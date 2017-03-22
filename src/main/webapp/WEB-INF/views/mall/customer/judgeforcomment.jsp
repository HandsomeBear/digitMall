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
			.search{float:left;line-height:100px;margin-top:-8px;}
			.logo{float:left;width:300px;height:100px;background:url(<%=path%>/resources/images/logo.png)}
			.title{font-size:30px;color:red;font-weight:bold;}

			.left{float:left;width:300px;height:200px;margin-left:20px;}
			.right{float:left;width:490px;height:200px;margin-left:50px;}
		</style>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<!--logo，搜索框-->
		<div class="container con">	
			<div class="logo"></div>
			<div class="search">				
				<span class="title">商品评价</span>
			</div>		
		</div>

		<div class="container" style="min-height:300px;border:1px solid #d1fbfe;background-color:#f2f9ff">
			<div style="width:940px;height:200px;">
				<div style="background-color:#eaeaea;height:40px;">
					<span style="line-height:40px;margin-left:126px;">宝贝</span>
					<span style="line-height:40px;margin-left:390px;">评价</span>
				</div>
				<hr/>
				<div class="left">
					<div style="float:left;width:100px;">
						<img alt="商品" src="${judgeInfo.smalljpg }">
					</div>
					<div style="float:left;width:180px;margin-left:20px;">
						<input type="hidden" value="${judgeInfo.digital_id }" id="digital_id" />
						<input type="hidden" value="${judgeInfo.order_no }" id="orderno" />
						<input type="hidden" value="${judgeInfo.color }" id="color" />
						<input type="hidden" value="${judgeInfo.version }" id="version" />
						<span>${judgeInfo.description }</span><br/><br/>
						<span>颜色：${judgeInfo.color }</span><br/><br/>
						<span>版本：${judgeInfo.version }</span>
					</div>
				</div>
				<div class="right">
					<div style="height:30px;">
						<img src="<%=path %>/resources/images/comment.png" id="img1" style="cursor:pointer"/>
						<img src="<%=path %>/resources/images/comment.png" id="img2" style="cursor:pointer"/>
						<img src="<%=path %>/resources/images/comment.png" id="img3" style="cursor:pointer"/>
						<img src="<%=path %>/resources/images/comment.png" id="img4" style="cursor:pointer"/>
						<img src="<%=path %>/resources/images/comment.png" id="img5" style="cursor:pointer"/>
						<span id="score" style="vertical-align:middle;color:red;font-size:16px;"></span>
					</div>
					<div style="margin-top:22px;">
						<textarea rows="6" style="width:400px;" id="comments"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="container" style="min-height:220px;">
			<hr/>
			<div align=center>
				<button type="button" class="btn btn-info" id="sure">确认提交</button>
				<button type="button" class="btn btn-info" id="later">以后再评</button>
			</div>
		</div>
		
		<jsp:include page="footer.jsp"/>

		<!--jQuery(necessary for Bootstrap's javascript plugins)-->
		<script src="<%=path %>/resources/bootstrap/jquery-1.7.2.min.js"></script>
		<!--Include all complied plugins(below) ,or include individual files as needed-->
		<script src="<%=path %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<script>
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
			};
			var rank;
			var urljudge = "<%=path%>/resources/images/judge.png?"+Math.random();
			var urlcomment = "<%=path%>/resources/images/comment.png?"+Math.random();
			var urlcry = "<%=path%>/resources/images/cry.png?"+Math.random();
			$("#img1").click(function(){
				$("#img1").attr("src",urlcry);
				$("#img2").attr("src",urlcomment);
				$("#img3").attr("src",urlcomment);
				$("#img4").attr("src",urlcomment);
				$("#img5").attr("src",urlcomment);
				$("#score").html("&nbsp;&nbsp;&nbsp;1分");
				rank = 1;
			});
			$("#img2").click(function(){
				$("#img1").attr("src",urlcry);
				$("#img2").attr("src",urlcry);
				$("#img3").attr("src",urlcomment);
				$("#img4").attr("src",urlcomment);
				$("#img5").attr("src",urlcomment);
				$("#score").html("&nbsp;&nbsp;&nbsp;2分");
				rank = 2;
			});
			$("#img3").click(function(){
				$("#img1").attr("src",urljudge);
				$("#img2").attr("src",urljudge);
				$("#img3").attr("src",urljudge);
				$("#img4").attr("src",urlcomment);
				$("#img5").attr("src",urlcomment);
				$("#score").html("&nbsp;&nbsp;&nbsp;3分");
				rank = 3;
			});
			$("#img4").click(function(){
				$("#img1").attr("src",urljudge);
				$("#img2").attr("src",urljudge);
				$("#img3").attr("src",urljudge);
				$("#img4").attr("src",urljudge);
				$("#img5").attr("src",urlcomment);
				$("#score").html("&nbsp;&nbsp;&nbsp;4分");
				rank = 4;
			});
			$("#img5").click(function(){
				$("#img1").attr("src",urljudge);
				$("#img2").attr("src",urljudge);
				$("#img3").attr("src",urljudge);
				$("#img4").attr("src",urljudge);
				$("#img5").attr("src",urljudge);
				$("#score").html("&nbsp;&nbsp;&nbsp;5分");
				rank = 5;
			});
			$("#sure").click(function(){
				var data = {};
				data["digital_id"] = $("#digital_id").val();
				data["rank"] = rank;
				data["comments"] = $("#comments").val();
				data["orderno"] = $("#orderno").val();
				data["color"] = $("#color").val();
				data["version"] = $("#version").val();
				var result = ajaxRequest("executejudge", "text", JSON.stringify(data));
				if(result=="SUCCESS"){					
					window.location.href="paysuccess";
				}else{
					alert("评价失败！");
					return false;
				}
			});
			$("#later").click(function(){
				window.location.href="toorderquerypage";
			});
		</script>
	</body>
</html>