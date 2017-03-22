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
			.search{float:left;line-height:100px;}
			.search .search-input{width:400px;height:30px;}
			.logo{float:left;width:300px;height:100px;background:url(<%=path%>/resources/images/logo.png)}

			.head{background-color:#788}
			.head .digitinfo{float:left;margin-left:122px;}
			.head .price{float:left;margin-left:256px;}
			.head .amount{float:left;margin-left:80px;}
			.head .sum{float:left;margin-left:72px;}
			.head .operation{float:left;margin-left:86px;}

			.info{min-height:400px;}

			.outter{height:100px;width:940px;margin-top:50px;background-color:#efefef;}
			.outter .inner{height:90px;width:900px;margin-left:20px;margin-top:5px;background-color:#efefef;}
			.outter .inner ul{list-style:none;}
			.outter .inner ul li{float:left;}
			.outter .inner ul li .picture{margin-left:4px;float:left;width:80px;height:80px;margin-top:8px;}
			.outter .inner ul li .titleinfo{float:left;margin-top:8px;width:154px;}
			.outter .inner ul li .blank{margin-left:0px;width:200px;height:90px;}
			.outter .inner ul li .singleprice{margin-left:-55px;margin-top:38px;}
			.outter .inner ul li .amount{margin-left:70px;margin-top:32px;}
			.outter .inner ul li .amount .inamount{width:20px;}
			.outter .inner ul li .sum{margin-left:75px;margin-top:38px;}
			.outter .inner ul li .opera{margin-left:100px;margin-top:38px;}
		</style>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<!--logo，搜索框-->
		<div class="container con">	
			<div class="logo"></div>
			<div class="search">				
				<form class="form-search">
					<input type="text" class="search-input" placeholder="订单号搜索">
					<button type="submit" class="btn btn-primary search-btn">Search</button>
				</form>
			</div>		
		</div>

		<div class="container">
			<div class="head">
				<div class="digitinfo">商品信息</div>
				<div class="price">单价(元)</div>
				<div class="amount">数量</div>
				<div class="sum">金额(元)</div>
				<div class="operation">操作</div>
			</div>
			<div class="info">
				<c:forEach var="payOrder" items="${payOrders }">
					<div class="outter">
						<div class="inner">
							<ul>
								<li>
									<div>
										<input type="hidden" value="${payOrder.digital_id }" /> 
										<input type="hidden" value="${payOrder.order_no }" />
										<!-- <input type="checkbox" name="ordered" style="cursor:pointer;" checked disabled /> -->
									</div>
								</li>
								<li>
									<div class="picture">
										<img src="${payOrder.smalljpg }" class='img'></img>
									</div>
									<div class="titleinfo">${payOrder.description }</div>
								</li>
								<li>
									<div class="blank">
										颜色：<span>${payOrder.color }</span> 
										<br /> 
										配置：<span>${payOrder.version }</span>
									</div>
								</li>
								<li>
									<div class="singleprice">
										<span>${payOrder.price }</span>
									</div>
								</li>
								<li>
									<div class="amount">
										<input type="text" class="inamount"
											value="${payOrder.quantity }" readOnly />
									</div>
								</li>
								<li>
									<div class="sum">
										<span>${payOrder.sum }</span>
									</div>
								</li>
								<li>
									<div class="opera"><a href="" class="pay">付款</a></div>
								</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<hr/>

		
		
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
			$(".pay").click(function(e){
				e.preventDefault();
				var data = {};
				data["digital_id"] = $(e.target).parent().parent().siblings().eq(0).children().children().eq(0).val().trim();
				data["description"] = $(e.target).parent().parent().siblings().eq(1).children().eq(1).text();
				data["color"] = $(e.target).parent().parent().siblings().eq(2).children().children().eq(0).html();
				data["version"] = $(e.target).parent().parent().siblings().eq(2).children().children().eq(2).html();
				data["quantity"] = $(e.target).parent().parent().siblings().eq(4).children().children().val().trim();
				data["sum"] = $(e.target).parent().parent().siblings().eq(5).children().children().html();
				data["order_no"] = $(e.target).parent().parent().siblings().eq(0).children().children().eq(1).val().trim();
				var result = ajaxRequest("pay", "text", JSON.stringify(data));
				if(result=="SUCCESS"){
					window.location.href="topay";
				}
			});
		</script>
	</body>
</html>