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
			.button{text-align:center;}
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
							<li><a href="admin/toChangePwd">修改密码</a></li>
						</ul>
					</div>
					<button type="button" class="btn btn-primary mybtn" data-toggle="collapse" 
	   					data-target="#digitOperation">
						产品管理
					</button>
					<div id="digitOperation" class="collapse in con">
						<ul>	
							<li><a href="admin/showdigitlist?currentPage=1">商品列表</a></li>
							<li><a href="admin/toaddone">新货上架</a></li>
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
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th><input type="checkbox" name="optionAll" id="optionAll"></th>
							<th>名称</th>
							<th>密码</th>
							<th>超管</th>
							<th>最近修改日期</th>
							<th>最近修改地址</th>
						</tr>
					</thead>
					<c:forEach items="${admins }" var="admin">
						<tbody>
							<tr class="success">
								<td><input type="checkbox" name="option" value="${admin.admin_id }"></td>
								<td align="center">${admin.name }</td>
								<td>${admin.password }</td>
								<td>${admin.super_admin }</td>
								<td>${admin.upd_date }</td>
								<td>${admin.upd_ip }</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
				<div class="button">
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#myModal" id="btn-add">添加管理员</button>
					<button type="button" class="btn btn-primary" id="btn-del">删除管理员</button>
					<button type="button" class="btn btn-primary" id="btn-dis">管理权限</button>
				</div>
			</div>
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
               				新增管理员
            			</h4>
         			</div>
         			<div class="modal-body">
         				<form class="form-horizontal">
         					<div class="control-group">
								<label class="control-label" for="name">
									<span class="labe">名称:</span>
								</label>
								<div class="controls">
									<input type="text" id="name" name="name" placeholder="name">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="password">
									<span class="labe">初始密码:</span>
								</label>
								<div class="controls">
									<input type="text" id="password" name="password" value="111111">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="super_admin">
									<span class="labe">超管:</span>
								</label>
								<div class="controls">
									<label class="radio inline">
										<input type="radio" name="super_admin" id="yes" value="T"/>
										是
									</label>
									<label class="radio inline">
										<input type="radio" name="super_admin" id="no" value="F" checked/>
										否
									</label>
								</div>
							</div>
         				</form>
         			</div>
         			<div class="modal-footer">
	            		<button type="button" class="btn btn-default" data-dismiss="modal">
	            			关闭
	            		</button>
	            		<button type="button" class="btn btn-primary" id="add_admin">提交
	            		</button>
         			</div>
      			</div><!-- /.modal-content -->
			</div><!-- /.modal -->
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
			$("#add_admin").click(function(){
				var name = $("#name").val();
				if(name==""){
					alert("名称不能为空...");
					$("#name").focus();
					return false;
				}
				$.ajax({
					url:'admin/validateUnique',
					type:'post',
					data:name,
					contentType:'application/json',
					success:function(data){
						if(data=="SUCCESS"){
							var password = $("#password").val();
							var super_admin = $("input[name='super_admin']:checked").val();
							var data = {'name':name,'password':password,'super_admin':super_admin};
							$.ajax({
								url:'admin/add',
								type:'post',
								data:JSON.stringify(data),
								contentType:'application/json',
								success:function(data){
									if(data="SUCCESS"){
										window.location.href="admin/showAll";
									}
								}
							});
						}else{
							alert("该名称已存在...");
							$("#name").val("").focus();
							return false;
						}
					}
				});
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
			$("#btn-del").click(function(){
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
					var data = {admin_ids:checkeds};
					$.ajax({
						url:'admin/delete',
						type:'post',
						data:data,
						success:function(data){
							if(data=="SUCCESS"){
								alert("成功删除!");
								window.location.href="admin/showAll";
							}else{
								alert("删除失败!");
								window.location.href="admin/showAll";
							}
						}
					});
				}
			});
		</script>
	</body>
</html>