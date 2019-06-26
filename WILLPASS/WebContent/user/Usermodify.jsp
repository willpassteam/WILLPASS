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
	<br>
	<br>
	<div class="container">
		<h2 align="center">회원정보 수정</h2>
		<br>
		<div class="row">
			
			<div class="col-sm-2"></div>
			<div class="col-sm-8 p-3">
				<form>
				<div class="row ">
					<div class="col-sm-6">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">아이디</span>
						    </div>
						    <input type="text" class="form-control" value="Userid" readonly="readonly">
						</div>
					</div>	
					<div class="col-sm-6">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">비밀번호</span>
						    </div>
						    <input type="password" class="form-control" value="Userpwd">
						    <div class="input-group-prepend">
						      <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#modifypwd">비밀번호 수정</button>
						    </div>
						</div>
					</div>
				</div>
					<div id="modifypwd" class="collapse row">
						<div class="col-sm-6">
							<div class="input-group mb-3">
							    <div class="input-group-prepend">
							      <span class="input-group-text">새로운 비밀번호</span>
							    </div>
							    <input type="password" class="form-control" name="Newpwd1">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="input-group mb-3">
							    <div class="input-group-prepend">
							      <span class="input-group-text">새로운 비밀번호 확인</span>
							    </div>
							    <input type="password" class="form-control" name="Newpwd2">
							</div>
						</div>							
				  	</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">휴대폰번호</span>
						    </div>
						    <input type="text" class="form-control" value="Usermobile">
						</div>
					</div>
					<div class="col-sm-6">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">생년월일</span>
						    </div>
						    <input type="text" class="form-control" value="Userage">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">이메일</span>
						    </div>
						    <input type="text" class="form-control" value="Useremail" readonly="readonly">
						</div>
					</div>	
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">주소</span>
						    </div>
						    <input type="text" class="form-control" value="Useraddress">
						</div>
					</div>	
				</div>
				
				<div class="row">
					<div class="col-sm-12" align="center">
						<input type="submit" value="정보 수정" class="btn btn-primary"> <input type="reset" value="다시 작성" class="btn btn-danger">
					</div>
				</div>
				
				</form>
			</div>
			
			<div class="col-sm-2"></div>
			
		</div>
	</div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>

</body>
</html>