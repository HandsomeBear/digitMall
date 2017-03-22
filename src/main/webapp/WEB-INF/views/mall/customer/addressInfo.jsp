<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
		<meta http-equiv="expires" content="0">
		<!--页面三要素-->
		<title>数码商城-用户界面</title>
		<meta name="Keywords" content="电子商城用户界面">
		<meta name="description" content="电子商城用户界面">
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
			.content .title{margin-top:30px;text-align:center;}
			.thead{font-family:"微软雅黑";font-size:16px;font-weight:bold;}
			.mytable{margin-top:20px;}
			.button{text-align:center}
			.labe{font-family:"微软雅黑";font-size:18px;}
			.error{color:red;}
			
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
					<div class="title"><span class="thead">收货地址</span></div>
					<div class="mytable">
						<table class="table table-bordered table-hover table-condensed">
							<thead>
								<tr>
									<th><input type="checkbox" name="optionAll" value="" id="optionAll"></th>
									<th>收货人姓名</th>
									<th>所在省市</th>
									<th>详细地址</th>
									<th>邮编</th>
									<th>电话/手机</th>
									<th>默认地址</th>
								</tr>
							</thead>
							<c:forEach items="${addresses }" var="address">
								<tbody>
									<tr class="success">
										<td><input type="checkbox" name="option" value="${address.address_id }"></td>
										<td>${address.receiver }</td>
										<td>${address.belong_to }</td>
										<td>${address.detailed }</td>
										<td>${address.zip_code }</td>
										<td>${address.phone }</td>
										<td>${address.default_address }</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
					<div class="button">
						<button class="btn btn-primary btn-lg" data-toggle="modal" 
   							data-target="#myModal">新增</button>
   						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-primary" id="delete">删除</button>
					</div>
				</div>
			</div>
			<br>
		</div>

		<!-- modal层 -->
		<div class="modal fade" id="myModal" tabindex="-1">
   			<div class="modal-dialog">
      			<div class="modal-content">
         			<div class="modal-header">
            			<button type="button" class="close" 
               				data-dismiss="modal">
                  			&times;
            			</button>
            			<h4 class="modal-title" id="myModalLabel">
               				新增收货地址
            			</h4>
         			</div>
         			<div class="modal-body">
         				<form class="form-horizontal">
         					<div class="control-group">
								<label class="control-label" for="belong_to">
									<span class="labe">所属省市:</span>
								</label>
								<div class="controls">
									<input type="text" id="belong_to" name="belong_to" placeholder="所属省市">
									<span class="error" id="belong_to_error"></span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="detailed">
									<span class="labe">详细地址:</span>
								</label>
								<div class="controls">
									<input type="text" id="detailed" name="detailed" placeholder="详细地址">
									<span class="error" id="detailed_error"></span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="phone">
									<span class="labe">联系方式:</span>
								</label>
								<div class="controls">
									<input type="text" id="phone" name="phone" placeholder="联系方式">
									<span class="error" id="phone_error"></span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="zip_code">
									<span class="labe">邮编:</span>
								</label>
								<div class="controls">
									<input type="text" id="zip_code" name="zip_code" placeholder="邮编">
									<span class="error" id="zip_code_error"></span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="receiver">
									<span class="labe">收货人姓名:</span>
								</label>
								<div class="controls">
									<input type="text" id="receiver" name="receiver" placeholder="收货人姓名">
									<span class="error" id="receiver_error"></span>
								</div>
							</div>
         				</form>
         			</div>
         			<div class="modal-footer">
	            		<button type="button" class="btn btn-default" data-dismiss="modal">
	            			关闭
	            		</button>
	            		<button type="button" class="btn btn-primary" id="add_address">提交更改
	            		</button>
         			</div>
      			</div><!-- /.modal-content -->
			</div><!-- /.modal -->
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
		<script type="text/javascript">
			$(function(){
				var url = "<%=path%>/resources/uploadFiles/uploadImages/personImage-<%=loginUserName %>.png?"+Math.random();
				$("#img").attr("src",url);
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
			$("#add_address").click(function(){
				var belong_to = $("#belong_to").val();
				var detailed = $("#detailed").val();
				var phone = $("#phone").val();
				var zip_code = $("#zip_code").val();
				var receiver = $("#receiver").val();
				if(belong_to==""){
					$("#belong_to_error").html("非空");
				}else if(detailed==""){
					$("#belong_to_error").html("");
					$("#detailed_error").html("非空");
				}else if(phone==""||phone.length!=11){
					$("#belong_to_error").html("");
					$("#detailed_error").html("");
					$("#phone_error").html("非空|长度为11");
				}else if(zip_code==""){
					$("#belong_to_error").html("");
					$("#detailed_error").html("");
					$("#phone_error").html("");
					$("#zip_code_error").html("非空|长度为6");
				}else if(receiver==""){
					$("#belong_to_error").html("");
					$("#detailed_error").html("");
					$("#phone_error").html("");
					$("#zip_code_error").html("");
					$("#receiver_error").html("非空");
				}else{
					var data = {'belong_to':belong_to,'detailed':detailed,'phone':phone,
							'zip_code':zip_code,'receiver':receiver};
					$.ajax({
						url:'address/addAddress',
						type:'post',
						contentType:'application/json',
						data:JSON.stringify(data),
						success:function(data){
							if(data=="SUCCESS"){
								alert("添加成功！");
								window.location.href="person/addressInfo?username=${loginUserName}";
							}else if(data=="FAILURE"){
								alert("添加失败！");
								window.location.href="person/addressInfo?username=${loginUserName}";
							}else if(data=="EXCEPTION"){
								alert("未知错误！");
								window.location.href="person/addressInfo?username=${loginUserName}";
							}
						}
					});
				}
			});
			$("#optionAll").click(function(){
				if($("input[name='optionAll']").attr("checked")){
					$("input[name='option']").attr("checked","checked");
				}else{
					$("input[name='option']").each(function(){
						$(this).removeAttr("checked");
					});
				}
			});
			$("#delete").click(function(){
				var checkeds = "";
				$("input[name='option']").each(function(){
					if($(this).attr("checked")){
						checkeds += $(this).val() + ",";
					}
				});
				if(checkeds.length <= 0){
					 alert("请选中一条或多条记录");
					return false;
				}else{
					checkeds = checkeds.substring(0,checkeds.length-1);
					var data = {strings:checkeds};
					$.ajax({
						url:'address/deleteAddress',
						type:'post',
						data:data,
						success:function(data){
							if(data=="SUCCESS"){
								alert("成功删除!");
								window.location.href="address/addressInfo?username=${loginUserName}";
							}else if(data=="FAILURE"){
								alert("删除失败!");
								window.location.href="address/addressInfo?username=${loginUserName}";
							}else if(data=="EXCEPTION"){
								alert("未知错误!");
								window.location.href="address/addressInfo?username=${loginUserName}";
							} 
						}
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