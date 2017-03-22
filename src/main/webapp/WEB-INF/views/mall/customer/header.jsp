<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<!--页面三要素-->
		<title>数码商城</title>
		<meta name="Keywords" content="电子商城主界面">
		<meta name="description" content="电子商城主界面">
		<%  String path = request.getContextPath(); 
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+
			request.getServerPort()+path+"/";
		%>
		<base href="<%=basePath%>">
		
		<style>
			body{margin:0;padding:0}
			
			/*顶部css style*/
			.top{height:30px;color:#fff;background-color:#efefef}
			.top ul{list-style:none;float:right;}
			.top ul li{float:left;line-height:30px;}
			.index{margin-right:100px;}
			.not_register{margin-right:600px;}
			.top ul li a{cursor:pointer;}
		</style>
	</head>
	<body>
		<!--顶层的选项连接-->
		<div class="container-fluid">
			<div class="top">
				<ul>
					<li><a href="index" class="index">返回首页</a></li>
					<c:choose>
						<c:when test="${empty loginUserName}">
							<li class="not_register"><a href="register">还没有账号！立即注册</a></li>
							<li><a href="login">登录</a>&nbsp; | &nbsp;</li>
						</c:when>
						<c:otherwise>
							<li><a href="person/toShowPersonInfo">欢迎您，${loginUserName }</a>&nbsp; | &nbsp;</li>
							<li><a href="logout">退出</a>&nbsp; | &nbsp;</li>
						</c:otherwise>
					</c:choose>
					<li><a href="tocart" id="mycart">我的购物车</a>&nbsp; | &nbsp;</li>
					<li><a href="toorderquerypage" id="myorder">我的订单</a>&nbsp; | &nbsp;</li>
					<li><a href="#">网站导航</a></li>
				</ul>
			</div>
		</div>
	</body>
</html>