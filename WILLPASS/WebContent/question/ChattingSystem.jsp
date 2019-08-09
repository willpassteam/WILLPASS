<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

</style>
<script type="text/javascript">
var join = false;
var joinnum = 0;
var joindata;
var Chatend = 0;
var ChatStart = 0;
var content ="";
var Allend = 0;
var AllStart = 0;
var title = "";
var page = 0;


$(document).on("click",".chatHead > .border > a",function(){
	//아웃먼저
	if(join == true ){
		adminOut();
	}
	//a 태그 번호 받아오기
	joinnum = $(".chatHead > .border > a").index(this) +1 ;
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
		data: {chat_no : joindata[joinnum - 1].chat_no},
		cache: false,
		success : function (data) {
			console.log("상담사 나가버림");
		}
		,error:function(e){
			console.log('실패'+e.status+":"+e.responseText);
		}
	});
};

function adminJoin(){
	//join
	$.ajax ({
		url : "adminJoin.chat",
		data: {chat_no : joindata[joinnum-1].chat_no},
		cache: false,
		success : function (data) {
			console.log("상담사 들어옴");
		}
		,error:function(e){
			console.log('실패'+e.status+":"+e.responseText);
		}
	});
};

function ChatSend(){
	var content_get = $("[name=content]").val();
	$("[name=content]").val("");
	$.ajax ({
		url : "adminSendChat.chat",
		cache: false,
		data: {chat_no : joindata[joinnum-1].chat_no,
				chat_content : content_get,
				user_email : joindata[joinnum-1].user_email }
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
	var ajax1 = true;
	var ajax2 = true;
	// ajax 작업 완료후 다시 실행 
	$("input[name=content]").keydown(function (key) {
		 
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	 ChatSend();
        }
 
    });
	
	timer2 = setInterval(function (){
		if(joinnum > 0 && ajax2 == true){
			ajax2 = false;
		$.ajax ({
			url : "ajaxGetAdmin.chat",
			dataType:"json",
			cache: false,
			data : {chat_no :joindata[joinnum-1].chat_no},
			success : function (datt) {
				var Change = false;
				Chatend = datt[0].size;
				
				for(var j = ChatStart;ChatStart<Chatend&& join == true;j++){
					Change =true;
					ChatStart ++;
					if(datt[j].chat_who =="\"true\""){
						content += "<div class='w-100' > <div class='float-right' style='max-width: 450px'><small class='float-left mx-2' style='margin-top:auto'>"+datt[j].chat_date+"</small><small class='float-right border border-success p-1' style='max-width: 360px'>"+datt[j].chat_content+" </small></div></div><div class='clearfix'></div>"
					}else{
						content +="<div	 class='float-left w-75'><div class='header'><small>상담사</small></div><div class='body'><div class='row ml-1'><small class='border w-75 float-left p-1'>"+datt[j].chat_content+"</small><small class='float-right w-25' style='margin-top: auto'>"+datt[j].chat_date+"</small></div></div></div><div class='clearfix my-2 Jul'></div>"
					}
				}
				$(".chatting").html(content);
				if(Change == true){
					$(".chatting").scrollTop($(".chatting")[0].scrollHeight);
					Change = false;
				}
				
				
				ajax2 = true;
				
				
				
				
			}
				
			,error:function(e){
				console.log('실패'+e.status+":"+e.responseText);
			}
		});
	}},1000);
	
	
	timer = setInterval(function(){
			if(ajax1 == true){
				ajax1= false;
				$.ajax ({
					url : "getChatAdmin.chat",
					dataType:"json",
					cache: false,
					success : function (data) {
						joindata = data;
						Allend = data[0].allsize;
						for (var i = AllStart; AllStart < Allend ;i++) {
							AllStart ++;
							title += "<div class='border'><a href='#'><h6>아이디:"+data[i].user_email+"/ 보낸 날짜 : "+data[i].chat_date+"&nbsp;&nbsp;<span class='badge badge-danger'>"+data[i].count+"</span></h6><h6><small>"+data[i].chat_content+"</small></h6></a></div>";
							if(i +1 == Allend ){
								chatHead(title);
							}
						}
						ajax1= true;
						
					}
					,error:function(e){
						console.log('실패'+e.status+":"+e.responseText);
					}
				})}
			}	
			,1000);
	/* timerOUT = , 1000); */

	
	
	
	
	
})
function chatHead(title_1){
	$(".chatHead").html(title_1);
}
function getChatAdmin(){
	timerId = setTimeout(getChatAdmin(), 1000);
    PrintTime();



}


</script>
</head>

<body>
	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	<div class="container my-3" style="background-color:#f7f7f7 ">
		<h1 align="center" style="color:#dc3545;">채팅 관리 시스템 <span class="float-right pt-2"><a href="javascript:location.href='./ChattingSystem.jsp'" class="btn btn-danger">리로딩</a></span></h1>
		<div class="row" >
			<div class="col-xl-5 scroll chatHead " style="overflow-y: auto;max-height: 600px;">
				
				
				
				
			</div>
			<div class="col-xl-7 border pt-3 chatBody " style="max-height: 600px;">
				<!-- 관리자 문자 -->
				<div class="chatting" style="min-height: 530px;max-height:530px; overflow-y:auto;">
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