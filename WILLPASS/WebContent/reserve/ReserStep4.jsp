<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="num_people" value="${sessionScope.searcharr[0].people}" />
<fmt:formatNumber value="${num_people}" type="number" var="numberpeople" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#final").on("click",function(){
		
		location.href="${pageContext.request.contextPath}/reservation/resercompleteaction";
		
	});	
	
});



</script>
<!-- 아이콘을 위한 css -->
</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
		<div class="container mb-5 mt-3"> 
			<h2 ><b>운임 확인</b></h2>
		</div>
	
	<div class="container mb-5"> 

	<h4><b>여정</b></h4>

	<table class="table">
    <thead>
      <tr class="bg-secondary text-white">
        <th>여정</th>
        <th>출발도착시간</th>
        <th>항공사/편명</th>
      </tr>
    </thead>
    <tbody>
		<tr>
        <td>${sessionScope.searcharr[0].starting}- ${ sessionScope.searcharr[0].destination}</td>
        <td> ${sessionScope.searcharr[0].date} ${ sessionScope.searcharr[0].departure_time}  →  ${ sessionScope.searcharr[0].arrival_time}</td>
        <td>${sessionScope.searcharr[0]. airline}/${sessionScope.searcharr[0].flight}</td>
     	</tr>

   	 <c:if test="${not empty sessionScope.searcharr[1]}">
		<tr>
        <td>${sessionScope.searcharr[1].starting}- ${ sessionScope.searcharr[1].destination}</td>
        <td> ${sessionScope.searcharr[1].date} ${ sessionScope.searcharr[1].departure_time}  →  ${ sessionScope.searcharr[1].arrival_time}</td>
        <td>${sessionScope.searcharr[1].airline}/${sessionScope.searcharr[1].flight}</td>
     	 </tr>      
      </c:if>
    </tbody>
  </table>
	<h4 class="mt-5"><b>가격</b></h4>
	<table class="table">
    <thead>
      <tr class="bg-secondary text-white">
        <th>승객명</th>
      	<th>항공권 운임</th>
        <th>항공사용료</th>
        <th>유류할증료</th>
        <th>총액</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${sessionScope.pasinfoarr}" var="data">
    	<tr>
  		<td>${data.pafname}/${data.paname}</td>
  		<td>${sessionScope.searchprice}</td>
  		<c:choose >
  		<c:when test="${sessionScope.searcharr[0].round_trip eq true}">
   			<td>64000</td>
  			<td>18000</td> 	
  			<td>${8200+sessionScope.searchprice}</td>	
  		</c:when>
  		<c:otherwise>
   			<td>32000</td>
  			<td>9000</td> 
  			<td>${12200+sessionScope.searchprice}</td>
		</c:otherwise>
  		</c:choose>

     	</tr>
   </c:forEach>
     	
    </tbody>
 	</table>
	
	<button id="final" class="btn bg-primary text-white">결제하기</button>


	</div>
	
	
	
	   <%-- Footer Start --%>
   		<jsp:include page="../include/Footer.jsp"></jsp:include>
   		<%-- Footer End --%>

	</body>
	
</html>