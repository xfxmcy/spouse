/**
 * 包含easyui的扩展和常用的方法
 * 
 * @author CY
 * 
 * @version 20120806
 */ 

var cy = $.extend({}, cy);/* 定义全局对象，类似于命名空间或包的作用 */


cy.errorMessage = 'system have a exception , please go on  your action after a while';

cy.uploadPath = '/resource/upload';
/**
 * @author CY
 * 
 * 增加formatString功能
 * 
 * 使用方法：sy.fs('字符串{0}字符串{1}字符串','第一个变量','第二个变量');
 * 
 * @returns 格式化后的字符串
 */
cy.fs = function(str) {
	for ( var i = 0; i < arguments.length - 1; i++) {
		str = str.replace("{" + i + "}", arguments[i + 1]);
	}
	return str;
};
/*********tree model**********/

function initialTree(){
	smoothness();
}
/**
 * @author xj
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展tree，使其支持平滑数据格式
 */
function smoothness(){
	$.fn.tree.defaults.loadFilter = function(data, parent) {
		var opt = $(this).data().tree.options;
		var idFiled, textFiled, parentField;
		if (opt.parentField) {
			idFiled = opt.idFiled || 'id';
			textFiled = opt.textFiled || 'text';
			parentField = opt.parentField;
			var i, l, treeData = [], tmpMap = [];
			for (i = 0, l = data.length; i < l; i++) {
				tmpMap[data[i][idFiled]] = data[i];
			}
			for (i = 0, l = data.length; i < l; i++) {
				if (tmpMap[data[i][parentField]] && data[i][idFiled] != data[i][parentField]) {
					if (!tmpMap[data[i][parentField]]['children'])
						tmpMap[data[i][parentField]]['children'] = [];
					data[i]['text'] = data[i][textFiled];
					tmpMap[data[i][parentField]]['children'].push(data[i]);
				} else {
					data[i]['text'] = data[i][textFiled];
					treeData.push(data[i]);
				}
			}
			return treeData;
		}
		return data;
	};
}
/*********dialog model**********/
function initialDialog(){
	dialogFrame.call(this);
	recoverMemory.call(this);
	closeDialog.call(this);
}
/**
 * @author CY
 * 
 * @requires jQuery,EasyUI
 * 
 * 防止panel/window/dialog组件超出浏览器边界
 * @param left
 * @param top
 */
function dialogFrame(){
	var easyuiPanelOnMove = function(left, top) {
		var l = left;
		var t = top;
		if (l < 1) {
			l = 1;
		}
		if (t < 1) {
			t = 1;
		}
		var width = parseInt($(this).parent().css('width')) + 14;
		var height = parseInt($(this).parent().css('height')) + 14;
		var right = l + width;
		var buttom = t + height;
		var browserWidth = $(window).width();
		var browserHeight = $(window).height();
		if (right > browserWidth) {
			l = browserWidth - width;
		}
		if (buttom > browserHeight) {
			t = browserHeight - height;
		}
		$(this).parent().css({/* 修正面板位置 */
			left : l,
			top : t
		});
	};
	$.fn.dialog.defaults.onMove = easyuiPanelOnMove;
	$.fn.window.defaults.onMove = easyuiPanelOnMove;
	$.fn.panel.defaults.onMove = easyuiPanelOnMove;
}
/**
 * @author CY
 * 
 * @requires jQuery,EasyUI
 * 
 * panel关闭时回收内存
 */
function recoverMemory(){
	$.fn.panel.defaults.onBeforeDestroy = function() {
		var frame = $('iframe', this);
		try {
			if (frame.length > 0) {
				for ( var i = 0; i < frame.length; i++) {
					frame[i].contentWindow.document.write('');
					frame[i].contentWindow.close();
				}
				frame.remove();
				if ($.browser.msie) {
					CollectGarbage();
				}
			}
		} catch (e) {
		}
	};
}
/**
 * @author CY
 * 
 * @requires jQuery,EasyUI
 * 
 * @param options
 */
function closeDialog(){
	cy.dialog = function(options) {
		var opts = $.extend({
			modal : true,
			onClose : function() {
				$(this).dialog('destroy');
			}
		}, options);
		return $('<div/>').dialog(opts);
	};
}

/*********valid model**********/

