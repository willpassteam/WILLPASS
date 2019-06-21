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
	${param.start }<br>
	${param.end }<br>
	${param.date }<br>
	
	<%
	    String[] arr = {"일", "월", "화", "수", "목", "금", "토"}; 
	    Calendar cal = Calendar.getInstance(); 
	    try{ 
	      cal.setTime(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"))); 
	      }catch(Exception pe){ 
	      pe.printStackTrace(); 
	   } 
	%>
	<%=arr[cal.get(cal.DAY_OF_WEEK)-1]%>

<%
 search_api a=new search_api();
ArrayList List = a.getAir(request.getParameter("date"), request.getParameter("start"), request.getParameter("end"));
%>
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
		<%
			for(int i = 0; i< List.size(); i+=12){
		%>
		<tr>
		
			<td><%=List.get(i) %></td>
			<td><%=List.get(i+1) %></td>
			<td><%=List.get(i+2) %></td>
			<td><%=List.get(i+3) %></td>
			<td><%=List.get(i+4) %></td>
			<td><%=List.get(i+5) %></td>
			<td><%=List.get(i+6) %></td>
			<td><%=List.get(i+7) %></td>
			<td><%=List.get(i+8) %></td>
			<td><%=List.get(i+9) %></td>
			<td><%=List.get(i+10) %></td>
			<td><%=List.get(i+11) %></td>
			
		</tr>		
		<%		
			}
		%>
		
	</table>
	
</body>
</html>