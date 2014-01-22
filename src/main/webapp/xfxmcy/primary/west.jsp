<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<script type="text/javascript" charset="utf-8">
	var tree;
	var menuPanel;
	$(function() {
		/*初始化页面*/
		easyloader.load([ "tree", "dialog", "parser", "tabs", "accordion",
				"layout", "blockUI", "messager" ], function() {
			/*加载 dialog plugin*/
			initialDialog.call(this);
			/*加载 tree plugin*/
			initialTree.call(this);
			menuPanel = $('#menuPanel').panel({
				tools : [ {
					iconCls : 'icon-reload',
					handler : function() {
						tree.tree('reload');
					}
				}, {
					iconCls : 'icon-redo',
					handler : function() {
						var node = tree.tree('getSelected');
						if (node) {
							tree.tree('expandAll', node.target);
						} else {
							tree.tree('expandAll');
						}
					}
				}, {
					iconCls : 'icon-undo',
					handler : function() {
						var node = tree.tree('getSelected');
						if (node) {
							tree.tree('collapseAll', node.target);
						} else {
							tree.tree('collapseAll');
						}
					}
				} ]
			});
			if ('${sessionInfo.userId}') {
				ctrlTree();
			}
		});
	});
	/*构建树*/
	function ctrlTree() {
		tree = $('#menu').tree({
			url : '${cy}/menu/menuCtrlTree/simple.do',
			parentField : 'pid',
			lines : true,
			onClick : function(node) {
				addTab(node);
			},
			onDblClick : function(node) {
				if (node.state == 'closed') {
					$(this).tree('expand', node.target);
				} else {
					$(this).tree('collapse', node.target);
				}
			}
		});
	}
</script>
<div class="easyui-accordion" fit="true" border="false">
	<div title="菜单">
		<div id="menuPanel" fit="true" border="false" title="功能菜单"
			style="padding: 5px;">
			<ul id="menu"></ul>
		</div>
	</div>
	<div title="其他内容"></div>
</div>