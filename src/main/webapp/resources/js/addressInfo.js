/**
 * 
 */
$(function(){
	var url = "<%=path%>/resources/uploadFiles/uploadImages/personImage-<%=loginUserName %>.png?"+Math.random();
	$("#img").attr("src",url);
});
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
					}else{
						alert("添加失败！");
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
					}else{
						alert("删除失败!");
						window.location.href="address/addressInfo?username=${loginUserName}";
					} 
				}
			});
		}
	});