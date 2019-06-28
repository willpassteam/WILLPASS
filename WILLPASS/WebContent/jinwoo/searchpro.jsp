<%@page import="jinwoo.c.search_api"%>
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
	${param.startLine }<br>
	${param.endLine }<br>
	${param.date }<br>
	
	<%
		String startLine=request.getParameter("startLine");
		String endLine=request.getParameter("endLine");
		String date=request.getParameter("from");
		String international= request.getParameter("international");
	    String[] arr = {"일", "월", "화", "수", "목", "금", "토"}; 
	    Calendar cal = Calendar.getInstance(); 
	    try{ 
	      cal.setTime(new SimpleDateFormat("yyyyMMdd").parse(date)); 
	      }catch(Exception pe){ 
	      pe.printStackTrace(); 
	   } 
	%>
	<%=arr[cal.get(cal.DAY_OF_WEEK)-1]%>
	

<%
search_api api=new search_api();
ArrayList list= api.getAir(date, startLine, endLine);
%>
<c:set value="<%=list %>" var="alist"></c:set>
<table>
		<tr align="center">
			<td>출발지</td>	
			<td>도착지</td>
			<td>시간</td>
			<td>항공사</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
			<td>일</td>
			<td>항공기</td>
		</tr>
		<c:forEach items="${alist }" var="list" >
			<tr align="center">
				<td>${list.airport}</td>
	    		<td>${list.city}</td>
	    		<td>${list.internationalTime}</td>
	    		<td>${list.airlineKorean}</td>
	    		<td>${list.internationalMon}</td>
	    		<td>${list.internationalTue}</td>
	    		<td>${list.internationalWed}</td>
	    		<td>${list.internationalThu}</td>
	    		<td>${list.internationalFri}</td>
	    		<td>${list.internationalSat}</td>
	    		<td>${list.internationalSun}</td>
	    		<td>${list.internationalNum}</td>
			</tr>
		</c:forEach>
		
		
	</table>
	
</body>
</html>