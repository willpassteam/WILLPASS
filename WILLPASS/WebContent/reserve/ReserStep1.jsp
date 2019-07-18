
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%
   		request.setCharacterEncoding("UTF-8");
   %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 아이콘을 위한 css -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<jsp:include page="../include/Bootstrap.jsp"></jsp:include>

<!-- jQuery 라이브러리 파일 사용을 위한 CDN 링크 주소 작성-->
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript">
//항공편 선택 함수 	
		
		var depart1, depart2;
		var usage1, usage2;
		var fuelfee1, fuelfee2;
		var sum1, sum2;
				
		$(function () {
			$(".select").click(function () {
			 var index = $(".select").index(this);
			 var td1 = $(".select:eq("+ index +") >td")[0].innerHTML; //출발-도착시간
				 var dep1 = td1.split("-"); //출발시간 - 도착시간 분리 저장
						 
			 var td3 = $(".select:eq("+ index +") >td")[1].innerHTML; //항공사
			 var td5 = $(".select:eq("+ index +") >td")[2].innerHTML; //항공편
			 var td7 = $(".select:eq("+ index +") >td")[4].innerHTML; //잔여석
			 var td9 = $(".select:eq("+ index +") >td")[5].innerHTML; //소요시간
			 								 
			 	$(".reserve1").html("${newlist[0].starting} -> ${newlist[0].destination}"+ "&nbsp;/&nbsp;" +  "${newlist[0].date}" + "<br>"
			 						+ td3 + "&nbsp;"+ td1);
		
				$(".select:eq("+ index +") >td").css("background-color","lavender");
				$(".select:not(:eq("+ index +")) >td").css("background-color","white");
			 	
			//항공편요금
			depart1 = parseInt($(".select:eq("+ index +") >td")[3].innerHTML );
			if(depart2 == null){
				$("#subtotal").html((depart1)* "${newlist[0].people}");
				$(".price1").val(depart1);
			}else{
				$("#subtotal").html((depart1 + depart2)*"${newlist[0].people}");
				$(".price1").val(depart1);
			}
			
			//항공사용료
			usage1 = 32000;
			if(usage2 == null){
				$("#usage").html((usage1)*"${newlist[0].people}");
			}else{
				$("#usage").html((usage1 + usage2)*"${newlist[0].people}");
			}			
			//유류할증료
			fuelfee1 = 9000;
			if(fuelfee2 == null){
				$("#fuelfee").html((fuelfee1)*"${newlist[0].people}");
			}else{
				$("#fuelfee").html((fuelfee1 + fuelfee2)*"${newlist[0].people}");
			}				
			//지불예상금액
			sum1 = depart1 + usage1 + fuelfee1;
			if(sum2 == null){
				$(".sum").html((sum1)*"${newlist[0].people}");
			}else{
				$(".sum").html((sum1 + sum2)*"${newlist[0].people}");
			} 		
			
			//ReserStep2 전달 값
 			$(".starting1").val("${newlist[0].starting}");
 			$(".destination1").val("${newlist[0].destination}");
			$(".date1").val("${newlist[0].date}");
			$(".departure_time1").val(dep1[0]);
			$(".arrival_time1").val(dep1[1]);
			$(".people1").val("${newlist[0].people}");
			$(".airline1").val(td3);
			$(".round_trip1").val("${newlist[0].round_trip}");
			$(".flight1").val(td5);
			$(".leftseat1").val(td7); 
					
			});
		});
			
		$(function () {
			$(".select2").click(function () {
			 var index2 = $(".select2").index(this);
	         var td2 = $(".select2:eq("+ index2 +") >td")[0].innerHTML;
	         	var dep2 = td2.split("-"); //출발시간 - 도착시간 분리 저장
	         	
			 var td4 = $(".select2:eq("+ index2 +") >td")[1].innerHTML; //항공사
			 var td6 = $(".select2:eq("+ index2 +") >td")[2].innerHTML; //항공편
			 var td8 = $(".select2:eq("+ index2 +") >td")[4].innerHTML; //잔여석
			 var td10 = $(".select2:eq("+ index2 +") >td")[5].innerHTML; //소요시간

			 	$(".reserve2").html("${newlist2[0].starting} -> ${newlist2[0].destination}" + "&nbsp;/&nbsp;" + "${newlist2[0].date}" +"<br>" 
			 							+ td4 + "&nbsp;"+ td2);

 				$(".select2:eq("+ index2 +") >td").css("background-color","lavender");
				$(".select2:not(:eq("+ index2 +")) >td").css("background-color","white");

				//항공편요금
				depart2 = parseInt($(".select2:eq("+ index2 +") >td")[3].innerHTML);
				$("#subtotal").html((depart1 + depart2)*"${newlist2[0].people}");
				$(".price2").val(depart2);
				
				//항공사용료
				usage2 = 32000;
				$("#usage").html((usage1 + usage2)*"${newlist2[0].people}");
			
				//유류할증료
				fuelfee2 = 9000;
					$("#fuelfee").html((fuelfee1 + fuelfee2)*"${newlist2[0].people}");
					$(".totalperperson").html((fuelfee1 + fuelfee2)*"${newlist2[0].people}");
				//지불예상금액				
				sum2 = depart2 + usage2 + fuelfee2;
					$(".sum").html((sum1 + sum2)*"${newlist2[0].people}"); 
					
				//ReserStep2 전달 값
	 			$(".starting2").val("${newlist2[0].starting}");
	 			$(".destination2").val("${newlist2[0].destination}");
				$(".date2").val("${newlist2[0].date}");
				$(".departure_time2").val(dep2[0]);
				$(".arrival_time2").val(dep2[1]);
				$(".people2").val("${newlist2[0].people}");
				$(".airline2").val(td4);
				$(".round_trip2").val("${newlist2[0].round_trip}");
				$(".flight2").val(td6);
				$(".leftseat2").val(td8); 
			});
		});
		
	</script>

