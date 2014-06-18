(function($, doc, U){

	var F = U.form;
	var vm_ram_list 				= vm_config['vm_cpu|vm_ram'],
		vm_os_list 					= vm_config['vm_cpu+vm_ram|vm_os'],
		vm_os_default_list 			= vm_config['vm_os'],
		vm_disktype_list 			= vm_config['vm_region_no|vm_disk_type'],
		vm_cpu_ssd_list				= vm_config['vm_cpu|vm_ssd_storage'],
		vm_ram_ssd_list				= vm_config['vm_ram|vm_ssd_storage'],
		vm_zone_list				= vm_config['vm_region_no+vm_disk_type|vm_zone_no'],
		vm_f_zone_list				= vm_config['vm_region_no|vm_zone_no'],
		vm_band_config 				= vm_config['vm_bandwidth'][0],
		vm_duration_config			= vm_config['order_time'],
		vm_quantity_config			= vm_config['order_num'],
		vm_yundisk_config			= vm_config['vm_yundisk_storage'][0],
		vm_yundisk_number_config	= vm_config['vm_yundisk_num'][0],
		vm_yundisk_max_config		= vm_config['vm_yundisk_storage_max'][0],
		vm_sata_config				= vm_config['vm_sata_storage'],
		vm_sata_number_config		= vm_config['vm_sata_num'],
		vm_sata_max_config			= vm_config['vm_sata_storage_max'],
		vm_ssd_config				= vm_config['vm_ssd_storage'],
		vm_ssd_number_config		= vm_config['vm_ssd_num'],
		vm_ssd_max_config			= vm_config['vm_ssd_storage_max'];

	/* 内存 集 */		
	F.RamSet = {};
	(function(){
		var i = 0, l = 0;
		for(i = 0, l = vm_ram_list.length; i < l; i ++){
			F.RamSet[vm_ram_list[i]['cond']['vm_cpu']] = vm_ram_list[i]['result'];
		}
	})();
	//console.log('F.RamSet:');
	//console.log(F.RamSet);
	
	/* 系统 集 */
	F.OsSet = {};
	F.OsDefaultSet = {};
	(function(){
		var	cpuKey = '',
			ramKey = '',
			reg = /^(CentOS|Ubuntu|Debian|Red Hat Enterprise Linux Server|Windows Server|Aliyun Linux).+$/i,
			_reg = /(CentOS|Ubuntu|Debian|Red Hat Enterprise Linux Server|Windows Server|Aliyun Linux)(,\1)*/gi,
			i = 0, l = 0, _i = 0, _l = 0;
		var setOsSet = function(data, SET){
			var strTemp, arrTemp = [], 
				i = 0, l = 0, _i = 0, _l = 0,
				txt, val;
			
			if(!data || data.length < 1){
				return;
			}
			
			strTemp = data[0].text.replace('centos', 'Centos').replace(reg, '$1');	// 写死，小写centos强制转成Centos
			for(i = 1, l = data.length; i < l; i ++){
				strTemp += ',' + data[i].text.replace('centos', 'Centos').replace(reg, '$1');	// 写死，小写centos强制转成Centos
			}		
			strTemp = strTemp.split(',').sort().join(',').replace(_reg, '$1');
			arrTemp = strTemp.split(',');
			
			SET['os'] = [];
			for(i = 0, l = arrTemp.length; i < l; i ++){
				txt = arrTemp[i];
				val = arrTemp[i].replace(/ /gi, '-').toLocaleLowerCase();
				SET['os'].push({	// 填充 os 数组
					'text': txt,
					'value' : val,
					'icon': 'ico-' + val
				});
				SET[val] = [];
				for(_i = 0, _l = data.length; _i < _l; _i ++){
					if((new RegExp(txt, 'i')).test(data[_i].text)){
						SET[val].push({	// 填充 os ver 数组
							'text': data[_i].text.replace(new RegExp(txt + '[ ]*', 'i'), ''),
							'value': data[_i].value
						});
					}
				}
			};
		};
		for(i = 0, l = vm_os_list.length; i < l; i ++){
			cpuKey = vm_os_list[i]['cond']['vm_cpu'];
			ramKey = vm_os_list[i]['cond']['vm_ram'];
			F.OsSet[cpuKey + '+' + ramKey] = {};
			
			setOsSet(vm_os_list[i]['result'], F.OsSet[cpuKey + '+' + ramKey]);
		}		
		setOsSet(vm_os_default_list, F.OsDefaultSet);
	})();
	//console.log('F.OsSet:');
	//console.log(F.OsSet);
	//console.log('F.OsDefaultSet:');
	//console.log(F.OsDefaultSet);
	
	/* 磁盘类型 集 */
	F.DisktypeSet = {};
	F.SSDEnableConfig = {};
	(function(){
		var i = 0, l = 0, _i = 0, _l = 0, cpu, ram;
		
		if(!vm_disktype_list){
			return;
		}
		
		for(i = 0, l = vm_disktype_list.length; i < l; i ++){
			F.DisktypeSet[vm_disktype_list[i]['cond']['vm_region_no']] = vm_disktype_list[i]['result'];
		}
		if(!!vm_cpu_ssd_list){
			for(i = 0, l = vm_cpu_ssd_list.length; i < l; i ++){
				cpu = vm_cpu_ssd_list[i]['cond']['vm_cpu'];
				for(_i = 0, _l = vm_ram_ssd_list.length; _i < _l; _i ++){
					ram = vm_ram_ssd_list[_i]['cond']['vm_ram'];
					F.SSDEnableConfig[cpu + '+' + ram] = {
						"enable": vm_cpu_ssd_list[i]['result'][0].enable - 0 && vm_ram_ssd_list[_i]['result'][0].enable - 0
					};
				}
			}
		}
	})();
	//console.log('F.DisktypeSet:');
	//console.log(F.DisktypeSet);
	//console.log('F.SSDEnableConfig:');
	//console.log(F.SSDEnableConfig);
	
	/* 可用区 集 */
	F.ZoneSet = {};
	F.isZoneSet = true;
	(function(){
		var key = '', i = 0, l = 0;
		
		if(!vm_zone_list){
			F.isZoneSet = false;
			return;
		}
		
		for(i = 0, l = vm_zone_list.length; i < l; i ++){
			key = vm_zone_list[i]['cond']['vm_region_no'] + '+' + vm_zone_list[i]['cond']['vm_disk_type']; 
			F.ZoneSet[key] = vm_zone_list[i]['result'];
		}
	})();
	F.FinancialZoneSet = {};
	F.isFinancialZoneSet = true;
	(function(){
		var key = '', i = 0, l = 0;
		
		if(!vm_f_zone_list){
			F.isFinancialZoneSet = false;
			return;
		}
		
		for(i = 0, l = vm_f_zone_list.length; i < l; i ++){
			key = vm_f_zone_list[i]['cond']['vm_region_no'];
			F.FinancialZoneSet[key] = vm_f_zone_list[i]['result'];
		}
	})();
	//console.log('F.ZoneSet:');
	//console.log(F.ZoneSet);
	//console.log('F.FinancialZoneSet:');
	//console.log(F.FinancialZoneSet);
	
	/* 磁盘配 */
	F.DiskConfig = {};
	(function(){
		var rangeA, rangeB;
		rangeB = Math.floor((vm_yundisk_config.max - 0) / 2);
		rangeA = Math.floor(rangeB / 2);
		F.DiskConfig['vm_yundisk_storage'] = {
			"config": {
				"data": [
					{
						"unit": vm_yundisk_config.step - 0,
						"min": 0,
						"max": rangeA
					},
					{
						"unit": vm_yundisk_config.step - 0,
						"min": rangeA,
						"max": rangeB
					},
					{
						"unit": vm_yundisk_config.step - 0,
						"min": rangeB,
						"max": vm_yundisk_config.max - 0
					}
				],
				"min": vm_yundisk_config.min - 0
			},
			"maxNumber": vm_yundisk_number_config.max - 0,
			"minNumber": vm_yundisk_number_config.min - 0,
			"max": vm_yundisk_max_config.max - 0
		};
		if(!!vm_sata_config){
			rangeB = Math.floor((vm_sata_config[0].max - 0) / 2);
			rangeA = Math.floor(rangeB / 2);
			F.DiskConfig['vm_sata_storage'] = {
				"config": {
					"data": [
						{
							"unit": vm_sata_config[0].step - 0,
							"min": 0,
							"max": rangeA
						},
						{
							"unit": vm_sata_config[0].step - 0,
							"min": rangeA,
							"max": rangeB
						},
						{
							"unit": vm_sata_config[0].step - 0,
							"min": rangeB,
							"max": vm_sata_config[0].max - 0
						}
					],
					"min": vm_sata_config[0].min - 0
				},
				"maxNumber": vm_sata_number_config[0].max - 0,
				"minNumber": vm_sata_number_config[0].min - 0,
				"max": vm_sata_max_config[0].max - 0
			};
		}
		if(!!vm_ssd_config){
			rangeB = Math.floor((vm_ssd_config[0].max - 0) / 2);
			rangeA = Math.floor(rangeB / 2);
			if(rangeA < 100){
				rangeA = 100;
				rangeB = ((vm_ssd_config[0].max - 0) - rangeA) / 2 + rangeA;
			}
			F.DiskConfig['vm_ssd_storage'] = {
				"config": {
					"data": [
						{
							"unit": vm_ssd_config[0].step - 0,
							"min": 0,
							"max": rangeA
						},
						{
							"unit": vm_ssd_config[0].step - 0,
							"min": rangeA,
							"max": rangeB
						},
						{
							"unit": vm_ssd_config[0].step - 0,
							"min": rangeB,
							"max": vm_ssd_config[0].max - 0
						}
					],
					"min": vm_ssd_config[0].min - 0
				},
				"maxNumber": vm_ssd_number_config[0].max - 0,
				"minNumber": vm_ssd_number_config[0].min - 0,
				"max": vm_ssd_max_config[0].max - 0
			};
		}
	})();
	//console.log('F.DiskConfig:');
	//console.log(F.DiskConfig);
	
	/* 带宽 配 */
	F.BandConfig = {};
	F.BandConfig.data = [];
	(function(){
		var step = (vm_band_config.step - 0) / 1024,
			min = (vm_band_config.min - 0) / 1024,
			max = (vm_band_config.max - 0) / 1024,
			defaultValue = 1;
		F.BandConfig.data = [
			{
				'unit': step,
				'min': min,
				'max': 5
			},
			{
				'unit': step,
				'min': 5,
				'max': 100
			},
			{
				'unit': step,
				'min': 100,
				'max': max
			}
		];
		F.BandConfig.defaultValue = 1;
	})();
	//console.log('F.BandConfig:');
	//console.log(F.BandConfig);
	
	/* 时长 配 */
	F.DurationConfig = {};
	F.DurationConfig.data = [];
	(function(){
		var i = 0, l = 0, _i = 0, _l = 0,
			step = 0,
			min = 0,
			max = 0,
			type;
		for(i = 0, l = vm_duration_config.length; i < l; i ++){
			type = vm_duration_config[i].unit;
			for(_i = vm_duration_config[i].min - 0, _l = vm_duration_config[i].max - 0; _i <= _l; _i ++){
				min = max;
				max = _i;
				max = type === 'year' ? max * 12 : max;
				step = max - min;
				F.DurationConfig.data.push({
					'unit': step,
					'min': min,
					'max': max
				});
			}
		}
		F.DurationConfig.defaultValue = 12;
	})();
	//console.log('F.DurationConfig:');
	//console.log(F.DurationConfig);
	
	/* 台数 配 */
	F.QuantityConfig = {};
	(function(){
		F.QuantityConfig.min = vm_quantity_config.min - 0;
		F.QuantityConfig.max = vm_quantity_config.max - 0;
		F.QuantityConfig.unit = vm_quantity_config.step - 0;
		F.QuantityConfig.defaultValue = F.QuantityConfig.min;
	})();
	//console.log('F.QuantityConfig:');
	//console.log(F.QuantityConfig);
	
})(jQuery, document, UC);/*  */

