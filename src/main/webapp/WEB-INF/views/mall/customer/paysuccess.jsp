<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<!--页面三要素-->
		<title>数码商城</title>
		<meta name="Keywords" content="电子商城订单">
		<meta name="description" content="电子商城订单">
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
			.not_register{margin-right:600px;}
			.top ul li a{cursor:pointer;}

			/*图标，搜索框css style*/
			.con{height:100px}
			.search{float:left;line-height:100px;margin-top:-8px;}
			.logo{float:left;width:300px;height:100px;background:url(<%=path%>/resources/images/logo.png)}
			.title{font-size:30px;color:red;font-weight:bold;}

		</style>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<!--logo，搜索框-->
		<div class="container con">	
			<div class="logo"></div>
			<div class="search">				
				<span class="title">操作成功</span>
			</div>		
		</div>

		<div class="container" style="min-height:300px;">
			<hr/>
				<div style="width:900px;height:200px;background-color:#f93">
					<span style="font-size:20px;font-weight:bold">恭喜您，操作成功！</span>
				</div>
			<hr/>
		</div>
		
		<div class="container">
			<div style="float:right;">
				<button type="button" class="btn btn-info" id="sure">确认</button>
			</div>
		</div>
		
		<jsp:include page="footer.jsp"/>

		<!--jQuery(necessary for Bootstrap's javascript plugins)-->
		<script src="<%=path %>/resources/bootstrap/jquery-1.7.2.min.js"></script>
		<!--Include all complied plugins(below) ,or include individual files as needed-->
		<script src="<%=path %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<script>
			$(function(){
			});
			$("#sure").click(function(){
				window.location.href="toorderquerypage";//转到订单查询页面
			});
		</script>
	</body>
</html>