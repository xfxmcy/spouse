<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${cy}/js/jquery-easyui-cy/jquery.cookie.js" charset="utf-8"></script>
<link rel="stylesheet" href="${cy}/js/jquery-easyui-portal/portal.css" type="text/css"></link>
<script type="text/javascript" charset="utf-8" src="${cy}/js/jquery-easyui-portal/jquery.portal.js">
</script>
<script type="text/javascript" charset="utf-8">

	var portal;
	var panels;

	$(function() {
		
		panels = [ {
			id : 'p1',
			title : 'CY',
			height : 420,
			collapsible : true,
			href:'${cy}/xfxmcy/primary/portal/president.jsp'
		}, {
			id : 'p2',
			title : 'XX',
			height : 420,
			collapsible : true,
			href:'${cy}/xfxmcy/primary/portal/commodity.jsp'
		}/* , {
			id : 'p4',
			title : 'description',
			height : 260,
			collapsible : true,
			content : '<h1>可以拖动面板的顺序，他会记住的，下次打开的时候，还是你之前调节过的顺序哦</h1><div><img src="images/mingren.jpg"/></div>'
		}, {
			id : 'p5',
			title : '目前实现的功能',
			height : 260,
			collapsible : true,
			href:'${cy}/index/indexLayout/portal/about2.jsp'
		} */ ];

		portal = $('#portal').portal({
			border : false,
			fit : true,
			onStateChange : function() {
				$.cookie('portal-state', getPortalState(), {
					expires : 7
				});
			}
		});
		var state = $.cookie('portal-state');
		if (!state) {
		//	state = 'p1,p2:p4,p5';/*冒号代表列，逗号代表行 p1,p2,p3:p4,p5,p6';*/
			state = 'p1:p2';
		}
		addPanels(state);
		portal.portal('resize');

	});

	function getPanelOptions(id) {
		for ( var i = 0; i < panels.length; i++) {
			if (panels[i].id == id) {
				return panels[i];
			}
		}
		return undefined;
	}
	
	function getPortalState() {
		var aa=[];
		for(var columnIndex=0;columnIndex<2;columnIndex++) {
			var cc=[];
			var panels=portal.portal('getPanels',columnIndex);
			for(var i=0;i<panels.length;i++) {
				cc.push(panels[i].attr('id'));
			}
			aa.push(cc.join(','));
		}
		return aa.join(':');
	}
	
	function addPanels(portalState) {
		var columns = portalState.split(':');
		for (var columnIndex = 0; columnIndex < columns.length; columnIndex++) {
			var cc = columns[columnIndex].split(',');
			for (var j = 0; j < cc.length; j++) {
				var options = getPanelOptions(cc[j]);
				if (options) {
					var p = $('<div/>').attr('id', options.id).appendTo('body');
					p.panel(options);
					portal.portal('add', {
						panel : p,
						columnIndex : columnIndex
					});
				}
			}
		}
	}
</script>
<div id="portal" style="position:relative;" >
	<div></div>
	<div></div>
</div>