(function($, doc, U){
	
	var F = U.form;
	
	/* 自定义镜像 */
	F.CustomSet = {};
	F._customIsLoaded = false;
	F._customAjax = function(){
		/* 获取自定义数据
		$.ajax({
			url: $('.ajax-url-custom').val(),
	        cache: false,
	        data:{
		    	'region': F.region.currentValue
	    	},
	        type: 'post',
	        dataType: 'json',
	        success: function(result){		        
	        	F._customIsLoaded = true;
		        if(result.success){
			        F.CustomSet = result.data;
			        F._customSwitch();	// 设置自定义镜像的数据
			        if(F.CustomSet[F.region.currentValue] && F.CustomSet[F.region.currentValue].length > 0){
			        	if(window.custom_switch){
				        	F.custom.open();
				        }
			        }else{
				        F.custom.list([]).text('请选择');
			        }
		        }
	        },
	        error: function(){
	        	F._customIsLoaded = true;
	        	F._customSwitch();
		        F.custom.list([]).text('请选择');
	        }
		}); */
	};
	F._customSwitch = function(){
		var region = F.region.currentValue;
		if($('.row-custom').length <= 0){
  		  return;
		}
		if(F.CustomSet[region] && F.CustomSet[region].length > 0){
			$('.row-custom').removeClass('row-hide row-relative');
			F.custom.list([{
				'text': '不使用',
				'value': ''
			}].concat(F.CustomSet[region])).text('请选择');//.index(0);				
		}else{
			$('.row-custom').addClass('row-hide row-relative');
			F.custom.list([]).text('请选择');
			//$('.uc-custom .unit span').text('没有可用的自定义镜像');
		}
	};
	
	/* 改变磁盘类型 */
	F._changeDisktype = function(){
		var arrDisktype = [],
			disktype = F.disktype.currentValue;
			region = F.region.currentValue,
			cpu = F.cpu.currentValue,
			ram = F.ram.currentValue,
			key = cpu + '+' + ram,
			i = 0, l = 0;
		
		if(F.SSDEnableConfig[key] && F.SSDEnableConfig[key].enable){
			if(!!region){
				F.disktype.list(F.DisktypeSet[region]).value(disktype);
			}
		}else{
			if(!!region){
				for(i = 0, l = F.DisktypeSet[region].length; i < l; i ++){
					if(F.DisktypeSet[region][i].value !== 'vm_ssd_storage'){	// 写死的判断磁盘类型中有无ssd
						arrDisktype.push(F.DisktypeSet[region][i]);
					}
				}
				F.disktype.list(arrDisktype).value(disktype);
			}
		}
	};
	
	/* 改变zone */
	F._changeZone = function(){
		var region = F.region.currentValue,
			disktype = F.disktype.currentValue,
			zone = F.zone.currentValue,
			key = region + '+' + disktype,
			len = 0, zoneRowNumber;
		
		if(!F.ZoneSet[key] || !F.ZoneSet[key].length){	// 没有值隐藏
			$('.row-zone').closest('.row').addClass('row-hide row-relative');
			return;
		}
		
		if(region && disktype){
			len = F.ZoneSet[key].length;
			$('.row-zone').closest('.row').removeClass('row-hide row-relative');
			zoneRowNumber = Math.ceil(len / 5);
			$('.row-zone').removeClass('row-zone-1 row-zone-2 row-zone-3 row-zone-4').addClass('row-zone-' + zoneRowNumber);
			F.zone.list(F.ZoneSet[key]).value(zone);
		}else{
			$('.row-zone').closest('.row').addClass('row-hide row-relative');
		}
	};
	/* 改变金融zone */
	F._changeFinancialZone = function(){
		var region = F.region.currentValue,
			zone = F.zone.currentValue,
			len = 0, zoneRowNumber;
			
		if(!F.FinancialZoneSet[region] || !F.FinancialZoneSet[region].length){	// 没有值隐藏
			$('.row-zone').closest('.row').addClass('row-hide row-relative');
			return;
		}
		
		if(region){
			len = F.FinancialZoneSet[region].length;
			$('.row-zone').closest('.row').removeClass('row-hide row-relative');
			zoneRowNumber = Math.ceil(len / 5);
			$('.row-zone').removeClass('row-zone-1 row-zone-2 row-zone-3 row-zone-4').addClass('row-zone-' + zoneRowNumber);
			F.zone.list(F.FinancialZoneSet[region]).value(zone);
		}else{
			$('.row-zone').closest('.row').addClass('row-hide row-relative');
		}
	};
	
	/* disk & snapshot */
	F._diskIndex	= 0;
	F._diskOver		= 0;
	F._diskTotal	= 0;
	F._diskNumber	= 0;
	F._diskSum		= 0;
	F._diskHtml = function(ishide){
		var disktype = F.disktype.currentValue,
			islogin = F._isLogin(),
			rangeA, rangeB, rangeC,
			inputMaxLength,
			html,
			config;
		
		if(!disktype){
			return;
		}
		
		config = F.DiskConfig[disktype].config.data;
		rangeA = config[0].max;
		rangeB = config[1].max;
		rangeC = config[2].max;
		inputMaxLength = (rangeC + '').length;
		
		if($.browser.version - 0 <= 7 && $.browser.msie){
    		ishide = false;
		}
		
		html = '\
			<div class="row-li pb15 w620' + (ishide ? ' row-li-hide' : '') + '"' + (ishide ? ' style="-webkit-transform: scale(0); -moz-transform: scale(0); -ms-transform: scale(0); -o-transform: scale(0); overflow: hidden;"' : '') + '>\
				<span id="uc-disk-' + F._diskIndex + '" class="uc-slider disk-slider disk-row">\
	            	<div class="range">\
		            	<span class="block ' + (disktype === 'vm_ssd_storage' ? 'w25' : 'w50') + '">\
			            	<div>\
				            	<span>' + rangeA + 'GB</span>\
				            </div>\
		            	</span><span class="block w25">\
			            	<div>\
				            	<span>' + rangeB + 'GB</span>\
			            	</div>\
		            	</span><span class="block ' + (disktype === 'vm_ssd_storage' ? 'w50' : 'w25') + '">\
			            	<div class="last">\
				            	<span>' + rangeC + 'GB</span>\
			            	</div>\
		            	</span>\
		            	<div class="container">\
			            	<div class="current">\
				            	<span class="unit">\
					            	<div>\
					            		<span>' + rangeA + 'GB</span>\
					            	</div>\
				            	</span><span class="unit">\
					            	<div>\
					            		<span>' + rangeB + 'GB</span>\
					            	</div>\
				            	</span><span class="unit">\
					            	<div class="last">\
					            		<span>' + rangeC + 'GB</span>\
					            	</div>\
				            	</span>\
			            	</div>\
		            	</div>\
		            	<div class="bar"></div>\
		            	<a href="javascript:;" target="_self" rel="nofollow" class="drag"' + (ishide ? ' style="-webkit-transform: scale(0); -moz-transform: scale(0); -ms-transform: scale(0); -o-transform: scale(0);"' : '') + ' hidefocus>\
			            	<i></i>\
			            	<i></i>\
			            	<i></i>\
		            	</a>\
	            	</div>\
	            </span>\
	            <input class="disk-slider-input uc-disk-' + F._diskIndex + ' uc-input c-f60" name="" maxlength="' + inputMaxLength + '" value="0" />\
	            <span class="disk-unit">GB</span>\
	            <a href="javascript:;" target="_self" data-disk-key="uc-disk-' + F._diskIndex + '" class="lnk-gray fn-left show-my-snapshot' + (islogin && !vm_cache ? '' : ' fn-hide') + '" hidefocus>用快照创建数据盘</a>\
	            <a href="javascript:;" target="_self" class="disk-help' + (islogin && !vm_cache ? '' : ' fn-hide') + '" hidefocus><i class="icon-help"></i></a>\
	    		<a href="javascript:;" target="_self" title="删除此数据盘" data-disk-key="uc-disk-' + F._diskIndex + '" class="disk-delete" hidefocus><i class="icon-wrong">delete</i></a>\
	    	</div>';
	    
	    return html;
	};
	F._diskInit = function(){
		var disktype = F.disktype.currentValue,
			key = 'uc-disk-' + F._diskIndex,
			objDisktype;
		
		if(!disktype){
			return;
		}
		
		objDisktype = F.DiskConfig[disktype].config;
		F.disk[key] = new U.slider('#' + key, {
			data: objDisktype.data,
			min: objDisktype.min,
			max: F._diskOver,
			bindInput: '.' + key
		});
		
		F._setDiskMax();
		
		/* 修改使用量 */
    	F.disk[key].change(function(){
	    	F._setDiskMax();
	    	
	    	// 询价			
			F._inquiry();
    	});
    	
    	/* 设置用量 */	
    	_diskTotal = F.DiskConfig[disktype].total;
	};
	F._diskAdd = function(){
		var sto = null, st0 = null, st1 = null, disktype = F.disktype.currentValue, rowLast = $('.row-disk .row-li:last');
		
		if(F._diskSum - F._diskNumber <= 0 || F.DiskConfig[disktype].config.min >= F._diskOver){	// 监测磁盘总数 或 如果剩余容量小于磁盘最小值
			return;
		}
					
		F._diskIndex ++;
		F._diskNumber ++;
		rowLast.before(F._diskHtml(true));
		sto = setTimeout(function(){
			$('.row-li.pb15.w620').removeClass('row-li-hide').css({
				'-webkit-transform': 'scale(1)',
				'-moz-transform': 'scale(1)',
				'-ms-transform': 'scale(1)',
				'-o-transform': 'scale(1)'
			});
			clearTimeout(sto);
			sto = null;	
		}, 1);
		st0 = setTimeout(function(){
			$('.row-li.pb15.w620').removeAttr('style');
			clearTimeout(st0);
			st0 = null;
		}, 310);
		st1 = setTimeout(function(){
			$('.row-li.pb15.w620 .drag').css({
				'-webkit-transform': 'scale(1)',
				'-moz-transform': 'scale(1)', 
				'-ms-transform': 'scale(1)',
				'-o-transform': 'scale(1)'
			});
			clearTimeout(st1);
			st1 = null;
		}, 113);
		F._diskInit();
		F._setDiskNumber();
		F._setDiskOver();
	};
	F._diskDelete = function(key){		
		var row = $('#' + key).closest('.row-li'), sto;
		
		F._diskNumber --;
		
		delete (F.disk[key]);
		F._setDiskNumber();
		
		row.addClass('row-li-delete').removeClass('pb15');
		sto = setTimeout(function(){
			row.remove();
			clearTimeout(sto);
			sto = null;
		}, 290);
		
		F._setDiskMax();
		
		
	};
	F._setDiskMax = function(){
		var disktype = F.disktype.currentValue;
		
		F._setDiskOver();
			
		if(!disktype){
			return;
		}		
		    	
		for(var key in F.disk){
			if(F.disk[key].setMaxValue){
	    		F.disk[key].setMaxValue(F.disk[key].currentValue + F._diskOver);
	    	}
		}
	};
	F._setDiskNumber = function(){
		var diskNumberTip = $('.disk-number'),
			disktype = F.disktype.currentValue;			
		
		diskNumberTip.text(F._diskSum - F._diskNumber);
			
		if(!(F._diskSum - F._diskNumber)){
			$('.disk-add').addClass('disk-add-disabled').find('span').text('不能再添加');
			$('.disk-number-info').addClass('fn-hide');
		}else{
			$('.disk-add').removeClass('disk-add-disabled').find('span').text('增加一块');
			$('.disk-number-info').removeClass('fn-hide');
		}
		
		if(disktype){	// 各种写死的逻辑，草死各种需求，在代码里诅咒你
			if(F._diskNumber <= F.DiskConfig[disktype].minNumber){
				$('.row-disk .disk-delete').addClass('fn-hide');
			}else{
				$('.row-disk .disk-delete').removeClass('fn-hide');
			}
		}
		
		// 询价			
		F._inquiry();	
	};
	F._setDiskOver = function(){
		var diskOverCapacity = 0, capacity = F._diskTotal, disktype = F.disktype.currentValue;
		
		if(F._diskTotal === 0){
			$('.disk-over-capacity-info').addClass('fn-hide');
		}else{
			for(var key in F.disk){
				capacity = capacity - F.disk[key].currentValue;
			}
			$('.disk-over-capacity').text(capacity);
			$('.disk-over-capacity-info').removeClass('fn-hide');
		}
		
		F._diskOver = capacity;
				
		if(!disktype){
			return;
		}		

		if(F.DiskConfig[disktype].config.min >= capacity || !(F._diskSum - F._diskNumber)){	// 如果剩余容量小于磁盘最小值
			$('.disk-add').addClass('disk-add-disabled').find('span').text('不能再添加');
			$('.disk-number-info').addClass('fn-hide');
		}else{
			$('.disk-add').removeClass('disk-add-disabled').find('span').text('增加一块');
			$('.disk-number-info').removeClass('fn-hide');
		}
		
		// 询价			
		F._inquiry();
	};
	F._resetDisk = function(){
		var disktype = F.disktype.currentValue,
			diskList, sto = null, objDisktype,
			rowLast,
			i = 0, l = 0;
		
		if(!disktype){
			return;
		}
		
		objDisktype = F.DiskConfig[disktype];		
		F.disk = {};	// 清空数组对象
		F._diskIndex	= -1;
		F._diskTotal	= objDisktype.max;
		F._diskOver		= F._diskTotal - objDisktype.config.min;
		F._diskSum		= objDisktype.maxNumber;
		F._diskNumber	= 0;
		
		
		if(objDisktype.minNumber > 0 ){
		
			diskList = $('.row-disk .row-li.pb15.w620');
			
			if(diskList.length > 0){
		       	$('.row-disk .row-li.pb15.w620:not(:eq(0))').remove();	    
	        
		        F._diskIndex ++;
		        F._diskNumber ++;
		        diskList.replaceWith(F._diskHtml(false));	
		       
		        F._diskInit();
		        
		        for(i = 1, l = objDisktype.minNumber; i < l; i ++){
					F._diskAdd();
				}
			}else{
				for(i = 0, l = objDisktype.minNumber; i < l; i ++){
					F._diskAdd();
				}
			}
		
			
		}else{			
			diskList = $('.row-li.pb15.w620').remove();
		}
		
		F._setDiskNumber();
		F._setDiskOver();	
		
	};
	F._isSnapshot = false;
	F._snapshotPageNumber 		= 0;
	F._snapshotIsDone 			= false;
	F._snapshotCurrentDiskKey	= '';
	F._resetSnapshot = function(){
		F._snapshotPageNumber 		= 0;
		F._snapshotIsDone 			= false;
		F._snapshotCurrentDiskKey	= '';
		
		$('.snapshot-box .snapshot-list').addClass('fn-hide').html('');
		$('.snapshot-empty').removeClass('fn-hide');
		
		F._snapshotAjax();
	};
	F._snapshotShow = function(){
		var disk, disktype, diskconfig, len, min, max, over, snapshotRow, snapshotId, arrSnapshotUsed = [], i, l, reg, snapshotList, snapshotDisk;
		
		if(!F._snapshotCurrentDiskKey){
			return;
		}
		
		disktype = F.disktype.currentValue;
		diskconfig = F.DiskConfig[disktype].config;
		disk = F.disk[F._snapshotCurrentDiskKey].currentValue;
		len = diskconfig.data.length;
		min = diskconfig.min;
		max = diskconfig.data[len - 1].max;
		over = disk + F._diskOver;
		over = over > max ? max : over;	// 允许快照的最大值
		
		/* 已使用的快照置灰 */
		/*snapshotRow = $('.disk-row:not(.uc-slider)');
		for(i = 0, l = snapshotRow.length; i < l; i ++){
    		snapshotId = $(snapshotRow[i]).find('.snapshot-id').val();
        	arrSnapshotUsed.push(snapshotId);
    	}*/
    	
    	reg = new RegExp('^(' + arrSnapshotUsed.join('|') + ')$');
    	
    	/* 根据最大最小值置灰快照 */
    	snapshotList = $('.snapshot-list .unit');
    	for(i = 0, l = snapshotList.length; i < l; i ++){
        	snapshotDisk = $(snapshotList[i]).attr('data-disk') - 0;
        	snapshotId = $(snapshotList[i]).attr('data-id');
        	if(snapshotDisk > over || snapshotDisk < min || reg.test(snapshotId)){
	        	$(snapshotList[i]).addClass('unit-disabled');
        	}else{
	        	$(snapshotList[i]).removeClass('unit-disabled');
        	}
    	}
	};
	F._snapshotReplace = function(key, snapshot){
		var html, diskRow, id, name, disk;
		
		id = snapshot.id;
		name = snapshot.name;
		disk = snapshot.disk;
		
		html = '\
        	<div class="row-li pb15 w620">\
    			<span id="' + key + '" class="disk-row">\
		    		<span class="snapshot-capacity">' + disk + 'GB</span>\
		    		<span class="snapshot-info" title="' + name + '(' + id + ')' + '">使用的快照为' + (name.length > 25 ? name.substr(0, 25) + '...' : name) + '</span>\
		    		<input type="hidden" class="snapshot-id" value="' + id + '" />\
		    		<input type="hidden" class="snapshot-disk" value="' + disk +'" />\
	    		</span>\
	    		<a href="javascript:;" target="_self" data-disk-key="' + key + '" class="lnk-gray show-my-snapshot fn-left" hidefocus>换一个快照创建</a>\
	    		<a href="javascript:;" target="_self" data-disk-key="' + key + '" class="disk-delete" hidefocus><i class="icon-wrong"></i></a>\
    		</div>';
    	
    	diskRow = $('#' + key).closest('.row-li');
	    	
    	diskRow.replaceWith(html);	// 用快照替换当前行
    	
    	/* 修改 F.disk 对象 */
    	delete (F.disk[key]);
    	
    	F.disk[key] = {
	    	'currentValue': disk - 0,
	    	'currentName': name,
	    	'currentId': id
    	};
    	
    	F._setDiskMax(F.disktype.currentValue);	// 设置剩余总容量
    	F._setDiskNumber();    	
		F._setDiskOver();    	
	};
	F._snapshotAjax = function(){
		//console.log(F._isSnapshot);
		
		if(F._snapshotIsDone || !F._isLogin() || !F._isSnapshot){
	    	return;
        }

        $.ajax({
	        url: $('.ajax-url-snapshot').val(),
	        cache: false,
	        data:{
		    	'region': F.region.currentValue,
		    	'page': F._snapshotPageNumber,
		    	'size': 10
	    	},
	        type: 'post',
	        dataType: 'json',
	        success: function(result){
	        	var html = [], data, text;
	        	
		        if(result.success){
			        $('.snapshot-number').text(result.total);
			        $('.snapshot-region').text($.trim($('#uc-region .current').text()));
			        data = result.data;
			        for(var i = 0, l = data.length; i < l; i ++){
			        	text = data[i].name;
			        	text = text.length > 20 ? text.substr(0, 20) + '...' : text;
				        html.push('<a href="javascript:;" target="_self" data-id="' + data[i].id + '" data-name="' + data[i].name + '" data-disk="' + data[i].disk + '" title="' + data[i].name + '(' + data[i].id + ')" class="unit">' + text + '(' + data[i].disk + 'GB)</a>');
			        }
			        if(data.length > 0){
				        $('.snapshot-box .snapshot-list').append(html.join('')).removeClass('fn-hide');
				        $('.snapshot-empty').addClass('fn-hide');
			        }
			        
			        if($('.snapshot-box .snapshot-list .unit').length >= result.total){
				        F._snapshotIsDone = true;
			        }
			        
			        F._snapshotShow();	
		        }
		        
		        F._snapshotPageNumber ++;
		        
		        $('.snapshot-box .snapshot-list').unbind('scroll');
		        $('.snapshot-box .snapshot-list').one('scroll', F._snapshotAjax);
	        },
	        error: function(){
		        //alert('请求失败，请稍后重试...');
	        }
        });//console.log(a);console.log(F._isSnapshot)
	};
	
	/* 订单行 */
	F._lines = [];
	F._lineMax = F.QuantityConfig.max;
	F._lineOver = F.QuantityConfig.max;
	F._lineHtml = function(){
		var html, region = F.region.currentValue,
			cpu, ram, band, os, disktype, disk, diskNumber, serverNumber, duration, price,
			i = 0, l = 0;
		
		cpu = F.cpu.currentValue + '核CPU、';
		ram = F.ram.currentValue - 0;
		ram = ram > 512 ? (ram / 1024) + 'GB内存、' : ram + 'MB内存、';
		band = F.band.currentValue + 'Mbps公网带宽';
		os = !!F.custom.currentValue ? '' : F.os.currentValue;
		disktype = F.disktype.currentValue;
		for(i = 0, l = F.DisktypeSet[region].length; i < l; i ++){
			if(F.DisktypeSet[region][i].value === disktype){
				disktype = F.DisktypeSet[region][i].text;
				break;
			}
		}
		diskNumber = 0;
		disk = '';
		for(var key in F.disk){
			if(F.disk[key].currentValue){		
				disk += F.disk[key].currentValue + 'GB、';
				diskNumber ++;
			}
		}
		if(diskNumber){
			disk = '、' + diskNumber + '块' + disktype + '(' + disk.substr(0, disk.length - 1) + ')';
		}else{
			disk = '';
		}
		serverNumber = F.number.currentValue;
		duration = F.duration.currentValue;
		duration = duration >= 12 ? (duration / 12) + '年' : duration + '个月';
		price = $('.order-line-price').val();
				
		html = '\
			<div class="order">\
		    	<div class="order-row">\
		    		<a href="javascript:;" rel="nofollow" target="_self" class="lnk-delete-order fn-right" title="删除" hidefocus><i class="icon-wrong"></i></a>\
		    		<span class="order-price">\
				    	<span class="cny">&yen;</span><span>' + price + '</span>\
			    	</span>\
			    	<strong>ECS<i class="ico-order-' + os + '"></i></strong>\
			    </div>\
		    	<div class="order-row">\
			    	<label>配置：</label>\
			    	<div class="order-info">\
				    	' + cpu + ram + band + disk + '\
			    	</div>\
		    	</div>\
		    	<div class="order-row">\
			    	<div class="info-half">\
				    	<label>数量：</label>\
				    	<div class="order-info">' + serverNumber + '台</div>\
			    	</div>\
			    	<div class="fn-left">\
				    	<label>时长：</label>\
				    	<div class="order-info">' + duration + '</div>\
			    	</div>\
		    	</div>\
	    	</div>';
	    	
	    return html;
	};
	F._lineData = function(){
		var duration, durationType, os, disk = [], zone, zoneCK, yundun, yundunCK, line,
			i = 0, l = 0;
		
		duration = F.duration.currentValue;
		durationType = duration >= 12 ? 'year' : 'month';
		duration = duration >= 12 ? duration / 12 : duration;
		os = F.custom.currentValue;
		os = !!os ? os : F.osver.currentValue;
		for(var key in F.disk){
			disk.push({
				'type': F.disktype.currentValue + '',
				'size': F.disk[key].currentValue + '',
				'vm_snapshot_id': !!F.disk[key].currentId ? F.disk[key].currentId + '' : null
			});
		}
		zoneCK = $('#zone-checkbox');
		zone = $('.row-zone').closest('.row').hasClass('row-hide') ? null : F.zone.currentValue;
		//zone =	zoneCK.length > 0 && !zoneCK[0].checked ? F.zone.currentValue : null;
		yundunCK = $('#yundun-checkbox');
		yundun = yundunCK[0].checked ? 1 : 0;
		
		line = {};
		line.commodityCode = 'vm';
		line.data = {
			'vm_cpu': F.cpu.currentValue + '',
			'vm_ram': F.ram.currentValue + '',
			//'vm_bandwidth': (F.band.currentValue * 1024) + '',
			'vm_region_no': F.region.currentValue + '',
			'vm_os': os + '',
			'vm_disk': disk,
			'duration': duration + '',
			'pricing_cycle': durationType + '',
			'quantity': F.number.currentValue + '',
			'vm_yundun_monitor': yundun + '',
			'vm_yundun_service': yundun + ''
		};
		
		//if($('.row-zone').length > 0 && !($('.row-zone').closest('.row').hasClass('row-hide'))){
		if(null != zone && zone != ""){	
			line.data.vm_zone_no = zone;
		}

		return line;
	};
	F._lineAdd = function(){
		var serverNumber = F._lineOver - F.number.currentValue,
			lineTitle = $('.uc-orders .title'),
			linesBox = $('.uc-orders .list'),
			lines = linesBox.find('.list-temp'),
			maxHeight = linesBox.attr('data-max-height') - 0;
		
		if(serverNumber < 0){	// 超过最大台数
			alert('您最多只能选购' + F._lineMax + '台');
			return;
		}
		
		F._lineOver = F._lineOver - F.number.currentValue;	// 设置剩余台数
		lineTitle.find('span').text(F._lineMax - F._lineOver);
		$('.orders-submit').removeClass('orders-submit-hide');
		
		lines.append(F._lineHtml());
		if(lines.outerHeight() - 0 > maxHeight){
			linesBox.addClass('list-scroll').css({
				height: maxHeight
			});
		}
		
		F._lines.push(F._lineData());	// 设置对象
		
		F._inquiryLines(F._lines);	// 询价
	};
	F._lineDelete = function(index){
		var i = 0, l = 0, arrTemp = [], number,
			lineTitle = $('.uc-orders .title'),
			linesBox = $('.uc-orders .list'),
			listTemp = linesBox.find('.list-temp'),
			lines = $('.uc-orders .order'),
			maxHeight = linesBox.attr('data-max-height') - 0;
	
		/* 删数据 */
		number = F._lines[index].data.quantity - 0;
		F._lineOver += number;
		F._lines[index] = 0;
		
		lineTitle.find('span').text(F._lineMax - F._lineOver);	
		
		for(i = 0, l = F._lines.length; i < l; i ++){
			if(F._lines[i] !== 0){
				arrTemp.push(F._lines[i]);
			}
		}
		
		F._lines.length = 0;
		F._lines = arrTemp;
		
		/* 删节点 */
		lines.eq(index).remove();
		
		if(maxHeight > listTemp.outerHeight()){
			linesBox.removeClass('list-scroll').removeAttr('style');
		}
		
		if(F._lines.length){
			F._inquiryLines(F._lines);	// 询价
		}else{
			$('.uc-orders .orders-submit').addClass('orders-submit-hide');
		}
	};
	
	/* 询价 */
	F._isInquiry = false;
	F._inquirySTO = null;
	F._inquiryBASE64 = '';
	F._inquiry = function(){
		// 询价			
		clearTimeout(F._inquirySTO);
		F._inquirySTO = null;
		F._inquirySTO = setTimeout(function(){
			F._inquiryLine(F._lineData());
		}, 100);
	};
	F._inquiryLineStart = function(){
		var btn1, btn2,
			infoRow;
	
		btn1 = $('.uc-submit .button-row .button-order-now');
		btn2 = $('.uc-submit .button-row .button-add-order');
		infoRow = $('.uc-submit .info-row');
		infoRow.find('.settle').addClass('fn-hide');
		infoRow.find('.cost').addClass('fn-hide');
		infoRow.find('.rebate').addClass('fn-hide');
		infoRow.find('.icon-giving').addClass('fn-hide');
		infoRow.find('.order-ploy-box').addClass('fn-hide');
		infoRow.find('label').text('正在计算价格请稍后...');
		
		btn1.addClass('uc-button-disabled').removeClass('uc-button').attr('disabled', 'disabled');
		btn2.addClass('uc-button-disabled').removeClass('uc-button-gray').attr('disabled', 'disabled');
	};
	F._inquiryLineEnd = function(data){
		var settle, cost, rebate, html = [], arrTemp, arrRule, ruleId, btn1, btn2,
			i = 0, l = 0, _i = 0, _l = 0;
	
		$('.uc-submit .info-row label').text('费用：');
		cost = (data.order.originalAmount - 0).toFixed(2);
		settle = (data.order.tradeAmount - 0).toFixed(2);
		rebate = (cost - settle).toFixed(2);
		$('.uc-submit .info-row .settle').removeClass('fn-hide').find('.money').text(settle);
		
		$('.order-line-price').val(cost);
		
		
		btn1 = $('.uc-submit .button-row .button-order-now');
		btn2 = $('.uc-submit .button-row .button-add-order');
		btn1.addClass('uc-button').removeClass('uc-button-disabled').removeAttr('disabled');
		btn2.addClass('uc-button-gray').removeClass('uc-button-disabled').removeAttr('disabled');
		
		/* 优惠策略 */
		arrTemp = data.order.ruleIds;
		arrRule = data.rules;
		if(!arrTemp || !arrRule){
			return;
		}
		if(arrTemp.length > 0){
			$('.uc-submit .info-row .icon-giving').removeClass('fn-hide');
			$('.uc-submit .info-row .cost').removeClass('fn-hide').find('.money').text(cost);
			$('.uc-submit .info-row .rebate').removeClass('fn-hide').find('.money').text(rebate);
			for(i = 0, l = arrTemp.length; i < l; i ++){
				ruleId = arrTemp[i];
				for(_i = 0, _l = arrRule.length; _i < _l; _i ++){
					if(ruleId === arrRule[_i].ruleDescId){
						html.push('<span class="uc-ploy" title="' + arrRule[_i].title + '">' + arrRule[_i].name + '</span>');
					}
				}
			}
			$('.uc-submit .info-row .order-ploy-box').html(html.join('')).removeClass('fn-hide');
		}
	};
	F._inquiryLinesStart = function(){
		var ordersRow;
		
		ordersRow = $('.orders-submit .orders-submit-row');
		ordersRow.eq(0).addClass('fn-hide');
		ordersRow.eq(1).addClass('fn-hide');
		ordersRow.eq(2).addClass('fn-hide');
		
		btn = $('.orders-submit .orders-submit-row .button-orders-now');
		btn.addClass('uc-button-disabled').removeClass('uc-button').attr('disabled', 'disabled');
	};
	F._inquiryLinesEnd = function(data){
		var btn, cost, rebate, settle, _cost, _rebate, _settle,
			ordersRow,
			html = [], arrTemp, arrRule, ruleId,
			i = 0, l = 0, _i = 0, _l = 0;
		
		btn = $('.orders-submit .orders-submit-row .button-orders-now');
		cost = $('.orders-submit .orders-submit-row .cost span:last');
		rebate = $('.orders-submit .orders-submit-row .rebate span:last');
		settle = $('.orders-submit .orders-submit-row .settle:last');
		
		ordersRow = $('.orders-submit .orders-submit-row');
		_cost = (data.order.originalAmount - 0).toFixed(2);
		_settle = (data.order.tradeAmount - 0).toFixed(2);
		_rebate = (_cost - _settle).toFixed(2);
		cost.text(_cost);
		settle.text(_settle);
		rebate.text(_rebate);		

		ordersRow.eq(2).removeClass('fn-hide');		
		
		btn.addClass('uc-button').removeClass('uc-button-disabled').removeAttr('disabled');
		
		/* 优惠策略 */
		arrTemp = data.order.ruleIds;
		arrRule = data.rules;
		if(!arrTemp || !arrRule){
			return;
		}
		if(arrTemp.length > 0){
			
			ordersRow.eq(0).removeClass('fn-hide');
			//$('.uc-submit .info-row .icon-giving').removeClass('fn-hide');
			for(i = 0, l = arrTemp.length; i < l; i ++){
				ruleId = arrTemp[i];
				for(_i = 0, _l = arrRule.length; _i < _l; _i ++){
					if(ruleId === arrRule[_i].ruleDescId){
						html.push('<span class="uc-ploy" title="' + arrRule[_i].title + '">' + arrRule[_i].name + '</span>');
					}
				}
			}
			$('.orders-submit .orders-submit-row .uc-ploy').remove();
			$('.orders-submit .orders-submit-row .icon-giving').after(html.join(''));		
			
			ordersRow.eq(1).removeClass('fn-hide');
		}		

	};
	F._inquiryAjax = function(base64, isline){
	
		if(!F._isInquiry){
			return;
		}
		
		
		if(isline){
			
			if(F._inquiryBASE64 !== base64){
				F._inquiryBASE64 = base64;
			}else{
				return;
			}
		
			F._inquiryLineStart();
		}else{
			F._inquiryLinesStart();
		}
						
		F._ajaxInquiry = $.ajax({
			url: $('.ajax-url-price').val(),
			cache: false,
			data:{
				'data': base64
			},
			type: 'post',
			dataType: 'json',
			success: function(result){
				var data, settle, cost, rebate, html = [], arrTemp, arrRule, ruleId,
					i = 0, l = 0, _i = 0, _l = 0;
				
				if(result.success){
					data = result.data;
					if(isline){
						F._inquiryLineEnd(data);
					}else{
						F._inquiryLinesEnd(data);
					}
				}
			},
			error: function(){
				//alert('请求失败，请稍后重试...');
			}
		});		
	};
	F._inquiryLine = function(data){
		var arrTemp = [],
			base64;
		
		arrTemp.push(data);
		base64 = U.BASE64.encode(U.stringify(arrTemp));	
		
		$('.order-line-data').val(base64);	// 埋放数据
			
		F._inquiryAjax(base64, true);
	};
	F._inquiryLines = function(data){
		var base64;
		
		base64 = U.BASE64.encode(U.stringify(data));
		
		$('.orders-data').val(base64);	// 埋放数据
		
		F._inquiryAjax(base64, false);
	};
	
	/* 简单验证 */
	F._scrollToError = function(selection){
		var sel = $(selection),
			offset = sel.offset();
		
		$('body,html').animate({ scrollTop: offset.top - 100 }, 300);
		//$(window).scrollTop(offset.top - 100);
	};
	F._isFormDone = function(){
		var isosdone = !!F.osver.currentValue,
			iscustomselected = !!F.custom.currentValue,
			isdone = false;
			
		if(iscustomselected){
			isdone = true;
		}else{
			if(isosdone){
				isdone = true;
			}else{
				isdone = false;					
				$('.row-os').addClass('row-error');
				$('.row-custom').addClass('row-error');
				$('.uc-custom').addClass('error')
				$('#uc-os').addClass('error');
				$('#uc-os-ver').addClass('error');
				F._scrollToError('.row-os');
			}
		}
		
		return isdone;
	};
	
	/* 登陆 */
	F._isLogin = function(){
		var islogin = /.*login_aliyunid=\"?([^;\"]+)\"?.*/i.test(doc.cookie);		
		return islogin;
	};
	F._hrefLogin = function(){
		var islogin = false,
			data, arrTemp = [],
			base64,
			url, href;
		
		url = location.href;
		data = F._lineData();
		base64 = U.BASE64.encode(U.stringify(data));
		
		url = url.indexOf('?') > 0 ? url + '&data=' + base64 : url + '?data=' + base64;		
		url = encodeURIComponent(url);
		href = $('.login-url').val();
		href = href + url;
		location.href = href;
	};
	
	/* 加载值 */
	F._pageLoad = function(){
		var strData, json, data, strOs, arrDisk = [], key, duration, disklist,
			i = 0, l = 0, _i = 0, _l = 0,
			reg = /http:\/\/[^?]+.+data=([^&]+).*/i;
			
		if(window.current_conf){	// 购买同配置
			data = current_conf;
		}else{
			if(!reg.test(location.href)){
			
				
				F.cpu.index(0);
				//F.band.value(1);
				F.region._index(0);
				F.duration.value(1);
				F.number.value(1);	
				if($('.row-zone').length > 0){
					$('#zone-checkbox')[0].checked = true;
				}	
			
				return;
			}
			
			strData = location.href.replace(reg, '$1');
			json = U.JSON.encode(U.BASE64.decode(strData));
			if(json){
				data = json.data;
			}else{
				F.cpu.index(0);
				//F.band.value(1);
				F.region._index(0);
				F.duration.value(1);
				F.number.value(1);	
				if($('.row-zone').length > 0){
					$('#zone-checkbox')[0].checked = true;
				}	
				
				return;
			}
		}	
		
		F.cpu.value(data.vm_cpu);
		F.ram.value(data.vm_ram);
		/*if(data.vm_bandwidth){
			F.band.value((data.vm_bandwidth - 0) / 1024);
		}else{	// 写死当没有带宽数据时
			F.band.value(0);
		}*/
		if(data.vm_region_no){
			F.region.value(data.vm_region_no);
		}else{
			F.region._index(0);
		}
		strOs = data.vm_os;
		if(strOs){
			for(var key in F.OsDefaultSet){
				for(i = 0, l = F.OsDefaultSet[key].length; i < l; i ++){
					if(strOs === F.OsDefaultSet[key][i].value){
						strOs = key;
						break;
					}
				}
			}
			F.os.value(strOs);
			F.osver.value(data.vm_os);
		}
		if(data.vm_disk){
			arrDisk = data.vm_disk;
			if(arrDisk.length > 0){
				F.disktype.value(arrDisk[0].type);
			}
			F._resetDisk();
			disklist = $('.row-disk .row-li.pb15.w620');
			for(i = 0, l = arrDisk.length; i < l; i ++){
				if(i >= disklist.length){
					F._diskAdd();
				}
				key = 'uc-disk-' + i;
				F.disk[key].value(arrDisk[i].size - 0);
			}
		}else{	// 写死当没有磁盘数据时
			F.disktype.value('vm_yundisk_storage');
			F._resetDisk();
		}
		if(data.vm_zone_no && $('.row-zone').length > 0){
			$('#zone-checkbox')[0].checked = false;
			$('.row-zone').removeClass('row-li-hide');
			F.zone.value(data.vm_zone_no);
		}
		if(data.duration - 0){
			duration = data.pricing_cycle === 'year' ? (data.duration - 0) * 12 : data.duration - 0;
			
			F.duration.value(duration - 0);
		}else{
			F.duration.value(1);
		}
		if(data.quantity - 0){
			F.number.value(data.quantity - 0);
		}else{
			F.number.value(1);
		}
		if(data.vm_yundun_monitor !== undefined && data.vm_yundun_service !== undefined){
			if(data.vm_yundun_monitor - 0 === 0 || data.vm_yundun_service - 0 === 0){
				$('#yundun-checkbox')[0].checked = false;
			}
		}
	};
	
	/* 其他 */
	F._showTip = function(t, tip){
		var tip = $(tip),
        	oa;
        		
    	oa = t.offset();
    	
    	tip.find('.block-tip').offset({
        	left: oa.left - 4,
        	top: oa.top + t.outerHeight() - 2
    	});
    	tip.css({
        	'overflow': 'visible'
    	});
	};
	
	F._scrollToOrdersTop = function(){
		var offset = $('.uc-orders').offset();
		
		$('body,html').animate({ scrollTop: offset.top }, 300);
	};
	
	
})(jQuery, document, UC);(function($, doc, U){

	$(doc).ready(function(){
		
		var F = U.form;
		
		/* ************************** 实例化 ************************** */
		F.cpu = new U.radio('#uc-cpu', {
			bindInput: '.uc-cpu'
		});

		F.ram = new U.radio('#uc-ram', {
			bindInput: '.uc-ram'
		});


		/*F.band = new U.slider('#uc-band', {
			data: F.BandConfig.data,
			bindInput: '.uc-band'
		}); */

		F.region = new U.radio('#uc-region', {
			bindInput: '.uc-region'
		});
		
		F.regiontip = new U.tip('.my-region', {
		    html: $('.my-region-tip-html').html(),
            show: 'click',
            delay: 0
	    });
		
		F.custom = new U.select('#uc-custom');
		
		F.os = new U.select('#uc-os');
		
		F.osver = new U.select('#uc-os-ver');
		
		F.disktype = new U.radio('#uc-disk-type', {
			bindInput: '.uc-disk-type'
		});
		
		F.disk = {
			'uc-disk-0': new U.slider('#uc-disk-0', {
				data: F.DiskConfig['vm_yundisk_storage'].config.data,
				min: F.DiskConfig['vm_yundisk_storage'].config.min,
				bindInput: '.uc-disk-0'
			})
		};
		
		F.zone = new U.radio('#uc-zone', {
			bindInput: '.uc-zone'
		});
		
		F.duration = new U.slider('#uc-duration', {
			data: F.DurationConfig.data,
			min: 1,
			bindInput: '.uc-duration'
		});
		
		F.durationtip = new U.tip('#uc-duration', {
	    	html: '<span class="text">花10个月钱享12个月服务！</span>',
            show: 'mousedown',
            hold: 0,
            delay: 0
    	});
		
		F.number = new U.number('#uc-number', {
			unit: F.QuantityConfig.unit,
			min: F.QuantityConfig.min,
			max: F.QuantityConfig.max
		});
		
		/* ************************** 值改变 ************************** */
		F.cpu.change(function(){
			var val = this.currentValue,
				ram = F.ram.currentValue;
			
			F.ram.list(F.RamSet[val]).value(ram);
		});
		
		F.ram.change(function(){
			var cpu = F.cpu.currentValue,
				ram = this.currentValue,
				os = F.os.currentValue,
				key = cpu + '+' + ram,
				tipRow = $('.ram-tip-row');
			
			// 系统改变
			if(F.OsSet[key]){				
				F.os.list(F.OsSet[key]['os']).value(os);
			}else{
				F.os.list(F.OsDefaultSet['os']).value(os);
			}
			
			// 磁盘类型改变
			F._changeDisktype();			
			
			// 内存提示
			if(ram === '512'){
				tipRow.removeClass('row-li-hide');
			}else{
				tipRow.addClass('row-li-hide');
			}
			
			// 询价
			if(ram){
				F._inquiry();
			}
		});

		/*F.band.change(function(){
			var val = this.currentValue,
				tipRow = $('.band-tip-row');

			if(val < 1){
				tipRow.removeClass('row-li-hide');
			}else{
				tipRow.addClass('row-li-hide');
			}

			// 询价
			F._inquiry();

		});*/

		
		F.custom.change(function(){
			var val = F.custom.currentValue,
				osRow = $('.row-os');
			
			if(val){
				osRow.addClass('row-hide row-relative');
			}else{
				osRow.removeClass('row-hide row-relative').css({
					'overflow': 'hidden'
				});
				setTimeout(function(){
					osRow.removeAttr('style');
				}, 300);
			}
						
			$('.row-os').removeClass('row-error').find('.uc-select').removeClass('error');
			$('.row-custom').removeClass('row-error').find('.uc-select').removeClass('error');
		});
		
		F.region.change(function(){
			// 磁盘类型改变
			F._changeDisktype();
			
			// 磁盘重置
			//F._resetDisk();
			
			// zone改变
			if(F.isZoneSet){
				F._changeZone();
			}else{
				F._changeFinancialZone();
			}
			
			//console.log(F.region.currentValue);
			
			// 重置快照
			F._resetSnapshot();
			
			// 自定义镜像改变
			if(F._customIsLoaded){
				F._customSwitch();
			}
		});
		
		F.os.change(function(){
			var cpu = F.cpu.currentValue,
				ram = F.ram.currentValue,
				os = F.os.currentValue,
				osver = F.osver.currentValue,
				key = cpu + '+' + ram;
			
			// 系统改变
			if(F.OsSet[key]){	
				F.osver.list(os === '' ? [] : F.OsSet[key][os]).value(osver);
			}else{
				F.osver.list(os === '' ? [] : F.OsDefaultSet[os]).value(osver);
			}
			
			$('.row-os').removeClass('row-error').find('.uc-select').removeClass('error');
			$('.row-custom').removeClass('row-error').find('.uc-select').removeClass('error');
		});
		
		F.osver.change(function(){
			$('.row-os').removeClass('row-error').find('.uc-select').removeClass('error');			
			$('.row-custom').removeClass('row-error').find('.uc-select').removeClass('error');
		});
		
		F.disktype.change(function(){
			var val = this.currentValue,
				tipRow = $('.disk-type-tip-row');
				
			// 磁盘重置
			F._resetDisk();
			
			// zone改变
			if(F.isZoneSet){
				F._changeZone();
			}
			
			if(val === 'vm_yundisk_storage'){
				tipRow.addClass('row-li-hide');
			}else{
				tipRow.removeClass('row-li-hide');
			}
		});
		
		F.duration.change(function(){
	    	switch(this.currentValue){
		    	case 24:
		    		F.durationtip.html('<span class="text">花20个月钱享24个月服务！</span>');
		    		F.durationtip.setDeviationX(397);
		    		break;
		    	case 36:
		    		F.durationtip.html('<span class="text">花30个月钱享36个月服务！</span>');
		    		F.durationtip.setDeviationX(454);
		    		break;
		    	default:
		    		F.durationtip.html('<span class="text">花10个月钱享12个月服务！</span>');
		    		F.durationtip.setDeviationX(340);
		    		break;
	    	}
	    	
	    	// 询价
			F._inquiry();
    	});
    	
    	F.number.change(function(){
	    	// 询价
			F._inquiry();
    	});
	});
	
})(jQuery, document, UC);(function($, doc, U){
	
	$(doc).ready(function(){
	
		var F = U.form;		
		
		/* 数据盘类型 */
		$('.disktype-help').click(function(ev){
	        ev.preventDefault();
	        
	        F._showTip($(this), '.disktype-tip');
        });
		
		/* 数据盘 */
		$('.disk-add').click(function(ev){
			ev.preventDefault();

			F._diskAdd();
		});
		$('.disk-delete').live('click', function(ev){
			ev.preventDefault();
			
			F._diskDelete($(this).attr('data-disk-key'));
		});
		$('.disk-help').live('click', function(ev){
        	ev.preventDefault();
        	
        	F._showTip($(this), '.snapshot-tip');        
        });
		
		/* 快照 */
		$('.show-my-snapshot').live('click', function(ev){
			ev.preventDefault();			
			
	        F._snapshotCurrentDiskKey = $(this).attr('data-disk-key');
	        F._snapshotShow();
	        
	        F._showTip($(this), '.snapshot-box');
		});		
		$('.snapshot-box .do-close').click(function(ev){
	        ev.preventDefault();
	        
	        $('.snapshot-box').removeAttr('style');
        });
        $('.snapshot-list .unit:not(.unit-disabled)').live('click', function(ev){
        	ev.preventDefault();
        	
	        var t = $(this), sid, sname, sdisk, key;        
	        
	        $('.snapshot-box').removeAttr('style');	// 隐藏快照选择面板
	        
	        sid = t.attr('data-id');
	        sname = t.attr('data-name');
	        sdisk = t.attr('data-disk');
	        key = t.attr('data-disk-key');
	        
	    	F._snapshotReplace(F._snapshotCurrentDiskKey, {
		    	id: sid,
		    	name : sname,
		    	disk: sdisk
	    	});
	        
        });
        
        /* 可用区 */
        $('.zone-help').click(function(ev){
	        ev.preventDefault();
	        
	        F._showTip($(this), '.zone-tip');
        });
        $('#zone-checkbox').change(function(){
        	var zoneRow = $('.row-zone'),
        		zoneRandom = 0;
        	
	        if(this.checked){
		        zoneRow.addClass('row-li-hide');
	        }else{
		        zoneRow.removeClass('row-li-hide');
	        }
        });
        
        /* 云盾 */
        $('.yundun-help').click(function(ev){
	        ev.preventDefault();
	        
	        F._showTip($(this), '.yundun-tip');
        });
        
        /* 清单 */
        $('.lnk-delete-order').live('click', function(){
	      	var t = $(this),
	        	orderLine = t.closest('.order'),
	        	index = $('.uc-orders .order').index(orderLine);
	        	
	        F._lineDelete(index);
        });
        		
        /* 提交 */
        $('.button-order-now').click(function(){
	        var isdone = false, islogin = false;
	        
	        islogin = F._isLogin();	        
	        if(!islogin){
		        F._hrefLogin();
	        }else{
		        isdone = F._isFormDone();
		        if(isdone){
		        	$('.order-line-data').val(U.BASE64.encode(U.stringify([F._lineData()])));
			        $('.form-vm').submit();
		        }
	        }
        });
        $('.button-add-order').click(function(){
	        var isdone = false, islogin = false;
	        
	        islogin = F._isLogin();	        
	        if(!islogin){
		        F._hrefLogin();
	        }else{
		        isdone = F._isFormDone();
		        if(isdone){
			        F._lineAdd();
			        F._scrollToOrdersTop();
		        }
	        }        
        });
        $('.button-orders-now').click(function(){
	       	$('.form-orders').submit(); 
        });
        	
		/* tip */		
		$(doc).click(function(ev){	        
	        var elm = ev.target, 
	        	t = $(elm);
	        	
	        if(t.closest('.disk-help').length > 0 || t.closest('.snapshot-tip').length > 0){
		        $('.zone-tip').removeAttr('style');
		        $('.snapshot-box').removeAttr('style');
		        $('.yundun-tip').removeAttr('style');
		        $('.disktype-tip').removeAttr('style');
	        }else if(t.closest('.zone-help').length > 0 || t.closest('.zone-tip').length > 0){
		        $('.snapshot-tip').removeAttr('style');
		        $('.snapshot-box').removeAttr('style');
		        $('.yundun-tip').removeAttr('style');
		        $('.disktype-tip').removeAttr('style');
	        }else if(t.closest('.snapshot-box').length > 0 || t.closest('.show-my-snapshot').length > 0){
		        $('.snapshot-tip').removeAttr('style');
		        $('.zone-tip').removeAttr('style');
		        $('.yundun-tip').removeAttr('style');
		        $('.disktype-tip').removeAttr('style');
	        }else if(t.closest('.yundun-tip').length > 0 || t.closest('.yundun-help').length > 0){
		        $('.snapshot-tip').removeAttr('style');
		        $('.zone-tip').removeAttr('style');
		        $('.snapshot-box').removeAttr('style');
		        $('.disktype-tip').removeAttr('style');
	        }else if(t.closest('.disktype-tip').length > 0 || t.closest('.disktype-help').length > 0){
		        $('.snapshot-tip').removeAttr('style');
		        $('.zone-tip').removeAttr('style');
		        $('.snapshot-box').removeAttr('style');
		        $('.yundun-tip').removeAttr('style');
	        }else{
		        $('.snapshot-tip').removeAttr('style');
		        $('.zone-tip').removeAttr('style');
		        $('.snapshot-box').removeAttr('style');
		        $('.yundun-tip').removeAttr('style');
		        $('.disktype-tip').removeAttr('style');
	        }	        
        });
		
		/* 去登录 */
        $('.login-in-check').live('click', function(ev){
	        ev.preventDefault;
	        
	        F._hrefLogin();
        });
        
        
		
        /* 赋值 */		
		F._isSnapshot = true;
		F._isInquiry = true;
		F._pageLoad();
		//F._snapshotAjax('page');
		if(!window.vm_cache){
			if(!window.custom_switch){
				F._customAjax();
			}else{	
				/* 自定义镜像 */
				$('#uc-custom').one('click', function(){					
					/* 获取自定义数据 */
					F._customAjax();
				});
			}
		}
	});
	
})(jQuery, document, UC);(function($, doc, U){

	$(doc).ready(function(){
	
		var F = U.form;
	
    	/* 支付行跟随 */
		var followBar = function(){
			
			var $w = $(window), submitBar = $('.uc-buy .uc-submit'), form = $('.uc-buy .form'), winHeight = 0, winScrollTop = 0, formHeight = 0, formTop = 0, submitBarHeight = 0, maxTop = 0, minTop = 0;
			
			winHeight = $w.height();	// 窗口高度
			winScrollTop = $w.scrollTop();	// 窗口滚动高度
			formHeight = form.outerHeight();	// 表单高度
			formTop = form.offset().top;	// 表单纵坐标
			submitBarOuterHeight = submitBar.outerHeight();	// 提交条的高度
			submitBarHeight = submitBar.height();
			maxHeight = formHeight + formTop;	// 最大允许跟随坐标
			minHeight = formTop + 210;	// 最小允许跟随坐标	
			
			var setFixedFormPadding = function(){
				submitBarOuterHeight = submitBar.outerHeight();
				form.css({
					padding: '10px 0 ' + submitBarOuterHeight + 'px'
				});
			};
			var setFixedSubmitBar = function(){
				submitBarHeight = submitBar.height();
				submitBarOuterHeight = submitBar.outerHeight();
				submitBar.css({
					position: 'fixed',
					width: form.width(),
					//height: submitBarHeight,
					top: winHeight - submitBarOuterHeight,
					left: form.offset().left - 1 - $w.scrollLeft(),
					'border-width': 1
				});
			};
			var setStaticFormPadding = function(){
				form.css({
					padding: '10px 0 0'
				});
			};
			var setStaticSubmitBar = function(){
				submitBar.css({
					position: 'static',
					'border-width': '1px 0'
				});
			};
									
			if($.browser.msie && $.browser.version - 0 < 7){
				return false;
			}
									
			/* 页面加载时 */
			if(winScrollTop + winHeight <= maxHeight && winScrollTop + winHeight >= minHeight){
				setFixedFormPadding();
				setFixedSubmitBar();
			}
			
			/* 当滚动窗口时 */
			$w.scroll(function(){
				var currentWindowHeight;				
				
				formHeight = form.outerHeight();
				maxHeight = formHeight + formTop;
				
				winScrollTop = $w.scrollTop();
				currentWindowHeight = winScrollTop + winHeight;
				
				submitBar.css({
					left: form.offset().left - 1 - $w.scrollLeft()
				});
				
				if(currentWindowHeight <= maxHeight && currentWindowHeight >= minHeight){
					//if(submitBar.css('position') !== 'fixed'){
						setFixedFormPadding();
						setFixedSubmitBar();
					//}								
				}else{
					//if(submitBar.css('position') === 'fixed'){
						setStaticFormPadding();
						setStaticSubmitBar();
					//}
				}
				
			});
			
			/* 当改变窗口尺寸时 */
			$w.resize(function(){
				var currentWindowHeight;
				
				formHeight = form.outerHeight();
				maxHeight = formHeight + formTop;
			
				winHeight = $w.height();
				currentWindowHeight = winScrollTop + winHeight;
				
				if(currentWindowHeight <= maxHeight && currentWindowHeight >= minHeight){
					if(submitBar.css('position') !== 'fixed'){
						setFixedFormPadding();
					}
					setFixedSubmitBar();
				}else{
					if(submitBar.css('position') === 'fixed'){
						setStaticFormPadding();
						setStaticSubmitBar();
					}
				}
				
				/* 随页面宽度变化而变化 */
				submitBar.css({	
					width: form.width()
				});
				
			});
			
		};
		
		followBar();
	});
    
})(jQuery, document, UC);