function initialValid(){
	eqPwd();
}
/**
 * @author CY
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展validatebox，添加验证两次密码功能
 */
function eqPwd(){
	$.extend($.fn.validatebox.defaults.rules, {
		eqPassword : {
			validator : function(value, param) {
				return value == $(param[0]).val();
			},
			message : '密码不一致！'
		}
	});
}
/**
 * @author CY
 * 
 * @requires jQuery,EasyUI
 * 
 * 单一选中
 */
function selectedSingle(){
	
	var rowSelected = this.datagrid('getSelections');
	if(null == rowSelected || 1 != rowSelected.length)
		return false;
	/*当前选中了*/
	return true;
}
/**
 * @author CY
 * 
 * @requires jQuery,EasyUI
 * 
 * 简单使用messager.show
 */
function simpleMessShow(pTitle,pMsg,pTimeout,pShowType){
	$.messager.show({
		title:pTitle,
		msg:pMsg,
		timeout:pTimeout,
		showType:pShowType
	});
} 
/**
 * @author CY
 * 
 * @requires jQuery
 * 
 * 将form表单元素的值序列化成对象
 * 
 * @returns object
 */
cy.serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (o[this['name']]) {
			o[this['name']] = o[this['name']] + "," + this['value'];
		} else {
			o[this['name']] = this['value'];
		}
	});
	return o;
};
/**
 *  图片类型转换
 */

cy.transHomePhotoType= function(value) {
	var statusValue = {};
	statusValue.status = "";
	switch (value) {
	case "0":
		statusValue.status = "待审核";
		break;
	case "1":
		statusValue.status = "申请被打回";
		break;
	case "2":
		statusValue.status = "待开启";
		break;
	case "3":
		statusValue.status = "已开启";
		break;
	case "4":
		statusValue.status = "进行中";
		break;
	case "5":
		statusValue.status = "评价完毕";
		break;
	case "6":
		statusValue.status = "结项草稿";
		break;
	case "7":
		statusValue.status = "待结项审核";
		break;
	case "8":
		statusValue.status = "结项被打回";
		break;
	case "9":
		statusValue.status = "待入库";
		break;
	case "10":
		statusValue.status = "已结束";
		break;
	case "11":
		statusValue.status = "待评价";	
		break;
	default:
		statusValue.status = "已结束";
		break;
	}
	return statusValue;
};
/**
 * @author CY
 * 将JSON对象转换成字符串
 * 
 * @param o
 * @returns string
 */
cy.jsonToString = function(o) {
	var r = [];
	if (typeof o == "string")
		return "\"" + o.replace(/([\'\"\\])/g, "\\$1").replace(/(\n)/g, "\\n").replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\"";
	if (typeof o == "object") {
		if (!o.sort) {
			for ( var i in o)
				r.push(i + ":" + obj2str(o[i]));
			if (!!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(o.toString)) {
				r.push("toString:" + o.toString.toString());
			}
			r = "{" + r.join() + "}";
		} else {
			for ( var i = 0; i < o.length; i++)
				r.push(obj2str(o[i]));
			r = "[" + r.join() + "]";
		}
		return r;
	}
	return o.toString();
};
/**
 * @author CY
 * 
 * @requires jQuery,EasyUI
 * 
 * 简单使用messager.show
 */
function simpleMessConf(pTitle,pMsg,pFn){
	$.messager.confirm(pTitle,pMsg,pFn);
}

/**
 * @author CY
 * 
 * @requires jQuery,EasyUI
 * 
 * 简单使用messager.alert
 */
function simpleMessAlert(pTitle,pMsg,pIcon,pFn){
	$.messager.alert(pTitle,pMsg,pIcon,pFn);
}

/**
 * @author CY
 * 
 * model 转换
 */
cy.transModelInFront= function(value) {
	var statusValue = {};
	statusValue.status = "";
	switch (value) {
	case "0":
		statusValue.status = "ours";
		break;
	case "1":
		statusValue.status = "her";
		break;
	case "2":
		statusValue.status = "him";
		break;
	case "3":
		statusValue.status = "schedule";
		break;
	case "4":
		statusValue.status = "index";
		break;	
	default:
		statusValue.status = "ours";
		break;
	}
	return statusValue;
};
