<%@page import="net.reservation.db.PassengerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 아이콘을 위한 css -->
<style type="text/css">


input{

display: none; 
}
</style>
 
<script type="text/javascript">
var pcount=parseInt("${sessionScope.searcharr[0].people}");  
var jbAry1 = new Array();
var jbAry2 = new Array();
for(var i = 0 ; i<pcount ;i++){
	
	jbAry1[i]="100";
	alert(jbAry[i]);
	
}

//클릭한 좌석 bg바꾸기 
function fnselect(selected){
	alert($(selected).val());
	
for(var i=0 ; i<pcount;i++){
	
	if(jbAry1[i]==$(selected).val()){
		
		alert("이미선택된좌석");
	}else{
		var sp = $(selected).attr('id');
		alert(sp.split('_',4)[2]); //구간번호
		
	}
}
// 	if($("selected_사람번호_구간번호 "))
// 	if($(".seat_사람번호_구간번호_좌석번호));

}

//구간선택하는 부분
$(function(){
	
	$("#2part").hide();
	
	$(".1partbtn").on("click",function(){
		
		$("#1part").show();
		$("#2part").hide();
		
	});
	
	$(".2partbtn").on("click",function(){
		
		$("#2part").show();
		$("#1part").hide();
		
	});
	
})
</script>


</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
<form action="${pageContext.request.contextPath}/reservation/seatinfo" method="get" >	
<div class="container mb-5 mt-3"> 
<h2 ><b>국제선 예약${sessionScope.pasinfoarr[0].paretel}</b></h2>
${ sessionScope.pasinfoarr[0].paretel}


</div>

<div class="container mt-5">

  <div class="row">
  
	<!-- 오른 --> 
    <div class="col-md-3 order-md-2 mb-4">

      <ul class="list-group mb-3" >
              
        <li class="list-group-item d-flex justify-content-between lh-condensed bg-light text-center ">
          <div>
           <h5 class="ml-5 text-muted"> <b>전체 예약정보</b></h5>
          </div>

        </li>
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted">
          
       <c:if test="${sessionScope.searcharr[0].round_trip eq true}">
            <b>
        	${ sessionScope.searcharr[0].starting}- ${ sessionScope.searcharr[0].destination}<br>
			${ sessionScope.searcharr[0].date} ${ sessionScope.searcharr[0].departure_time}  →  ${ sessionScope.searcharr[0].arrival_time} <br><br>
			${ sessionScope.searcharr[1].starting} - ${ sessionScope.searcharr[1].destination}<br>
			${ sessionScope.searcharr[1].date} ${ sessionScope.searcharr[1].departure_time}  →  ${ sessionScope.searcharr[1].arrival_time}<br>
          </b>
       
       </c:if>
       <c:if test="${sessionScope.searcharr[0].round_trip eq false}">
             <b>
        	${ sessionScope.searcharr[0].starting}- ${ sessionScope.searcharr[0].destination}<br>
			${ sessionScope.searcharr[0].date} ${ sessionScope.searcharr[0].departure_time}  →  ${ sessionScope.searcharr[0].arrival_time} <br><br>
          </b>
       
       </c:if>

          </div>
     
        </li>
        
        
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >
          
           	성인 ${sessionScope.searcharr[0].people}명

          </div>
          <span class="text-muted small"><b>55,000 KRW</b></span>
        </li>

        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >
           	항공사용료
          </div>
          <span class="text-muted small"><b>66,900 KRW</b></span>
        </li>      
 
         <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >
           	유류할증료 
          </div>
          <span class="text-muted small"><b>18,800 KRW</b></span>
        </li>       

         <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >
           	지불예상금액 
          </div>
          <span class="text-muted "><b>${searchprice} KRW</b></span>
        </li>         
        <li class="list-group-item d-flex justify-content-between bg-light">
          <div class="text-success small text-danger">
			상기 운임은 결제완료 전까지 좌석상황에 따라 실시간 변동될 수 있습니다.<br><br>
			※한국출발 세금(BP)은 국제여객공항이용료 12,000원, 출국납부금 10,000원, 국제빈곤퇴치기여금 1,000원이 포함되어 있습니다.
          </div>
   
        </li>
 
        <li class="list-group-item d-flex justify-content-between bg-dark text-white mt-3">
          <span>지불예상금액 </span>
          <strong>${searchprice} KRW</strong>
        </li>
        
  		<li class="list-group-item d-flex justify-content-between lh-condensed pl-0 pr-0 pt-0 pb-0 mt-3">
        <input class="btn  btn-lg btn-block btn-primary" type="submit" value="다음단계 ">
        </li>	
      </ul>

		 </div>

		 
