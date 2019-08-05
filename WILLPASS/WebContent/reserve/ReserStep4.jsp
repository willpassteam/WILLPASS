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
<style type="text/css">

#loading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 95;  
 text-align: center; } 
  
#loading-image {  
 position: absolute; 
 width:400px; 
 top: 45%;  
 left: 40%; 
 z-index: 100; }

</style>
<script type="text/javascript">
$(window).load(function() {//로딩이미지    
    $('#loading').hide();  
   });
$(function(){
	
	
	  window.onbeforeunload = function(){

		  
		  location.href="${pageContext.request.contextPath}/reservation/backtoReserStep3";
	    
	  };

	
	
	$("#final").on("click",function(){
		$('#loading').show();	
		location.href="${pageContext.request.contextPath}/reservation/resercompleteaction";
	});	
	
});

</script>
<!-- 아이콘을 위한 css -->
</head>
<body>
<c:set var="sear0" value="${sessionScope.searcharr[0]}"/>
	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	<div id="loading"><img id="loading-image" src="../img/loading.gif" alt="Loading..." /></div>
	
	<div class="border"></div>
	<div class="bg-light mt-0 pt-5 pb-5">   
		<div class="container border bg-white pb-5 ">
			<h2 class="text-center mt-5 mb-4">항공권 예약/결제</h2>
			<div class="container pl-5 border">
			<div class="container mb-5"> 

	<table class="table mt-5  text-center">
    <thead>
      <tr class="bg-light text-dark">
      	<th>구간</th>
        <th>출발일</th>
        <th>출발도착시간</th>
        <th>항공사</th>
        <th>편명</th>
      </tr>
    </thead>
    <tbody>
		<tr>
		<td width="10%">1구간</td>
        <td width="15%" class="pt-4"> ${sear0.date}</td>
        <td width="55%">${sear0.starting} &nbsp;&nbsp;<i class='fas fa-plane-departure pt-3 text-muted '></i>&nbsp;&nbsp;${sear0.destination}<br>
        <small>${ sear0.departure_time}→  ${sear0.arrival_time}</small>
        </td>
        <td width="10%">${sear0. airline}</td>
        <td width="10%">${sear0.flight}</td>
     	</tr>

   	 <c:if test="${not empty sessionScope.searcharr[1]}">
   	 <c:set var="sear1" value="${sessionScope.searcharr[1]}"/>
		<tr>
		<td>2구간</td>
             <td> ${sear1.date}</td>
			 <td>${sear1.starting} &nbsp;&nbsp;<i class='fas fa-plane-departure pt-3 text-muted'></i>&nbsp;&nbsp;${sear1.destination}<br>
    		 <small>${ sear1.departure_time}→  ${sear1.arrival_time}</small>
        	</td>
        	<td>${sear1.airline}</td>
        	<td>${sear1.flight}</td>
      </tr>      
      </c:if>
    </tbody>
  </table>
  
		<!-- 가격보여주는 format 시작-->
         <c:choose>
         <c:when test="${not empty sessionScope.searcharr[1]}"> <!-- 왕복일경우 -->
         <fmt:formatNumber value="${sear0.price +sear1.price}" pattern="#,###" var="price1" />
         <fmt:formatNumber value="${32000*2}" pattern="#,###" var="price2" />
         <fmt:formatNumber value="${9000*2}" pattern="#,###" var="price3" />
         <fmt:formatNumber value="${sear0.price  +sear1.price+32000*2 + 9000*2
         }" pattern="#,###" var="price4" />
         <fmt:formatNumber value="${sear0.price * sear0.people +sear1.price *sear1.people
         +32000*sear0.people*2 + 9000*sear0.people*2
         }" pattern="#,###" var="price5" />
         
         </c:when>
         
         <c:otherwise> <!-- 편도일경우 -->
         <fmt:formatNumber value="${sear0.price }" pattern="#,###" var="price1" />
         <fmt:formatNumber value="${32000}" pattern="#,###" var="price2" />
         <fmt:formatNumber value="${9000}" pattern="#,###" var="price3" />
         <fmt:formatNumber value="${sear0.price +32000 + 9000
         }" pattern="#,###" var="price4" />
               <fmt:formatNumber value="${sear0.price * sear0.people
 			+32000*sear0.people + 9000*sear0.people
         }" pattern="#,###" var="price5" />
         
      	 </c:otherwise>
         </c:choose>
         <!-- 가격보여주는 format 끝ㄴ -->
  
  
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
    
    <c:forEach items="${sessionScope.pasinfoarr}" var="data"> <!-- 가격출력부분 -->
    	<tr>
  			<td>${data.pafname}/${data.paname}</td>
  			<td>${price1} KRW</td>
  			<td>${price2} KRW</td>
  			<td>${price3} KRW</td>
  			<td>${price4} KRW</td>
		</tr>
   </c:forEach>
     	
    </tbody>
 	</table>

	<h5 class="mt-3 text-dark mb-3"><b>결제정보</b></h5>
	<p class="small text-muted">상기 금액은 홈페이지 구매 시 적용되는 운임이며 지점,공항을 통하여 구매하시면 운임이 달라질 수 있습니다.</p>
	<div class="border">
	<ul class="list-group">
	<li class="list-group-item border-right-0"><input type="radio" name="pay" checked="checked" id="pay1"> <label for="pay1">신용카드 [카드사 연결] </label></li>
	<li class="list-group-item"><input type="radio" name="pay" id="pay2"> <label for="pay2">해외발행 카드결제</label></li>
	<li class="list-group-item"><input type="radio" name="pay" id="pay3"><label for="pay3"> 실시간 계좌이체</label></li>
	<li class="list-group-item"><input type="radio" name="pay" id="pay4"><label for="pay4">네이버페이</label></li>
	</ul>
	</div>
	
	<div class="border bg-dark text-white mt-3">
	<div class="row pt-2 pb-2">
	<div class="col-2 pl-5 pt-1"><h6><b>지불총액</b></h6></div>
	<div class="col-6"></div>
	<div class="col-4 pr-5" align="right"><h5><b>${price5} KRW</b></h5></div>
	</div>
	</div>
	<div align="right" class="mt-3">
	<button id="final" class="btn text-white  " style="background-color: #D60815"><b >결제하기</b></button>
	</div>
	</div>
	</div>
	</div>
	</div>
	
	<div class="mb-5 pb-5"></div>
	   <%-- Footer Start --%>
   		<jsp:include page="../include/Footer.jsp"></jsp:include>
   		<%-- Footer End --%>

	</body>
	
</html>