<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅 관리 시스템</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<style type="text/css">
.chatHead > div,.chatBody{
	background-color: white;
	
}
div,small,p,pre {
	word-break:break-all;
}

</style>
<script type="text/javascript">
var join = false;
var joinnum = 0;
var Chatend = 0;
var ChatStart = 0;
var joindata;
var content ="";
var Allend = 0;
var AllStart = 0;
var title = "";


$(document).on("click",".chatHead > .border",function(){
	//아웃먼저
	adminOut();
	//a 태그 번호 받아오기
	joinnum = $(".chatHead > .border").index(this);
	//join은 fnChatStart()실행하기 위한 조건
	join = true;
	
	ChatStart = 0;
	//모든내용 초기화
	$(".chatting").html("");
	//넣을 정보 초기화
	content = "";
	adminJoin();
});
function adminOut(){
	$.ajax ({
		url : "adminOut.chat",
		data: {chat_no : joinnum},
		success : function (data) {
			console.log("상담사 나가버림");
		}
		,error:function(e){
			console.log('실패'+e.status+":"+e.responseText);
		}
	});
}
function adminJoin(){
	//join
	$.ajax ({
		url : "adminJoin.chat",
		data: {chat_no : joinnum},
		success : function (data) {
			console.log("상담사 들어옴");
		}
		,error:function(e){
			console.log('실패'+e.status+":"+e.responseText);
		}
	});
}
function ChatSend(){
	title = "";
	AllStart = 0;
	var content = $("[name=content]").val();
	$.ajax ({
		url : "adminSendChat.chat",
		data: {chat_no : joindata[joinnum][0].chat_no,
				chat_content : content,
				user_email : joindata[joinnum][0].user_email }
		,
		success : function (data) {
			console.log("메시지 작성완료");
		}
		,error:function(e){
			console.log('실패'+e.status+":"+e.responseText);
		}
	});
}

$(function() {
	var body = document.body
	var height = Math.max( body.scrollHeight, body.offsetHeight);
	if(height < 802){
		
	}
	
	
	
	
	
	
	
	timer = setInterval( function () {
		$.ajax ({
			url : "getChatAdmin.chat",
			dataType:"json",
			success : function (data) {
				joindata = data;
				Allend = data[0][0].allsize;
				title = "";
				for (var i = AllStart; AllStart < Allend ;i++) {
					var count = "";
					
					function A (){$.ajax ({
						url : "adminChatCount.chat",
						data: {chat_no : data[i][0].chat_no}
						,
						success : function (da) {
							count = da;
						}
						,error:function(e){
							console.log('실패'+e.status+":"+e.responseText);
						}
					})};
					AllStart ++;
					title += "<div class='border'><a href='#'><h6>아이디:"+data[i][0].user_email+"&nbsp;&nbsp;<span class='badge badge-danger'>"+count+"</span></h6><h6><small>"+data[i][data[i][0].chat_count-1].chat_content+"</small></h6></a></div>";
					if(i +1 == Allend ){
						chatHead(title);
					}
				}
				
				if(join == true){
					fnChatStart();
				}
			}
			,error:function(e){
				console.log('실패'+e.status+":"+e.responseText);
			}
		});
	},1000);
	
})
function chatHead(title_1){
	$(".chatHead").html(title_1);
}
function fnChatStart(){
	
	Chatend = joindata[joinnum][0].chat_count;
	
	for(var j = ChatStart;ChatStart<Chatend&& join == true;j++){
		console.log(joindata[joinnum][j].chat_content)
		ChatStart ++;
		if(joindata[joinnum][j].chat_who =="true"){
			content += "<div class='w-100' > <div class='float-right' style='max-width: 450px'><small class='float-left mx-2' style='margin-top:auto'>"+joindata[joinnum][j].chat_date+"</small><small class='float-right border border-success p-1' style='max-width: 360px'>"+joindata[joinnum][j].chat_content+" </small></div></div><div class='clearfix'></div>"
		}else{
			content +="<div class='float-left w-75'><div class='header'><small>상담사</small></div><div class='body'><div class='row ml-1'><small class='border w-75 float-left p-1'>"+joindata[joinnum][j].chat_content+"</small><small class='float-right w-25' style='margin-top: auto'>"+joindata[joinnum][j].chat_date+"</small></div></div></div><div class='clearfix my-2 Jul'></div>"
		}
	}
	$(".chatting").html(content);
	
}


</script>
</head>

<body>
	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	<div class="container my-3" style="background-color:#f7f7f7 ">
		<h1 align="center" style="color:#dc3545;">채팅 관리 시스템</h1>
		<div class="row" >
			<div class="col-xl-5 scroll chatHead " style="overflow-y: auto;max-height: 600px;">
				
				
				
				
			</div>
			<div class="col-xl-7 border pt-3 chatBody " style="overflow-y: auto;max-height: 600px;">
				<!-- 관리자 문자 -->
				<div class="chatting" style="min-height: 530px; overflow-y:auto;">
					<div class='float-left w-75'><div class='header'><small>상담사</small></div><div class='body'>	<div class='row ml-1'><small class='border w-75 float-left p-1'>예제</small><small class='float-right w-25' style='margin-top: auto'>날짜</small></div></div></div><div class='clearfix my-2 Jul'></div>
					
					<!-- 사용자 문자 -->
					<div class="w-100" > 
						<div class="float-right" style="max-width: 450px">
							<small class="float-left mx-2" style="margin-top:auto">날짜</small><small class="float-right border border-success p-1" style="max-width: 360px">예제</small>
						</div>
					</div>
					<div class="clearfix"></div>
					
					<!-- <div class ="row">
						<div class="col-sm-3"></div>
						<div class='col-sm-9 float-right' style="padding-right: 0px"><div class='row'><small class='' style='margin-top: auto'>"+date+"</small>&nbsp;<small class='border border-success w-75 p-1'>"+contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentv+"</small></div></div><div class='clearfix my-2'></div>
					</div> -->
					
				</div>
				<div class="chttingbutton mb-3">
					<input type="text" name="content" style="width: 550px; height: 40px"><input type="button" class="btn btn-danger mb-1" onclick="ChatSend();" value="전송">
				</div>
			</div>
		</div>
	</div>
	
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>

</body>
</html>