<!--왼쪽 -->

       <div class="col-md-9 order-md-1">
 			
 	 	<h3> 좌석배정 </h3>
      	<ul>
      		<li>항공기 교체 등의 사유로 기종이 변경될 수 있으며, 배정된 좌석이 변경 또는 취소될 수 있습니다..</li>
			<li>만 15세 미만, 임산부 또는 영어로 의사소통이 불가능한 손님은 비상구 좌석 배정이 불가합니다.</li>
			<li>구매하신 유료석에서 다른 유료석 혹은 무료석으로 변경을 원하시면 환불 후 재구매하셔야 합니다.</li>
			<li>타항공사 연결 및 공동운항편의 경우 사전좌석 예약서비스가 제한됩니다.</li>
			<li>한국 국내선 여정 포함 시 한국 국내선 사전좌석 배정은 출발 30일 전부터 가능합니다.</li>
			<li>사전좌석배정 : 회원등급 및 구매한 항공권 종류에 따라 좌석 선택이 제한될 수 있습니다 .</li>
			
        </ul>
        <input type="text">
<!-- 탑승객정보 -->
	   <!-- 탑승자수 people이 string type이기때문에 numbertype으로 바꿈 -->
			<c:set var="num_people" value="${sessionScope.searcharr[0].people}" />
			<fmt:formatNumber value="${num_people}" type="number" var="numberpeople" />
			<div class="border">
				<c:forEach begin="0" end="${numberpeople-1}" step="1" varStatus="varstatus">
					<div class="border">
						<div class="row">
						<div class="col-6">
							${pasinfoarr[varstatus.index].paname}<!--탑승자이름출력부분  -->
						</div>
						<c:if test="${sessionScope.searcharr[0].round_trip eq true}">
							<div class="col-2 seati_1part_${varstatus.index}">
							seati${varstatus.index} <!-- radio버튼으로 클릭한 자석 출력부분-->
							</div>
							<div class="col-2 seati_2part_${varstatus.index}">
							seati${varstatus.index} <!-- radio버튼으로 클릭한 자석 출력부분-->
							</div>
						</c:if>
						
						<c:if test="${sessionScope.searcharr[0].round_trip eq false}">
							<div class="col-2 seati_1part_${varstatus.index}">
							seati${varstatus.index} <!-- radio버튼으로 클릭한 자석 출력부분-->
							</div>
						</c:if>						
						
						
						</div>
					</div>
				</c:forEach>
			</div> 
<!-- 탑승객정보끝 -->
       
<!-- 구간선택부분 -->
 	<div class="col row">
 	
 	 <c:if test="${sessionScope.searcharr[0].round_trip eq true}">
 		<div class="col-6 border text-center 1partbtn" >
 			<h5 class="text-muted">${ sessionScope.searcharr[0].starting}- ${ sessionScope.searcharr[0].destination}</h5>
 		</div>
 		<div class="col-6 border text-center 2partbtn">
 			<h5 class="text-muted">${ sessionScope.searcharr[1].starting} - ${ sessionScope.searcharr[1].destination}</h5>
 		</div>
 	 </c:if>
 	 
 	 
 		<c:if test="${sessionScope.searcharr[0].round_trip eq false}">
 		<div class="col-6 border text-center 1partbtn"><h5 class="text-muted">${ sessionScope.searcharr[0].starting}- ${ sessionScope.searcharr[0].destination}</h5></div>
 		</c:if>
	 	</div>
<!-- 구간선택부분끝 -->       
      
      
 <!-- 좌석선택부분       -->
<div class="col border mr-0 pr-0">
<div id="1part">
<div class="row">
<div class="col-1"></div>
</div>


<!-- 사람수 만큼 for문돌려서 좌석을 만들어주는부분  -->
<c:forEach begin="0" end="${numberpeople -1}" step="1" varStatus="aak"> 
<c:set var="count" value="1"></c:set> <!-- 좌석 행 출력때문에 count해줌-> 
<br>