</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	<div class="container mb-5 mt-3"> 
		<h2 ><b>국제선 예약</b></h2>

		<img src="../img/Reser/step2_pr.png">

	</div>

	<img src="../img/Reser/step1.png" width="100%" class="mb-3">
	<div class="container">


  <div class="row">
<!--  오른쪽 		 -->
  
     <div class="col-md-3 order-md-2 mb-4 mt-5">
     
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
      
	<form action="${contextPath}/reserve1/ReserStep2.do" method="post" > 
      	
      <ul class="list-group mb-3" >
              
        <li class="list-group-item d-flex justify-content-between lh-condensed bg-light text-center ">
          <div>
           <h5 class="ml-5 text-muted"><b>선택 항공편</b></h5>
          </div>

        </li>
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted">
          <b>
          <ul style="list-style: none; padding-left: 0px;">
          	<li class="reserve1"></li>
          	<br>
          	<li class="reserve2"></li>
          </ul>
          </b>

          </div>
     
        </li>
        
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >
           	성인 ${newlist[0].people} 명
          </div>
          <span class="text-muted small" id="subtotal"></span>
          <span class="text-muted small" ><b>KRW</b></span>
          
        </li>

        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >
           	항공사용료
          </div>
          <span class="text-muted small" id="usage"></span>
          <span class="text-muted small" ><b>KRW</b></span>
          
        </li>      
 
         <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >
           	유류할증료 
          </div>
          <span class="text-muted small" id="fuelfee"></span>
          <span class="text-muted small" ><b>KRW</b></span>
        </li>       

         <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >
           	지불예상금액 
          </div>
          <span class="text-muted sum"></span>
          <span class="text-muted" ><b>KRW</b></span>
        </li>         
        <li class="list-group-item d-flex justify-content-between bg-light">
          <div class="text-success small text-danger">
			상기 운임은 결제완료 전까지 좌석상황에 따라 실시간 변동될 수 있습니다.<br><br>
			※한국출발 세금(BP)은 국제여객공항이용료 12,000원, 출국납부금 10,000원, 국제빈곤퇴치기여금 1,000원이 포함되어 있습니다.
          </div>
   
        </li>
 
        <li class="list-group-item d-flex justify-content-between bg-dark text-white mt-3">
          <span>지불예상금액 </span>
          <span class="sum"> </span>
          <span>KRW</span>
        </li>
        
  		<li class="list-group-item d-flex justify-content-between lh-condensed pl-0 pr-0 pt-0 pb-0 mt-3">
  		
	<!-- ReserStep2 로 전달할 값 -->
	  <!-- 가는 항공  -->
  		<input type="hidden" name="starting1" class="starting1">
  		<input type="hidden" name="destination1" class="destination1">
  		<input type="hidden" name="date1" class="date1">
  		<input type="hidden" name="departure_time1" class="departure_time1">
  		<input type="hidden" name="arrival_time1" class="arrival_time1">
  		<input type="hidden" name="people1" class="people1">
  		<input type="hidden" name="airline1" class="airline1">
  		<input type="hidden" name="round_trip1" class="round_trip1">
  		<input type="hidden" name="flight1" class="flight1">
  		<input type="hidden" name="price1" class="price1">
  		<input type="hidden" name="leftseat1" class="leftseat1">
  		
  	  <!-- 오는 항공  -->	
  		<input type="hidden" name="starting2" class="starting2">
  		<input type="hidden" name="destination2" class="destination2">
  		<input type="hidden" name="date2" class="date2">
  		<input type="hidden" name="departure_time2" class="departure_time2">
  		<input type="hidden" name="arrival_time2" class="arrival_time2">
  		<input type="hidden" name="people2" class="people2">
  		<input type="hidden" name="airline2" class="airline2">
  		<input type="hidden" name="round_trip2" class="round_trip2">
  		<input type="hidden" name="flight2" class="flight2">
  		<input type="hidden" name="price2" class="price2">
  		<input type="hidden" name="leftseat2" class="leftseat2">
    		
        <input class="btn  btn-lg btn-block btn-primary" type="submit" value="다음단계 ">
        </li>	
      </ul>
     </form> 
   </div>
    
