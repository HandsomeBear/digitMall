<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<!--页面三要素-->
		<title>注册-个人注册</title>
		<meta name="Keywords" content="电子商城注册页面">
		<meta name="description" content="电子商城注册页面">

		<%  String path = request.getContextPath(); 
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+
			request.getServerPort()+path+"/";
		%>
		<base href="<%=basePath%>">

		<!--Bootstrap-->
		<link rel="stylesheet" href="<%=path %>/resources/bootstrap/css/bootstrap.min.css">

		<style>
			body{margin:0;padding:0}

			/*顶部css style*/
			.top{height:30px;color:#fff;background-color:#efefef}
			.top ul{list-style:none;float:right;}
			.top ul li{float:left;line-height:30px;}
			.index{margin-right:100px;}
			.top ul li a{cursor:pointer;}
			
			/*logo title css style*/
			.con{height:100px;}
			.logo{float:left;width:300px;height:100px;background:url(<%=path %>/resources/images/logo.png)}
			.title{line-height:76px;font-size:28px;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;color:#cacaca;}
			
			hr{height:10px;border:none;border-top:10px groove skyblue;}

			/*注册表单css style*/
			.register-form{width:600px;}
			.control-group{margin-top:30px;}
			.labe{font-family:"微软雅黑";font-size:18px;color:#9a9a9a}
			.xing{color:red;}
			.error{color:red;}
			.btn{width:200px;}
			.button{text-align:center;margin-top:20px;}
			.inp{width:40px;}
			.jcaptcha-btn{color:#dbf2ff;vertical-align:middle;}​
		</style>
	</head>
<body>
	<!--顶层的选项连接-->
	<div class="container-fluid">
		<div class="top">
			<ul>
				<li><a href="index" class="index">返回首页</a></li>
				<li><a href="login">登录</a>&nbsp; | &nbsp;<a href="logout">退出</a>&nbsp; | &nbsp;</li>
				<li><a href="tocart">我的购物车</a>&nbsp; | &nbsp;</li>
				<li><a href="toorderquerypage">我的订单</a>&nbsp; | &nbsp;</li>
				<li><a href="#">网站导航</a></li>
			</ul>
		</div>
	</div>

	<div class="container con">	
		<div class="logo"></div>
		<div class="title">欢迎注册</div>
	</div>
	<hr class="container"/>

	<div class="container">
		<div class="register-form">
			<div align="center" style="height:12px;"><span class="error">${registerMessage }
			<%request.getSession().removeAttribute("registerMessage");%>
			</span></div>
			<form class="form-horizontal">
				<div class="control-group">
					<label class="control-label" for="username"><span class="labe"><span class="xing">*</span>   &nbsp;&nbsp;&nbsp;用户名:</span></label>
					<div class="controls">
						<div class="input-append">
							<input type="text" id="username" name="username" placeholder="UserName">
							<span class="add-on"><i class="icon-user"></i></span>
						</div>
						<span class="error" id="username-span">*&nbsp;&nbsp;&nbsp;&nbsp;</span>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="password"><span class="labe"><span class="xing">*</span>   &nbsp;&nbsp;&nbsp;请设置密码:</span></label>
					<div class="controls">
						<div class="input-append">
							<input type="password" id="password" name="password" placeholder="Password">
							<span class="add-on"><i class="icon-lock"></i></span>
						</div>
						<span class="error" id="pwd-span">*&nbsp;&nbsp;&nbsp;&nbsp;</span>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="rpassword"><span class="labe"><span class="xing">*</span>   &nbsp;&nbsp;&nbsp;请确认密码:</span></label>
					<div class="controls">
						<div class="input-append">
							<input type="password" id="rpassword" name="rpassword" placeholder="Password">
							<span class="add-on"><i class="icon-lock"></i></span>
						</div>
						<span class="error" id="rpwd-span">*&nbsp;&nbsp;&nbsp;&nbsp;</span>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="code"><span class="labe"><span class="xing">*</span>   &nbsp;&nbsp;&nbsp;请输入验证码:</span></label>
					<div class="controls">
						<input type="text" id="captcha" name="captcha" placeholder="Captcha" class="inp">&nbsp;&nbsp;
						<img class="jcaptcha-btn jcaptcha-img"   
						src="captcha" style="display: inline-block;">
						<span class="error" id="captcha-span">&nbsp;&nbsp;&nbsp;&nbsp;</span>
					</div>
				</div>

				<div class="button">
					<button type="button" class="btn btn-primary" id="btn">立即注册</button>
				</div>
			</form>
		</div>
	</div>

	<!--jQuery(necessary for Bootstrap's javascript plugins)-->
	<script src="<%=path %>/resources/bootstrap/jquery-1.7.2.min.js"></script>
	<!--Include all complied plugins(below) ,or include individual files as needed-->
	<script src="<%=path %>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script>
		//验证username唯一,若后填写username，change事件？（password获得焦点时，验证username非空）
		$("#password").focus(function(){
			var username = $("#username").val();
			if(username==""){
				alert("用户名不能为空！");
				$("#username").focus();
				return false;
			}
		});
		$("#username").change(function(){
			var username = $("#username").val();
			if(username==""){
				alert("用户名不能为空！");
				$("#username").focus();
				return false;
			}
			$.ajax({
				url:'validUnique',
				type:'post',
				data:username,
				contentType:'application/json',
				success:function(data){
					if(data=="FAILURE"){
						alert("该用户名已存在！");
						$("username").val("").focus();
					}else if(data=="EXCEPTION"){
						alert("未知错误！");
						$("username").val("").focus();
					}
				}
			});
		});
		//captcha的更新事件
		$(function(){
			$(".jcaptcha-btn").click(function() {
				$(".jcaptcha-img").attr("src", 'captcha?'+new Date().getTime());
			});
		});
		//提交注册请求
		$("#btn").click(function(){
			var username = $("#username").val();
			var password = $("#password").val();
			var rpassword = $("#rpassword").val();
			var captcha = $("#captcha").val();
			if(username==""){
				$("#username-span").html("用户名非空");
			}else if(password==""){
				$("#username-span").html("");
				$("#pwd-span").html("密码非空");
			}else if(rpassword==""){
				$("#username-span").html("");
				$("#pwd-span").html("");
				$("#rpwd-span").html("密码非空");
			}else if(password.trim()!=rpassword.trim()){
				$("#username-span").html("");
				$("#pwd-span").html("");
				$("#rpwd-span").html("密码不一致");
			}else if(captcha==""){
				$("#username-span").html("");
				$("#pwd-span").html("");
				$("#rpwd-span").html("");
				$("#captcha-span").html("验证码非空");
			}else{
				var data = {'username':username,'password':password,'rpassword':rpassword,
							'captcha':captcha};
				$.ajax({
					url:'register',
					contentType:'application/json',
					type:'post',
					data:JSON.stringify(data),
					success:function(data){
						if(data=="SUCCESS"){
							window.location.href="login";
						}else if(data=="FAILURE"){
							alert("注册失败！");
							window.location.href="register";
						}else if(data=="EXCEPTION"){
							alert("未知错误！");
							window.location.href="register";
						}
					}
				});
			}
		});
	</script>
</body>
</html>