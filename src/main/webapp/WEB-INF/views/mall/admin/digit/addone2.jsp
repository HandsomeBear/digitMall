<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			.content{width:100%;height:84%;}
			.content .menu{width:16%;height:100%;background:#ff9;float:left}
			.content .menu .options{height:100%;background:#ff9;}
			.content .menu .options .mybtn{width:100%}
			.content .menu .options .con{background:#ff9;}
			.content .menu .options .con li{list-style-type:none;margin-top:5px;}
			.content .menu .options .con a{text-decoration:none;}
			.content .menu .options .con .aa{background:red;}
			.content .menu .options .con a:hover{cursor:pointer;}
			.content .main{width:84%;height:100%;background-color:#ffe0c1;float:right;}
			.content .main span{width:100px;display:inline-block;text-align:right;}
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
				<div style="float:left;width:480px;">
					<div><span>title:</span>
						<textarea rows="2" cols="" id="title"></textarea>
					</div>
					<div><span>Description:</span>
						<textarea rows="2" cols="" id="description"></textarea>
					</div>
					<div><span>factory:</span>
						<input type="text" id="factory" />
					</div>
					<div><span>release_date:</span>
						<input type="text" id="release_date" />
					</div>
					<div><span>quantity:</span>
						<input type="text" id="quantity" />
					</div>
					<div><span>price:</span>
						<input type="text" id="price" />
					</div>
					<div><span>category:</span>
						<select id="category">
							<option value="1">phone</option>
							<option value="2">computer</option>
							<option value="3">camera</option>
							<option value="4">VR</option>
						</select>
					</div>
					<div><span>weight:</span>
						<input type="text" id="weight" />
					</div>
					<div><span>produce_from:</span>
						<input type="text" id="produce_from" />
					</div>
					<div><span>func:</span>
						<input type="text" id="func" />
					</div>
					<div><span>color:</span>
						<input type="text" id="color" />
					</div>
					<div><span>version:</span>
						<input type="text" id="version" />
					</div>
					<input type="hidden" id="image" />
					<input type="hidden" id="bigimage" />
					<input type="hidden" id="smallimage" />
				</div>
				<div style="float:left;border-left:1px solid bule;">
					<form id="fileForm">
						<input type="file" name="file" />
						<button type="button" class="btn btn-info" id="btnView">PreView</button>
						<button type="button" class="btn btn-primary" id="btnClear">Clear</button>
						<br/>
						<input type="file" name="file" />
						<button type="button" class="btn btn-info" id="btnView1">PreView</button>
						<button type="button" class="btn btn-primary" id="btnClear1">Clear</button>
						<br/>
						<input type="file" name="file" />
						<button type="button" class="btn btn-info" id="btnView2">PreView</button>
						<button type="button"  class="btn btn-primary" id="btnClear2">Clear</button>
						<br/>
						<button type="button" class="btn btn-primary" id="btnUpload">Upload File</button>
					</form>
					<div><button type="button" class="btn btn-primary" id="addone">添加</button></div>
					<div id="imgContainer"></div>
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
//			var uploadImage;
			var uploadstatus = false;
			var isJpg = function(name) {
			    return name.match(/jpg$/i)
			};
			    
			var isPng = function(name) {
			    return name.match(/png$/i)
			};
			$(function(){
				var ff;
				var ff1;
				var ff2;
			    var imgContainer = $('#imgContainer');
			    
			    $('#btnView').on('click', function() {
					var file = $('[name="file"]').eq(0);
					ff = file;
			        var filename = $.trim(file.val());
			        if (!(isJpg(filename) || isPng(filename))) {
			            alert('Please browse a JPG/PNG file to upload ...');
			            return;
			        }
			        $.ajax({
			            url: 'admin/previewall/0',
			            type: 'post',
			            data: new FormData(document.getElementById("fileForm")),
			            enctype: 'multipart/form-data',
			            processData: false,
			            contentType: false
			          }).done(function(data) {
			              imgContainer.html('');
			              var img = '<img src="data:' + data.contenttype + ';base64,'
			                  + data.base64 + '"/>';
			    
			              imgContainer.append(img);
			          }).fail(function(jqXHR, textStatus) {
			              //alert(jqXHR.responseText);
			              alert('File PreView failed ...');
			          });
			        
			    });
			    
			    $('#btnView1').on('click', function() {
					var file = $('[name="file"]').eq(1);
					ff1 = file;
			        var filename = $.trim(file.val());
			        if (!(isJpg(filename) || isPng(filename))) {
			            alert('Please browse a JPG/PNG file to upload ...');
			            return;
			        }
			        $.ajax({
			            url: 'admin/previewall/1',
			            type: 'post',
			            data: new FormData(document.getElementById("fileForm")),
			            enctype: 'multipart/form-data',
			            processData: false,
			            contentType: false
			          }).done(function(data) {
			              imgContainer.html('');
			              var img = '<img src="data:' + data.contenttype + ';base64,'
			                  + data.base64 + '"/>';
			    
			              imgContainer.append(img);
			          }).fail(function(jqXHR, textStatus) {
			              //alert(jqXHR.responseText);
			              alert('File PreView failed ...');
			          });
			        
			    });
			    $('#btnView2').on('click', function() {
					var file = $('[name="file"]').eq(2);
					ff2 = file;
			        var filename = $.trim(file.val());
			        if (!(isJpg(filename) || isPng(filename))) {
			            alert('Please browse a JPG/PNG file to upload ...');
			            return;
			        }
			        $.ajax({
			            url: 'admin/previewall/2',
			            type: 'post',
			            data: new FormData(document.getElementById("fileForm")),
			            enctype: 'multipart/form-data',
			            processData: false,
			            contentType: false
			          }).done(function(data) {
			              imgContainer.html('');
			              var img = '<img src="data:' + data.contenttype + ';base64,'
			                  + data.base64 + '"/>';
			    
			              imgContainer.append(img);
			          }).fail(function(jqXHR, textStatus) {
			              //alert(jqXHR.responseText);
			              alert('File PreView failed ...');
			          });
			        
			    });
			    
			    $('#btnUpload').on('click', function() {
			    	var flag = true;
			    	var clair;
			    	$('[name="file"]').each(function(){
			    		var file = $(this).val();
			    		if(file==""||file==null||file==undefined){
			    			clair = "File can't be null";
				    		flag = false;
				    	}
			    		if(!(isJpg($.trim($(this).val()))||isPng($.trim($(this).val())))){
			    			clair = "File Invalid";
			    			flag = false;
			    		}
			    	});
			    	if(!flag){
			    		alert(clair);
			    		return false;
			    	}
			    	var category = $("#category option:selected").text();
			    	var result = ajaxRequest("admin/setcategory"+category, "text");
			    	if(result=="SUCCESS"){
				        $.ajax({
				            url: 'admin/uploadall',
				            type: 'post',
				            data: new FormData(document.getElementById("fileForm")),
				            enctype: 'multipart/form-data',
				            processData: false,
				            contentType: false
				          }).done(function(data) {
				              $("#image").val(data[0]);
				              $("#bigimage").val(data[1]);
				              $("#smallimage").val(data[2]);
				              uploadstatus = true;
				              alert("Upload Image Success");
				          }).fail(function(jqXHR, textStatus) {
				              //alert(jqXHR.responseText);
				              alert('File upload failed ...');
				          });
			    	}
			    });
			    
			    $('#btnClear').on('click', function() {
			        imgContainer.html('');
			        ff.val('');
			    });
			    $('#btnClear1').on('click', function() {
			        imgContainer.html('');
			        ff1.val('');
			    });
			    $('#btnClear2').on('click', function() {
			        imgContainer.html('');
			        ff2.val('');
			    });
			});
			$("#addone").click(function(){
				if(!uploadstatus){
					alert("Please Upload Image First!");
					return false;
				}
				var title = $("#title").val().trim();
				var description = $("#description").val().trim();
				var factory = $("#factory").val().trim();
				var release_date = $("#release_date").val().trim();
				var quantity = $("#quantity").val().trim();
				var price = $("#price").val().trim();
				var category = $("#category option:selected").val();
				var weight = $("#weight").val().trim();
				var produce_from = $("#produce_from").val().trim();
				var func = $("#func").val().trim();
				var color = $("#color").val().trim();
				var version = $("#version").val().trim();
				var image = $("#image").val().trim();
				var bigimage = $("#bigimage").val().trim();
				var smallimage = $("#smallimage").val().trim();
				//数据判断。。。
				var data = {};
				data["title"] = title;
				data["description"] = description;
				data["factory"] = factory;
				data["release_date"] = release_date;
				data["quantity"] = quantity;
				data["price"] = price;
				data["category_code"] = category;
				data["weight"] = weight;
				data["produce_from"] = produce_from;
				data["func"] = func;
				data["color"] = color;
				data["version"] = version;
				data["image_address"] = image;
				data["image_address_big"] = bigimage;
				data["image_small"] = smallimage;
				
				var result = ajaxRequest("admin/addone", "text", JSON.stringify(data));
				if(result!="FAIL"){
					if(confirm("Add an other one!")){
						window.location.reload();
					}else{	
						var data1 = {"digital_id":result};
						var result = ajaxRequest("admin/tomoreinfo", "text", JSON.stringify(data1));
						if(result=="SUCCESS"){
							window.location.href="admin/moreinfo";
						}else{
							alert("Redirect to moreinfo fail!");
							return false;
						}
					}
				}
			});
		</script>
	</body>
</html>