<!--  왼쪽 -->

 <div class="col-md-9 order-md-1">
	<p class="text-danger small mt-2 mb-4">운임규정은 항공권에 따라 상이하며, 자세한 내용은 하단의 운임규정 ‘필독사항’를 통해 확인 바랍니다.</p>
	<!-- 가격 정렬 버튼 -->
	<div>
<%-- 		<form action="${contextPath}/reserve1/ReserStep1.do" method="post">
			<input type="hidden" name="order" value="null">
			<input type="submit" value="시간순" >
		</form> --%>
		<form action="${contextPath}/reserve1/ReserStep1.do" method="post">
			<input type="hidden" name="order" value="1">
			<input type="submit" value="낮은 가격순">
		</form>
		<form action="${contextPath}/reserve1/ReserStep1.do" method="post">
			<input type="hidden" name="order" value="2">
			<input type="submit" value="높은 가격순">
		</form>
 	</div>
 	
	<i class='fas fa-plane' style='font-size:30px'></i>
	${newlist[0].starting} -> ${newlist[0].destination} : ${newlist[0].date} 
	
	<div style="overflow: auto;  height: 400px">
  		<table class="table mt-3">

    		<tbody>
			<tr class="bg-light">
			<td>출발-도착시간</td>
			<td>항공사</td>		
			<td>항공편</td>	
			<td>금액</td>
			<td>잔여석</td>
			<td style="display: none;">소요시간</td>
			</tr>
												
		    </tbody>
	<c:choose>
		<c:when test="${newlist == null}">
			<tr>
				<td colspan="5">
				검색된 항공편이 없습니다.
				</td>
			</tr>
		</c:when>
		<c:when test="${newlist != null}">

		<c:forEach var="air" items="${newlist}">
			<tr class="select">
				<td >${air.departure_time} - ${air.arrival_time}</td>
				<td >${air.airline}</td>
				<td >${air.flight}</td>
				<td >${air.price}</td>
				<td >${air.leftseat}</td>	
				<td style="display: none;">${air.time}</td>				
			</tr>				
		</c:forEach>

	</c:when>
	</c:choose>	
	    
  		</table>	
