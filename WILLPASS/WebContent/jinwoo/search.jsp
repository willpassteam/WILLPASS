<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
국제<br>
인천(ICN), 김포(GMP), 제주(CJU), 김해(PUS), 청주(CJJ), 대구(TAE), 양양(YNY), 무안(MWX)
<br>
국내<br>
군산(KUV), 여수(RSU), 포항(KPO), 울산(USN), 원주(WJU) ,사천(HIN), 광주(KWJ)<br>

	<form action="searchpro.jsp">
	출발지 : <input type="text" name="start"><br>
	목적지 : <input type="text" name="end"><br>
	날짜 : <input type="date" name="date"><br>
	<input type="submit" value="검색"> 
	</form>

</body>
</html>