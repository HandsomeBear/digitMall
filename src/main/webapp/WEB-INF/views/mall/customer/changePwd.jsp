<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
		<meta http-equiv="expires" content="0">
		<!--页面三要素-->
		<title>数码商城-修改密码</title>
		<meta name="Keywords" content="电子商城修改密码">
		<meta name="description" content="电子商城修改密码">
		<%  String path = request.getContextPath(); 
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+
			request.getServerPort()+path+"/";
		%>
		<base href="<%=basePath%>">
		<%String loginUserName = (String)request.getSession().getAttribute("loginUserName"); %>
		
		<!--Bootstrap-->
		<link rel="stylesheet" href="<%=path %>/resources/bootstrap/css/bootstrap.min.css">

		<style>
			body{margin:0;padding:0}
			
			/*顶部css style*/
			.top{height:30px;color:#fff;background-color:#efefef}
			.top ul{list-style:none;float:right;}
			.top ul li{float:left;line-height:30px;}
			.uu{margin-right:600px;}
			.index{margin-right:100px;}
			.top ul li a{cursor:pointer;}

			/*图标，搜索框css style*/
			.con{height:100px}
			.search{float:left;line-height:100px;}
			.search .search-input{width:400px;height:30px;}
			.logo{float:left;width:300px;height:100px;background:url(<%=path%>/resources/images/logo.png)}

			/*选项菜单css style*/
			.title{font-size:20px;font-weight:bold}
			.person_image{width:158px;height:158px;border:1px solid red;}
			.mainmenu{float:left;}
			.mainmenu .nav-tabs{width:160px;background-color:#f9f9f9;height:350px;text-align:center}
			.content{float:left;width:650px;height:560px;border:1px solid #08c;}
			.msg{display:block;margin-top:40px;font-family:"微软雅黑";
				font-weight:bold;font-size:16px;}
			.button{text-align:center;}
			.errordiv{text-align:center;margin-top:15px;height:12px;}
			.error{color:red;}
			.myForm{margin-top:40px;width:600px;}
			.myForm .in{margin-left:-120px;}

			/*底部css style*/
			.footer{}
		</style>
	</head>
	<body>
		<!--顶层的选项连接-->
		<div class="container-fluid">
			<div class="top">
				<ul>
					<li><a href="#" class="uu">欢迎您，${loginUserName }</a></li>
					<li><a href="index" class="index">返回首页</a></li>
					<li><a href="logout">退出</a>&nbsp; | &nbsp;</li>
					<li><a href="tocart">我的购物车</a>&nbsp; | &nbsp;</li>
					<li><a href="toorderquerypage">我的订单</a>&nbsp; | &nbsp;</li>
					<li><a href="#">网站导航</a></li>
				</ul>
			</div>
		</div>

		<!--logo，搜索框-->
		<div class="container con">	
			<div class="logo"></div>
			<div class="search">				
				<form class="form-search">
					<input type="text" class="search-input" placeholder="数码宝贝" id="searchword">
					<button type="button" class="btn btn-primary search-btn" id="search">Search</button>
				</form>
			</div>		
		</div>

		<!--菜单，巨幕，右侧选项-->
		<div class="container">
			<div style="height:350px">
				<!--Menu-->
				<div class="tabbable tabs-left mainmenu">
					<div><span class="title">账号管理</span></div>
					<div class="person_image">
						<img src="" id="img">
					</div>
					<ul class="nav nav-tabs">
						<li><a href="person/completeInfo?username=${loginUserName }">个人资料</a></li>
						<li><a href="#">个人交易信息</a></li>
						<li><a href="address/addressInfo?username=${loginUserName }">收货地址</a></li>
						<li><a href="person/tochangePwd">修改密码</a></li>
						<li><a href="#">选项卡五</a></li>
						<li><a href="#">选项卡六</a></li>
						<li><a href="#">选项卡七</a></li>
						<li><a href="#">选项卡八</a></li>
					</ul>
				</div>
				<!--content-->
				<div class="content" id="content" align="center">
					<div><span class="msg">修改密码</span></div>
					<div class="errordiv"><span class="error" id="error-span"></span></div>
					<form class="form-horizontal myForm">
						<div class="control-group">
							<label class="control-label" for="password"><span class="labe">初始密码:</span></label>
							<div class="controls">
								<input type="password" id="password" name="password" placeholder="Password" class="in">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="newPassword"><span class="labe">新密码:</span></label>
							<div class="controls">
								<input type="password" id="newPassword" name="newPassword" placeholder="Password" class="in">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="rpassword"><span class="labe">确认密码:</span></label>
							<div class="controls">
								<input type="password" id="rpassword" name="newPassword" placeholder="Password" class="in">
							</div>
						</div>
						
						<div class="button">
							<button type="button" class="btn btn-primary" id="btn">确定</button>
						</div>
					</form>
				</div>
			</div>
			<br>
		</div>

		<!--脚部-->
		<div class="container">
			<div class="footer">
			</div>
		</div>

		<!--jQuery(necessary for Bootstrap's javascript plugins)-->
		<script src="<%=path %>/resources/bootstrap/jquery-1.7.2.min.js"></script>
		<!--Include all complied plugins(below) ,or include individual files as needed-->
		<script src="<%=path %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				var url = "<%=path%>/resources/uploadFiles/uploadImages/personImage-<%=loginUserName %>.png?"+Math.random();
				$("#img").attr("src",url);
			});
			function ajaxRequest(url,datatype,requestData){
				var result="";
				$.ajax({
			        url:url,
			        dataType: datatype,
			        type: 'POST',
			        async: false,//import
			        contentType: 'application/json; charset=UTF-8',
			        data: requestData,
			        success: function( data){
			           result=data;
			        },
			        error: function( XMLHttpRequest, textStatus, errorThrown ){
			          console.log( errorThrown );
			        }
			    });
				return result;
			};
			$("input[name='newPassword']").click(function(){
				if($("#password").val()==""){
					alert("初始密码不能为空！");
					$("#password").focus();
				}
			});
			$("#password").change(function(){
				var password = $("#password").val();
				var data = {pwd:password};
				$.ajax({
					url:'person/checkPwd',
					type:'post',
					data:data,
					success:function(data){
						if(data=="FAILURE"){
							alert("初始密码不正确!");
							$("#password").val("").focus();
						}else if(data=="EXCEPTION"){
							alert("未知错误！");
							$("#password").val("").focus();
						}
					}
				});
			});
			$("#btn").click(function(){
				var password = $("#password").val();
				var newPassword = $("#newPassword").val();
				var rpassword = $("#rpassword").val();
				if(password==""){
					$("#error-span").html("初始密码非空");
				}else if(newPassword==""){
					$("#error-span").html("新密码非空");
				}else if(rpassword==""){
					$("#error-span").html("确认密码非空");
				}else if(newPassword.trim()!=rpassword.trim()){
					$("#error-span").html("密码不一致");
				}else{
					$("#error-span").html("");
					var data ={newPwd:newPassword};
					$.ajax({
						url:'person/savePwd',
						type:'post',
						data:data,
						success:function(data){
							if(data=="SUCCESS"){
								alert("修改成功，下次登录生效!");
								window.location.href="person/toShowPersonInfo";
							}else if(data=="EXCEPTION"){
								alert("未知错误，操作未能成功！");
								window.location.href="person/toShowPersonInfo";
							}
						}
					});
				}
			});
			$("#search").click(function(){
				var searchword = $("#searchword").val().trim();
				if(searchword==""||searchword==null||searchword==undefined){
					alert("There is no input data!");
					$("#searchword").focus();
					return false;
				}
				var data = {};
				data["priceFrom"] = "del";
				data["priceTo"] = "del";
				data["brand"] = "del";
				var result = ajaxRequest("buildsearchcondition", "text", JSON.stringify(data));
				if(result="SUCCESS"){
					window.location.href="showdigitlist?flag="+searchword+"&currentPage=1";
				}
			});
		</script>
	</body>
</html>