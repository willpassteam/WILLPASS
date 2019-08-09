<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<c:if test="${user_email == null }">
	<script type="text/javascript">
		alert('로그인후 이용하시기 바랍니다.');
		location.href = '../user/Userlogin.jsp';
	</script>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 문의 사이트</title>

<!-- 아이콘 사용을 위한 CDN링크 -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>


<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
</head>
<style>
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
#loading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 95;  
 text-align: center; } 
  
#loading-image {  
 position: absolute; 
 width:400px; 
 top: 45%;  
 left: 40%; 
 z-index: 100; }




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
	//a 태그 번호 받아오기
	joinnum = $(".chatHead > .border").index(this);
	//join은 fnChatStart()실행하기 위한 조건
	join = true;
	
	ChatStart = 0;
	//모든내용 초기화
	$(".chatting").html("");
	//넣을 정보 초기화
	content = "";
});

$(function() {
	timerId = setInterval(
		function(){
			if(join == true){
				fnChatStart();
			}}, 500);
		

	
	
	$.ajax ({
		url : "getChatUser.chat",
		dataType:"json",
		success : function (data) {
			$('#loading').hide();
			joindata = data;
			Allend = data[0][0].allsize;
			for (var i = AllStart; AllStart < Allend ;i++) {
				var count = "";
				
				function A (){$.ajax ({
					url : "adminChatCount.chat",
					data: {chat_no : data[i][0].chat_no}
					,
					cache: false,
					success : function (da) {
						count = da;
					}
					,error:function(e){
						console.log('실패'+e.status+":"+e.responseText);
					}
				})};
				AllStart ++;
				var chat_lastcount = data[i][0].chat_count-1;
				var chat_lastcontent = data[i][chat_lastcount].chat_content;
				var chat_lastdate = data[i][chat_lastcount].chat_date;
				
				title += "<div class='border' ><div class='ChatLog' ><a class='btn btn-light btn-outline-secondary' style='width: 255px' ><small class='float-left'>마지막 전송 시간 :"+chat_lastdate+"</small><div class='clear-fix' /><small class='float-left'>내용 :"+chat_lastcontent+"</small></a></div></div>";
				if(i +1 == Allend ){
					chatHead(title);
				}
			}
		}
		,error:function(e){
			console.log('실패'+e.status+":"+e.responseText);
		}
	});

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
function fnchat() {
	//join은 fnChatStart()실행하기 위한 조건
	join = false;
	//넣을 정보 초기화
	   window.open("Chatting_popup.jsp", "회원가입","width=500 height=640 menubar=no status=no");

}


</script>
<body>


	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	
	<div id="loading"><img id="loading-image" src="../img/loading.gif" alt="Loading..." /></div>
	
	<div class="m-3 p-3">
		<div class="container" style="min-height: 600px; max-height: 700px;">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-3 border rounded p-2">
					<div class="border p-2" style="height: 60px">
						<h6 class="float-left align-center pt-2">나의 문의내역</h6>
						<a href="javascript:fnchat()" class="btn btn-primary float-right">문의하기</a>
					</div>
					<div class="chatHead" style="height: 600px;overflow-y:auto">
						
					</div>
				</div>
				<!-- <div class="col-sm-7 border rounded p-2"> -->
				<div class="col-sm-7 border pt-3 chatBody " style="overflow-y: auto;max-height: 678px;">
					<!-- 관리자 문자 -->
					<div class="chatting" style="min-height: 650px; overflow-y:auto;">
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
				</div>
				<!-- </div> -->
				<div class="col-sm-1"></div>

			</div>


		</div>
	</div>

	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>