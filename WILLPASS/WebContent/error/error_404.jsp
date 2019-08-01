<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<%-- 404오류를 처리하는 jsp 페이지 --%>
	<div align="center">
	<img src="${pageContext.request.contextPath}/img/alert.png" width="200" style="padding-top: 100px"><br>

	<h1>요청한 페이지는 존재하지 않습니다.</h1>
	<a href="${pageContext.request.contextPath}/main/index.jsp">메인 페이지로 돌아가기</a> 
	</div>
	
	


</body>
</html>