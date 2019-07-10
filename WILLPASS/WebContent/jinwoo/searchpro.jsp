<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	출발 날짜 : ${param.from }<br><br>
	
	<c:forEach items="${list1 }" var="list">
		출발지 : ${list.starting }<br>
		도착지 : ${list.destination }<br>
		항공사 : ${list.airline }<br>
		항공편 : ${list.flight }<br>
		출발시간 : ${list.departure_time }<br>
		소요시간 : ${list.time }<br>
		도착시간 : ${list.arrival_time }<br>
		왕복 여부 : ${list.round_trip }<br><br>
		
	</c:forEach>
	<hr>
	<c:forEach items="${list2 }" var="list">
		출발지 : ${list.starting }<br>
		도착지 : ${list.destination }<br>
		항공사 : ${list.airline }<br>
		항공편 : ${list.flight }<br>
		출발시간 : ${list.departure_time }<br>
		소요시간 : ${list.time }<br>
		도착시간 : ${list.arrival_time }<br>
		왕복 여부 : ${list.round_trip }<br><br>
		
	</c:forEach>
	

	
</body>
</html>