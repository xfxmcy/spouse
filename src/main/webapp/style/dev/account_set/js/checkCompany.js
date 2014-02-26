/*
		验证函数
	*/
	function strlen(str){  
	    var len = 0;  
	    for (var i=0; i<str.length; i++) {   
	     var c = str.charCodeAt(i);   
	    //单字节加1   
	     if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) {   
	       len++;   
	     }   
	     else {   
	      len+=2;   
	     }   
	    }   
	    return len;  
	}  
	
	
	
	
	function fn_checkCompanyName(){
		var s=$("input[name='companyName']").val().trim();
		if(strlen(s)<4 || strlen(s)>50){
			$("#checkCompanyName").html("所输入字节应在4-50之间");
			return false;
		}else{
			$("#checkCompanyName").html("");
			return true;
		}
	}
	function fn_checkCompanyAddress(){
		var s=$("input[name='companyAddress']").val().trim();
		if(strlen(s)<4 || strlen(s)>50){
			$("#checkCompanyAddress").html("所输入字节应在4-50之间");
			return false;
		}else{
			$("#checkCompanyAddress").html("");
			return true;
		}
	}
	function fn_checkCompanyPrincipal(){
		var s=$("input[name='companyPrincipal']").val().trim();
		if(strlen(s)<4 || strlen(s)>50){
			$("#checkCompanyPrincipal").html("所输入字节应在4-50之间");
			return false;
		}else{
			$("#checkCompanyPrincipal").html("");
			return true;
		}
	}
	
	
	function fn_checkCompanyEmail(){
		var s=$("input[name='companyEmail']").val().trim();
		var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if(!myreg.test(s)){
			$("#checkCompanyEmail").html("邮箱格式不正确");
			return false;
		}else{
			$("#checkCompanyEmail").html("");
			return true;
		}
	}
	

	function fn_checkCompanyPhone(){
		var s=$("input[name='companyPhone']").val().trim();
		var myreg = /((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/;
		if(!myreg.test(s)){
			$("#checkCompanyPhone").html("手机格式不正确");
			return false;
		}else{
			$("#checkCompanyPhone").html("");
			return true;
		}
	}
	
	function fn_checkCompanyAcce(){
		var s=$("#fileUl").html().trim();
		if(s==null || s==""){
			$("#checkCompanyAcce").html("请上传企业认证文件");
			return false;
		}else{
			$("#checkCompanyAcce").html("");
			return true;
		}
	}
	
	