</div>
 	<br>
	<i class='fas fa-plane' style='font-size:30px'></i>
	<!-- 2구간 부산 큐슈(후쿠오카) 07/14(일) -->
	${newlist2[0].starting} -> ${newlist2[0].destination} : ${newlist2[0].date}
	
	<div style="overflow: auto;  height: 400px">
  		<table class="table mt-3">

    		<tbody>
			<tr class="bg-light">
			<td>출발-도착시간</td>
			<td>항공사</td>		
			<td>항공편</td>
			<td>금액</td>
			<td>잔여석</td>
			<td style="display: none;">소요시간</td>
			</tr>
												
		    </tbody>
	<c:choose>
		<c:when test="${newlist2 == null}">
			<tr>
				<td colspan="5">
				검색된 항공편이 없습니다.
				</td>
			</tr>
		</c:when>
		<c:when test="${newlist2 != null}">
		<c:forEach var="air2" items="${newlist2}">
			<tr class="select2">
				<td >${air2.departure_time} - ${air2.arrival_time}</td>
				<td >${air2.airline}</td>
				<td >${air2.flight}</td>
				<td >${air2.price}</td>	
				<td >${air2.leftseat}</td>	
				<td style="display: none;">${air2.time}</td>					
			</tr>				
		</c:forEach>
	</c:when>		
	</c:choose>			    
  		</table>	
 	</div>
 		<div class="border bg-light small text-dark">
 		<ul class="mt-3">
	<li>상기 운임은 인터넷 전용 운임이며 예약센터, 공항을 통한 결제 및 변경 시 해당운임이 적용되지 않습니다.</li>
	<li>우측 운임은 유류할증료(홍콩발 전쟁보험료 포함) 및 공항시설사용료(세부 현지 공항시설사용료 제외)가 포함된 총액이며, 구매일/환율 등에 따라 변동될 수 있습니다.</li>
	<li>구매 후 탑승시점에 유류할증료가 인상되어도 차액을 징수하지 않으며, 인하되어도 환급되지 않습니다.</li>
	<li>일자 및 항공편 출/도착시각은 현지 기준이며 +1은 다음날 도착을 의미합니다.</li>
	<li>상기 스케줄은 정부 인가조건으로 불가피하게 사전 예고 없이 변경될 수 있습니다.</li>
	<li>인터넷 시스템 정기 작업으로 매일 23시50분~00시10분까지 항공권 예매 및 여정변경/환불 서비스가 제한되며, 매주 일요일 23시00분~24시00분까지 시스템 정기점검 시간으로 홈페이지 이용이 불가하오니 이용에 참고하시기 바랍니다.
	<li>홈페이지를 통한 예약은 최대 9석까지 표시되며, 10인 이상 예약은 단체예약문의를 통해 진행하시기 바랍니다.</li>
	공통규정
	<li>항공권상에 명시된 여정 순서대로 사용하는 것을 원칙으로 하며 명의 변경 및 타인양도가 불가합니다.</li>
	<li>항공권의 유효기간은 항공권 미사용 시 최초 예약일 또는 재발행일로부터 1년이며, 여행개시 후에는 최초 출발일로부터 1년입니다.</li>
	<li>환불은 항공권 유효기간 만료일로부터 30일 이내에 접수되어야 합니다.</li>
	<li>수수료는 1인 당 구간별로 징수하며, 좌석을 점유하지 않은 유아는 면제됩니다.</li>
	<li>여권상의 정보와 상이한 정보로 예약한 경우 탑승이 거절될 수 있습니다.</li>
	<li>편도항공권 구매 시 복편항공권 미소지 또는 해당 국가의 비자 미소지로 입국이 거절 될 경우 책임은 승객 본인에게 있습니다.  </li>
	 </ul>
 		</div>
 		
 		<div class="border small text-dark mt-5">
 		<ul class="mt-3">
 		<b>안내사항</b>
 		<li class="mt-2">선택하신 항공편에 따라 항공운임이 상이하오니 클릭 후 지불예상금액을 확인하여 주시기 바랍니다.</li>
		<li>특가, 실속프로모션 및 이벤트항공권은 UM(보호자 동반 없이 혼자 여행하는 어린이) 신청이 불가합니다.</li>
		</ul>
 		</div>
 
 
 	</div>	<!--   왼쪽끝 -->
	</div><!--  row끝 -->
	</div><!--  container끝 -->

</body>
</html>