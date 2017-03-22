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

			.outter{width:800px;height:50px;background-color:#f93;}
			.info{width:700px;height:40px;margin-top:0px;margin-left:10px;}
			
			.desc{font-size:20px;font-weight:bold;}
			.desc a{overflow:hidden;white-space:nowrap;display:block;width:240px;
				text-overflow: ellipsis;text-decoration: none;margin-top:-22px;}
			.color{font-size:20px;font-weight:bold;}
			.version{font-size:20px;font-weight:bold;}
			.sum{font-size:20px;font-weight:bold;color:red;}
		</style>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<!--logo，搜索框-->
		<div class="container con">	
			<div class="logo"></div>
			<div class="search">				
				<span class="title">付款</span>
			</div>		
		</div>

		<div class="container" style="min-height:300px;">
			<hr/>
			<div class="outter">
				<div class="info">
					<input type="hidden" id="digital_id" value="${payInfo.digital_id }" />
					<input type="hidden" id="quantity" value="${payInfo.quantity }" />
					<input type="hidden" id="order_no" value="${payInfo.order_no }" />
					<div style="float:left;margin-top:16px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span id="desc" class="desc">
							<a title="${payInfo.description }">${payInfo.description }</a>
						</span>
					</div>
					<div style="float:left;margin-top:16px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span id="color" class="color">${payInfo.color }</span> 
					</div>
					<div style="float:left;margin-top:16px;">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span id="version" class="version">${payInfo.version }</span>
					</div>
					<div style="float:right;margin-top:16px;">
						<span style="color:red;font-weight:bold;font-size:20px;">￥</span>
						<span id="sum" class="sum">${payInfo.sum }</span>
						<span style="font-weight:bold;font-size:20px;">元</span>
					</div>
				</div>
			</div>
			<hr/>
		</div>
		
		<div class="container">
			<div style="float:right;">
				<button type="button" class="btn btn-info" id="cancer">取消</button>
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
			$("#cancer").click(function(){
				window.location.href="toorderquerypage";
			});
			$("#sure").click(function(){
				var data = {};
				data["digital_id"] = $("#digital_id").val().trim();
				data["color"] = $("#color").html();
				data["version"] = $("#version").html();
				data["quantity"] = $("#quantity").val().trim();
				data["order_no"] = $("#order_no").val().trim();
				var result = ajaxRequest("executepay", "text", JSON.stringify(data));
				if(result=="SUCCESS"){
					window.location.href="paysuccess";
				}else{
					alert("Pay Fail!");
				}
			});
		</script>
	</body>
</html>