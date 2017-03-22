<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- 页面三要素 -->
		<title>Digital-Admin</title>
		<meta name="Keywords" content="数码商城后台主页面">
		<meta name="description" content="数码商城后台主页面">
		
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
			
			.order{min-height:500px;}
			
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
							<li><a href="admin/add">新增管理员</a></li>
						</ul>
					</div>
					<button type="button" class="btn btn-primary mybtn" data-toggle="collapse" 
	   					data-target="#digitOperation">
						产品管理
					</button>
					<div id="digitOperation" class="collapse in con">
						<ul>	
							<li><a href="#">商品列表</a></li>
							<li><a href="#">新货上架</a></li>
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
				<div style="height:40px;">
					<input type="text" id="orderno" placeholder="订单号搜索" value="${orderno }" style="margin-top:4px;"/>
					<button type="button" class="btn btn-primary" id="search" style="margin-top:-6px">搜索</button>
				</div>
				<div class="order">
					<table class="table table-bordered table-hover table-condensed">
						<thead>
							<tr>
								<th align="center">订单号</th>
								<th>购买日期</th>
								<th>收货地址</th>
								<th>商品</th>
								<th>颜色</th>
								<th>配置</th>
								<th>数量</th>
								<th>发货</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="order" items="${orders }">
								<tr>
									<td style="width:190px;">${order.order_no }</td>
									<td style="width:142px;">${order.shoppingDate }</td>
									<td style="width:240px;">${order.address }</td>
									<td style="width:380px;">${order.title }</td>
									<td style="width:40px;">${order.color }</td>
									<td style="width:50px;">${order.version }</td>
									<td style="width:30px;">${order.quantity }</td>
									<td><a href="javascript:void(0)">发货</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="pagination pagination-centered">
					<ul>
						<li><a href="javascript:void(0)" id="first" onclick="check('first');return false;">First</a></li>
						<li><a href="javascript:void(0)" id="prev" onclick="check('prev');return false;"><<</a></li>
						<li><a href="javascript:void(0)" id="next" onclick="check('next');return false;">>></a></li>
						<li><a href="javascript:void(0)" id="last" onclick="check('last');return false;">Last</a></li>
						<li><input type="text" id="totalPage" style="width:30px;" readOnly value="${pageUtil.totalPage }"/></li>
						<li><input type="text" id="currentPage" style="width:30px;" value="${pageUtil.currentPage }"/></li>
						<li><button style="width:100px;margin-top:-12px;" class="btn btn-info" id="goto" onclick="check('goto');return false;">Goto</button></li>
					</ul>
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
			function check(operation){
				var currentPage = $("#currentPage").val();
				var totalPage = $("#totalPage").val();
				if(parseInt(totalPage)==0){
					alert("There is no data!");
					return false;
				}
				if(operation=="prev"){
					if(parseInt(parseInt(currentPage)-1)==0){
						alert("This is the first page!");
					}else{
						window.location.href="admin/tosend?currentPage="+parseInt(parseInt(currentPage)-1);
					}
				}else if(operation=="next"){
					if(parseInt(currentPage)==parseInt(totalPage)){
						alert("This is the last page!");
					}else{
						window.location.href="admin/tosend?currentPage="+parseInt(parseInt(currentPage)+1);
					}
				}else if(operation=="first"){
					if(parseInt(totalPage)==0){
						alert("There is no data!");
					}else{
						window.location.href="admin/tosend?currentPage=1";
					}
				}else if(operation=="last"){
					if(parseInt(totalPage)==0){
						alert("There is no data!");
					}else{
						window.location.href="admin/tosend?currentPage="+totalPage;
					}
				}else if(operation=="goto"){
					if(parseInt(currentPage)<=0){
						alert("Invalid page number!");
						return false;
					}
					if(parseInt(currentPage)>parseInt(totalPage)){
						alert("Invalid page number!");
						return false;
					}
					window.location.href="admin/tosend?currentPage="+currentPage;
				}
			}
			$("#currentPage").click(function(){
				var current = $("#currentPage").val();
				var totalPage = $("#totalPage").val();
				//屏蔽backspace键
				$("#currentPage").keydown(function(e){
					var keycode = e.keyCode;
					if(e.keyCode==8){
						return false;
					}
				});
				$("#currentPage").on("input",function(){
					var nowpage = $("#currentPage").val();
					if(parseInt(nowpage)<=0){
						$("#currentPage").val(current);
					}else if(parseInt(nowpage)>parseInt(totalPage)){
						alert("Invalid number!");
						$("#currentPage").val(current);
						return false;
					}
				});
			});
			$("#search").click(function(){
				var orderno = $("#orderno").val();
				var data = {};
				data["orderno"] = orderno;
				var result = ajaxRequest("admin/buildsearchcon", "text", JSON.stringify(data));
				if(result=="SUCCESS"){
					window.location.href="admin/tosend?currentPage=1";
				}
			});
		</script>
	</body>
</html>