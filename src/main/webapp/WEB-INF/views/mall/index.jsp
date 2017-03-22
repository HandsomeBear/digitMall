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

			/*选项菜单，巨幕轮播图，右侧导航css style*/
			.mainmenu{float:left;margin-top:-15px;}
			.mainmenu .nav-tabs{width:160px;background-color:#f9f9f9;height:350px}
			.tabcontent{position:absolute;z-index:2;width:670px;height:363px;margin-left:-20px;background-color:white}
			.tabcontent ul{list-style:none}
			.tabcontent ul li{float:left;margin-top:10px;margin-left:30px;}
			
			.screen{float:left;width:650px;height:350px;z-index:1;}
			.carousel-indicators{list-style:outside none none;margin:0;position: absolute;
					right:325px;top:320px;}
			.right-nav{float:left;width:105px;height:348px;border:1px solid red}
			.right-nav ul{list-style:none}
			.right-nav ul li{margin-top:20px;margin-left:-10px;}

			/*商品展示css style*/
			.show .show-product{height:390px;margin-top:20px;}
			.show .show-product .title{font-size:30px;color:#f03}
			.show .show-product ul{list-style:none}
			.show .show-product ul li{float:left;margin-left:26px;}
			.show .show-product ul li .imgs-discount{width:200px;height:250px;border:1px solid red;}
			.show .show-product ul li .imgs-vr{width:270px;height:290px;}
			.show .show-product ul li .imgs-phone{width:220px;height:300px;}
			.show .show-product ul li .imgs-camera{width:260px;height:260px;}
			.show .show-product ul li .imgs-computer{width:260px;height:260px;}

			/*底部css style*/
			.footer{}
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
		<jsp:include page="customer/header.jsp"/>
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
						<li class="active"><a href="javascript:void(0)">首页</a></li>
						<li><a href="showdigitlist?flag=1&currentPage=1" id="topor1">手机</a></li>
						<li><a href="showdigitlist?flag=2&currentPage=1" id="topor2">电脑</a></li>
						<li><a href="showdigitlist?flag=3&currentPage=1" id="topor3">相机</a></li>
						<li><a href="showdigitlist?flag=4&currentPage=1" id="topor4">VR</a></li>
					</ul>
				</div>
			</nav>
		</div>

		<!--菜单，巨幕，右侧选项-->
		<div class="container">
			<div style="height:350px">
				<!--Menu-->
				<div class="tabbable tabs-left mainmenu">
					<ul class="nav nav-tabs" id="tabs">
						<li><a href="#tab1" data-toggle="tab" class="flag">手机</a></li>
						<li><a href="#tab2" data-toggle="tab" class="flag">电脑</a></li>
						<li><a href="#tab3" data-toggle="tab" class="flag">相机</a></li>
						<li><a href="#tab4" data-toggle="tab" class="flag">VR产品</a></li>
						<li><a href="#tab5" data-toggle="tab" class="flag">选项卡五</a></li>
						<li><a href="#tab6" data-toggle="tab" class="flag">选项卡六</a></li>
						<li><a href="#tab7" data-toggle="tab" class="flag">选项卡七</a></li>
						<li><a href="#tab8" data-toggle="tab" class="flag">选项卡八</a></li>
					</ul>
					<div class="tab-content" id="tab-con">
						<div class="tab-pane tabcontent flag" id="tab1">
							<ul class="flag">
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('1','Huawei')" class="flag">华为</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('1','Xiaomi')" class="flag">小米</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('1','Iphone')" class="flag">苹果</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('1','Meizu')" class="flag">魅族</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('1','Samsung')" class="flag">三星</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('1','Zet')" class="flag">中兴</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('1','Smartisan')" class="flag">锤子</a></li>
							</ul>
						</div>
						<div class="tab-pane tabcontent flag" id="tab2">
							<ul class="flag">
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('2','Acer')" class="flag">宏碁</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('2','Lenovo')" class="flag">联想</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('2','Dell')" class="flag">戴尔</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('2','Imac')" class="flag">苹果</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('2','Haier')" class="flag">海尔</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('2','Hp')" class="flag">惠普</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('2','Tongfang')" class="flag">清华同方</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('2','Asus')" class="flag">华硕</a></li>
							</ul>
						</div>
						<div class="tab-pane tabcontent flag" id="tab3">
							<ul class="flag">
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('3','Canon')" class="flag">佳能（Canon）</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('3','Nikon')" class="flag">尼康（Nikon）</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('3','Olympus')" class="flag">奥林巴斯（OLYMPUS）</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('3','Panasonnic')" class="flag">松下电器（Panasonnic）</a></li>
								<br/>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('3','Sony')" class="flag">索尼（SONY）</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('3','FoxConn')" class="flag">富士康（FoxConn）</a></li>
							</ul>
						</div>
						<div class="tab-pane tabcontent flag" id="tab4">
							<ul class="flag">
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('4','Baofeng')" class="flag">暴风魔镜</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('4','Ant VR')" class="flag">蚁视（ANTVR）</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('4','Zhuoke')" class="flag">卓客（zhuoke）</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('4','Haorui')" class="flag">皓睿（HAORUI）</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('4','Qike')" class="flag">柒客（Qike）</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('4','Moke')" class="flag">魔壳（MOKE）</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('4','Oculus')" class="flag">Oculus</a></li>
								<br/>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('4','现代演绎')" class="flag">现代演绎</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('4','Newman')" class="flag">纽曼（Newman）</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('4','天力星')" class="flag">天力星（TLPOWER）</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('4','TBM')" class="flag">TBM</a></li>
								<li class="flag"><a href="javascript:void(0)" onclick="searchbybrand('4','点拾')" class="flag">点拾</a></li>
							</ul>
						</div>
						<div class="tab-pane tabcontent flag" id="tab5">
							这是选项卡五
						</div>
						<div class="tab-pane tabcontent flag" id="tab6">
							这是选项卡六
						</div>
						<div class="tab-pane tabcontent flag" id="tab7">
							这是选项卡七
						</div>
						<div class="tab-pane tabcontent flag" id="tab8">
							这是选项卡八
						</div>
					</div>
				</div>
				<!--巨幕轮播图-->
				<div class="screen carousel slide" id="screen">
					<!-- 轮播（Carousel）指标 -->
					<ol class="carousel-indicators">
						<li data-target="#screen" data-slide-to="0" class="active"></li>
						<li data-target="#screen" data-slide-to="1"></li>
						<li data-target="#screen" data-slide-to="2"></li>
					</ol>   
					<!-- 轮播（Carousel）项目 -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="<%=path %>/resources/images/1.png" alt="First slide">
							 <div class="carousel-caption" style="color:red">iPhone 6S Plus</div>
						</div>
						<div class="item">
							<img src="<%=path %>/resources/images/3.png" alt="Second slide">
							 <div class="carousel-caption" style="color:red">Samsung Galaxy Note</div>
						</div>
						<div class="item">
							<img src="<%=path %>/resources/images/4.png" alt="Third slide">
							 <div class="carousel-caption" style="color:red">iPhone 5S</div>
						</div>
					</div>
					<!-- 轮播（Carousel）导航 -->
					<a class="carousel-control left" href="#screen" 
						data-slide="prev" style="margin-top:20px;">&lsaquo;</a>
					<a class="carousel-control right" href="#screen" 
						data-slide="next" style="margin-top:20px;">&rsaquo;</a>
				</div>
				<!--右侧选项-->
				<div class="right-nav">
					<div>
						<ul>
							<li><a href="#">商家一</a><br></li>
							<li><a href="#">商家二</a><br></li>
							<li><a href="#">商家三</a><br></li>
							<li><a href="#">商家四</a><br></li>
							<li><a href="#">商家五</a><br></li>
							<li><a href="#">商家六</a><br></li>
						</ul>
					</div>
				</div>
			</div>
			<br>
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
			
		<!--商品展示-->
		<div class="container">
			<div class="show">
				<!--打折商品-->
				<div class="show-product" style="height:460px;">
					<span class="title"><a href="###">VR专场-Floor1</a></span>
					<hr/>
					<ul>
						<li><div class="imgs-vr"><a href="digitdetails/41"><img src="<%=path %>/resources/images/VR/small/vr_game.png"></img></a></div><div   class="description">蚁视 虚拟现实3D电脑游戏头盔</div></li>
						<li><div class="imgs-vr"><a href="digitdetails/48"><img src="<%=path %>/resources/images/VR/small/vr_glasess06.png"></img></a></div><div   class="description">zhuoke卓客智能眼镜虚拟现实</div></li>
						<li><div class="imgs-vr"><a href="digitdetails/44"><img src="<%=path %>/resources/images/VR/small/vr_glasess02.png"></img></a></div><div   class="description">皓睿 智能眼镜vr眼镜虚拟现实</div></li>
					</ul>
				</div>
				<br/>
				<!--产品来源一-->
				<div class="show-product">
					<span class="title"><a href="###">手机专场-Floor2</a></span>
					<hr/>
					<ul>
						<li><div class="imgs-phone"><a href="digitdetails/5"><img src="<%=path %>/resources/images/phone/small/huaweiEnjoy.png"></img></a></div><div   class="description">华为 畅想 Enjoy</div></li>
						<li><div class="imgs-phone"><a href="digitdetails/9"><img src="<%=path %>/resources/images/phone/small/iPhone6sA1700.png"></img></a></div><div   class="description">IPhone 6S A1700</div></li>
						<li><div class="imgs-phone"><a href="digitdetails/1"><img src="<%=path %>/resources/images/phone/small/galaxyGrang2.png"></img></a></div><div   class="description">三星 Samsung Galaxy Grang2</div></li>
						<%-- <li><div class="imgs-phone"><a href="digitdetails/6"><img src="<%=path %>/resources/images/phone/small/huaweiHonour.png"></img></a></div><div   class="description">华为 荣耀 Honour</div></li> --%>
					</ul>
				</div>
				<br/>
				<!--产品来源二-->
				<div class="show-product">
					<span class="title"><a href="###">电脑专场-Floor3</a></span>
					<hr/>
					<ul>
						<li><div class="imgs-computer"><a href="digitdetails/20"><img src="<%=path %>/resources/images/computer/small/dellIns3847-R7938.png"></img></a></div><div   class="description">Dell Inspiration 3847</div></li>
						<li><div class="imgs-computer"><a href="digitdetails/17"><img src="<%=path %>/resources/images/computer/small/acerATC-700MP.png"></img></a></div><div   class="description">宏碁 Acer ATC</div></li>
						<li><div class="imgs-computer"><a href="digitdetails/23"><img src="<%=path %>/resources/images/computer/small/hp20-r301cn.png"></img></a></div><div   class="description">惠普 HP20</div></li>
					</ul>
				</div>
				<br/>
				<!--产品来源二-->
				<div class="show-product">
					<span class="title"><a href="###">相机专场-Floor4</a></span>
					<hr/>
					<ul>
						<li><div class="imgs-camera"><a href="digitdetails/29"><img src="<%=path %>/resources/images/camera/small/canonsx400.png"></img></a></div><div   class="description">Canon 佳能 SX400</div></li>
						<li><div class="imgs-camera"><a href="digitdetails/32"><img src="<%=path %>/resources/images/camera/small/foxconn.png"></img></a></div><div   class="description">Foxconn 富士康</div></li>
						<li><div class="imgs-camera"><a href="digitdetails/33"><img src="<%=path %>/resources/images/camera/small/nikon01.png"></img></a></div><div   class="description">Nikon 尼康</div></li>
					</ul>
				</div>
			</div>
		</div>
		<jsp:include page="customer/footer.jsp"/>

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
			//左侧选项卡hover效果实现($应该是被插件所用了--替换一下)
			jQuery(function ($) {
				$("#tabs a").hover(function () {
					$("#tab-con").show();
					$(this).tab('show');
				});
				$("body").mouseover(function (e) {
					if($(e.target).hasClass('flag')){
						return false;
					}
					$("#tab-con").hide();
				});
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
				$("#mycart").click(function(e){
					e.preventDefault();
//					var islogin = ajaxRequest("checkislogin","text");
//					if(islogin=="SUCCESS"){
						window.location.href="tocart";
//					}else{
//						$("#loginModal").modal({
							//esc键退出
//							keyboard:true
//						});
//					}
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
			});
			function searchbybrand(flag,brand){
				var data = {"brand":brand};
				var result = ajaxRequest("buildsearchcondition","text",JSON.stringify(data));
				if(result=="SUCCESS"){
					window.location.href="showdigitlist?flag="+flag+"&currentPage=1";
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