<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- 页面三要素 -->
		<title>Admin-changePwd</title>
		<meta name="Keywords" content="数码商城后台修改密码">
		<meta name="description" content="数码商城后台修改密码">
		
		<%  String path = request.getContextPath(); 
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+
			request.getServerPort()+path+"/";
		%>
		<base href="<%=basePath%>">

		<!--Bootstrap-->
		<link rel="stylesheet" href="<%=path %>/resources/bootstrap/css/bootstrap.min.css">
		
		<style type="text/css">
			*{margin:0;padding:0;}
			html,body{height:100%;width:100%;}
			.top{width:100%;height:20%;}
			.top .nav{height:30px;color:#fff;background-color:#efefef}
			.top .nav ul{list-style:none;float:right;margin-right:100px;}
			.top .nav ul li{float:left;line-height:30px;}
			.top .nav ul li a{cursor:pointer;}
			.top .img{margin-left:160px;color:red;}
			
			.content{width:100%;height:74%;}
			.content .menu{width:16%;height:100%;background:#ff9;float:left}
			.content .menu .options{height:100%;background:#ff9;}
			.content .menu .options .mybtn{width:100%}
			.content .menu .options .con{background:#ff9;}
			.content .menu .options .con li{list-style-type:none;margin-top:5px;}
			.content .menu .options .con a{text-decoration:none;}
			.content .menu .options .con .aa{background:red;}
			.content .menu .options .con a:hover{cursor:pointer;}
			.content .main{width:84%;height:100%;background-color:#ffe0c1;float:right;}
			.content .main .title{text-align:center;margin-top:10px;}
			.form-horizontal{margin-top:30px;}
			.form-horizontal .controls{margin-left:-70px;}
			.content .main .myform{text-align:center;}
			.errordiv{text-align:center;margin-top:15px;height:12px;}
			.error{color:red;}
			.ss{display:inline-block;width:100px;text-align:right;}
			.footer{height:6%;background:#efefef;}
		</style>
	</head>
	<body>
		<!-- top -->
		<div class="top">
			<div class="nav">
				<ul>
					<li><a href="#">欢迎您，${LoginAdminName }</a>&nbsp; | &nbsp;</li>
					<li><a href="admin/logout">退出</a></li>
				</ul>
			</div>
			<div class="img">
				<h1 style="line-height:86px;">数码商城Admin</h1>
			</div>
		</div>
		<!-- content -->
		<div class="content">
			<!-- menu -->
			<div class="menu">
				<div class="options">
					<button type="button" class="btn btn-primary mybtn" data-toggle="collapse" 
	   					data-target="#adminOperation">
						管理员管理
					</button>
					<div id="adminOperation" class="collapse in con">
						<ul>
							<li><a href="admin/showself">个人信息</a></li>
							<li><a href="admin/showAll">所有管理员信息</a></li>
							<li><a href="admin/toChangePwd">修改密码</a></li>
						</ul>
					</div>
					<button type="button" class="btn btn-primary mybtn" data-toggle="collapse" 
	   					data-target="#digitOperation">
						产品管理
					</button>
					<div id="digitOperation" class="collapse in con">
						<ul>	
							<li><a href="admin/showdigitlist?currentPage=1">商品列表</a></li>
							<li><a href="admin/toaddone">新货上架</a></li>
						</ul>
					</div>
					<button type="button" class="btn btn-primary mybtn" data-toggle="collapse" 
	   					data-target="#orderOperation">
						订单管理
					</button>
					<div id="orderOperation" class="collapse con">
						<ul>
							<li><a href="admin/tosend?currentPage=1">未发货订单</a></li>
							<li><a href="admin/torefund?currentPage=1">未退款订单</a></li>
							<li><a href="#">已退款订单</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- main -->
			<div class="main">
				<div class="title"><h3>修改密码</h3></div>
				<div class="errordiv"><span class="error" id="error-span"></span></div>
				<div class="myform">
					<form action="" method="post" class="form-horizontal">
						<div class="control-group">
							<div class="controls">
								<span class="ss">当前用户：</span>
								<input type="text" id="name" placeholder="name" 
									value="${LoginAdminName }" readOnly>
									<span style="color:red;" id="error"></span>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<span class="ss">当前密码：</span>
								<input type="password" id="cPwd" placeholder="cPwd">
								<span style="color:red;width:150px;" id="cError"></span>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<span class="ss">输入新密码：</span>
								<input type="password" id="nPwd" placeholder="nPwd">
								<span style="color:red;" id="nError"></span>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<span class="ss">确认新密码：</span>
								<input type="password" id="rPwd" placeholder="rPwd">
								<span style="color:red;" id="rError"></span> 
							</div>
						</div>
						<div class="button">
							<button type="button" class="btn btn-primary" id="btn">确认修改</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- footer -->
		<div class="footer">
			
		</div>
		
		<!--jQuery(necessary for Bootstrap's javascript plugins)-->
		<script src="<%=path %>/resources/bootstrap/jquery-1.7.2.min.js"></script>
		<!--Include all complied plugins(below) ,or include individual files as needed-->
		<script src="<%=path %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript">			
			$("li").mouseenter(function(){
				$(this).addClass("aa");
			});
			$("li").mouseleave(function(){
				$(this).removeClass("aa");
			});
			$("#nPwd").focus(function(){
				var cPwd = $("#cPwd").val();
				if(cPwd==""){
					alert("当前密码不能为空...");
					$("#cPwd").focus();
					return false;
				}
			});
			$("#rPwd").focus(function(){
				var cPwd = $("#cPwd").val();
				var nPwd = $("#nPwd").val();
				if(cPwd==""){
					alert("当前密码不能为空...");
					$("#cPwd").focus();
					return false;
				}
				if(nPwd==""){
					alert("新密码不能为空...");
					$("#nPwd").focus();
					return false;
				}
			});
			$("#cPwd").change(function(){
				var cPwd = $("#cPwd").val();
				if(cPwd==""){
					alert("当前密码不能为空...");
					$("#cPwd").focus();
					return false;
				}
				$.ajax({
					url:'admin/validateEquals',
					type:'post',
					data:cPwd,
					contentType:'application/json',
					success:function(data){
						if(data=="FAILURE"){
							alert("但前密码不正确，请确认后重新输入...");
							$("#cPwd").val("").focus();
						}
					}
				});
			});
			$("#btn").click(function(){
				var cPwd = $("#cPwd").val();
				var nPwd = $("#nPwd").val();
				var rPwd = $("#rPwd").val();
				if(cPwd==""){
					$("#error-span").html("* 当前密码不能为空");
				}else if(nPwd==""){
					$("#error-span").html("* 新密码不能为空");
				}else if(rPwd==""){
					$("#error-span").html("* 请确认新密码");
				}else if(nPwd.trim()!=rPwd.trim()){
					$("#error-span").html("* 两次密码不一致");
				}else{
					$.ajax({
						url:'admin/changePwd',
						type:'post',
						data:rPwd,
						contentType:'application/json',
						success:function(data){
							if(data=="SUCCESS"){
								alert("密码修改成功，下次登录时生效");
								$("#error-span").html("");
								$("#cPwd").val("");
								$("#nPwd").val("");
								$("#rPwd").val("");
							}
						}
					});
				}
			});
		</script>
	</body>
</html>