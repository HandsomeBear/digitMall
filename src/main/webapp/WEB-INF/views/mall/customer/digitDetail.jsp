<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Digit Details</title>
		<meta name="Keywords" content="电子商城商品详情">
		<meta name="description" content="电子商城商品详情">
		<%  String path = request.getContextPath(); 
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+
			request.getServerPort()+path+"/";
		%>
		<base href="<%=basePath%>">
		
		<!--Bootstrap-->
		<link rel="stylesheet" href="<%=path %>/resources/bootstrap/css/bootstrap.min.css">
		<style type="text/css">
			body{margin:0;padding:0}
			
			/*顶部css style*/
			.top{height:30px;color:#fff;background-color:#efefef}
			.top ul{list-style:none;float:right;}
			.top ul li{float:left;line-height:30px;}
			.index{margin-right:100px;}
			.not_register{margin-right:600px;}
			.top ul li a{cursor:pointer;}
			
			/*图标，搜索框css style*/
			.con{height:100px}
			.search{float:left;line-height:100px;}
			.search .search-input{width:400px;height:30px;}
			.logo{float:left;width:300px;height:100px;background:url(<%=path%>/resources/images/logo.png)}

			/*导航条css style*/
			.mynav li{margin-left:30px}
			
			/*详细信息*/
			.links{}
			.detail{height:450px;color:#777}
			.detail_image{width:380px;height:450px;float:left}
			.detail_info{float:left;width:600px;height:450px;margin-left:40px;}
			.detail_info .price_info{background-color:#efefef}
			.detail_info .commentsum{position:relative;float:right;margin-top:-96px;mright-right:0px;width:60px;height:20px;}
			.parameter{margin-left:28px;width:1000px;height:120px;background-color:#efefef;color:#777}
			.parameter ul{list-style:none;}
			.parameter ul li{float:left;width:220px;}
			.parameter ul li a{overflow:hidden;white-space:nowrap;display:block;width:200px;
				text-overflow: ellipsis;text-decoration: none;color:#777}
			.picture{margin-left:160px;}
			.comments{margin-left:150px;width:1000px;height:900px;border:1px solid #777}
			.comment_all{width:900px;margin-left:50px;height:52px;background-color:#efefef}
			.comment_left{width:150px;height:52px;float:left;border-right:1px solid #fff;}
			.comment_left .date{margin-top:10px;}
			.comment_middle{width:600px;height:52px;float:left;border-right:1px solid #fff;}
			.comment_middle .com{margin-top:4px;margin-left:20px;}
			.comment_right{width:140px;height:52px;float:left}
			.comment_right .nickname{margin-top:10px;}
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

		<!--导航条nav-->
		<div class="container" style="width:1200px;">
			<nav class="navbar mynav">
				<div class="navbar-inner">
					<ul class="nav">
						<li><a href="#"><span style="font-size:20px;">全部商品分类</span></a></li>
						<li><a href="index" id="toindex">首页</a></li>
						<li><a href="showdigitlist?flag=1&currentPage=1" id="topor1">手机</a></li>
						<li><a href="showdigitlist?flag=2&currentPage=1" id="topor2">电脑</a></li>
						<li><a href="showdigitlist?flag=3&currentPage=1" id="topor3">相机</a></li>
						<li><a href="showdigitlist?flag=4&currentPage=1" id="topor4">其他</a></li>
					</ul>
				</div>
			</nav>
		</div>
		
		<!-- 详细信息 -->
		<div class="container" style="width:1200px;">
			<input type="hidden" id="digital_id" value="${digital.digital_id }" />
			<input type="hidden" id="image_small" value="${digital.image_small }" />
			<!-- 链接 -->
			<div class="links"></div>
			<!-- 图片，价格，库存等信息 -->
			<div class="detail">
				<div class="detail_image">
					<img src="<%=path%>/resources/images/${digital.image_address_big}.png"></img>
				</div>
				<div class="detail_info">
					<span style="font-weight:bold;font-size:16px;" id="desc">${digital.description }</span><br/><br/>
					<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日本原装进口镜头！3D巨幕影院，沉浸式游戏，环抱式全景！</span><br/><br/>
					<div class="price_info">
						<br/>
						<div>商品价格：
							<span style="color:red;font-weight:bold;font-size:16px;" id="price">${digital.price }</span>
						</div><br/>
						<div>促销信息：
								<span id="discount">
									暂无优惠信息
								</span>
						</div>
						<br/>
						<div class="commentsum">
							累计评价<br/><span>${commentamount }</span>
						</div>
					</div>
					<br/>
					<div>
						配送至：
							<select style="width:120px;">
								<option>广东深圳</option>
							</select>
							<span>有货</span>，支持99元免运费 | 货到付款<br/><br/>
						服务：由 ** 发货并提供售后服务。15：00前完成下单，可预约今晚送达
					</div>
					<hr/>
					<div>
						<div id="version">选择版本：
							<c:forEach var="version" items="${versions }">
								<input style="width:46px;cursor:pointer;border:1px solid #f3f3f3" type="text" value="${version }" readOnly class="flag"/>
							</c:forEach>
						</div>
						<div id="color">选择颜色：
							<c:forEach var="color" items="${colors }">
								<input style="width:36px;cursor:pointer;border:1px solid #f3f3f3" type="text" value="${color }" readOnly class="flag"/>
							</c:forEach>
						</div>
						<div>库存：<span id="quantity">${digital.quantity }</span></div>
						<br/>
						<div>
							<table>
								<tr>
									<td rowspan="2"><input style="width:40px;" type="text" id="num" value="1"/></td>
									<td><div style="margin-top:-10px;"><img style="width:12px;height:12px;cursor:pointer" class="img-rounded" src="<%=path %>/resources/images/add.png" id="add"/></div></td>
									<td style="width:30px;"></td>
									<td rowspan="2"><button style="width:100px;margin-top:-12px;" class="btn btn-info" id="buyitnow">立即购买</button></td>
									<td style="width:30px;"></td>
									<td rowspan="2"><button style="width:100px;margin-top:-12px;" class="btn btn-info" id="joincart">加入购物车</button></td>
								</tr>
								<tr>
									<td><div style="margin-top:-12px;"><img style="width:12px;height:12px;cursor:pointer" class="img-rounded" src="<%=path %>/resources/images/sub.png" id="sub"/></div></td>
								</tr>
							</table>
						</div>
						<!-- modal弹出框 -->
						<div id="loginModal" class="modal hide fade" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true" style="width:404px;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    								<h3 id="myModalLabel">Login</h3>
								</div>
								<div class="modal-body">
									<div>
										<div class="login-form">
											<form class="form-horizontal" action="login" method="post">
												<div class="control-group">
													<!--
													<label class="control-label" for="username"><span>UserName：</span></label>
													-->
													<div class="controls" style="margin-left:56px;">
														<i class="icon-user"></i> 
														<input type="text" id="username" name="username" placeholder="username">
													</div>
												</div>
												<div class="control-group">
													<!--
													<label class="control-label" for="password"><span>Password：</span></label>
													-->
													<div class="controls" style="margin-left:56px;">
														<i class="icon-lock"></i>
														<input type="password" id="password" name="password" placeholder="password">
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div class="modal-footer">
    								<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    								<button class="btn btn-primary" id="login">Login</button>
  								</div>
						</div>				
					</div>
				</div>
			</div>
			<!-- 详细信息，评价模块 -->
			<div class="container" style="width:1200px;margin-top:40px;">
				<div class="content">
					<ul	class="nav nav-tabs" id="mytab">
						<li class="active"><a href="#moreinfo">商品详情</a></li>
						<li><a href="#comment" id="commentshow">商品评价</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="moreinfo">
							<div class="parameter">
								<ul>
									<br/>
									<li><a title="${digital.description }">商品名称：${digital.description }</a></li>
									<li><a title="${digital.serial_no }">商品编号：${digital.serial_no }</a></li>
									<li><a title="${digital.factory }">品牌：${digital.factory }</a></li>
									<li><a title="${digital.weight }">商品毛重：${digital.weight }</a></li>
									<br/><br/>
									<li><a title="${digital.produce_from }">商品产地：${digital.produce_from }</a></li>
									<li><a title="${digital.func }">功能：${digital.func }</a></li>
								</ul>
							</div>
							<hr/>
							<div style="margin-left:30px;"><img src="<%=path%>/resources/images/test5.png"></img></div>
							<br/><br/>
							<div style="margin-left:160px;"><img src="<%=path%>/resources/images/test6.png"></img></div>
							<br/>
							<div class="picture">
								<div><img src="<%=path%>/resources/images/1.gif"></img></div>
								<br/>
								<div><img src="<%=path%>/resources/images/test1.png"></img></div>
								<br/>
								<div><img src="<%=path%>/resources/images/test2.png"></img></div>
								<br/>
								<div><img src="<%=path%>/resources/images/test3.png"></img></div>
								<br/>
								<div><img src="<%=path%>/resources/images/test4.png"></img></div>
							</div>
						</div>
						<div class="tab-pane aaa" id="comment">
							<div class="comments" id="comments">
								
							</div>
							<div class="pagination pagination-right">
								<ul>
									<li><a href="#" id="first">First</a></li>
									<li><a href="#" id="prev"><<</a></li>
									<li><a href="#" id="next">>></a></li>
									<li><a href="#" id="last">Last</a></li>
									<li><input type="text" id="totalPage" style="width:30px;" readOnly/></li>
									<li><input type="text" id="currentPage" style="width:30px;"/></li>
									<li><button style="width:100px;margin-top:-12px;" class="btn btn-info" id="goto">Goto</button></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"/>

		<!--jQuery(necessary for Bootstrap's javascript plugins)-->
		<script src="<%=path %>/resources/bootstrap/jquery-1.7.2.min.js"></script>
		<!--Include all complied plugins(below) ,or include individual files as needed-->
		<script src="<%=path %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript">
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
			}
			//选择颜色，并进行库存查询
			var color;
			var version;
			$("#version").click(function(e){
				var data = {};
				var quantity;
				var digitExt;
				if($(e.target).hasClass('flag')){
					$(e.target).css("border","1px solid red");
					$(e.target).siblings().css("border","1px solid #f3f3f3");
					version = $(e.target).val();
				}
				data["version"] = version;
				data["digital_id"] = $("#digital_id").val();
				if(color == undefined || color == null || color == ""){
					quantity = ajaxRequest("queryQuantityByCon","text",JSON.stringify(data));
					digitExt = ajaxRequest("queryPriceByCon","json",JSON.stringify(data));
				}else{
					data["color"] = color;
					quantity = ajaxRequest("queryQuantityByCon","text",JSON.stringify(data));
					digitExt = ajaxRequest("queryPriceByCon","json",JSON.stringify(data));
				}
				$("#quantity").html(quantity);
				if(digitExt.discount_flag=="F"){
					$("#price").html(digitExt.price);
					$("#discount").html("暂无优惠信息");
				}else{
					$("#price").html(digitExt.price);
					$("#discount").html(digitExt.discount_num+"折！");
				}
			});
			$("#color").click(function(e){
				var data = {};
				var quantity;
				var digitExt;
				if($(e.target).hasClass('flag')){
					$(e.target).css("border","1px solid red");
					$(e.target).siblings().css("border","1px solid #f3f3f3");
					color = $(e.target).val();
				}
				data["color"] = color;
				data["digital_id"] = $("#digital_id").val();
				if(version == undefined || version == null || version == ""){
					quantity = ajaxRequest("queryQuantityByCon","text",JSON.stringify(data));
					digitExt = ajaxRequest("queryPriceByCon","json",JSON.stringify(data));
				}else{
					data["version"] = version;
					quantity = ajaxRequest("queryQuantityByCon","text",JSON.stringify(data));
					digitExt = ajaxRequest("queryPriceByCon","json",JSON.stringify(data));
				}
				$("#quantity").html(quantity);
				if(digitExt.discount_flag=="F"){
					$("#price").html(digitExt.price);
					$("#discount").html("暂无优惠信息");
				}else{
					$("#price").html(digitExt.price);
					$("#discount").html(digitExt.discount_num+"折！");
				}
			});
			
			//导航栏 鼠标放入，放出效果显示
			$("#toindex").hover(function(){
					$(this).parent().addClass("active");
				},function(){
					$(this).parent().removeClass("active");
				}
			);
			$("#topor1").hover(function(){
					$(this).parent().addClass("active");
				},function(){
					$(this).parent().removeClass("active");
				}
			);
			$("#topor2").hover(function(){
					$(this).parent().addClass("active");
				},function(){
					$(this).parent().removeClass("active");
				}
			);
			$("#topor3").hover(function(){
					$(this).parent().addClass("active");
				},function(){
					$(this).parent().removeClass("active");
				}
			);
			$("#topor4").hover(function(){
					$(this).parent().addClass("active");
				},function(){
					$(this).parent().removeClass("active");
				}
			);
			
			//购买商品数量的增加和减少
			$("#add").click(function(){
				var num = $("#num").val();
				if(parseInt(num)<=0){
					alert("Please input number which is more than 0!");
					return false;
				}
				var quantity = $("#quantity").html();
				if(parseInt(num)<0||parseInt(num)<parseInt(quantity)){
					num++;
					$("#num").val(num);
				}else{
					alert("The num that you want to buy is more than quantity! ");
					return false;
				}
			});
			$("#sub").click(function(){
				var num = $("#num").val();
				if(parseInt(num)<=0){
					alert("Please input number which is more than 0!");
					return false;
				}
				var quantity = $("#quantity").html();
				if(parseInt(num)<parseInt(quantity)){
					if(parseInt(num)<=1){
						alert("The num can't be less than 1!");
						return false;
					}
					num--;
					$("#num").val(num);
				}else{
					alert("The num that you want to buy is more than quantity! ");
					return false;
				}
			});
			
			//商品详情与用户评论的切换
			$("#mytab a").click(function(e){
				e.preventDefault();
				$(this).tab("show");
			});
			
			function appendComment(result){
				$("#comments").append(""+
						"<div class='comment_all'  style='background-color:#f2f9ff'>"+""+
							"<div class='comment_left'><div class='date'><img src='"+result.rank+"'"+"/></br>"+result.comment_date+"</div></div>"+""+
							"<div class='comment_middle'><div class='com'>"+result.comments+"</div></div>"+""+
							"<div class='comment_right'><div class='nickname'>顾客："+result.nickname+"<br/>"+
															"<span style='color:#d5d5d5;'>"+result.color+"&nbsp;"+result.version+"</span>"+
														"</div></div>"+""+
						"</div><hr/>");
			};
			//分页全局变量
			var pageUtil;
			function print(){
				var digital_id = $("#digital_id").val();
//				var result = ajaxRequest("querycomment/"+digital_id,"json");
				var data = {"digital_id":digital_id};
				var result = ajaxRequest("querycomment", "json", JSON.stringify(data));
				if(result!=""&&result!=null){
					for(var i = 0;i<result.length;i++){
						if(i==0){
							$("#totalPage").val(result[0].pageUtil.totalPage);
							$("#currentPage").val(result[0].pageUtil.currentPage);
							pageUtil = result[0].pageUtil;
						}
						if(result[i].rank=="1"){
							result[i].rank="<%=path%>/resources/images/one.png";
						}else if(result[i].rank=="2"){
							result[i].rank="<%=path%>/resources/images/two.png";
						}else if(result[i].rank=="3"){
							result[i].rank="<%=path%>/resources/images/three.png";
						}else if(result[i].rank=="4"){
							result[i].rank="<%=path%>/resources/images/four.png";
						}else if(result[i].rank=="5"){
							result[i].rank="<%=path%>/resources/images/five.png";
						}
						appendComment(result[i]);
					}
				}
			}
			function printByCurrentPage(currentPage){
				var digital_id = $("#digital_id").val();
				var data = {"digital_id":digital_id,"currentPage":currentPage};
				var result = ajaxRequest("querycomment","json",JSON.stringify(data));
				if(result!=""&&result!=null){
					for(var i = 0;i<result.length;i++){
						if(i==0){
							$("#totalPage").val(result[0].pageUtil.totalPage);	
							$("#currentPage").val(result[0].pageUtil.currentPage);
							pageUtil = result[0].pageUtil;
						}
						if(result[i].rank=="1"){
							result[i].rank="<%=path%>/resources/images/one.png";
						}else if(result[i].rank=="2"){
							result[i].rank="<%=path%>/resources/images/two.png";
						}else if(result[i].rank=="3"){
							result[i].rank="<%=path%>/resources/images/three.png";
						}else if(result[i].rank=="4"){
							result[i].rank="<%=path%>/resources/images/four.png";
						}else if(result[i].rank=="5"){
							result[i].rank="<%=path%>/resources/images/five.png";
						}
						appendComment(result[i]);
					}
				}
			}
			//加载用户评论
			$("#commentshow").click(function(){
				print();
			});
			//首页
			$("#first").click(function(e){
				e.preventDefault();
				if(pageUtil.totalPage==0){
					alert("无数据！！！");
					return false;
				}
				if(pageUtil.currentPage==1){
					alert("当前已是首页！！！");
					return false;
				}
				$("#comments").empty();
				print();
			});
			//上一页
			$("#prev").click(function(e){
				e.preventDefault();
				if(pageUtil.totalPage==0){
					alert("无数据！！！");
					return false;
				}
				if(pageUtil.currentPage==1){
					alert("当前已是首页！！！");
					return false;
				}
				$("#comments").empty();
				var currentPage = pageUtil.currentPage-1;
				printByCurrentPage(currentPage);
				
			});
			//下一页
			$("#next").click(function(e){
				e.preventDefault();
				if(pageUtil.totalPage==0){
					alert("无数据！！！");
					return false;
				}
				if(pageUtil.currentPage==pageUtil.totalPage){
					alert("当前已是尾页！！！");
					return false;
				}
				$("#comments").empty();
				var currentPage = pageUtil.currentPage+1;
				printByCurrentPage(currentPage);
			});
			//尾页
			$("#last").click(function(e){
				e.preventDefault();
				if(pageUtil.totalPage==0){
					alert("无数据！！！");
					return false;
				}
				if(pageUtil.currentPage==pageUtil.totalPage){
					alert("当前已是尾页！！！");
					return false;
				}
				$("#comments").empty();
				var currentPage = pageUtil.totalPage;
				printByCurrentPage(currentPage);
			});
			//跳转
			$("#goto").click(function(){
				var page = $("#currentPage").val().trim();
				var totalPage = $("#totalPage").val().trim();
				if(parseInt(page)<1||parseInt(page)>totalPage){
					alert("InValid Input!");
					$("#currentPage").val(pageUtil.currentPage);
					return false;
				}
				$("#comments").empty();
				var currentPage = page;
				printByCurrentPage(currentPage);
			});
			var neededdata;
			var op;
			//加入购物车
			$("#joincart").click(function(){
				if(version == undefined || version == null || version == ""){
					alert("Please choose a version!" );
					return false;
				}
				if(color == undefined || color == null || color == ""){
					alert("Please choose a color!");
					return false;
				}
				var currentquantity=$("#num").val();
				var totalquantiry=$("#quantity").html();
				if(parseInt(currentquantity)>parseInt(totalquantiry)){
					alert("The quantity is not enough!");
					return false;
				}
				var data = {};
				data["digital_id"] = $("#digital_id").val().trim();
				data["smalljpg"] = $("#image_small").val();
				data["color"] = color;
				data["version"] = version;
				data["quantity"] = currentquantity;
				data["description"] = $("#desc").html();
				data["price"] = $("#price").html();
				
				var islogin = ajaxRequest("checkislogin","text");
				if(islogin=="SUCCESS"){
					var joincartresult = ajaxRequest("joincart", "text",JSON.stringify(data));
					if(joincartresult=="SUCCESS"){
						alert("Join Cart Successful！");
						$("#loginModal").modal('hide');
						return false
					}
					alert("Join Cart Fail！");
					return false;
				}else{
					neededdata = data;
					op="joincart";
					$("#loginModal").modal({
						//esc键退出
						keyboard:true
					});
				}
			});
			$("#login").click(function(){
				var data = {};
				data["username"] = $("#username").val().trim();
				data["password"] = $("#password").val().trim();
				var result = ajaxRequest("businesslogin", "text", JSON.stringify(data));
				if(result=="SUCCESS"){
					if(op=="joincart"){
						var joincartresult = ajaxRequest("joincart", "text",JSON.stringify(neededdata));
						if(joincartresult=="SUCCESS"){
							alert("Join Cart Successful！");
							$("#loginModal").modal('hide');
							return false
						}
						alert("Join Cart Fail！");
						return false;
					}
					if(op=="buyitnow"){
						var result = ajaxRequest("toorder","text",JSON.stringify(array));
						if(result=="SUCCESS"){
							window.location.href="geneorderpage";
						}else{
							alert("Buy It Now Fail!");
							return false;
						}
					}
					if(op=="mycart"){
						window.location.href="tocart";
					}
					if(op=="myorder"){
						window.location.href="toorderquerypage";
					}
				}else{
					alert("Login Fail!");
					return false;
				}
			});
			//立即购买
			$("#buyitnow").click(function(){
				if(version == undefined || version == null || version == ""){
					alert("Please choose a version!" );
					return false;
				}
				if(color == undefined || color == null || color == ""){
					alert("Please choose a color!");
					return false;
				}
				array = new Array();
				var data = {};
				data["digital_id"] = $("#digital_id").val();
				data["smalljpg"] = "<%=path%>/resources/images/"+$("#image_small").val();
				data["color"] = color;
				data["description"] = $("#desc").html();
				data["version"] = version;
				data["price"] = $("#price").html();
				data["quantity"] = $("#num").val();
				var totalmoney = parseFloat($("#num").val())*parseFloat($("#price").text());
				data["sum"] = totalmoney;
				array[0] = data;
				
				var islogin = ajaxRequest("checkislogin","text");
				if(islogin=="SUCCESS"){
					var result = ajaxRequest("toorder","text",JSON.stringify(array));
					if(result=="SUCCESS"){
						window.location.href="geneorderpage";
					}else{
						alert("Buy It Now Fail!");
						return false;
					}
				}else{
					neededdata = data;
					op="buyitnow";
					$("#loginModal").modal({
						//esc键退出
						keyboard:true
					});
				}
			});
			
			$("#mycart").click(function(e){
				e.preventDefault();
				var islogin = ajaxRequest("checkislogin","text");
				if(islogin=="SUCCESS"){
					window.location.href="tocart";
				}else{
	//				neededdata = data;
					op="mycart";
					$("#loginModal").modal({
						//esc键退出
						keyboard:true
					});
				}
			});
			$("#myorder").click(function(e){
				e.preventDefault();
				var islogin = ajaxRequest("checkislogin","text");
				if(islogin=="SUCCESS"){
					window.location.href="toorderquerypage";
				}else{
	//				neededdata = data;
					op="myorder";
					$("#loginModal").modal({
						//esc键退出
						keyboard:true
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