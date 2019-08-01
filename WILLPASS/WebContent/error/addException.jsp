<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"%> <%-- 다른 JSP 페이지에서 예외 발생시 예외를 처리하는 예외처리 페이지로 지정한다. --%>
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에러 페이지</title>
</head>
<body>
	<%-- exception 내장객체를 이용해서 발생한 예외를 처리 하도록 합니다. --%>
	==============toString()내용===============<br>
	
	<%--exception 내장객체를 사용해 예외 처리를 합니다.--%>
	<h1><%=exception.toString()%></h1>
	
	==============getMessage()내용===============<br>
	
	<h1><%=exception.getMessage()%></h1>
	
	
 	==============Console 창에 예외 메세지를 출력===============<br>
	<h1><%=exception.printStackTrace()%></h1>
	
	<a href="../main/index.jsp">메인 페이지로 돌아가기</a> 

</body>
</html>