<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="/xfxmcy/initialEasyUI.jsp"></jsp:include>
<head>
<script type="text/javascript">
	var manageFavorite;
	var nodeCurrent ;// 当前选中节点
	var linkDialog;  // 链接form 
	var idIndex = 100;
	var queryType = 'queryTreegrid'; // 查询参数
	/* 右键menu */
	function onContextMenu(e,row){
		e.preventDefault();
		$(this).treegrid('select', row.id);
		$('#mm').menu('show',{
			left: e.pageX,
			top: e.pageY
		});
	}
	
	
	/*append*/
	function appendMaterialLink(){
		var formDialog;
		var objectLink;
		nodeCurrent = $('#favorite_grid').treegrid('getSelected');
		 linkDialog = parent.cy.dialog({
			title : 'add a favorite',
			href : '${cy}/xfxmcy/my/favorite/favorite.jsp?type=simpleSave&parentId='+nodeCurrent.id,
			width : 440,
			height : 183,
			buttons : [ {
				text : 'add',
				handler : function() {			
					formDialog = linkDialog.find('form');
					$.post('${cy}/favorite/favoritePersistent.do',cy.serializeObject(formDialog),function(json){
						if (json.success) {
							objectLink = {};
							manageFavorite.treegrid('reload');
						//	addLink(json.otherMessage);
							linkDialog.dialog('close');
						}
						parent.simpleMessAlert.call(this,'提示',json.message);
					},'json');
					/* formDialog.form('submit', {
						url : '${cy}/favorite/favoritePersistent.do',
						success : function(d) {
							var json = $.parseJSON(d);
							if (json.success) {
								objectLink = {};
								manageFavorite.treegrid('reload');
							//	addLink(json.otherMessage);
								linkDialog.dialog('close');
							}
							simpleMessAlert.call(this,json.message,'提示');
						}
					});*/
				} 
			}, {
				text : 'clean',
				handler : function() {
					formDialog.form('clear');	
				}
			}],
			onLoad : function(){
				//formDialog = ('#material_link_linkForm').form();
			}
			
		});
		
	}
	/*add link entity in front desk , not fresh page*/
	/*not using*/
	function addLink(objectLink){
		idIndex++;
		var createDate = new Date();
		//var node = $('#favorite_grid').treegrid('getSelected');
		$('#favorite_grid').treegrid('append',{
			parent: nodeCurrent.id,
			data: [{
				id: objectLink.id,
				mtitle: objectLink.mtitle,
				linkStr: objectLink.linkStr,
				persistDate: $.fn.datebox.defaults.formatter(createDate),
				mdescription: objectLink.mdescription
			}]
		});
		//nodeCurrent = null;
	}
	
	/*collapse the tree*/
	function collapse(){
		var node = $('#favorite_grid').treegrid('getSelected');
		if (node){
			$('#favorite_grid').treegrid('collapse', node.id);
		}
	}
	/*expand the tree*/
	function expand(){
		var node = $('#favorite_grid').treegrid('getSelected');
		if (node){
			$('#favorite_grid').treegrid('expand', node.id);
		}
	}
	
	
	
	/*initial*/
	$(function() {
		/*初始化页面*/
		easyloader.load(["tree","treegrid","dialog", "parser", "tabs","validatebox", "combobox", "form", "blockUI", "messager",
				"validMethods", "datebox", "datagrid" ], function() {
			/*treegrid*/
			manageFavorite = $('#favorite_grid')
					.treegrid(
							{
								fit : true, //强烈使用
								title : 'my Favorite',
								url : '${cy}/favorite/favoriteQuery.do?queryType=queryTreegrid',
							//	url : '${pageContext.request.contextPath}/jquery-easyui-1.3.3/demo/treegrid/treegrid_data2.json',
								fitColumns : true,//列很少的情况使用,自使用,尽量不出现滚动条
								pagination : true,
								rownumbers : true,//渲染时间加长 ,数量大的时候,宽度不知道是否满足
								animate: true,
								toolbar:'#favoriteToolBar',
							//	parentField : 'pid',
								idField: 'id',
							//	width:770,
							//	height:450,
								pageSize:1,
								pageList:[1,2,4],
								treeField: 'title',
								checkOnSelect : false,//选中行时,是否选中复选框
								selectOnCheck : false,//选中复选框时,是否选中行   加设复选框
								singleSelect  : true,
								onContextMenu: onContextMenu,
								frozenColumns : [ [ {
									field : 'title',
									title : '标题',
									//hidden : true,
									//checkbox : true,
									width : 200   //不设置宽度,加载变慢
								}, {
	
									field : 'url',
									title : '链接',
									width : 200,
									formatter:function(value){
										if(null == value || ""==value){
											return value;
										}
										return "<a href='"+value+"' target='_blank'>"+value+"</a>";
									}
	
								} ] ],
								columns : [ [ {
									field : 'formatterCreatetime',
									title : '添加时间',
									width : 150
								}, {
									field : 'description',
									title : '说明',
									width : 200
								}] ],
								onLoadSuccess:function(row, data){
									//queryType = 'queryTreegrid';
								}
							});
							
			/*north面板的 两个linkbutton和input*/
			/* $('#favorite_manage_search').linkbutton({
				iconCls : 'icon-search'
			});
			$('#favorite_manage_clear').linkbutton({
				iconCls : 'icon-redo'
			}); */
			/*根据查询条件查询*/
			/* $('#favorite_manage_search').bind('click', function() {
	
				manageFavorite.datagrid('load', {});
	
			}); */
			/*查询条件清空*/
			/* $('#favorite_manage_clear').bind('click', function() {
	
				manageFavorite.datagrid('load');
			}); */
			
			$("body").css("visibility","visible");
		});
	});
	
	/*addMaterialLink,editMaterialLink,removeMaterialLink*/
	function editMaterialLink() {
		nodeCurrent = $('#favorite_grid').treegrid('getSelected');
		if(!isEdited(nodeCurrent)){
			parent.simpleMessAlert.call(this,'当前节点不可操作','提示');
		}
		else{
			var parentNode = manageFavorite.treegrid("getParent",nodeCurrent.id);
		    linkDialog = parent.cy.dialog({
			title : '修改链接',
			href : '${cy}/xfxmcy/my/favorite/favorite.jsp?type=simpleUpdate&mid='+nodeCurrent.id,
			width : 440,
			height : 183,
			buttons : [ {
				text : '修改',
				handler : function() {			
					formDialog = linkDialog.find('form');
					$.post('${cy}/favorite/favoriteMerge.do',cy.serializeObject(formDialog),function(json){
						if (json.success) {
							objectLink = {};
							manageFavorite.treegrid('reload');
						//	addLink(json.otherMessage);
							linkDialog.dialog('close');
						}
						parent.simpleMessAlert.call(this,'提示',json.message);
					},'json');
				}
			}, {
					text : '清空',
					handler : function() {
						formDialog.form('clear');	
					}
				}],
				onLoad : function(){
					formDialog = linkDialog.find('form');
					/*赋值*/
					formDialog.find('#mdescription').val(nodeCurrent.description);
					formDialog.find('#mtitle').val(nodeCurrent.title);
					formDialog.find('#linkStr').val(nodeCurrent.url);
					formDialog.find('#parentId').val(nodeCurrent.pid);
				}	
			});
			
		}
	}
	
	/*删除链接确认*/
	function removeMaterialLink() {
		nodeCurrent = $('#favorite_grid').treegrid('getSelected');
		if(!isEdited(nodeCurrent)){
			cy.showParentMessage('当前节点不可操作','提示');
		}	
		else{/*后期可以批量删除*/
			parent.simpleMessConf.call(this,
				 'warning',
				 'do you sure your dicision ? when you delete the parent catalog, the offspring will be disappeared',
				 function(result){
					/*sure*/
					if(result){
						removeIt.call(this,nodeCurrent.id);
					}
				}
			);
		
		}
	}
	/*验证选中节点是否可以编辑*/
	function isEdited(node){
		// 可以操作
		if(null != node && null != node.pid && '' != node.pid){
			return true;
		}
		// 不可操作
		else{
			return false;
		}
	}
	/*remove*/
	function removeIt(nodeId){
		$.post('${cy}/favorite/favoriteDelete/'+nodeId+'.do?queryType=simpleDelete',null,callBack);
		if (nodeId){
			$('#favorite_grid').treegrid('remove', nodeId);
		}
	}
	/*callback 操作*/
	function callBack(data){
		var json = $.parseJSON(data);
		parent.simpleMessAlert.call(this,'Alert',json.message);
	}
	/*过滤查询 searchMana*/
	function searchMana(){
		
		 manageFavorite.treegrid('load',{
			"isFilter" : true,
			"likeNameFirst" : $('#likeNameFirst').val()
			
		}); 
		/*
		"beginDate" : $('#beginTime').datebox('getValue'),
			"endDate" : $('#endTime').datebox('getValue')
		*/
		 
	}
	/*clean*/
	function cleansearchMana(){
	//	$("#searchForm input[name = 'folk.pname']").val('');
	//	$("#searchForm input[name = 'folk.endbirthday']").val('');
	//	$("#searchForm input[name = 'folk.prebirthday']").val('');
		$("#searchForm input").val('');
		manageFavorite.treegrid("load",{});
	}
	
	
