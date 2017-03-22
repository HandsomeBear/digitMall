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
			
			.error{color:red}
			.disable{readOnly;}
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
				<c:forEach var="digitAdmin" items="${digitAdmins }" varStatus="status">
					<c:if test="${status.count == 1}">
						<table class="table table-bordered table-hover table-condensed">
							<thead>
								<tr>
									<th>商品编号</th>
									<th>主题</th>
									<th>描述</th>
									<th>生产商</th>
									<th>发布日期</th>
									<th>剩余数量</th>
									<th>重量</th>
									<th>生产来源</th>
									<th>功能</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="width:60px;" id="digital_id">${digitAdmin.digital_id }</td>
									<td style="width:300px;">${digitAdmin.title }</td>
									<td style="width:300px;">${digitAdmin.description }</td>
									<td style="width:60px;">${digitAdmin.factory }</td>
									<td style="width:146px;">${digitAdmin.release_date }</td>
									<td style="width:60px;">${digitAdmin.quantity }</td>
									<td style="width:50px;">${digitAdmin.weight }</td>
									<td style="width:60px;">${digitAdmin.produce_from }</td>
									<td style="width:100px;">${digitAdmin.func }</td>
								</tr>
							</tbody>
						</table>
						<div>
							<div>
								<button class="btn btn-info btn-lg" data-toggle="modal" 
   									data-target="#updatedigit" style="width:122px;height:27px;">修改</button>
							</div>
						</div>
						<!-- modal层 -->
						<div class="modal fade" id="updatedigit" tabindex="-1">
				   			<div class="modal-dialog">
				      			<div class="modal-content">
				         			<div class="modal-header">
				            			<button type="button" class="close" 
				               				data-dismiss="modal">
				                  			&times;
				            			</button>
				            			<h4 class="modal-title" id="myModalLabel">
				               				修改信息
				            			</h4>
				         			</div>
				         			<div class="modal-body">
				         				<form class="form-horizontal">
				         					<div class="control-group">
												<label class="control-label" for="digital_id">
													<span class="labe">商品Id:</span>
												</label>
												<div class="controls">
													<input type="text" id="digital_id" name="digital_id" value="${digitAdmin.digital_id }" readOnly>
													<span class="error" id="digital_error"></span>
												</div>
											</div>
				         					<div class="control-group">
												<label class="control-label" for="title">
													<span class="labe">主题:</span>
												</label>
												<div class="controls">
													<textarea rows="3" id="title" name="title">${digitAdmin.title }</textarea>
													<span class="error" id="title_error"></span>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" for="description">
													<span class="labe">描述:</span>
												</label>
												<div class="controls">
													<textarea rows="3" id="description" name="description" >${digitAdmin.description }</textarea>
													<span class="error" id="description_error"></span>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" for="weight">
													<span class="labe">重量:</span>
												</label>
												<div class="controls">
													<input type="text" id="weight" name="weight" value="${digitAdmin.weight }">
													<span class="error" id="weight_error"></span>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" for="produce_from">
													<span class="labe">来源:</span>
												</label>
												<div class="controls">
													<input type="text" id="produce_from" name="produce_from" value="${digitAdmin.produce_from }">
													<span class="error" id="from_error"></span>
												</div>
											</div>
											<div class="control-group">
												<label class="control-label" for="func">
													<span class="labe">功能:</span>
												</label>
												<div class="controls">
													<input type="text" id="func" name="func" value="${digitAdmin.func }">
													<span class="error" id="func_error"></span>
												</div>
											</div>
				         				</form>
				         			</div>
				         			<div class="modal-footer">
					            		<button type="button" class="btn btn-default" data-dismiss="modal">
					            			关闭
					            		</button>
					            		<button type="button" class="btn btn-primary" id="updatenow">提交更改
					            		</button>
				         			</div>
				      			</div><!-- /.modal-content -->
							</div><!-- /.modal -->
						</div>
					</c:if>
				</c:forEach>
				<br/>
				<div>
					<table class="table table-bordered table-hover table-condensed">
						<thead>
							<tr>
								<th>商品id</th>
								<th>颜色</th>
								<th>版本</th>
								<th>剩余数量</th>
								<th>价格</th>
								<th>是否打折</th>
								<th>折扣</th>
								<th>所属</th>
								<th>修改</th>
								<th>下架</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="digitAdmin" items="${digitAdmins }" varStatus="status">
								<tr>
									<td>${digitAdmin.id }</td>
									<td>${digitAdmin.color }</td>
									<td>${digitAdmin.version }</td>
									<td>${digitAdmin.amount }</td>
									<td>${digitAdmin.money }</td>
									<td>${digitAdmin.discount_flag }</td>
									<td>${digitAdmin.discount_num }</td>
									<td>${digitAdmin.digital_id }</td>
									<td><button class="btn btn-info up" data-toggle="modal" 
   									data-target="#updateone" style="height:27px;">修改</button>
   									</td>
   									<td><button type="button" class="btn btn-info delete" 
   									style="height:27px;">下架</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<button class="btn btn-info" data-toggle="modal"
   					data-target="#addnew" style="height:27px;">添加</button>
				</div>
			</div>
		</div>
		<!-- modal层 update ext-->
		<div class="modal fade" id="updateone" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
				    <div class="modal-header">
				        <button type="button" class="close" 
				               	data-dismiss="modal">
				                &times;
				        </button>
				        <h4 class="modal-title" id="myModalLabel">
				            	修改信息
				        </h4>
				        </div>
				        <div class="modal-body">
				         	<form class="form-horizontal">
				         		<div class="control-group">
									<label class="control-label" for="id">
										<span class="labe">商品Id:</span>
									</label>
								<div class="controls">
									<input type="text" id="id" name="id" readOnly>
										<span class="error" id="id_error"></span>
									</div>
								</div>
				         		<div class="control-group">
									<label class="control-label" for="amount">
										<span class="labe">剩余数量:</span>
									</label>
								<div class="controls">
									<input type="text" value="" id="amount" name="amount" />
										<span class="error" id="amount_error"></span>
								</div>
								</div>
									<div class="control-group">
										<label class="control-label" for="money">
											<span class="labe">价格:</span>
										</label>
									<div class="controls">
										<input type="text" value="" id="money" name="money" />
											<span class="error" id="money_error"></span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="discount_flag">
										<span class="labe">打折:</span>
									</label>
									<div class="controls">
										<select id="discount_flag" name="discount_flag" >
											<option value="T">T</option>
											<option value="F">F</option>
										</select>
										<span class="error" id="discount_flag_error"></span>
									</div>
									</div>
										<div class="control-group">
											<label class="control-label" for="discount_num">
												<span class="labe">折扣:</span>
											</label>
										<div class="controls">
											<input type="text" id="discount_num" name="discount_num" value="${digitAdmin.discount_num }">
												<span class="error" id="discount_num_error"></span>
										</div>
									</div>
									<input type="hidden" id="digitalid" />
				         		</form>
				         	</div>
				         	<div class="modal-footer">
					            <button type="button" class="btn btn-default" data-dismiss="modal">
					            		关闭
					            </button>
					            <button type="button" class="btn btn-primary" id="updateonenow">提交更改
					            </button>
				         	</div>
				      	</div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
				<!-- modal层 update ext-->
		<div class="modal fade" id="addnew" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
				    <div class="modal-header">
				        <button type="button" class="close" 
				               	data-dismiss="modal">
				                &times;
				        </button>
				        <h4 class="modal-title" id="myModalLabel">
				            	添加信息
				        </h4>
				        </div>
				        <div class="modal-body">
				         	<form class="form-horizontal">
				         		<div class="control-group">
									<label class="control-label" for="new_amount">
										<span class="labe">数量:</span>
									</label>
								<div class="controls">
									<input type="text" value="" id="new_amount" name="new_amount" />
										<span class="error" id="new_amount_error"></span>
								</div>
								</div>
									<div class="control-group">
										<label class="control-label" for="new_money">
											<span class="labe">价格:</span>
										</label>
									<div class="controls">
										<input type="text" value="" id="new_money" name="new_money" />
											<span class="error" id="new_money_error"></span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="new_color">
										<span class="labe">顏色:</span>
									</label>
									<div class="controls">
										<input type="text" value="" id="new_color" name="new_color" />
										<span class="error" id="new_color_error"></span>
									</div>
									</div>
										<div class="control-group">
											<label class="control-label" for="new_version">
												<span class="labe">配置:</span>
											</label>
										<div class="controls">
											<input type="text" id="new_version" name="new_version" >
												<span class="error" id="new_version_error"></span>
										</div>
									</div>
									<input type="hidden" id="digitalid" />
				         		</form>
				         	</div>
				         	<div class="modal-footer">
					            <button type="button" class="btn btn-default" data-dismiss="modal">
					            		关闭
					            </button>
					            <button type="button" class="btn btn-primary" id="add">
					            		确定添加
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
			$("#updatenow").click(function(){
				var digital_id = $("#digital_id").val();
				var title = $("#title").val().trim();
				var description = $("#description").val().trim();
				var weight = $("#weight").val();
				var produce_from = $("#produce_from").val();
				var func = $("#func").val();
				
				if(title==""||title==null){
					$("#title_error").html("Can't be empty!");
					return false;
				}
				if(description==""||description==null){
					$("#description_error").html("Can't be empty!");
					return false;
				}
				if(weight==""||weight==null){
					$("#weight_error").html("Can't be empty!");
					return false;
				}
				if(produce_from==""||produce_from==null){
					$("#from_error").html("Can't be empty!");
					return false;
				}
				if(func==""||func==null){
					$("#func_error").html("Can't be empty!");
					return false;
				}
				
				var data = {};
				data["digital_id"] = digital_id;
				data["title"] = title;
				data["description"] = description;
				data["weight"] = weight;
				data["produce_from"] = produce_from;
				data["func"] = func;
				
				var result = ajaxRequest("admin/updatedigit", "text", JSON.stringify(data));
				if(result=="SUCCESS"){
					var data1 = {"digital_id":digital_id};
					var a = ajaxRequest("admin/tomoreinfo","text",JSON.stringify(data1));
					if(a=="SUCCESS"){
						window.location.href="admin/moreinfo";
					}
				}else{
					alert("Update Fail!");
					return false;
				}
			});
			$(".up").click(function(e){
				$("#id").val($(e.target).parent().siblings().eq(0).html());
				$("#amount").val($(e.target).parent().siblings().eq(3).html());
				$("#money").val($(e.target).parent().siblings().eq(4).html());
				if($(e.target).parent().siblings().eq(5).html()=="T"){
					$("#discount_flag option[value='T']").attr("selected",true);
				}else{
					$("#discount_flag option[value='F']").attr("selected",true);
					$("#discount_num").attr("disabled",true);
				}
				$("#discount_num").val($(e.target).parent().siblings().eq(6).html());
				$("#digitalid").val($(e.target).parent().siblings().eq(7).html());
			});
			$("#updateonenow").click(function(){
				var id = $("#id").val().trim();
				var amount = $("#amount").val().trim();
				var money = $("#money").val().trim();
				var discount_flag = $("#discount_flag option:selected").val();
				var discount_num = $("#discount_num").val().trim();
				var digitalid = $("#digitalid").val().trim();
				var re = /^[0-9]+.?[0-9]*$/;
				if(amount==""||amount==null||parseInt(amount)<=0||!re.test(amount)){
					$("#amount_error").html("InValid input");
					return false;
				}
				if(money==""||money==null||parseInt(money)<=0||!re.test(money)){
					$("#money_error").html("InValid input");
					return false;
				}
				if(discount_flag!="T"&&discount_flag!="F"){
					$("#discount_flag_error").html("Only can be T or F");
					return false;
				}
				if(discount_num==""||discount_num==null||parseInt(discount_num)<=0
						||!re.test(discount_num)){
					$("#discount_num_error").html("InValid input");
					return false;
				}
				var data = {};
				data["id"] = id;
				data["amount"] = amount;
				data["money"] = money;
				data["discount_flag"] = discount_flag;
				data["discount_num"] = discount_num;
				data["digital_id"] = digitalid;
				
				var result = ajaxRequest("admin/updatedigitext", "text", JSON.stringify(data));
				if(result=="SUCCESS"){
					var data1 = {"digital_id":digitalid};
					var a = ajaxRequest("admin/tomoreinfo","text",JSON.stringify(data1));
					if(a=="SUCCESS"){
						window.location.href="admin/moreinfo";
					}
				}else{
					alert("Update Fail!");
//					$("#updateone").hide();
				}
			});
			$("#discount_flag").change(function(){
				if($("#discount_flag option:selected").val()=="T"){
					$("#discount_num").removeAttr("disabled");
				}else{
					$("#discount_num").attr("disabled",true);
				}
			});
			$(".delete").click(function(e){
				var id = $(e.target).parent().siblings().eq(0).html();
				var digital_id = $(e.target).parent().siblings().eq(7).html();
				var data = {};
				data["id"] = id;
				data["digital_id"] = digital_id;
				var result = ajaxRequest("admin/deleteone", "text", JSON.stringify(data));
				if(result=="SUCCESS"){
					alert("Operration Successful!");
					var data1 = {"digital_id":digital_id};
					var a = ajaxRequest("admin/tomoreinfo","text",JSON.stringify(data1));
					if(a=="SUCCESS"){
						window.location.href="admin/moreinfo";
					}
				}else{
					alert("Operation Fail!");
					return false;
				}
			});
			$("#add").click(function(e){
				var digital_id = $("#digital_id").html();
				var data = {};
				data["amount"] = $("#new_amount").val().trim();
				data["money"] = $("#new_money").val().trim();
				data["color"] = $("#new_color").val().trim();
				data["version"] = $("#new_version").val().trim();
				data["digital_id"] = digital_id;
				//数据验证
				var result = ajaxRequest("admin/addext", "text", JSON.stringify(data));
				if(result=="SUCCESS"){
					alert("Operation Successful!");
					var data1 = {"digital_id":digital_id};
					var a = ajaxRequest("admin/tomoreinfo","text",JSON.stringify(data1));
					if(a=="SUCCESS"){
						window.location.href="admin/moreinfo";
					}
				}else{
					alert("Operation Failed!");
					return false;
				}
			});
		</script>
	</body>
</html>