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

	<div class="container" id="con1" >
		<div class="row">
			<div class="col-sm-6 ">
				<h2 align="center">아이디 찾기</h2>
				<br>
					<button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#findemail">이메일로 찾기</button>
					<button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#findmobile">휴대폰번호로 찾기</button>
				<br>
				<br>
				<div id="findemail" class="collapse">
			  		<div class="input-group mb-3">
					    <div class="input-group-prepend">
					      <span class="input-group-text">이메일</span>
					    </div>
					    <input type="text" class="form-control mr-3" value="Useremail">
					    <input type="button" class="btn btn-success" value="아이디 찾기">
					</div>
			  	</div>
				
			  	<div id="findmobile" class="collapse">
			    	<div class="input-group mb-3">
					    <div class="input-group-prepend">
					      <span class="input-group-text">휴대폰 번호</span>
					    </div>
					    <input type="text" class="form-control mr-3" value="Usermobile">
					    <input type="button" class="btn btn-success" value="아이디 찾기">
					</div>
			  	</div>
			  	
			  	
				
			</div>
			<div class="col-sm-6">
				<h2 align="center">비밀번호 찾기</h2>
				<br>
				<button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#findpwd">비밀번호 찾기</button>
				<br>
				<br>
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
		</div>
	</div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>

</body>
</html>