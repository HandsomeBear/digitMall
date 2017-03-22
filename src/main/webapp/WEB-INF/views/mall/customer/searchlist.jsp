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

			/*导航条css style*/
			.mynav li{margin-left:30px}
			
			.show ul{list-style:none}
			.show ul li{float:left;margin-left:26px;}
			.show ul li .one{width:260px;height:340px;}
			.show .title{margin-bottom:0px;}
			
			.show ul li .onechange{width:260px;height:430px;}
			.show ul li .twochange{width:260px;height:350px;}
			.show ul li .threechange{width:260px;height:350px;}
			.show ul li .fourchange{width:260px;height:400px;}
			
			/*border:1px solid #d5d5d5;*/
			.factory{width:940px;height:120px;border:1px solid #ddd;}
			.factory .left{float:left;width:110px;height:120px;background-color:#f3f3f3}
			.factory .right{float:left;}
			.factory .right ul{list-style:none}
			.factory .right ul li{float:left;margin-left:24px;margin-top:24px;}
			.choose{width:940px;height:36px;border:1px solid #ddd;}
			.choose .price{float:left;width:110px;height:36px;background-color:#f3f3f3}
			.choose .range{float:left;line-height:36px;}
			.choose .range span{color:#08c;margin-left:20px;cursor:pointer;}
			
			.order{width:940px;height:36px;border:1px solid #ddd;}
			.order .orderbyall{float:left;width:110px;height:36px;background-color:#f3f3f3}
			.order .orderbyother{float:left;line-height:36px;}
		</style>
	</head>
	<body>
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

		<!--导航条nav-->
		<div class="container">
			<nav class="navbar mynav">
				<div class="navbar-inner">
					<a class="brand" href="#">全部商品分类</a>
					<ul class="nav">
						<li class="active"><a href="index" id="toindex">首页</a></li>
						<li><a href="javascript:void(0)" id="topor1" onclick="searchbytitle('1')">手机</a></li>
						<li><a href="javascript:void(0)" id="topor2" onclick="searchbytitle('2')">电脑</a></li>
						<li><a href="javascript:void(0)" id="topor3" onclick="searchbytitle('3')">相机</a></li>
						<li><a href="javascript:void(0)" id="topor4" onclick="searchbytitle('4')">VR</a></li>
					</ul>
				</div>
			</nav>
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
			
		<div class="container">
			<div class="factory">
				<div class="left">
					<span style="font-weight:bold;color:#666">品牌:</span>
				</div>
				<div class="right">
					<c:choose>
						<c:when test="${flag=='1' }">
							<a href="javascript:void(0)" onclick="searchbybrand('Huawei')"><img src="<%=path%>/resources/images/huawei.png" /></a>
							<a href="javascript:void(0)" onclick="searchbybrand('Xiaomi')"><img src="<%=path%>/resources/images/xiaomi.png" /></a>
							<a href="javascript:void(0)" onclick="searchbybrand('Iphone')"><img src="<%=path%>/resources/images/apple.png" /></a>
							<a href="javascript:void(0)" onclick="searchbybrand('Meizu')"><img src="<%=path%>/resources/images/meizu.png" /></a>
							<a href="javascript:void(0)" onclick="searchbybrand('Samsung')"><img src="<%=path%>/resources/images/samsung.png" /></a>
							<br/>
							<a href="javascript:void(0)" onclick="searchbybrand('Zet')"><img src="<%=path%>/resources/images/zte.png" /></a>
							<a href="javascript:void(0)" onclick="searchbybrand('Smartisan')"><img src="<%=path%>/resources/images/smartisan.png" /></a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="javascript:void(0)" onclick="searchbybrand('del')">全部</a>
						</c:when>
						<c:when test="${flag=='2' }">
							<a href="javascript:void(0)" onclick="searchbybrand('Acer')"><img src="<%=path%>/resources/images/acer.png" /></a>
							<a href="javascript:void(0)" onclick="searchbybrand('Lenovo')"><img src="<%=path%>/resources/images/lenovo.png" /></a>
							<a href="javascript:void(0)" onclick="searchbybrand('Dell')"><img src="<%=path%>/resources/images/dell.png" /></a>
							<a href="javascript:void(0)" onclick="searchbybrand('Imac')"><img src="<%=path%>/resources/images/appl.png" /></a>
							<a href="javascript:void(0)" onclick="searchbybrand('Haier')"><img src="<%=path%>/resources/images/haier.png" /></a>
							<br/>
							<a href="javascript:void(0)" onclick="searchbybrand('Hp')"><img src="<%=path%>/resources/images/hp.png" /></a>
							<a href="javascript:void(0)" onclick="searchbybrand('Tongfang')"><img src="<%=path%>/resources/images/tongfang.png" /></a>
							<a href="javascript:void(0)" onclick="searchbybrand('Asus')"><img src="<%=path%>/resources/images/asus.png" /></a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="javascript:void(0)" onclick="searchbybrand('del')">全部</a>
						</c:when>
						<c:when test="${flag=='3' }">
							<ul>
								<li><a href="javascript:void(0)" onclick="searchbybrand('Canon')">佳能（Canon）</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('Nikon')">尼康（Nikon）</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('Olympus')">奥林巴斯（OLYMPUS）</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('Panasonnic')">松下电器（Panasonnic）</a></li>
								<br/>
								<li><a href="javascript:void(0)" onclick="searchbybrand('Sony')">索尼（SONY）</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('FoxConn')">富士康（FoxConn）</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('del')">所有</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul>
								<li><a href="javascript:void(0)" onclick="searchbybrand('Baofeng')">暴风魔镜</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('Ant VR')">蚁视（ANTVR）</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('Zhuoke')">卓客（zhuoke）</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('Haorui')">皓睿（HAORUI）</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('Qike')">柒客（Qike）</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('Moke')">魔壳（MOKE）</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('Oculus')">Oculus</a></li>
								<br/>
								<li><a href="javascript:void(0)" onclick="searchbybrand('现代演绎')">现代演绎</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('Newman')">纽曼（Newman）</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('天力星')">天力星（TLPOWER）</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('TBM')">TBM</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('点拾')">点拾</a></li>
								<li><a href="javascript:void(0)" onclick="searchbybrand('del')">全部</a></li>
							</ul>					
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="choose">
				<div class="price">
					<span style="color:#666">价格:</span>
				</div>
				<div class="range">
					<span onclick="searchbyprice(this)">0-499</span>
					<span onclick="searchbyprice(this)">500-999</span>
					<span onclick="searchbyprice(this)">1000-1999</span>
					<span onclick="searchbyprice(this)">2000-2999</span>
					<span onclick="searchbyprice(this)">3000-4999</span>
					<span onclick="searchbyprice(this)">5000-9999</span>
					<span onclick="searchbyprice(this)">10000-以上</span>
					<span onclick="searchbyprice(this)">全部</span>
				</div>
			</div>
			<div class="order">
				<div class="orderbyall">
					<span style="color:#666">综合排序:</span>
				</div>
				<div class="orderbyother">
					<div style="float:left;margin-left:20px;cursor:pointer;">
						<a href="javascript:void(0)" onclick="orderbyoptional('sellamount')">销量</a>
					</div>
					<div style="float:left;margin-left:12px;cursor:pointer">
						<a href="javascript:void(0)" onclick="orderbyoptional('price')">价格</a>
					</div>
					<div style="float:left;margin-left:12px;cursor:pointer">
						<a href="javascript:void(0)" onclick="orderbyoptional('commentamount')">评论</a>
					</div>
				</div>
			</div>
		</div>
			
		<!--商品展示-->
		<div class="container" style="min-height:300px;">
			<input type="hidden" value="${flag }" id="flag" />
			<div class="show">
				<ul>
					<c:forEach var="digit" items="${digits }">
						<li>
							<div class="one">
								<div class="imgs">
									<a href="digitdetails/${digit.digital_id }">
										<img src="<%=path%>/resources/images/${digit.image_address}.png"></img>
									</a>
								</div>
								<div class="title">
									<span style="color:#666">${digit.title }</span>
									<br/><br/>
									<span style="color:#666">共有<span style="color:#666;font-weight:bold;">${digit.commentamount }条评价</span></span>
									<br/>
									<span style="color:#666">已销售<span style="color:#666;font-weight:bold;">${digit.sellamount }</span></span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<br/><br/><br/><br/>
		<div class="container">
			<div class="pagination pagination-right">
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
		<jsp:include page="footer.jsp"/>

		<!--jQuery(necessary for Bootstrap's javascript plugins)-->
		<script src="<%=path %>/resources/bootstrap/jquery-1.7.2.min.js"></script>
		<!--Include all complied plugins(below) ,or include individual files as needed-->
		<script src="<%=path %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<!-- lazyload.js -->
		<script src="<%=path %>/resources/jquery.lazyload.js"></script>
		<script>
			<%-- var Img = "<%=path %>/resources/images/lazyload.gif";
			jQuery.noConflict()(function(){
				jQuery.noConflict()("img").lazyload({placeholder:Img,effect:"fadeIn"});
			}); --%>
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
			jQuery(function ($) {
				var flag = $("#flag").val();
				if(flag=="1"){
					$("#topor1").parent().addClass("active");
					$("#topor1").parent().siblings().removeClass("active");
					$(".one").addClass("onechange");
				}else if(flag=="2"){
					$("#topor2").parent().addClass("active");
					$("#topor2").parent().siblings().removeClass("active");
					$(".one").addClass("twochange");
				}else if(flag=="3"){
					$("#topor3").parent().addClass("active");
					$("#topor3").parent().siblings().removeClass("active");
					$(".one").addClass("threechange");
				}else if(flag=="4"){
					$("#topor4").parent().addClass("active");
					$("#topor4").parent().siblings().removeClass("active");
					$(".one").addClass("fourchange");
				}else{
					$(".one").addClass("onechange");
				}
				$("#toindex").hover(function(){
						$(this).parent().addClass("active");					
					},function(){
						$(this).parent().removeClass("active");
					}
				);
				$("#topor1").hover(function(){
						$(this).parent().addClass("active");
					},function(){
						if(flag=="1")
							return false;
						$(this).parent().removeClass("active");
					}
				);
				$("#topor2").hover(function(){
						$(this).parent().addClass("active");
					},function(){
						if(flag=="2")
							return false;
						$(this).parent().removeClass("active");
					}
				);
				$("#topor3").hover(function(){
						$(this).parent().addClass("active");
					},function(){
						if(flag=="3")
							return false;
						$(this).parent().removeClass("active");
					}
				);
				$("#topor4").hover(function(){
						$(this).parent().addClass("active");
					},function(){
						if(flag=="4")
							return false;
						$(this).parent().removeClass("active");
					}
				);
				//加载时，若没有数据，禁用分页标签
				$("#mycart").click(function(e){
					e.preventDefault();
					var islogin = ajaxRequest("checkislogin","text");
					if(islogin=="SUCCESS"){
						window.location.href="tocart";
					}else{
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
						window.location.href="tocart";
					}else{
						alert("Login Fail!");
						return false;
					}
				});
				var totalPage = $("#totalPage").val();
				if(parseInt(totalPage)==0){
					$("#currentPage").val("0");
				}
			});
			$(".range span").hover(function(){
					$(this).css("color","red");
				},function(){
					$(this).css("color","#666");
				}
			);
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
						window.location.href="showdigitlist?flag&currentPage="+parseInt(parseInt(currentPage)-1);
					}
				}else if(operation=="next"){
					if(parseInt(currentPage)==parseInt(totalPage)){
						alert("This is the last page!");
					}else{
						window.location.href="showdigitlist?flag&currentPage="+parseInt(parseInt(currentPage)+1);
					}
				}else if(operation=="first"){
					if(parseInt(totalPage)==0){
						alert("There is no data!");
					}else{
						window.location.href="showdigitlist?flag&currentPage=1";
					}
				}else if(operation=="last"){
					if(parseInt(totalPage)==0){
						alert("There is no data!");
					}else{
						window.location.href="showdigitlist?flag&currentPage="+totalPage;
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
					window.location.href="showdigitlist?flag&currentPage="+currentPage;
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
			function searchbyprice(span){
				var pricerange = $(span).html();
				var prices = pricerange.split("-");
				var data = {};
				if(pricerange=="10000-以上"){
					data["priceFrom"] = prices[0];
					var result = ajaxRequest("buildsearchcondition","text",JSON.stringify(data));
					if(result=="SUCCESS"){
						window.location.href="showdigitlist?flag&currentPage=1";
					}
				}else if(pricerange=="全部"){
					data["priceFrom"] = "del";
					data["priceTo"] = "del";
					var result = ajaxRequest("buildsearchcondition","text",JSON.stringify(data));
					if(result=="SUCCESS"){
						window.location.href="showdigitlist?flag&currentPage=1";
					}
				}else{
					data["priceFrom"] = prices[0];
					data["priceTo"] = prices[1];
					var result = ajaxRequest("buildsearchcondition","text",JSON.stringify(data));
					if(result=="SUCCESS"){
						window.location.href="showdigitlist?flag&currentPage=1";
					}
				}
			}
			function searchbybrand(brand){
				var data = {"brand":brand};
				var result = ajaxRequest("buildsearchcondition","text",JSON.stringify(data));
				if(result=="SUCCESS"){
					window.location.href="showdigitlist?flag&currentPage=1";
				}
			}
			function searchbytitle(flag){
				var data = {};
				data["priceFrom"] = "del";
				data["priceTo"] = "del";
				data["brand"] = "del";
				var result = ajaxRequest("buildsearchcondition", "text", JSON.stringify(data));
				if(result="SUCCESS"){
					window.location.href="showdigitlist?flag="+flag+"&currentPage=1";
				}
			}
			function orderbyoptional(order){
				var data = {};
				data["orderBy"] = order;
				var result = ajaxRequest("buildsearchcondition","text",JSON.stringify(data));
				if(result=="SUCCESS"){
					window.location.href="showdigitlist?flag&currentPage=1";
				}
			}
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