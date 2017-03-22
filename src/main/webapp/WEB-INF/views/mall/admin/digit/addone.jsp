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
						<button type="button" id="btnView">PreView</button>
						<button type="button" id="btnUpload">Upload File</button>
						<button type="button" id="btnClear">Clear</button>
					</form>
					<form id="fileForm_Big">
						<input type="file" name="file_big" />
						<button type="button" id="btnView_big">PreView</button>
						<button type="button" id="btnUpload_big">Upload File</button>
						<button type="button" id="btnClear_big">Clear</button>
					</form>
					<form id="fileForm_Small">
						<input type="file" name="file_small" />
						<button type="button" id="btnView_small">PreView</button>
						<button type="button" id="btnUpload_small">Upload File</button>
						<button type="button" id="btnClear_small">Clear</button>
					</form>
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
			var uploadImage;
			var uploadBigImage;
			var uploadSmallImage;
			var isJpg = function(name) {
			    return name.match(/jpg$/i)
			};
			    
			var isPng = function(name) {
			    return name.match(/png$/i)
			};
			$(function(){
				var ff;
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
			            url: 'admin/preview',
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
			    	var file = $('[name="file"]').eq(0);
			    	if(file==""||file==null||file==undefined){
			    		alert("File can't be null!");
			    		return false;
			    	}
			    	var category = $("#category option:selected").text();
			    	alert(category);
			    	var result = ajaxRequest("admin/setcategory"+category, "text");
			    	if(result=="SUCCESS"){
			    		var filename = $.trim(file.val());
				        if (!(isJpg(filename) || isPng(filename))) {
				            alert('Please browse a JPG/PNG file to upload ...');
				            return;
				        }
				        $.ajax({
				            url: 'admin/upload',
				            type: 'post',
				            data: new FormData(document.getElementById("fileForm")),
				            enctype: 'multipart/form-data',
				            processData: false,
				            contentType: false
				          }).done(function(data) {
				              alert(data);
				              $("#image").val(data);
				              uploadImage = true;
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
			    //big image
			    $('#btnView_big').on('click', function() {
					var file = $('[name="file_big"]').eq(0);
					ff = file;
			        var filename = $.trim(file.val());
			        if (!(isJpg(filename) || isPng(filename))) {
			            alert('Please browse a JPG/PNG file to upload ...');
			            return;
			        }
			        $.ajax({
			            url: 'admin/previewbig',
			            type: 'post',
			            data: new FormData(document.getElementById("fileForm_Big")),
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
			    
			    $('#btnUpload_big').on('click', function() {
			    	var file = $('[name="file_big"]').eq(0);
			    	if(file==""||file==null||file==undefined){
			    		alert("File can't be null!");
			    		return false;
			    	}
			    	var category = $("#category option:selected").text();
			    	alert(category);
			    	var result = ajaxRequest("admin/setcategory"+category, "text");
			    	if(result=="SUCCESS"){
			    		var filename = $.trim(file.val());
				        if (!(isJpg(filename) || isPng(filename))) {
				            alert('Please browse a JPG/PNG file to upload ...');
				            return;
				        }
				        $.ajax({
				            url: 'admin/uploadbig',
				            type: 'post',
				            data: new FormData(document.getElementById("fileForm_Big")),
				            enctype: 'multipart/form-data',
				            processData: false,
				            contentType: false
				          }).done(function(data) {
				              alert(data);
				              $("#bigimage").val(data);
				              uploadBigImage = true;
				          }).fail(function(jqXHR, textStatus) {
				              //alert(jqXHR.responseText);
				              alert('File upload failed ...');
				          });
			    	}
			    });
			    
			    $('#btnClear_big').on('click', function() {
			        imgContainer.html('');
			        ff.val('');
			    });
			    
			    //big small
			    $('#btnView_small').on('click', function() {
					var file = $('[name="file_small"]').eq(0);
					ff = file;
			        var filename = $.trim(file.val());
			        if (!(isJpg(filename) || isPng(filename))) {
			            alert('Please browse a JPG/PNG file to upload ...');
			            return;
			        }
			        $.ajax({
			            url: 'admin/previewsmall',
			            type: 'post',
			            data: new FormData(document.getElementById("fileForm_Small")),
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
			    
			    $('#btnUpload_small').on('click', function() {
			    	var file = $('[name="file_small"]').eq(0);
			    	if(file==""||file==null||file==undefined){
			    		alert("File can't be null!");
			    		return false;
			    	}
			    	var category = $("#category option:selected").text();
			    	alert(category);
			    	var result = ajaxRequest("admin/setcategory"+category, "text");
			    	if(result=="SUCCESS"){
			    		var filename = $.trim(file.val());
				        if (!(isJpg(filename) || isPng(filename))) {
				            alert('Please browse a JPG/PNG file to upload ...');
				            return;
				        }
				        $.ajax({
				            url: 'admin/uploadsmall',
				            type: 'post',
				            data: new FormData(document.getElementById("fileForm_Small")),
				            enctype: 'multipart/form-data',
				            processData: false,
				            contentType: false
				          }).done(function(data) {
				              alert(data);
				              $("#smallimage").val(data);
				              uploadSmallImage = true;
				          }).fail(function(jqXHR, textStatus) {
				              //alert(jqXHR.responseText);
				              alert('File upload failed ...');
				          });
			    	}
			    });
			    
			    $('#btnClear_small').on('click', function() {
			        imgContainer.html('');
			        ff.val('');
			    });
			});
		</script>
	</body>
</html>