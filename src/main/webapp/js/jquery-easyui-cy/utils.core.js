$(function () {
	
	if (window.utils) {
		return;
	}
	
	var defalutLockImage = '/ui/themes/icons/busy.gif';
	var defaultLockMsg = "正在处理中……";
	
	var trimReg = /(^\s+)|(\s+$)/;
	
	window.utils = {
			
		trimForm : function (formId) {
			if (!formId) {
				return ;
			}
			
			var $form = $("#"+formId);
			
			if ($form.length > 0 ) {
				$form
					.find(":input") // 取得form下所有的input元素
					.each(function (index, obj) {
						if (trimReg.test(obj.value)) {
							obj.value = $.trim(obj.value);
						}
					});
			}
		},
			
		lockPage : function (imageURL, msg) {
			$.blockUI({
				message : '<img src="' + this.getContextPath()
						+ (imageURL || defalutLockImage)
						+ '"></img><span style="font-size:12pt;">'
						+ (msg || defaultLockMsg) + '</span>'
			});
		},
		
		unlockPage : function () {
			$.unblockUI();
		},
		
		getContextPath : function () {
			return window._contextPath;
		},
		
		ajax: function (url, data, fn) {
			utils.lockPage();
			$.ajax({
				url: url,
				type:"POST",
				data: data,
				dataType: "json",
				success : function (r) {
					
					utils.unlockPage();
					
					if (r.hasError) {
						$.messager.alert("系统提示", r.errorMsg, "error");
					} else {
						if (typeof fn === "function") {
							fn.call(window, r.result);
						}
					}
				}
			});
			
		}
	};
	//
	Date.prototype.format = function(format)
	{
	var o = {
	"M+" : this.getMonth()+1, //month
	"d+" : this.getDate(), //day
	"h+" : this.getHours(), //hour
	"m+" : this.getMinutes(), //minute
	"s+" : this.getSeconds(), //second
	"q+" : Math.floor((this.getMonth()+3)/3), //quarter
	"S" : this.getMilliseconds() //millisecond
	};
	if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
	(this.getFullYear()+"").substr(4 - RegExp.$1.length));
	for(var k in o)if(new RegExp("("+ k +")").test(format))
	format = format.replace(RegExp.$1,
	RegExp.$1.length==1 ? o[k] :
	("00"+ o[k]).substr((""+ o[k]).length));
	return format;
	};
});
function datetimeFormatter(value, row, index) {
	var c = new Date();
	c.setTime(value);
	return c.format("yyyy-MM-dd");
}
var sy = $.extend({}, sy);/* 定义全局对象，类似于命名空间或包的作用 */
/**
 * @author CY
 * 
 * @requires jQuery
 * 
 * 将form表单元素的值序列化成对象
 * 
 * @returns object
 */
sy.serializeObject = function(form) {
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
