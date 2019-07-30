<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WIllPASS회원가입_3단계</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
</head>
<body>
	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	
	<div class="bg-light mt-0 pt-5 pb-5">   
	<div class="container border bg-white pb-5 mb-5">
<!-- 	<img src="../img/user/join1.png" class="col-12"> -->
	
	<div class="container border mt-5 pt-4 ">
	<h2 class="text-center text-dark ">WILLPASS 회원가입을 축하합니다!</h2> 
	<h6  class="text-center text-muted">WILLPASS에서 제공하는 다양한 서비스를 이용할 수 있습니다.</h6>
	<h6  class="text-center text-muted mb-4"> 감사합니다. </h6>
	<div class="row">
	<div class="col-3">
	</div>
	<div class="col-6">
	<hr class="mb-0 mt-0 pb-0 pt-0 bg-dark">
	<hr class="mb-0 mt-0 pb-0 pt-0 bg-dark">

	<table class="table mb-0">
	<tr class="border border-right-0 border-left-0">
	<td width="30%" class="bg-light">이름</td>
	<td>${user_name}</td>
<%-- 	<%=id %> --%>
	</tr>
	<tr class="border border-right-0 border-left-0">
	<td width="30%" class="bg-light">아이디</td>
	<td>${user_id}</td>
	</tr>
	</table>
	
	
	<hr class="mb-0 mt-0 pb-0 pt-0 bg-dark">
	</div>
	<div class="col-3"></div>
	</div>
	
  <div class="d-flex justify-content-xl-center mb-3 mt-4">
    <button class="p-2  mr-3 btn btn-primary col-1" onclick="location.href='${contextPath}/user/Userlogin.jsp'">로그인</button>
    <button class="p-2  mr-3 btn btn-outline-primary col-1" onclick="location.href='${contextPath}/main/index.jsp'">메인</button>

  </div>
	
	</div>
	
	</div>

	
</div>
	
<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>