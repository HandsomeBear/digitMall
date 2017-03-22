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
		<title>数码商城-完善用户信息</title>
		<meta name="Keywords" content="数码商城-完善用户信息">
		<meta name="description" content="数码商城-完善用户信息">
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

			.form{margin-top:40px;}
			.birth_year{width:50px;}
			.birth_month{width:25px;}
			.birth_day{width:25px;}
			.button{text-align:center}
			.option{margin-top:20px;margin-left:20px;}
			.option span{font-family:"微软雅黑";font-size:16px;}

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
				<div class="content" id="content" style="background-color:#f2f9ff">
					<div class="option"><a href="person/completeInfo?username=${loginUserName }">
						<span>基本信息</span></a>
						&nbsp;|&nbsp;
						<a href="person/touploadImage"><span>上传图像</span></a>
					</div>
					<div align="center" id="info" style="color:red;height:12px;">${successMessage }
					<%request.getSession().removeAttribute("successMessage"); %>
					</div>
					<form class="form-horizontal form">
						<div class="control-group">
							<label class="control-label" for="username">用户名：</label>
							<div class="controls">
								<input type="text" id="username" value="${customer.nickname }" readonly/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="realname">真实姓名：</label>
							<div class="controls">
								<input type="text" id="realname" value="${customer.realname }"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="sex">性别：</label>
							<div class="controls">
								<input type="hidden" id="sex_hidden" value="${customer.sex }"/>
								<label class="radio inline">
									<input type="radio" name="sex" id="sex1" value="男" checked/>
									男
								</label>
								<label class="radio inline">
									<input type="radio" name="sex" id="sex2" value="女"/>女
								</label>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="phone">联系电话：</label>
							<div class="controls">
								<input type="text" id="phone" value="${customer.phone }"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="email">邮箱：</label>
							<div class="controls">
								<input type="email" id="email" value="${customer.email }"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="birth">生日：</label>
							<div class="controls">
								<input type="hidden" id="birth" value="${customer.birth_date }"/>
								<input class="inline birth_year" type="text" id="year" name="year"/>年
								<input class="inline birth_month" type="text" id="month" name="month"/>月
								<input class="inline birth_day" type="text" id="day" 
								name="day"/>日
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="home_adress">住址：</label>
							<div class="controls">
								<input type="text" id="home_adress" value="${customer.home_adress }"/>
							</div>
						</div>
						<div class="button">
							<button type="button" class="btn btn-primary">保存</button>
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
		<script>
			$(function(){
				var url = "<%=path%>/resources/uploadFiles/uploadImages/personImage-<%=loginUserName %>.png?"+Math.random();
				$("#img").attr("src",url);
			});
			$(function(){
				var sex_hidden = $("#sex_hidden").val();
				if(sex_hidden=="男"){
					$("input[name='sex']:eq(0)").attr("checked","checked");
				}else{
					$("input[name='sex']:eq(1)").attr("checked","checked");
				}
				var birth = $("#birth").val();
				var births = birth.split("-");
				$("#year").val(births[0]);
				$("#month").val(births[1]);
				$("#day").val(births[2]);
			});
			
			$(".btn").click(function(){
				var username = $("#username").val();
				var realname = $("#realname").val();
				var sex = $("input[name='sex']:checked").val();
				var phone = $("#phone").val();
				var email = $("#email").val();
				var year = $("#year").val();
				var month = $("#month").val();
				var day = $("#day").val();
				var birth_date = year+"-"+month+"-"+day;
				var home_adress = $("#home_adress").val();
				var data = {'username':username,'realname':realname,'sex':sex,
						'phone':phone,'email':email,'birth_date':birth_date,
						'home_adress':home_adress};
				$.ajax({
					url:'person/saveedit',
					type:'post',
					contentType:'application/json',
					data:JSON.stringify(data),
					success:function(data){
						if(data=="SUCCESS"){
							window.location.href="person/completeInfo?username=${loginUserName }";
						}else if(data=="FAILURE"){
							$("#info").html("<span style='color:red'>电话或邮箱错误</span>");
						}else if(data=="EXCEPTION"){
							$("#info").html("<span style='color:red'>未知错误</span>");
						}
					}
				});
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