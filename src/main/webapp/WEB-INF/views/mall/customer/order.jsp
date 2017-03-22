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

			.head{}
			.head .digitinfo{float:left;margin-left:122px;}
			.head .price{float:left;margin-left:256px;}
			.head .amount{float:left;margin-left:80px;}
			.head .sum{float:left;margin-left:72px;}
			.head .operation{float:left;margin-left:86px;}
			
			.order{margin-top:20px;min-height:600px;}
			
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
			
			.address_info{width:600px;cursor:pointer;border:1px solid #f3f3f3}
		</style>
	</head>
	<body>
		<%-- <!--顶层的选项连接-->
		<div class="container-fluid">
			<div class="top">
				<ul>
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
					<li><a href="#">我的订单</a>&nbsp; | &nbsp;</li>
					<li><a href="#">网站导航</a></li>
				</ul>
			</div>
		</div> --%>
		<jsp:include page="header.jsp"/>
		
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

		<div class="address container">
			<div class="address_list" id="address_list">
				
			</div>
			<div><a href="address/addressInfo?username=${loginUserName }">还没有地址？ 使用新地址？</a></div>
		</div>

		<hr/>

		<div class="container">
			<div class="head">
				<div class="digitinfo">商品信息</div>
				<div class="price">单价(元)</div>
				<div class="amount">数量</div>
				<div class="sum">金额(元)</div>
				<div class="operation">操作</div>
			</div>
			<div class="order" id="order">
				<c:forEach var="orderItem" items="${orderItems }">
					<div class="outter" style="background-color:#f2f9ff">
						<div class="inner" style="background-color:#f2f9ff">
							<ul>
								<li>
									<div>
										<input type="hidden" value="${orderItem.digital_id }"/>
										<input type="checkbox" name="ordered" style="cursor:pointer;" checked disabled/>
									</div>
								</li>
								<li>
									<div class="picture"><img src="${orderItem.smalljpg }" class='img'></img></div>
									<div class="titleinfo">${orderItem.description }</div>
								</li>
								<li>
									<div class="blank">
										颜色：<span>${orderItem.color }</span>
										<br/>
										配置：<span>${orderItem.version }</span>
									</div>
								</li>
								<li>
									<div class="singleprice"><span>${orderItem.price }</span></div>
								</li>
								<li>
									<div class="amount">
										<input type="text" class="inamount" value="${orderItem.quantity }" readOnly/>
									</div>
								</li>
								<li>
									<div class="sum"><span>${orderItem.sum }</span></div>
								</li>
								<li>
									<div class="opera">待定</div>
								</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
			<div>
				<button type="button" class="btn btn-primary" id="sure" style="float:right;margin-left:40px;">确认订单</button>
				<button type="button" class="btn btn-primary" id="back" style="float:right;">返回</button>
			</div>
		</div>
		
		<jsp:include page="footer.jsp"/>

		<!--jQuery(necessary for Bootstrap's javascript plugins)-->
		<script src="<%=path %>/resources/bootstrap/jquery-1.7.2.min.js"></script>
		<!--Include all complied plugins(below) ,or include individual files as needed-->
		<script src="<%=path %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<script>
			$(function(){
				var addresslist = ajaxRequest("queryaddress", "json");
				if(addresslist.length==0){
					alert("You haven't have a Receive Address!");
					return false;
				}
				for(var i = 0;i<addresslist.length;i++){
					$("#address_list").append(""+
							"<input type='text' class='address_info' style='cursor:pointer' readOnly "+
							" value='"+addresslist[i].belong_to+"   "+
									addresslist[i].detailed+"   "+
									addresslist[i].receiver+"   "+
									addresslist[i].phone+"   "+
									addresslist[i].zip_code+"   "+
							"' /><br/>"
					);
				}
			});
			var address;
			$("#address_list").click(function(e){
				if($(e.target).hasClass('address_info')){
					$(e.target).css("border","1px solid red");
					$(e.target).siblings().css("border","1px solid #f3f3f3");
					address = $(e.target).val().trim();
				}
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
			$("#back").click(function(){
				window.location.href="tocart";
			});
			$("#sure").click(function(){
				if(address==null||address==""||address==undefined){
					alert("You haven't choose a address,Please choose or add one!");
					return false;
				}
				array = new Array();
				i = -1;
				$("input[name='ordered']").each(function(){
					if($(this).attr("checked")){
						var data = {};
						i++;
						data["digital_id"] = $(this).siblings().eq(0).val();
						data["color"] = $(this).parent().parent().siblings().eq(1).children().children().eq(0).text();
						data["version"] = $(this).parent().parent().siblings().eq(1).children().children().eq(2).text();
						data["smalljpg"] = $(this).parent().parent().siblings().eq(0).children().eq(0).children()[0].src
						data["quantity"] = $(this).parent().parent().siblings().eq(3).children().children().val();
						data["sum"] = $(this).parent().parent().siblings().eq(4).children().children().text();
						data["price"] =  $(this).parent().parent().siblings().eq(2).children().children().html();
						data["description"] = $(this).parent().parent().siblings().eq(0).children().eq(1).text();
						data["address"] = address;
						array[i] = data;
					}
				});
				var result = ajaxRequest("geneorder","text",JSON.stringify(array));
				if(result=="SUCCESS"){
					window.location.href="paypage";
				}else{
					alert("Fail!");
					return false;
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