$.fn.SDCDialog = function(options) {
	
	var defaults = {
		width : 300,
		height : 200,
		title : '此处标题',
		html : '',
		iconCls : '',
		submit : function() {
			alert('可执行代码.');
		}
	};
	
	
	
	var id = $(this).attr('id');
	options = $.extend(defaults, options);
	var self = this;

	$(self).dialog({
		title : options.title,
		height : options.height,
		width : options.width,
		iconCls : options.iconCls,
		buttons : [ {
			text : '确定',
			iconCls : 'icon-ok',
			handler : options.submit
		}, {
			text : '取消',
			iconCls : 'icon-cancel',
			handler : function() {
				$('#' + id).dialog('close');
			}
		} ]
	});
};