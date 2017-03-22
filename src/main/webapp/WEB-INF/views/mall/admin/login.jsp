<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<!--页面三要素-->
		<title>登录-个人登录</title>
		<meta name="Keywords" content="电子商城登录,like taobao">
		<meta name="description" content="电子商城登录界面">

		<%  String path = request.getContextPath(); 
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+
			request.getServerPort()+path+"/";
		%>
		<base href="<%=basePath%>">

		<!--Bootstrap-->
		<link rel="stylesheet" href="<%=path %>/resources/bootstrap/css/bootstrap.min.css">

		<style>
			body{margin:0;padding:0}
			
			/*logo error css style*/
			.con{height:100px;}
			.logo{float:left;width:300px;height:100px;background:url(<%=path %>/resources/images/logo.png)}
			.login-show{line-height:76px;font-size:28px;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;color:#cacaca;}
			.error-in{margin-bottom:-20px;height:20px;margin-top:5px;}
			.error{color:red;}
			
			.con-main{margin-top:60px;}

			/*登录css style*/
			.right-login{float:left;margin-left:180px;width:300px;height:300px;border:1px solid red}
			.right-login span{font-weight:bold}
			.right-login .title{font-size:24px;font-family:"微软雅黑";margin-top:20px;}
	
			/*登录表单css style*/
			.form-horizontal .control-label {margin-left:16px;width:80px;padding-top:5px;text-align:right;}
			.form-horizontal .controls {*display:inline-block;*padding-left:20px;margin-left:30px;
			*margin-left: 0;}
			.login-form{margin-top:40px;}
			.register{text-align:center;margin-top:20px;}
			.button{text-align:center;margin-top:20px;}
			#btn{width:200px;}
		</style>
	</head>
	<body>
		<div class="container-fluid con">
			<div class="logo"></div>
			<div class="login-show">欢迎登录</div>
		</div>
		<div class="container con-main">
			<div>
				<!--右边登录-->
				<div class="right-login">
					<div class="title" align="center">账户密码登录</div>
					<div align="center" class="error-in" id="error"><span class="error">${loginMessage }</span></div>
					<div class="login-form">
						<form class="form-horizontal" action="admin/login" method="post">
							<div class="control-group">
								<!--
								<label class="control-label" for="username"><span>UserName：</span></label>
								-->
								<div class="controls">
									<i class="icon-user"></i> 
									<input type="text" id="username" name="username" placeholder="username">
								</div>
							</div>
							<div class="control-group">
								<!--
								<label class="control-label" for="password"><span>Password：</span></label>
								-->
								<div class="controls">
									<i class="icon-lock"></i>
									<input type="password" id="password" name="password" placeholder="password">
								</div>
							</div>
							<div class="register">
								<h6><a href="#">忘记登录密码？</a>&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="register">免费注册</a></h6>
							</div>
							<div class="button">
								<input type="submit" class="btn btn-primary" id="btn" value="登录"/>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!--jQuery(necessary for Bootstrap's javascript plugins)-->
		<script src="<%=path %>/resources/bootstrap/jquery-1.7.2.min.js"></script>
		<!--Include all complied plugins(below) ,or include individual files as needed-->
		<script src="<%=path %>/resources/bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>