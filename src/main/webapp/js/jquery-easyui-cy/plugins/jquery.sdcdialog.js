(function($) {

	function createESDialog(target) {
		//通过此处创建真正的dialog
		var totalDialogShow = window.top.$("#mainArea");
		if(totalDialogShow.length<1){
			$(window.top.document.body).append("<div id=\"mainArea\"></div>");
			totalDialogShow = window.top.$("#mainArea");
		}
		
		totalDialogShow.dialog({
			 modal:true,
	    	 closed:false,
	    	 width: 700,
	    	 height:400,
	    	 top:100,
	    	 title:'why'
		});
		
	}
	
	
	$.ESDialog = function(options, param){
		if (typeof options == 'string'){
			return $.ESDialog.methods[options](this, param);
		}
		
		options = options || {};
		createESDialog(this);
	};
	
	$.ESDialog.methods = {
		options: function(jq){
			return $.data(jq[0], 'esdialog').options;
		}
	};
	
	$.ESDialog.parseOptions = function(target){
		var t = $(target);
		return $.extend({}, $.parser.parseOptions(target, ['id']), 
		{disabled: (t.attr('disabled') ? true : undefined)});
	};
	
	$.ESDialog.defaults = {
		id: null
	};
	

})(jQuery);