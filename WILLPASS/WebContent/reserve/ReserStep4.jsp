<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 아이콘을 위한 css -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>

<div class="container mb-5"> 

	<h2 ><b>국제선 예약</b></h2>
  <table class="table border mt-5">
	
    <tbody>
      <tr>
        <td >부산->오사카(간사이)</td>
        <td>2019-06-28(금) 11:05->12:35</td>
        <td>편명 : BX 126</td>
        <td rowspan="2" class="border">성인 1명</td>
        
      </tr>
      <tr>
        <td>오사카(간사이)->부산</td>
        <td>2019-07-09 (화) 13:30 ->15:00</td>
        <td>편명 : BX 125</td>
  	  </tr>

    </tbody>
 	</table>


	</div>

	<img src="../img/Reser/step4.png" width="100%">
	
	 <div class="container">
	
	</div>
</body>
</html>