<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<script type="text/javascript" charset="utf-8">
	/*登录 dialog*/
	var loginDialog;
	var sessionInfo;
	var loginInputForm;
	$(function() {
		/*初始化页面*/
		easyloader.load(["parser","tabs","accordion","layout", "validatebox", "combobox","form", "blockUI", "messager", "validMethods","datebox","datagrid"], function () {
			
			loginDialog = $('#loginAndRegDialog').show().dialog({
				closable : false,
				title : '登录',
				modal : true,
				buttons : [ {
					text : '注册',
					handler : function() {
						//regDialog.dialog('open');
					}
				},{
					text : '登录',
					handler : function() {
							var formLogin = loginTabs.tabs('getSelected').find('form');
							formLogin.submit();
					}
				} ],
				onOpen : function() {
					var t = $(this);
					window.setTimeout(function() {
						t.find('input[name=cname]').focus();
					}, 0);
				}
			});
			
			/*初始化 form*/
			var formParam = {
					url : '${cy}/folk/login.do',
					success : function(data) {
						var json = $.parseJSON(data);
						if (json && json.success) {
							loginDialog.dialog('close');

						//	$('#sessionInfoDiv').html(sy.fs('[<strong>{0}</strong>]，欢迎你！您使用[<strong>{1}</strong>]IP登录！', json.otherMessage.loginName, json.otherMessage.ip));
						}
						$.messager.show({
							msg : json.message,
							title : '提示'
						});
					}
				};
			/*login form*/
			loginInputForm = $('#loginInputForm').form(formParam);
			/* 增加回车提交功能 */
			$('form input').bind('keyup', function(event) {
				if (event.keyCode == '13') {
					$(this).submit();
				}
			});
		});

		
		/*当前在线人*/
		sessionInfo = {
				userId : '${sessionInfo.userId}',
				loginName : '${sessionInfo.loginName}',
				ip : '${sessionInfo.ip}'
			};
			if (sessionInfo.userId) {/*如果有userId说明已经登陆过了*/
				window.setTimeout(function() {
					$('div.validatebox-tip').remove();
				}, 500);
				loginDialog.dialog('close');
			}
	
	});
</script>
<div id="loginAndRegDialog"
	style="width:260px;height:250px;display: none;overflow: hidden;">
	<div id="loginTabs" data-options="fit:true,border:false">
		<div title="输入方式" style="overflow: hidden;">
			<div class="info">
				<div class="tip icon-tip"></div>
				<div style="text-align: center;">本账号与梦幻无关,新用户注册即可</div>
			</div>
			<div align="center">
				<form id="loginInputForm" method="post">
					<table class="tableForm" style="margin: 5px;">
						<tr>
							<th>登陆名</th>
							<td><input tLogin="account" name="employer.paccount"
								class="easyui-validatebox" required="true"
								missingMessage="请填写登录名称" style="width: 145px;" /></td>
						</tr>
						<tr>
							<th>密码</th>
							<td><input tLogin="password" name="employer.ppwd"
								type="password" class="easyui-validatebox" required="true"
								missingMessage="请填写登录密码" style="width: 145px;" /></td>

						</tr>
						<tr>
							<th>角色</th>
							<td><select id="role" name="role" style="width:150px;"
								editable="false">
									<option value="Employer" selected="selected">Employer</option>
									<option value="Admin">Admin</option>
							</select></td>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
