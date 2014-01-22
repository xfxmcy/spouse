<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>文件上传</title>
<link href="${cy}/jslib/swfupload/css/default.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="${cy}/jslib/cyUI/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${cy}/jslib/swfupload/swfupload.js"></script>
<script type="text/javascript" src="${cy}/jslib/swfupload/swfupload.queue.js"></script>
<script type="text/javascript" src="${cy}/jslib/swfupload/fileprogress.js"></script>
<script type="text/javascript" src="${cy}/jslib/swfupload/handlers.js"></script>

<link rel="stylesheet" href="${cy}/jslib/swfupload/css/default.css">

</head>
<body>
	<div>
		<form id="form1" action="" method="post" enctype="multipart/form-data">
			<div class="fieldset flash" id="fsUploadProgress">
				<span class="legend">上传队列</span>
			</div>
			<div id="divStatus">0 个文件已上传</div>
			<div>
				<span id="spanButtonPlaceHolder"></span> <input id="btnCancel"
					type="button" value="取消上传"
					disabled="disabled"
					style="margin-left: 2px; font-size: 8pt; height: 29px;" />
			</div>

		</form>
	</div>
	<script type="text/javascript">
		var callBackFunc = "${param.params}";
		var successFunc = "${param.success}";
		var params = {};
		var p = window.parent == self ? false: window.parent;
		if (p && callBackFunc) {
			if (p[callBackFunc] && typeof p[callBackFunc] === "function") {
				params = p[callBackFunc].call(p);
			}
		}
		
		$(function () {
			
			
			var settings = {
					flash_url : "${cy}/jslib/swfupload/swfupload.swf",
					upload_url : "${cy}/UploadServlet",
					use_query_string: true,
					file_size_limit : "5000 MB",
					file_types : "*.*",
					file_types_description : "All Files",
					file_upload_limit : 0,
					file_queue_limit : 2,
					custom_settings : {
						progressTarget : "fsUploadProgress",
						cancelButtonId : "btnCancel"
					},
					debug : false,

					// Button settings
					button_image_url : "${cy}/jslib/swfupload/images/TestImageNoText_65x29.png",
					button_width : "65",
					button_height : "29",
					button_placeholder_id : "spanButtonPlaceHolder",
					button_text : '<span class="theFont">上传文件</span>',
					button_text_style : ".theFont { font-size: 12; }",
					button_text_left_padding : 7,
					button_text_top_padding : 3,

					// The event handler functions are defined in handlers.js
					file_queued_handler : fileQueued,
					file_queue_error_handler : fileQueueError,
					file_dialog_complete_handler : fileDialogComplete,
					upload_start_handler : uploadStart,
					upload_progress_handler : uploadProgress,
					upload_error_handler : uploadError,
					upload_success_handler : uploadSuccess,
					upload_complete_handler : uploadComplete,
					queue_complete_handler : queueComplete
				// Queue plugin event
				};
			
			$.extend(settings, params);
			
			var swfu = new SWFUpload(settings);
			
			$("#btnCancel").click(function () {
				swfu.cancelQueue();
			});
			
		});
		
		function uploadSuccess(file, serverData) {
			try {
				
				var progress = new FileProgress(file, this.customSettings.progressTarget);
				progress.setComplete();
				
				var sData = eval("("+serverData+")");
				if (sData.hasError) {
					progress.setStatus("文件上传失败。");
					progress.toggleCancel(false);
					return ;
				}
				progress.setStatus("文件上传成功。");
				progress.toggleCancel(false);
				
				
				
				if (p && successFunc) {
					if (p[successFunc] && typeof p[successFunc] === "function") {
						p[successFunc].call(p, serverData);
					}
				}
				
			} catch (ex) {
				this.debug(ex);
			}
		}
		
	</script>
</body>
</html>