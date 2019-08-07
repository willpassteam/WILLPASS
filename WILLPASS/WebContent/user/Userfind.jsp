<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

function idfind() {
	var user_mobile = $("#user_mobile").val();
	$.ajax({
		type : 'POST',
		url  : '${path}/mobilecheck', // 여기를 어떻게 바꾸나 ...
		//data: { id : id }, //{parameterName, data} 형식
		data: { user_mobile : user_mobile }, //{parameterName, data} 형식
		success: function(result){
			if(result== "0"){
				alert("없는 번호입니다.");
			}else{
				alert("해당 번호로 조회된 아이디 :" + result +" 입니다.");
			}
					
		},
	});}



function pwdfind() {
	var user_mobile = $("#user_mobile1").val();
	var user_email = $("#user_email").val();
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getMobile = RegExp(/^01([0|1|6|7|8|9]{1})[0-9]{7,8}$/);
	
	if(user_email == ""){
		alert("이메일을 입력해주세요.");
		return;
	}else{
		
		 if(!getMail.test($("#user_email").val())){
		        alert("이메일형식에 맞게 입력해주세요")
		        $("#user_email").val("");
		        $("#user_email").focus();
		        return;
		      }
	}
	
	
	if(user_mobile == ""){
		alert("휴대폰번호입력해주세요.");
		return;
	}else{
		  if (!getMobile.test($("#user_mobile1").val())) {
	          alert("형식에 맞게 입력해주세요");
	          $("#user_mobile1").val("");
	          $("#user_mobile1").focus();
	          return ;
	        }
	}
	
	
	$.ajax({
		type : 'POST',
		url  : '${path}/pwdcheck', // 여기를 어떻게 바꾸나 ...
		//data: { id : id }, //{parameterName, data} 형식
		//data: { user_mobile : user_mobile,user_email : user_email}, //{parameterName, data} 형식
		data: { user_mobile : user_mobile, user_email:user_email }, 
		success: function(result){
			if(result== "0"){
				alert("이메일과 비번이 일치하지않습니다.");
			}else{
				alert("조회된 비밀번호 :"+result + " 입니다.");
			}
					
		}
	});}
	
	


</script>
</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	<div class="container mb-4" id="con1" >
		<div class="row">
			<div class="col-sm-6 ">
				<br>
				<br>
				<div id="findmobile" class="border p-2">
					<br>
					<h3 align="center">아이디 찾기</h3>
					<br>
					<br>
					<h6><small>아이디가 기억나지 않아 답답하셨나요?</small></h6><br>
					<h6><small>등록한 휴대폰 번호를 입력하시면, 찾을 수 있는 방법을 알려드려요</small></h6>
					<hr class="bg-primary">
			  		<div class="input-group mb-3">
					    <div class="input-group-prepend">
					      <span class="input-group-text">휴대폰 번호</span>
					    </div>
					    <input type="text" class="form-control mr-3"  id="user_mobile"  placeholder="휴대폰 번호를 입력해주세요.">
					    <input type="button" class="btn btn-success" id="phone" onclick="idfind()" value="아이디찾기">
					</div>
					<ul>
						<li><h6><small>카카오계정를 통해 아이디 찾기를 원하시나요? <a href="#" class="underline"><mark>바로가기</mark></a></small></h6></li>
						<li><h6><small>고객센터를 통해 아이디 찾기를 원하시나요? <a href="#" class="underline"><mark>바로가기</mark></a></small></h6></li>
					</ul>
			  	</div>
			</div>
			<div class="col-sm-6">
				<br>
				<br>
				<div id="findmobile" class="border p-2">
					<br>
					<h3 align="center">비밀번호 찾기</h3>
					<br>
					<br>
					<h6><small>비밀번호가 기억나지 않아 답답하셨나요?</small></h6><br>
					<h6><small>등록한 아이디,휴대폰 번호를 입력하시면, 찾을 수 있는 방법을 알려드려요</small></h6>
					<hr class="bg-primary">
			  		<div class="input-group mb-3">
					    <div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">이메일</span>
						    </div>
						    <input type="text" class="form-control mr-3" id="user_email" placeholder="이메일 을  입력해주세요">
						</div>
				  		<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">휴대폰</span>
						    </div>
						    <input type="text" class="form-control mr-3"  id="user_mobile1"  placeholder="휴대폰 번호를 입력해주세요">
						    <input type="button" class="btn btn-success" onclick="pwdfind()"value="비밀번호 찾기" >
						</div>
					</div>
					<ul>
						<li><h6><small>카카오계정를 통해 비밀번호 찾기를 원하시나요? <a href="#" class="underline"><mark>바로가기</mark></a></small></h6></li>
						<li><h6><small>고객센터를 통해 비밀번호 찾기를 원하시나요? <a href="#" class="underline"><mark>바로가기</mark></a></small></h6></li>
					</ul>
			  	</div>
			</div>
		</div>
	</div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>

</body>
</html>