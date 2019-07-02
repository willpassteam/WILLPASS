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
	
	<div class="bg-light mt-0 pt-5 pb-5">   
	<div class="container border bg-white pb-5 ">
	<h2 class="text-center mt-5 mb-4">회원가입을 환영합니다.</h2>
	<h6 class="text-center text-muted">여행의 지혜, WILLPASS 회원가입을 시작하세요!</h6>

<!-- 	<img src="../img/user/join1.png" class="col-12"> -->
	
	<div class="container mt-4">
		<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
		<a href="UserJoinstep1.jsp"><img id="click"alt="" src="../img/회원가입창.PNG" width="100%" onclick="fn_img();"></a>
		</div>
				<div class="col-2"></div>
		</div>
	</div>
	</div>
	</div>	

	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>

</body>
</html>