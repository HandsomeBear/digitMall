<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<!--页面三要素-->
		<title>数码商城</title>
		<meta name="Keywords" content="电子商城购物车">
		<meta name="description" content="电子商城购物车">
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
			.index{margin-right:100px;}
			.not_register{margin-right:600px;}
			.top ul li a{cursor:pointer;}

			/*图标，搜索框css style*/
			.con{height:100px}
			.search{float:left;line-height:100px;}
			.search .search-input{width:400px;height:30px;}
			.logo{float:left;width:300px;height:100px;background:url(<%=path%>/resources/images/logo.png)}
			
			.head{}
			.head .chooseall{float:left;margin-left:0px;}
			.head .digitinfo{float:left;margin-left:110px;}
			.head .price{float:left;margin-left:252px;}
			.head .amount{float:left;margin-left:82px;}
			.head .sum{float:left;margin-left:102px;}
			.head .operation{float:left;margin-left:80px;}
			
			.cartinfo{margin-top:20px;min-height:1000px;}
			
			.outter{height:100px;width:940px;margin-top:50px;background-color:#efefef;}
			.outter .inner{height:90px;width:900px;margin-left:20px;margin-top:5px;background-color:#efefef;}
			.outter .inner ul{list-style:none;}
			.outter .inner ul li{float:left;}
			.outter .inner ul li .choose{}
			.outter .inner ul li .picture{margin-left:0px;float:left;width:80px;height:80px;margin-top:8px;}
			.outter .inner ul li .titleinfo{float:left;margin-top:8px;width:154px;}
			.outter .inner ul li .blank{margin-left:0px;width:200px;height:90px;}
			.outter .inner ul li .singleprice{margin-left:-20px;margin-top:38px;}
			.outter .inner ul li .amount{margin-left:66px;margin-top:38px;}
			.outter .inner ul li .sum{margin-left:75px;margin-top:38px;}
			.outter .inner ul li .opera{margin-left:100px;margin-top:38px;}
			
			.sub{margin-top:-16px;}
			.inamount{width:20px;margin-top:-6px;}
			.add{margin-top:-16px;}
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

		<!-- 购物车 -->
		<div class="container" id="cart">
			<div style="width:940px;height:60px;">
				<div style="line-height:60px;margin-left:-789px;display:inline;float:left"><span style="color:red;font-size:20px;">全部商品</span></div>
				<div style="display:inline;float:left;width:200px;margin-left:600px;">已选商品（不含运费）<span style="color:red;" id="totalmoney">￥0.0</span></div>
				<div style="line-height:18px;float:right;width:60px;height:20px;"><button style="width:60px;height:20px;" class="btn btn-info" id="count">结算</button></div>
			</div>
			<hr/>
			<div class="head">
				<div class="chooseall"><input type="checkbox" id="chooseall" name="chooseall"/>全选</div>
				<div class="digitinfo">商品信息</div>
				<div class="price">单价(元)</div>
				<div class="amount">数量</div>
				<div class="sum">金额(元)</div>
				<div class="operation">操作</div>
			</div>
			<div id="cartinfo" class="cartinfo">
			</div>
		</div>
		
		<jsp:include page="footer.jsp"/>

		<!--jQuery(necessary for Bootstrap's javascript plugins)-->
		<script src="<%=path %>/resources/bootstrap/jquery-1.7.2.min.js"></script>
		<!--Include all complied plugins(below) ,or include individual files as needed-->
		<script src="<%=path %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<script>
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
			function exec(a){
				var data = {};
				data["digital_id"] = $(a).parent().parent().siblings().eq(0).children().children().eq(0).val();
				data["color"] = $(a).parent().parent().siblings().eq(0).children().children().eq(1).val();
			    data["version"] = $(a).parent().parent().siblings().eq(0).children().children().eq(2).val();
				var result = ajaxRequest("removecartbyone", "text", JSON.stringify(data));
				if(result=="SUCCESS"){
					alert("Delete Success!");
					window.location.href="tocart";
				}else{
					alert("Delete Fail!");
					return false;
				}
			}
			$(function(){
				
				//加载购物车
				function print(cart){
					$("#cartinfo").append(""+
							"<div class='outter' style='background-color:#f2f9ff'>"+
								"<div class='inner'>"+
									"<ul>"+
										"<li>"+
											"<div>"+
												"<input type='hidden' value='"+cart.digital_id+"'/>"+
												"<input type='hidden' value='"+cart.color+"'/>"+
												"<input type='hidden' value='"+cart.version+"'/>"+
												"<input type='checkbox' name='choose' class='choose' />"+
											"</div>"+
										"</li>"+
										"<li>"+
											"<div class='picture'><img src='<%=path%>/resources/images/"+cart.smalljpg+"' class='img'></img></div>"+
											"<div class='titleinfo'>"+cart.description+"</div>"+
										"</li>"+
										"<li>"+
											"<div class='blank'>"+
												"颜色：<span>"+cart.color+"</span>"+
												"<br/>"+
												"配置：<span>"+cart.version+"</span>"+
											"</div>"+
										"</li>"+
										"<li>"+
											"<div class='singleprice'><span>"+cart.price+"</span></div>"+
										"</li>"+
										"<li>"+
											"<div class='amount'>"+
												"<button class='sub'>-</button>"+
												"<input type='text' class='inamount' value='1'/>"+
												"<button class='add'>+</button>"+
											"</div>"+
										"</li>"+
										"<li>"+
											"<div class='sum'><span>"+cart.price+"</span></div>"+
										"</li>"+
										"<li>"+
											"<div class='opera'><a href='javascript:void(0);' onclick='exec(this)'>移除</a></div>"+
										"</li>"+
									"</ul>"+
								"</div>"+
							"</div>"
					);
				};
				function printnull(output){
					$("#cartinfo").append(""+
							"<div align='center' style='margin-top:120px;'>"+
							"<span style='color:#777;font-size:30px'>"+output+"</span></div>"
						);
				}
				var result = ajaxRequest("querycart", "json");
				if(result==""||result==null){
					var output = "Your Cart Is Empty!";
					printnull(output);
				}else{
					for(var i = 0;i<result.length;i++){
						print(result[i]);
					}
				}
				
				//根据checkbox 更新所要结算的金额总数
				var sum = 0;
				$("#chooseall").click(function(){
					if($("input[name='chooseall']").attr("checked")){
						sum = 0;
//						$("input[name='choose']").attr("checked","checked");
						$("input[name='choose']").each(function(){
							$(this).attr("checked","checked");
							var curr = $(this).parent().parent().siblings().eq(4).children().text();
							sum = parseFloat(sum) + parseFloat(curr);
						});
						$("#totalmoney").html("￥"+sum);
					}else{
						$("input[name='choose']").each(function(){
							$(this).removeAttr("checked");
						});
						$("#totalmoney").html("￥0.0");
						sum = 0;
					}
				});
				
				$(".choose").click(function(e){
					if($("#chooseall").attr("checked")){
						$("#chooseall").removeAttr("checked");
					}
					var curr = $(e.target).parent().parent().siblings().eq(4).children().text();
					if($(e.target).attr("checked")){
						var flag = true;
						$("input[name='choose']").each(function(){
							if(!$(this).attr("checked")){
								flag = false;
							}
						});
						if(flag){
							$("#chooseall").attr("checked","checked");
						}
						sum = parseFloat(sum)+parseFloat(curr);
						$("#totalmoney").html("￥"+sum);
					}else{
						sum = parseFloat(sum)-parseFloat(curr);
						$("#totalmoney").html("￥"+sum);
					}
				});
				//add,sub amount and calculate total sum
				$(".add").click(function(e){
					var price = $(e.target).parent().parent().siblings().eq(3).children().text();
					if($(e.target).parent().parent().siblings().eq(0).children().children().eq(3).attr("checked")){
				//		$(e.target).parent().parent().siblings().eq(0).children().children().removeAttr("checked");
						var totalmoney = $("#totalmoney").text();
						sum = parseFloat(totalmoney.substring(1,totalmoney.length))+parseFloat(price);
						$("#totalmoney").html("￥"+sum);
					}//else{						
					//	$("#totalmoney").html("￥0.0");
					//	sum = 0;
				//	}
				//	if($("#chooseall").attr("checked")){
				//		$("#chooseall").removeAttr("checked");
				//	}
					var amount = $(e.target).siblings().eq(1).val();
					if(parseInt(amount)<1){
						alert("The Amount can't < 1!");
						return false;
					}
					amount++;
					$(e.target).siblings().eq(1).val(amount);
					$(e.target).parent().parent().siblings().eq(4).children().html(parseFloat(amount)*parseFloat(price));
				});
				$(".sub").click(function(e){
					if($(e.target).siblings().eq(0).val()=="1"){
						alert("This can't be less than 1!");
						return false;
					}
					var price = $(e.target).parent().parent().siblings().eq(3).children().text();
					if($(e.target).parent().parent().siblings().eq(0).children().children().eq(3).attr("checked")){
				//		$(e.target).parent().parent().siblings().eq(0).children().children().removeAttr("checked");
						var totalmoney = $("#totalmoney").text();
						sum = parseFloat(totalmoney.substring(1,totalmoney.length))-parseFloat(price);
						$("#totalmoney").html("￥"+sum);
					}//else{
				//		$("#totalmoney").html("￥0.0");
				//		sum = 0;
				//	}
				//	if($("#chooseall").attr("checked")){
				//		$("#chooseall").removeAttr("checked");
				//	}
					var amount = $(e.target).siblings().eq(0).val();
					if(parseInt(amount)<=1){
						alert("The Amount can't < 1!");
						return false;
					}
					amount--;
					$(e.target).siblings().eq(0).val(amount);
					$(e.target).parent().parent().siblings().eq(4).children().html(""+parseFloat(amount)*parseFloat(price));
				});
				$(".inamount").click(function(){
					//屏蔽backspace键
					$(".inamount").keydown(function(e){
						var keycode = e.keyCode;
						if(e.keyCode==8){
							return false;
						}
					})
					$(".inamount").on('input',function(e){
						var amount = $(e.target).val(); 
						if(parseInt(amount)<=0){
							alert("This amount can't less than 1!");
							$(e.target).val("1");
						}
						var price = $(e.target).parent().parent().siblings().eq(3).children().text();
						var prechange = $(e.target).parent().parent().siblings().eq(4).children().text();
						$(e.target).parent().parent().siblings().eq(4).children().html(""+parseFloat(amount)*parseFloat(price));
						var suffchange = $(e.target).parent().parent().siblings().eq(4).children().text();
						//alert(parseFloat(suffchange)-parseFloat(prechange));
						if($(e.target).parent().parent().siblings().eq(0).children().children().eq(3).attr("checked")){
							var totalmoney = $("#totalmoney").text();
							sum = parseFloat(totalmoney.substring(1,totalmoney.length))+(parseFloat(suffchange)-parseFloat(prechange));
							$("#totalmoney").html("￥"+sum);
						}
					}); 
				});
				//结算，订单
				$("#count").click(function(){
					var array = new Array();
					var i = -1;
					$("input[name='choose']").each(function(){
						if($(this).attr("checked")){
							var data = {};
							i++;
							data["digital_id"] = $(this).siblings().eq(0).val();
							data["color"] = $(this).siblings().eq(1).val();
							data["version"] = $(this).siblings().eq(2).val();
							data["smalljpg"] = $(this).parent().parent().siblings().eq(0).children().eq(0).children()[0].src;
							data["description"] = $(this).parent().parent().siblings().eq(0).children().eq(1).text();
							data["price"] = $(this).parent().parent().siblings().eq(2).children().children().text();
							data["quantity"] = $(this).parent().parent().siblings().eq(3).children().children().eq(1).val();
							data["sum"] = $(this).parent().parent().siblings().eq(4).children().text();
							array[i] = data;
						}
					});
					if(array==null||array==""){
						alert("Please Choose one or more!");
						return false;
					}
					var result = ajaxRequest("toorder", "text", JSON.stringify(array));
					if(result=="SUCCESS"){
						//未比较库存
						window.location.href="geneorderpage";
					}
				});
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