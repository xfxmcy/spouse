$.extend($.fn.validatebox.defaults.rules, {  
	maxLength: {  
        validator: function(value, param){  
        	
        	var tempLength = 0;
        	if (value) {
        		
        		var length = value.length;
        		
        		
        		for (var index = 0; index < length; index ++) {
        			
        			var char = value.charAt(index);
        			
        			if (/[\x00-\xff]/.test(char)) {
        				++tempLength;
        			} else {
        				tempLength += 3;
        			}
        		}
        	}
            return tempLength <= param[0];  
        },  
        message: '您输入的字符过长，请重新输入。'
    },
    
    codeChar : {
    	validator: function (value, param) {
    		
    		var reg = /^[A-Za-z0-9_$]+$/;
    		
    		return reg.test(value);
    	},
    	message: '请输入字母、数字、下划线或者$。'
    },
    
    nameChar: {
    	validator: function (value, param) {
    		
    		//var val = $.trim(value);
    		var reg = /[^<>&'@￥%!*#]+$/;
    		var vin = value.indexOf(" ");
    		var as = reg.test(value);
    		if(vin != -1){
    			return false;
    		}
    		return as;
    	},
    	message: '不能输入空白字符和特殊字符。'
    },
    
    muleNameChar: {
    	validator: function (value, param) {
    		
    		var reg = /^[A-Za-z0-9_$]+$/;
    		var vin = value.indexOf(" ");
    		var as = reg.test(value);
    		if(vin != -1){
    			return false;
    		}
    		return as;
    	},
    	message: '请输入字母、数字、下划线或者$。'
    },
    
    portChar: {
    	validator: function (value, param) {
    		
    		var reg = /^[0-9]+$/;
 
    		return reg.test(value);
    	},
    	message: '只能输入数字。'
    },
    
    ipChar: {
    	validator: function (value, param) {
    		
    		var reg = /^(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.)(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.){2}([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))$/;
 
    		return reg.test(value);
    	},
    	message: '请输入正确的IP地址。'
    },
    
    pathChar: {
    	validator: function (value, param) {
    		
    		var reg = /^[A-Za-z0-9_\/\.+]+$/;
 
    		return reg.test(value);
    	},
    	message: '请输入字母、数字、下划线或者反斜杠。'
    },
    
    addrChar: {
    	validator: function (value, param) {
    		
    		var reg = /^http\:\/\/.+$/;
 
    		return reg.test(value);
    	},
    	message: '请输入正确的服务地址。'
    },
    
    methodChar: {
    	validator: function (value, param) {
    		
    		var reg = /^[A-Za-z0-9_\.]+$/;
 
    		return reg.test(value);
    	},
    	message: '只能输入英文。'
    },
    
    emailChar: {
    	validator: function (value, param) {
    		
    		var reg = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
 
    		return reg.test(value);
    	},
    	message: '请输入正确的电子邮箱！'
    },
    
    chinaChar: {
    	validator: function (value, param) {
    		
    		var reg = /^[\u4e00-\u9fa5]+$/;
 
    		return reg.test(value);
    	},
    	message: '请输入中文！'
    }
    
});  