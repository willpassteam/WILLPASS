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
	<div class="border">step3</div>
		<div class="bg-light mt-0 pt-5 pb-5">   
	<div class="container border bg-white pb-5 ">
	<h2 class="text-center mt-5 mb-4">항공권 예약/결제</h2>
	<div class="container pl-5 border">

	
	<div class="container mb-5"> 


	<table class="table mt-5">
    <thead>
      <tr class="bg-light text-dark">
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
	<h5 class="mt-5 text-dark mb-3"><b>탑승자별 운임 정보</b></h5>
	<table class="table">
    <thead>
      <tr class="bg-light">
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

 	
	<div class="border bg-dark text-white mt-0">
	<div class="row pt-2 pb-2">
	<div class="col-2 pl-5 pt-1"><h6><b>지불총액</b></h6></div>
	<div class="col-6"></div>
	<div class="col-4 pr-5" align="right"><h5><b>${12200+sessionScope.searchprice}원</b></h5></div>
	</div>
	</div>
	
	 	<h5 class="mt-3 text-dark mb-3"><b>결제하기</b></h5>
	<p class="small text-muted">상기 금액은 홈페이지 구매 시 적용되는 운임이며 지점,공항을 통하여 구매하시면 운임이 달라질 수 있습니다.</p>
	<div class="border">
	<ul class="list-group">
	<li class="list-group-item border-right-0"><input type="radio"> 신용카드 [카드사 연결]</li>
	<li class="list-group-item"><input type="radio"> 해외발행 카드결제</li>
	<li class="list-group-item"><input type="radio"> 실시간 계좌이체</li>
	<li class="list-group-item"><input type="radio">네이버페이</li>
	</ul>
	</div>
	
	<div align="right" class="mt-3">
	<button id="final" class="btn text-white  " style="background-color: #D60815"><b >결제하기</b></button>
	</div>

	</div>
	</div>
	</div>
	

	
	   <%-- Footer Start --%>
   		<jsp:include page="../include/Footer.jsp"></jsp:include>
   		<%-- Footer End --%>

	</body>
	
</html>