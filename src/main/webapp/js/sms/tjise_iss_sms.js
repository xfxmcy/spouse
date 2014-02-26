function openSMS() {
	//弹出一个dialog
	window
			.open(
					'' + urlConf.url + '',
					'聊天窗口',
					'top=50px,left=500px,resizable=yes,scrollbars=no,height=390px,width=180px,status=no,toolbar=no,titlebar=no,location=no',
					false);
	// window.open('jwchat.jsp',makeWindowName('admin@im.iss.com/tjise'),'width=180,height=390,resizable=yes',false);
}

//向body中添加元素
var newDiv = document.createElement("div");
newDiv.id = "iss_tjise_sms_div";
newDiv.name = "iss_tjise_sms_div";
newDiv.text = "dsfsdfsd";
newDiv.setAttribute("style", "height: 48px;");
var newA = document.createElement("a");
newA.setAttribute("href", "###");
newA.setAttribute("ondblclick", "openSMS();");
newDiv.appendChild(newA);

window.onload = function() {
	document.body.appendChild(newDiv);
};