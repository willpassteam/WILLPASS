<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
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
					    <input type="text" class="form-control mr-3" placeholder="휴대폰 번호를 입력해주세요.">
					    <input type="button" class="btn btn-success" value="아이디 찾기">
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
						      <span class="input-group-text">아이디</span>
						    </div>
						    <input type="text" class="form-control mr-3" value="User_id">
						</div>
				  		<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">휴대폰</span>
						    </div>
						    <input type="text" class="form-control mr-3" value="User_email">
						    <input type="button" class="btn btn-success" value="비밀번호 찾기">
						</div>
					</div>
					<ul>
						<li><h6><small>카카오계정를 통해 비밀번호 찾기를 원하시나요? <a href="#" class="underline"><mark>바로가기</mark></a></small></h6></li>
						<li><h6><small>고객센터를 통해 비밀번호 찾기를 원하시나요? <a href="#" class="underline"><mark>바로가기</mark></a></small></h6></li>
					</ul>
					
			  	</div>
				
			</div>
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				
			  	<div id="findpwd" class="collapse">
					<div class="input-group mb-3">
					    <div class="input-group-prepend">
					      <span class="input-group-text">아이디</span>
					    </div>
					    <input type="text" class="form-control mr-3" value="Userid">
					</div>
			  		<div class="input-group mb-3">
					    <div class="input-group-prepend">
					      <span class="input-group-text">이메일</span>
					    </div>
					    <input type="text" class="form-control mr-3" value="Useremail">
					    <input type="button" class="btn btn-success" value="비밀번호 찾기">
					</div>
			  	</div>
			</div>
			<div class="col-sm-3"></div>
			
		</div>
	</div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>

</body>
</html>