</script>
</head>

<body>
		<div style="margin-left: 1%;margin-right:1%;margin-top: -3px;height: 450px;">
			<div style="height:60px;overflow: hidden;" id="favoriteToolBar" >
				<form id="searchForm">
					<table class="tableForm datagrid-toolbar"
						style="width: 100%;height: 100%;FONT-SIZE: 15pt; FILTER: shadow(color=#AF0530); WIDTH: 100%; LINE-HEIGHT: 150%; FONT-FAMILY: 华文行楷 ">
						<tr>
							
							<td>标题关键字&nbsp;&nbsp;
								<input id="likeNameFirst" name="likeNameFirst" style="width:317px;" />
								&nbsp;&nbsp;<a href="#"
								class="easyui-linkbutton" onclick="searchMana();">查询</a>&nbsp;
							<a href="javascript:void(0);" class="easyui-linkbutton"
								onclick="cleansearchMana();">清空</a></td>
							
						</tr>
						<!-- <tr>
							<td>添加时间 &nbsp;&nbsp;
							<input name="beginDate" id="beginTime"
								class="easyui-datebox" data-options="editable:false"
								style="width: 155px;" />至
							<input name="endDate" id="endTime"
								class="easyui-datebox" data-options="editable:false"
								style="width: 155px;" />&nbsp;&nbsp;
							<a href="#"
								class="easyui-linkbutton" onclick="searchMana();">查询</a>&nbsp;
							<a href="javascript:void(0);" class="easyui-linkbutton"
								onclick="cleansearchMana();">清空</a></td>
						</tr> -->
						 
					</table>
				</form>
			</div>
		<!-- table -->
		<table id="favorite_grid"></table>
		</div>
		<div id="mm" class="easyui-menu" style="width:120px;">
			<div onclick="appendMaterialLink()" data-options="iconCls:'icon-add'">Append</div>
			<div onclick="editMaterialLink()" data-options="iconCls:'icon-remove'">Edit</div>
			<div onclick="removeMaterialLink()" data-options="iconCls:'icon-remove'">Remove</div>
			<div class="menu-sep"></div>
			<div onclick="collapse()">Collapse</div>
			<div onclick="expand()">Expand</div>
		</div>
		
</body>
</html>
