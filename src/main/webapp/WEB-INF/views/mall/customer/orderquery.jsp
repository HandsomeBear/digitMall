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

			.head{width:940px;height:30px;background-color:#f5f5f5;}
			.head .baby{float:left;margin-left:146px;}
			.head .price{float:left;margin-left:170px;}
			.head .amount{float:left;margin-left:36px;}
			.head .sum{float:left;margin-left:60px;}
			.head .status{float:left;margin-left:56px;}
			.head .operation{float:left;margin-left:42px;}
			
			.topdiv{width:940px;height:36px;background-color:#f5f5f5;}
			.topdiv span{color:black;line-height:36px;}
			.bottom{width:900px;height:116px;}
			.bottom ul{list-style:none;}
			.bottom ul li{float:left;}
			.bottom ul li .picture{margin-left:4px;float:left;width:80px;height:80px;margin-top:8px;border:1px solid #d5d5d5;}
			.bottom ul li .titleInfo{float:left;margin-top:8px;width:180px;}
			.bottom ul li .titleInfo span{font-size:12px;}
			.bottom ul li .titleInfo .color{color:#d5d5d5;display:block;margin-top:0px;}
			.bottom ul li .buyprice{margin-left:70px;margin-top:44px;}
			.bottom ul li .buyquantity{margin-left:70px;margin-top:44px;}
			.bottom ul li .borderleft{with:2px;border-left:1px solid #d5d5d5;height:116px;float:left}
			.bottom ul li .aaa{margin-left:42px;}
			.bottom ul li .buyamount{float:left;margin-top:44px;margin-left:20px}
			.bottom ul li .bbb{margin-left:22px;}
			.bottom ul li .buystatus{float:left;margin-top:44px;margin-left:48px}
			.bottom ul li .ccc{margin-left:52px;}
			.bottom ul li .buyoperation{float:left;margin-top:44px;margin-left:20px}
			
			.comment{cursor:pointer;color:red;}
		</style>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<!--logo，搜索框-->
		<div class="container con">	
			<div class="logo"></div>
			<div class="search">				
				<span class="title">订单查询</span>
			</div>		
		</div>

		<div class="container">
			<form class="form-search">
				<input type="text" class="search-input" placeholder="搜索订单" id="orderno">
				<button type="submit" class="btn btn-primary search-btn" id="search">Search</button>
			</form>
		</div>

		<div class="container" style="min-height:300px;">
			<hr/>
				<div class="content">
					<ul class="nav nav-tabs" id="mytab">
						<li class="active"><a href="#all" id="allOrder">所有订单</a></li>
						<li><a href="#prepay" id="prepayOrder">未付款订单</a></li>
						<li><a href="#presend" id="presendOrder">未发货订单</a></li>
						<li><a href="#prereceive" id="prereceiveOrder">未收货订单</a></li>
						<li><a href="#precomment" id="precommentOrder">未评价订单</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="all">
							<div class="head">
								<div class="baby">宝贝</div>
								<div class="price">单价（元）</div>
								<div class="amount">数量</div>
								<div class="sum">实付款</div>
								<div class="status">交易状态</div>
								<div class="operation">交易操作</div>
							</div>
							<div id="allcontent" style="background-color:#f2f9ff">
							</div>
						</div>
						
						<div class="tab-pane" id="prepay">
							<div class="head">
								<div class="baby">宝贝</div>
								<div class="price">单价（元）</div>
								<div class="amount">数量</div>
								<div class="sum">实付款</div>
								<div class="status">交易状态</div>
								<div class="operation">交易操作</div>
							</div>
							<div id="prepaycontent" style="background-color:#f2f9ff">
							</div>
						</div>
						
						<div class="tab-pane" id="presend">
							<div class="head">
								<div class="baby">宝贝</div>
								<div class="price">单价（元）</div>
								<div class="amount">数量</div>
								<div class="sum">实付款</div>
								<div class="status">交易状态</div>
								<div class="operation">交易操作</div>
							</div>
							<div id="presendcontent" style="background-color:#f2f9ff">
							</div>
						</div>
						
						<div class="tab-pane" id="prereceive">
							<div class="head">
								<div class="baby">宝贝</div>
								<div class="price">单价（元）</div>
								<div class="amount">数量</div>
								<div class="sum">实付款</div>
								<div class="status">交易状态</div>
								<div class="operation">交易操作</div>
							</div>
							<div id="prereceivecontent" style="background-color:#f2f9ff">
							</div>
						</div>
						
						<div class="tab-pane" id="precomment">
							<div class="head">
								<div class="baby">宝贝</div>
								<div class="price">单价（元）</div>
								<div class="amount">数量</div>
								<div class="sum">实付款</div>
								<div class="status">交易状态</div>
								<div class="operation">交易操作</div>
							</div>
							<div id="precommentcontent" style="background-color:#f2f9ff">
							</div>
						</div>
					</div>
				</div>
			<hr/>
		</div>
		
		<div class="container">
			<div class="pagination pagination-right">
				<ul>
					<li><a href="#" id="first">First</a></li>
					<li><a href="#" id="prev"><<</a></li>
					<li><a href="#" id="next">>></a></li>
					<li><a href="#" id="last">Last</a></li>
					<li><input type="text" id="totalPage" style="width:30px;" readOnly/></li>
					<li><input type="text" id="currentPage" style="width:30px;"/></li>
					<li><button style="width:100px;margin-top:-12px;" class="btn btn-info" id="goto">Goto</button></li>
				</ul>
			</div>
		</div>
		
		<jsp:include page="footer.jsp"/>

		<!--jQuery(necessary for Bootstrap's javascript plugins)-->
		<script src="<%=path %>/resources/bootstrap/jquery-1.7.2.min.js"></script>
		<!--Include all complied plugins(below) ,or include individual files as needed-->
		<script src="<%=path %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<script>
			var pageUtil;
			var flag = "L";
			var currentPage = 1;
			var currentUser;
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
				data["digital_id"]=$(a).parent().siblings().eq(0).val();
				data["description"]=$(a).parent().siblings().eq(1).val();
				data["color"]=$(a).parent().siblings().eq(2).val();
				data["version"]=$(a).parent().siblings().eq(3).val();
				data["quantity"]=$(a).parent().siblings().eq(4).val();
				data["sum"]=$(a).parent().siblings().eq(5).val();
				data["order_no"]=$(a).parent().siblings().eq(6).val();
				data["smalljpg"]=$(a).parent().parent().parent().parent().siblings().eq(0).children().eq(0).children()[0].src;
				if(a.innerHTML=="去付款"){
					var result = ajaxRequest("pay", "text", JSON.stringify(data));
					if(result=="SUCCESS"){
						window.location.href="topay";
					}
				}else if(a.innerHTML=="去评价"){
					var result = ajaxRequest("judge", "text", JSON.stringify(data));
					if(result=="SUCCESS"){
						window.location.href="tojudgeforcomment";
					}
				}else if(a.innerHTML=="确认收货"){
					var data1 = {"orderno":data["order_no"],"digital_id":data["digital_id"]};
					var result = ajaxRequest("receive","text",JSON.stringify(data1));
					if(result=="SUCCESS"){
						var result = ajaxRequest("judge", "text", JSON.stringify(data));
						if(result=="SUCCESS"){
							window.location.href="tojudge";
						}
					}else{
						alert("Receive Fail!");
						return false;
					}
				}else if(a.innerHTML=="申请退款"){
					var data2 = {"orderno":data["order_no"]};
					var result = ajaxRequest("refund", "text", JSON.stringify(data2));
					if(result=="SUCCESS"){
						alert("Refund Pending!");
						window.location.reload();
					}else{
						alert("Refund Failed!");
						return false;
					}
				}
			};
			$(function(){
				//添加order
				function appendOrder(result){
					var list;
					if(flag=="L"){
						list = $("#allcontent");
						currentUser=$("#allcontent");
					}else if(flag=="N"){
						list = $("#prepaycontent");
						currentUser=$("#prepaycontent")
					}else if(flag=="P"){
						list = $("#presendcontent");
						currentUser=$("#presendcontent");
					}else if(flag=="A"){
						list = $("#prereceivecontent");
						currentUser=$("#prereceivecontent");
					}else{
						list = $("#precommentcontent");
						currentUser=$("#precommentcontent");
					}
					list.append(""+
							"<br/>"+
							"<div class='topdiv'>"+
								"<span>"+result.shoppingDate+"&nbsp;&nbsp;&nbsp;&nbsp;订单号："+result.order_no+"</span>"+
							"</div>"+
							"<div class='bottom'>"+
								"<ul>"+
									"<li>"+
										"<div class='picture'><img src='<%=path%>/resources/images/"+result.image_small+"' class='img'></img>"+
										"</div>"+
										"<div class='titleInfo'><span>"+result.description+"</span></br>"+
											"<span class='color'>"+result.color+" "+result.version+"</span>"+
										"</div>"+
									"</li>"+
									"<li>"+
										"<div class='buyprice'>"+result.price+
										"</div>"+
									"</li>"+
									"<li>"+
										"<div class='buyquantity'>"+result.quantity+
										"</div>"+
									"</li>"+
									"<li>"+
										"<div class='aaa'>"+
											"<div class='borderleft'></div>"+
											"<div class='buyamount'>"+result.amount+
											"</div>"+
										"</div>"+
									"</li>"+
									"<li>"+
										"<div class='bbb'>"+
											"<div class='borderleft'></div>"+
											"<div class='buystatus'>"+result.status+
											"</div>"+
										"</div>"+
									"</li>"+
									"<li>"+
										"<div class='ccc'>"+
											"<div class='borderleft'></div>"+
											"<div class='buyoperation'>"+
												"<input type='hidden' value='"+result.digital_id+"'/>"+
												"<input type='hidden' value='"+result.description+"'/>"+
												"<input type='hidden' value='"+result.color+"'/>"+
												"<input type='hidden' value='"+result.version+"'/>"+
												"<input type='hidden' value='"+result.quantity+"'/>"+
												"<input type='hidden' value='"+result.amount+"'/>"+
												"<input type='hidden' value='"+result.order_no+"'/>"+
												"<span><a href='javascript:void(0);' onclick='exec(this)'>"+result.operation+"</a></span>"+
											"</div>"+
										"</div>"+	
									"</li>"+
								"</ul>"+
							"</div><hr/>");
				};
				function printnull(output){
					currentUsr.append(""+
							"<div align='center' style='margin-top:120px;'>"+
							"<span style='color:#777;font-size:30px'>"+output+"</span></div>"
						);
				}
				function printByCurrentPage(currentPage){
					var data = {};
					data["flag"] = flag;
					data["currentPage"] = currentPage;
					var result = ajaxRequest("orderquery", "json", JSON.stringify(data));
					if(result!=null&&result!=""){
						for(var i = 0;i<result.length;i++){
							if(i==0){
								$("#totalPage").val(result[0].pageUtil.totalPage);	
								$("#currentPage").val(result[0].pageUtil.currentPage);
								pageUtil = result[0].pageUtil;
							}
							result[i].price = parseFloat(result[i].amount)/parseFloat(result[i].quantity);
							if(result[i].status=="N"){
								result[i].status = "待付款";
								result[i].operation = "去付款";
							}else if(result[i].status=="P"){
								result[i].status = "待发货";
								result[i].operation = "申请退款";
							}else if(result[i].status=="A"){
								result[i].status = "待收货";
								result[i].operation = "确认收货";
							}else if(result[i].status=="S"){
								result[i].status = "已收货";
								if(result[i].comment_flag=="T"){									
									result[i].operation = "已评价";
								}else{
									result[i].operation = "去评价";
								}
							}else if(result[i].status=="R"){
								result[i].status = "退款中";
								result[i].operation = "处理中";
							}else if(result[i].status=="D"){
								result[i].status = "已退款";
								result[i].operation = "交易关闭";
							}
							
							appendOrder(result[i]);
						}
					}else{
						var output = "Your Order Is Empty!";
						printnull(output);
					}
				}
				//页面初始化
				printByCurrentPage(currentPage);
				//标签页之间的切换
				$("#mytab a").click(function(e){
					e.preventDefault();
					$(this).tab("show");
				});
				
				$("#allOrder").click(function(){
					$("#orderno").val("");
					$("#allcontent").empty();
					flag = "L";
					currentPage = 1;
					printByCurrentPage(currentPage);
				});
				$("#prepayOrder").click(function(){
					$("#orderno").val("");
					$("#prepaycontent").empty();
					flag = "N";
					currentPage = 1;
					printByCurrentPage(currentPage);
				});
				$("#presendOrder").click(function(){
					$("#orderno").val("");
					$("#presendcontent").empty();
					flag = "P";
					currentPage = 1;
					printByCurrentPage(currentPage);
				});
				$("#prereceiveOrder").click(function(){
					$("#orderno").val("");
					$("#prereceivecontent").empty();
					flag = "A";
					currentPage = 1;
					printByCurrentPage(currentPage);
				});
				$("#precommentOrder").click(function(){
					$("#orderno").val("");
					$("#precommentcontent").empty();
					flag = "S";
					currentPage = 1;
					printByCurrentPage(currentPage);
				});
					
				//首页
				$("#first").click(function(e){
					e.preventDefault();
					if(pageUtil.totalPage==0){
						alert("无数据！！！");
						return false;
					}
					if(pageUtil.currentPage==1){
						alert("当前已是首页！！！");
						return false;
					}
					currentUser.empty();
					currentPage = 1;
					printByCurrentPage(currentPage);
				});
				//上一页
				$("#prev").click(function(e){
					e.preventDefault();
					if(pageUtil.totalPage==0){
						alert("无数据！！！");
						return false;
					}
					if(pageUtil.currentPage==1){
						alert("当前已是首页！！！");
						return false;
					}
					currentUser.empty();
					currentPage = pageUtil.currentPage-1;
					printByCurrentPage(currentPage);
					
				});
				//下一页
				$("#next").click(function(e){
					e.preventDefault();
					if(pageUtil.totalPage==0){
						alert("无数据！！！");
						return false;
					}
					if(pageUtil.currentPage==pageUtil.totalPage){
						alert("当前已是尾页！！！");
						return false;
					}
					currentUser.empty();
					currentPage = pageUtil.currentPage+1;
					printByCurrentPage(currentPage);
				});
				//尾页
				$("#last").click(function(e){
					e.preventDefault();
					if(pageUtil.totalPage==0){
						alert("无数据！！！");
						return false;
					}
					if(pageUtil.currentPage==pageUtil.totalPage){
						alert("当前已是尾页！！！");
						return false;
					}
					currentUser.empty();
					currentPage = pageUtil.totalPage;
					printByCurrentPage(currentPage);
				});
				//跳转
				$("#goto").click(function(){
					var page = $("#currentPage").val().trim();
					var totalPage = $("#totalPage").val().trim();
					if(parseInt(page)<1||parseInt(page)>totalPage){
						alert("InValid Input!");
						$("#currentPage").val(pageUtil.currentPage);
						return false;
					}
					currentUser.empty();
					currentPage = page;
					printByCurrentPage(currentPage);
				});
				//付款
				$(".comment").click(function(e){
					e.preventDefault();
					alert($(e.target).html());
					var data = {};
					data["digital_id"]=$(e.target).parent().siblings().eq(0).val();
					data["description"]=$(e.target).parent().siblings().eq(1).val();
					data["color"]=$(e.target).parent().siblings().eq(2).val();
					data["version"]=$(e.target).parent().siblings().eq(3).val();
					data["quantity"]=$(e.target).parent().siblings().eq(4).val();
					data["sum"]=$(e.target).parent().siblings().eq(5).val();
					data["order_no"]=$(e.target).parent().siblings().eq(6).val();
					
					if($(e.target).html()=="去付款"){
						var result = ajaxRequest("pay", "text", JSON.stringify(data));
						if(result=="SUCCESS"){
							window.location.href="topay";
						}
					}else if($(e.target).html()=="去评价"){
						var result = ajaxRequest("judge", "text", JSON.stringify(data));
						if(result=="SUCCESS"){
							window.location.href="tojudge";
						}
					}
				});
				//搜索订单
				$("#search").click(function(){
					var orderno = $("#orderno").val();
					if(orderno==""||orderno==null||orderno==undefined){
						alert("Please Input A OrderNo!");
						return false;
					}
					var data = {"orderno":orderno};
					var result = ajaxRequest("querybyorderno", "json", JSON.stringify(data));
					if(result!=""){
						result.price = parseFloat(result.amount)/parseFloat(result.quantity);
						if(result.status=="N"){
							result.status = "待付款";
							result.operation = "去付款";
						}else if(result.status=="P"){
							result.status = "待发货";
							result.operation = "申请退款";
						}else if(result.status=="A"){
							result.status = "待收货";
							result.operation = "物流中";
						}else if(result.status=="S"){
							result.status = "已收货";
							if(result.comment_flag=="T"){									
								result.operation = "已评价";
							}else{
								result.operation = "去评价";
							}
						}else if(result.status=="R"){
							result.status = "退款中";
							result.operation = "处理中";
						}else if(result.status=="D"){
							result.status = "已退款";
							result.operation = "交易关闭";
						}
						currentUser.empty();
						appendOrder(result);
						return false;
					}else{
						alert("No Information Founded About This OrderNo!");
						return false;
					}
				});
			});
		</script>
	</body>
</html>