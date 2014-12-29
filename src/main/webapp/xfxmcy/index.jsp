<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" ></c:set>
<jsp:include page="/xfxmcy/initialEasyUI.jsp"></jsp:include>
</head>
<body>
<script type="text/javascript">
	/*登录 dialog*/
	var loginDialog;
	var sessionInfo;
	var loginInputForm;
	var regDialog;
	var regForm;
	$(function() {
		/*初始化页面*/
		easyloader.load(["tree","dialog", "parser", "tabs", "accordion", "layout",
				"validatebox", "combobox", "form", "blockUI", "messager",
				"validMethods", "datebox", "datagrid" ], function() {
			/*加载 valid plugin*/
			initialValid.call(this);
			/*加载 dialog plugin*/
			initialDialog.call(this);
			/*加载 tree plugin*/
			initialTree.call(this);
			/*当前在线人*/
			sessionInfo = {
				userId : '${sessionInfo.userId}',
				loginName : '${sessionInfo.loginName}',
				ip : '${sessionInfo.ip}'
			};
			/*nobody have logined*/
			if (!sessionInfo.userId) {
				showLoginDialog.call(this, null);
			}
			/*显示*/
			$('body').layout();
			$('#indexBottom').show();
			/*初始化 form*/
			var formParam = {
				url : '${cy}/spouse/login/loginAdmin.do',
				success : function(data) {
					var json = $.parseJSON(data);
					if (json && json.success) {
						loginDialog.dialog('close');
						$('#sessionInfoDiv').html(cy.fs('[<strong>{0}</strong>]，欢迎你！您使用[<strong>{1}</strong>]IP登录！', json.result.loginName, json.result.ip));
						/*构建树*/
						ctrlTree.call(this);						
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
			
			/*saved code which is origin*/
			/*if (sessionInfo.userId) {
				window.setTimeout(function() {
					$('div.validatebox-tip').remove();
				}, 500);
				loginDialog.dialog('close');
			}*/
			$("body").css("visibility","visible");
		});
	});
	/*show login dialog*/
	function showLoginDialog(){
		/*login dialog*/
		loginDialog = $('#loginAndRegDialog').show().dialog({
		//	top : document.body.clientHeight/2-50,
			closable : false,
			title : '登录',
			modal : true,
			buttons : [ /*{
				text : '注册',
				handler : function() {
					去掉注册 dialog
					showRegDialog();
				}
			},*/ {
				text : '登录',
				handler : function() {
					loginInputForm.submit();
				}
			} ],
			onOpen : function() {
				var t = $(this);
				window.setTimeout(function() {
					t.find('input[name=account]').focus();
				}, 0);
			}
		});
	}
	/*show dialog*/
	function showRegDialog() {
		regDialog = $('#regDialog').show().dialog({
			top : document.body.clientHeight/2-102,
			width: 285,
			title : '注册',
			modal : true,
			buttons : [ {
				text : '注册',
				handler : function() {
					/*是否存在用户名*/
					isExistAccount();
				}
			} ],
			onOpen : function() {
				$(this).find('input[name=account]').focus();
			},
			onClose : function() {
				$(this).find('input').val('');
				$('div.validatebox-tip').remove();
				loginDialog.find('input[name=cname]').focus();
			}
		});
		regForm = regDialog
				.find('form')
				.form(
						{
							url : '${cy}/folk/doSave.do',
							success : function(data) {
								var d = $.parseJSON(data);
								if (d.success) {
									regDialog.dialog('close');
								} else {
									regDialog.find('input[tLogin=account]')
											.focus();
								}
								$.messager.show({
									msg : d.message,
									title : '提示'
								});
							}
						});
	}
	
	/*注销操作*/
	function logout(){
		simpleMessConf.call(this,'Confirm', 'Are you sure to exit this system?', function(r){
			if (r){
				$.post("${cy}/spouse/logout.do",null,function(result){
					//var result = eval("("+data+")");
					if(result.success){
						$.messager.show({
							msg : result.message,
							title : 'alert'
						});
					$('#sessionInfoDiv').html("");
					}else{
						simpleMessAlert.call(this,'error',cy.errorMessage);		
					}
					showLoginDialog.call(this, null);
				},'json');
				
			}
		});


	}
</script>


	<!-- top -->
	<div
		data-options="region:'north',href:'${cy}/xfxmcy/primary/north.jsp'"
		style="height: 80px;overflow: hidden;" class="logo"></div>
	<!-- left -->
	<div
		data-options="region:'west',href:'${cy}/xfxmcy/primary/west.jsp'"
		style="width: 210px;overflow: hidden;"></div>

	<!-- center -->
	<div
		data-options="region:'center',title:'welcome to xfxmcy  system ',href:'${cy}/xfxmcy/primary/center.jsp'"
		style="overflow: hidden;"></div>

	<!-- bottom -->
	<div data-options="region:'south'"
		style="height: 20px;overflow: hidden;">
		<div align="center" style="display: none;" id="indexBottom">
			版权所有&nbsp;CY</div>
	</div>

	<!-- login -->
	<div id="loginAndRegDialog"
		style="width:260px;height:190px;display: none;overflow: hidden;">
		<div title="输入方式" style="overflow: hidden;">
			<div class="info">
				<div class="tip icon-tip"></div>
				<div style="text-align: center;">非法用户,请不要尝试登陆</div>
			</div>
			<div align="center">
				<form id="loginInputForm" method="post">
					<table class="tableForm" style="margin: 5px;">
						<tr>
							<th>登陆名</th>
							<td><input tLogin="account" name="sAccount"
								class="easyui-validatebox" required="true"
								missingMessage="请填写登录名称" style="width: 145px;" /></td>
						</tr>
						<tr>
							<th>密码</th>
							<td><input tLogin="password" name="sPassword"
								type="password" class="easyui-validatebox" required="true"
								missingMessage="请填写登录密码" style="width: 145px;" /></td>

						</tr>
						<tr>
							<th>验证码</th>
							<td>
								<input type="text" 	size="4" class="txt" name="tvery" id="tvery" value="" maxlength="4" style="width:50px"/> 
								<img src="${cy}/xfxmcy/checkcode.jsp" align="absmiddle" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<!-- register -->
	<div id="regDialog" style="display: none;width:250px;padding: 5px;">
		<form method="post">
			<table class="tableForm">
				<tr>
					<th style="width: 85px;">登录名</th>
					<td><input name="account" tLogin="account"
						class="easyui-validatebox"
						data-options="required:'true',missingMessage:'请填写登录名称'"
						style="width: 148px;"
						 /></td>
				</tr>
				<tr>
					<th style="width: 85px;">密码</th>
					<td><input name="employerPassword" type="password"
						tLogin="password" class="easyui-validatebox"
						data-options="required:'true',missingMessage:'请填写登录密码'"/></td>
				</tr>
				<tr>
					<th style="width: 85px;">重复密码</th>
					<td><input type="password" class="easyui-validatebox"
						data-options="required:'true',missingMessage:'请再次填写密码',validType:'eqPassword[\'#regDialog input[tLogin=password]\']'" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="mhxyDialog"></div>
</body>
</html>
