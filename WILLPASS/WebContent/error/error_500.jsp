<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<img src="${pageContext.request.contextPath}/img/alert.png"><br>

	<h1>죄송합니다. 서비스 실행 중에 오류가 발생했습니다.</h1>
	<h1>잠시 후 다시 시도해 보세요.</h1>
	<a href="${pageContext.request.contextPath}/main/index.jsp">메인 페이지로 돌아가기</a> 
	</div>
</body>
</html>