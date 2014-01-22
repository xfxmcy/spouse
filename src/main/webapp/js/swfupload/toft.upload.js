
function createUpload(options) {
	var settings = {
		flash_url : options.contextPath + "/upload/swfupload/swfupload.swf",
		upload_url : options.contextPath + "/UploadServlet",
		file_size_limit : options.fileSizeLimit || "2 MB",
		file_types : options.fileTypes || "*.*",
		 file_types_description : options.fileTypesDescription || "All Files",
		file_upload_limit : 100,
		file_queue_limit : options.fileQueueLimit || 1,
		custom_settings : options.customSettings || {

		},
		//debug : true,

		// Button settings
		//button_image_url: "images/TestImageNoText_65x29.png",
		button_width : "60",
		button_height : "20",
		button_placeholder_id : options.buttonId || "spanButtonPlaceHolder",
		button_text : '<span class="theFont">浏览…</span>',
		button_text_style : ".theFont { font-size: 12;} .theFont:hover{color:#F00;}",
		button_text_left_padding : 12,
		button_text_top_padding : 3,

		file_dialog_start_handler : options.fileDialogStartHandler
				|| function() {
					this.cancelUpload();
				},

		file_queued_handler : options.fileQueuedHandler || function(file) {

			if (options.fileDesc) {
				var _file = document.getElementById(options.fileDesc);
				_file.value = file.name;
			}
		},
		file_queue_error_handler : options.fileQueueErrorHandler
				|| function(file, errorCode, message) {
					if (errorCode == SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT) {
						_showMessage("你上传的文件超出了允许的最大文件限制");
					}
				},
		file_dialog_complete_handler : function(a, b, c) {
			var file = this.getFile();
			if (file) {
				if (file.name) {
					if(options.fileArea) {
						$("#"+options.fileArea).val(file.name);
					}
				}
			}
		},
		upload_start_handler : function(file) {
			
		},
		upload_progress_handler : function() {
		},
		upload_error_handler : function() {

		},
		upload_success_handler : options.uploadSuccessHandler
				|| function(file, serverData) {
					if (options.urlDomId) {
						var data = JSON.parse(serverData);
						if (data["hasError"]) {
							_showMessage(data["errorMsg"]);
						} else {
							var urls = [];
							
							for ( var index = 0; index < data.length; index++) {
								
								var encodedUrl = data[index]["name"];
								urls.push(data[index]["url"]+"&fileName="+encodeURIComponent(encodedUrl));
							}
							
							var url = urls.join(",");
							
							document.getElementById(options.urlDomId).value = url;
							_showMessage("文件上传成功");
							
							if (options.linkButtonId) {
								
								var $linkBtn = $("#"+options.linkButtonId);
								
								if ($linkBtn.length > 0) {
									$linkBtn.attr("url", options.contextPath+"/"+url);
								}
							}
						}
					}

				},
		upload_complete_handler : function() {
		},
		queue_complete_handler : function() {
		}
	};

	return new SWFUpload(settings);
}

function _showMessage(msg) {
	if (jQuery && jQuery.messager) {
		jQuery.messager.alert("系统提示", msg, "info");
	} else {
		alert(msg);
	}
}

function setFileURL(domId, url) {
	var fileURL = url;
	
	var eqIndex = fileURL.lastIndexOf("=");
	
	fileURL = $.trim(fileURL.substring(eqIndex+1));
	
	$("#"+domId).val(decodeURIComponent(fileURL));
}