<!--좌석모양나오는 부분-->
<c:forEach var="data" items="${possibleseats1}" varStatus="varStatus">


	<c:if test="${(varStatus.index mod 6)==0 }">  <!-- 	좌석들을 6개씩 출력하기 위해서 mod해줌 -->
	<div class="col row">
	</c:if>
	
	<c:choose>
	<c:when test="${(varStatus.index mod 3)==0 }"> <!--좌석들을 6개씩 출력하기 위해서 mod해주는데 양옆에는 안나와야하니까 3mod인경우는 행번호 나와야함-->
		<c:if test="${(varStatus.index mod 6)!=0 }">
			<div class="col-1 text-center">
			<c:out value="${count}"/>
			<c:set var="count" value="${count+1}"></c:set>
			</div>
		</c:if>

	</c:when>
	
	</c:choose>
	
	<c:choose>

		<c:when test="${data eq 0}">  <!-- {data eq 0}이라는 의미는 1구간 int[]로 넘어온 배열의 값이 0이라는 것 ->예약가능한 좌석  -->
		<div class="col-1 border bseat1">
		  <input type="radio" id="seat_${aak.index}_1_${varStatus.index}" name="selected_${aak.index}_1" onclick="fnselect(this);" value="${varStatus.index}">
		 <label  for="seat_${aak.index}_1_${varStatus.index}" class="col"><i class='far fa-user'></i></label></label>
		</div>
		</c:when>
		<c:when test="${data eq 1 }">
		<div class="col-1 border bg-light text-center">
		 <input type="radio" id="seat_${aak.index}_1_${varStatus.index}" name="selected_${aak.index}_1" onclick="fnselect(this);" value="${varStatus.index}" disabled="disabled">
		 <label   for="seat_${aak.index}_1_${varStatus.index}" class="col"><B>X</B></label>
		 </div>
		</c:when>
	</c:choose>


	
	<c:if test="${(varStatus.index mod 6)== 5 }">
	</div>
	</c:if>

</c:forEach> <!--좌석모양나오는 부분 끝-->
</c:forEach> <!-- 사람수 만큼 for문돌려서 좌석을 만들어주는부분끝  -->

</div>

<!-- 2구간 -->
<div id="2part">
<div class="row">
<div class="col-1"></div>
</div>


<!-- 사람수 만큼 for문돌려서 좌석을 만들어주는부분  -->
<c:forEach begin="0" end="${numberpeople -1}" step="1" varStatus="aak"> 
<c:set var="count" value="1"></c:set> <!-- 좌석 행 출력때문에 count해줌-> 
<br>

<!--좌석모양나오는 부분-->
<c:forEach var="data" items="${possibleseats2}" varStatus="varStatus">


	<c:if test="${(varStatus.index mod 6)==0 }">  <!-- 	좌석들을 6개씩 출력하기 위해서 mod해줌 -->
	<div class="col row">
	</c:if>
	
	<c:choose>
	<c:when test="${(varStatus.index mod 3)==0 }"> <!--좌석들을 6개씩 출력하기 위해서 mod해주는데 양옆에는 안나와야하니까 3mod인경우는 행번호 나와야함-->
		<c:if test="${(varStatus.index mod 6)!=0 }">
			<div class="col-1 text-center">
			<c:out value="${count}"/>
			<c:set var="count" value="${count+1}"></c:set>
			</div>
		</c:if>

	</c:when>
	
	</c:choose>
	
	<c:choose>

		<c:when test="${data eq 0}">  <!-- {data eq 0}이라는 의미는 1구간 int[]로 넘어온 배열의 값이 0이라는 것 ->예약가능한 좌석  -->
		<div class="col-1 border bseat1">
		  <input type="radio" id="seat_${aak.index}_2_${varStatus.index}" name="selected_${aak.index}_2" onclick="fnselect(this);" value="${varStatus.index}">
		 <label  for="seat_${aak.index}_2_${varStatus.index}" class="col"><i class='far fa-user'></i></label></label>
		</div>
		</c:when>
		<c:when test="${data eq 1 }">
		<div class="col-1 border bg-light text-center">
		 <input type="radio" id="seat_${aak.index}_2_${varStatus.index}" name="selected_${aak.index}_2" onclick="fnselect(this);" value="${varStatus.index}" disabled="disabled">
		 <label  for="seat_${aak.index}_2_${varStatus.index}" class="col"><B>X</B></label>
		 </div>
		</c:when>
	</c:choose>


	
	<c:if test="${(varStatus.index mod 6)== 5 }">
	</div>
	</c:if>

</c:forEach> <!--좌석모양나오는 부분 끝-->
</c:forEach> <!-- 사람수 만큼 for문돌려서 좌석을 만들어주는부분끝  -->

</div>
<!-- 2구간끝 -->



</div>



<!-- 좌석선택부분끝       -->
</div>
    
<!--왼쪽끝 -->       
       
  

</div>
</div>

</form>  	
	
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>