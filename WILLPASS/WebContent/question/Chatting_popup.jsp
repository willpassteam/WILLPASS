<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="net.question.chat.db.chatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String user_email = (String)session.getAttribute("user_email");
	chatDAO dao = new chatDAO();
	dao.joinUser(user_email);
	int chat_no = dao.createRoom(user_email);
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<title>WILLPASS 상담톡</title>
<style>
div {
	word-breack: break-all;
}
/* width */
::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #888; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555; 
}
.cell{
	margin-bottom: 3px;
}

</style>
<script type="text/javascript">
$(function() {
	
	$("input[name=content]").keydown(function (key) {
		 
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	fnSubmit();
 
    }});
	
	
	var start = 0;
	var end = 0;
	var ajaxCheck = true;
	timer = setInterval( function () {
		if(ajaxCheck == true){
			
		ajaxCheck= false;
		$.ajax ({
			url : "getChatContent.chat",
			dataType:"json",
			data : {chat_no :'<%=chat_no%>'},
			success : function (data) {
				end = data[0].size;
					for ( var i = start; i < end; i++) {
						start++; 					
						fnJson(data[i].chat_who,data[i].chat_date,data[i].chat_content);
					}
					ajaxCheck = true;
				
				
				
			}
				
			,error:function(e){
				console.log('실패'+e.status+":"+e.responseText);
			}
		});
	}},1000);

	
	window.onunload = function () {
	   fnclose();
	}
});
function fnJson(who,date,content){
	console.log(who+","+date+","+content);
	if(who == "\"false\""){
		$(".cell:last").append("<div class='float-left w-75'><div class='header'><small>상담사</small></div><div class='body'>	<div class='row ml-1'><small class='border w-75 float-left p-1'>"+content+"</small><small class='float-right w-25' style='margin-top: auto'>"+date+"</small></div></div></div><div class='clearfix cell my-2 Jul'></div>");	
	}else{
		$(".cell:last").append("<div class='float-right w-75'><div class='row' style='width: 360px'><small class='' style='margin-top: auto'>"+date+"</small>&nbsp;<small class='border border-success w-75 p-1'>"+content+"</small></div></div><div class='clearfix cell my-2'></div>")
		
	}
}
function fnSubmit(){
	var content = $("[name=content]").val();
	$("[name=content]").val("");
	$.ajax ({
		type:"post",
		url : "writeChat.chat",
		data : {chat_no :'<%=chat_no%>',content : content},
		success : function (result){ 
		}
	});
};
function fnclose(){
	opener.location="ChatStart.chat";
	location.href="close.chat?chat_no=<%=chat_no%>";
    self.close();   //자기자신창을 닫습니다.
};



</script>
</head>
<body>
	<div class="container-flude border p-3 chatBody " style="max-height: 680px;">
		<h2>
			WILL PASS 상담톡<a href="javascript:fnclose()" class="btn btn-primary float-right">대화종료</a>
		</h2>
		<hr>
		<div class="clearfix"></div>
		
		<div class="chatting w-100" style="min-height: 475px;max-height:500px; overflow-y: auto;max-width: 500px">
			<div class="clearfix my-2 cell"></div>
		</div>
		
		<div class="chttingbutton mb-3">
			<input type="text" name="content" class=" mx-2" style="width: 360px; height: 40px"><input type="button" class="btn btn-danger mb-1" value="전송" onclick="fnSubmit()">
		</div>
			
	</div>

</body>
</html>