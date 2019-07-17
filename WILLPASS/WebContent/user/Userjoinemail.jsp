<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WILLPASS-이메일인증</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


//계정인증 버튼 클릭했을때 timer 
function dailyMissionTimer(duration) {
    
    var timer = duration * 3600;
    var hours, minutes, seconds;
    
    var interval = setInterval(function(){
        hours	= parseInt(timer / 3600, 10);
        minutes = parseInt(timer / 60 % 60, 10);
        seconds = parseInt(timer % 60, 10);
		
        hours 	= hours < 10 ? "0" + hours : hours;
        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;
		
        $('#time-min').text(minutes+":"+seconds);
        if($('#time-min').text()=='00:00'){
        	
        	alert("인증시간을 초과하였습니다.다시 인증해주세요");
        	self.close();
        }

        if (--timer < 0) {
            timer = 0;
            clearInterval(interval);
            
        }
    }, 1000);
}

//계정인증 버튼을 클릭했을때 타이머함수 실행
function EmailTimer(){ 
	$("#fr").submit();
	dailyMissionTimer(0.003); 
}

//확인버튼 눌렀을때 부모창으로 email값전달
function setParentText(){
    opener.location="UserJoinstep2.jsp?email="+$("#user_email").val();
    window.close();
}


</script>
</head>
<body>


 <img src="../img/Logo.PNG" width="50%" height="40%">
 <hr>

 <div class="container">
 <div class="bg-light border text-dark ">
 <ul class="mt-3">
 <li> 입력하신 이메일정보가 일치하지 않을 경우 인증메일이 발송되지 않습니다.</li>
 <li>1분 이내에 이메일이 수신되지 않을 경우 정확한 정보로 재시도해 주시기 바랍니다.</li>
 <li>재시도를 하려면 <a href="#">여기</a>를 클릭해 주세요.</li>
 </ul>
 </div>
<form action="/WILLPASS/mailsend.se" method="post" name="fr" id="fr">
 <div class=" mt-4 bg-white border pb-3 pt-3">
	<div class="row col pr-0">
	
	<div class="col-3 text-center"><div class="pt-2"><b>이메일주소</b></div></div>
	<div class="col-9 input-group pr-0">
	<input type="text" class="form-control" placeholder="willpass@gamil.com" id="user_email" name="user_email">
	 <div class="input-group-prepend">
       <button type="button" class="btn btn-outline-primary"  onclick="EmailTimer();">계정인증</button>
      </div>
	</div>
	
	</div>

 </div>
 </form>
 <div class=" mt-4 bg-white border pt-3">
	<div class="row col pr-0">
	<div class="col-3 text-center"><div class="pt-2"><b>인증번호</b></div></div>
	<div class="col-7 input-group pr-0 pt-1">
	<input type="text" class="form-control pt-2" name="auth">
	</div>
	   <p class="text-danger text-center pt-2 pl-3 col-1" id="time-min">3:00</p>
	
	
	</div>
 <p class="text-dark text-center pt-2 pl-5">&nbsp;&nbsp;3분이내로 인증번호 6자리를 입력해주세요.</p>
 </div> 
  <div class="row mt-3">
   <div class="col-3"></div>
    <button class="btn btn-primary col-6" onclick="setParentText();">확인</button>
 <div class="col-1"></div>
  </div>
</div>


<hr class="mb-0 ">
<hr class="mb-0 mt-0">
<hr class="mb-0 mt-0">
<div class="bg-light pb-5 mb-0" >
</div>
</body>
</html>