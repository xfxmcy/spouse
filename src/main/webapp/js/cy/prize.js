/*get webRoot*/
function getWebRootPath() {
	var webroot=document.location.href;
	webroot=webroot.substring(webroot.indexOf('//')+2,webroot.length);
	webroot=webroot.substring(webroot.indexOf('/')+1,webroot.length);
	webroot=webroot.substring(0,webroot.indexOf('/'));
	var rootpath="/"+webroot;
	var lh = location.host;
	return lh+rootpath;
};

//向body中添加元素
var newDiv = document.createElement("div");
newDiv.id = "iss_tjise_sms_div";
newDiv.name = "iss_tjise_sms_div";
newDiv.text = "dsfsdfsd";
newDiv.setAttribute("style", "height: 100px;");
//newDiv.setAttribute("style", "width: 200px;");
var newA = document.createElement("a");
newA.setAttribute("href", "###");
newA.setAttribute("onclick", "openPrize();");
newDiv.appendChild(newA);

window.onload = function() {
	document.body.appendChild(newDiv);
};