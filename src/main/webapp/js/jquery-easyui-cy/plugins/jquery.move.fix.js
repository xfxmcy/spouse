$.fn.dialog.defaults.onMove = function (left, top) {
	
	var p = $(this).parent();
	
	if (left < 0) {
		p.css("left", 0);
	}
	
	if (top < 0) {
		p.css("top", 0);
	}
	
};