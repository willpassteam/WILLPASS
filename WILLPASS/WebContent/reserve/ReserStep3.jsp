<%@page import="net.reservation.db.PassengerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="num_people" value="${sessionScope.searcharr[0].people}" />
<fmt:formatNumber value="${num_people}" type="number" var="numberpeople" /><!--  넘어오는 사람수가 string 이라서 number type으로 바꿈 -->
 <c:if test="${not empty sessionScope.searcharr[1]}"><!--왕복일경우 -->
	<c:set var="isround" value="true"/>
 </c:if>
  <c:if test="${empty sessionScope.searcharr[1]}"> <!-- 편도일경우 -->
	<c:set var="isround" value="false"/>
 </c:if>
    
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

var isroundtr=${isround}//왕복인지 편도인지 
var totalse=0; //선택가능한 좌석수 (왕복일 경우 1구간+2구간 선택가능한 좌석수)
var maxChecked = ${numberpeople};//선택가능한 체크박스 수
var totalChecked = 0; //설정 
var maxChecked2 = ${numberpeople};//선택가능한 체크박스 수
var totalChecked2 = 0; // 설정+
var totalCheckedr=0;

if(isroundtr==true){ //왕복인지 편도인지에 따라 check박스 선택가능한 수 바꿈
	totalse=maxChecked *2;
}else{
	totalse=maxChecked;
}

function changeSeat(seatnum){ //선택된 좌석보여주는 부분에 보여주기 위해서 좌석숫자를 문자+숫자로 바꿔줌
	var col;
	switch (seatnum%6) {
	case 0:col='A';break;
	case 1:col='B';break;
	case 2:col='C';break;
	case 3:col='D';break;
	case 4:col='E';break;
	case 5:col='F';break;
}
	return col;
}


function fncheck(){ //좌석수가 일치하는지 안하는지 확인해주는 함수 일치하하면 <form>submit
	
	if($('input:checked').length<totalse){
		
		alert("좌석을선택하세요!");
		
	return false;
		
	}else{
		return true;
	}
}

$(function(){
   
	//뒤로가기로 돌아왔을때 check된거 지워주기
	$('input[name=selected_1]').prop('checked', false);
	if(isroundtr==true){
	$('input[name=selected_2]').prop('checked', false);
			}
	
	$(".engseat").html("<div class='col-2'></div>"+
			   "<div class='col-1 text-center'><b>A</b></div>"+
			  " <div class='col-1 text-centerㅋㅋ'><b>B</b></div>"+
			   "<div class='col-1 text-center'><b>C</b></div>"+
			   "<div class='col-1 text-center'></div>"+
			   "<div class='col-1 text-center'><b>D</b></div>"+
			   "<div class='col-1 text-center'><b>E</b></div>"+
			   "<div class='col-1 text-center'><b>F</b></div>"+
			   "</div>");
	
	
	$("#1part").show();
	$("#2part").hide();
	$("#1partbtnid").css("background-color","#6D6E71");
	$("#1partbtnid").children().removeClass("text-muted");
	$("#1partbtnid").children().addClass("text-white");
   
	
$(".partseat").on("click",function(){ //좌석선택했을때 선택가능여부 / 선택한 좌석 div에 출력 함수
	
	var peoplenum=${numberpeople}; //예약한 사람수
	
	
	if($(this).attr("class")=="partseat 1partre"){//1구간 선택일때
		totalCheckedr=totalChecked;

		
	}else if($(this).attr("class")=="partseat 2partre"){//2구간 선택일때
		totalCheckedr=totalChecked2;
	}
	
	//click이 어떤 클릭인지 구분함
	 if (this.checked){ //클릭한게 선택하기 위한 클릭
			totalCheckedr=totalCheckedr+1; //총선택한 좌석의 수를 +1
	 }else{ //클릭한게 취소하기위한 클릭
		 $(this).parent().removeClass("border-danger");
		 totalCheckedr-= 1;//총선택한 좌석수를 -1
	}
	
	//현재 클릭한 수가 클릭할수 있는 수보다 많으면  클릭한 걸 취소해줌 
	 if (totalCheckedr> maxChecked) {
		 
		 alert("${numberpeople}좌석 선택가능합니다.");
		 $(this).prop("checked", false);
		 totalCheckedr-= 1;
		 
	 }else{
		 
		 $("input:checked").parent().addClass("border-danger");
		 
	 }
		var is=${isround};
		var pp=${numberpeople};
	
		for(var i=0;i<pp;i++){
			
			var seatval1=$('input:checkbox[name="selected_1"]:checked').eq(i).val();
			
			if(typeof seatval1=='undefined'){
				$(".fre1_"+i).text("");
			}else{
				
				$(".fre1_"+i).text(parseInt((($('input:checkbox[name="selected_1"]:checked').eq(i).val())/6)+1)+changeSeat(seatval1));
			}
			
			if(is==true){ //왕복일 경우
				var seatval2=$('input:checkbox[name="selected_2"]:checked').eq(i).val();
				if(typeof seatval2=='undefined'){
					$(".fre2_"+i).text("");
				}else{
				
					$(".fre2_"+i).text(parseInt((($('input:checkbox[name="selected_2"]:checked').eq(i).val())/6)+1)+changeSeat(seatval2));
				}
			}
		}
		
		if($(this).attr("class")=="partseat 1partre"){//1구간 선택일때
			totalChecked=totalCheckedr;
		
			
		}else if($(this).attr("class")=="partseat 2partre"){//2구간 선택일때
			totalChecked2=totalCheckedr;
		}
	
});


$(".partbtn").on("click",function(){ //구간 선택부분 함수
	  
	var result=$(this).attr('id');
	  var other="";
	 if(result=="1partbtnid"){
		 
		$("#2part").hide();
		$("#1part").show();
		other="2partbtnid";
		 }else{
			 
			$("#1part").hide();
			$("#2part").show();
			other="1partbtnid";
		 }
	$("#"+result).css("background-color","#6D6E71");
	$("#"+result).children().removeClass("text-muted");
	$("#"+result).children().addClass("text-white");
	
	$("#"+other).children().addClass("text-muted");
	$("#"+other).children().removeClass("text-white");
	$("#"+other).css("background-color","white");
	$("#"+other).show();
});//구간 선택부분  함수 끝

});

</script>

</head>
<body>


   <%-- Top Start --%>
   <jsp:include page="../include/Top.jsp"></jsp:include>
   <%-- Top End --%>
<form action="${pageContext.request.contextPath}/reservation/selectseatsaction" method="get" name="formt" onsubmit="return fncheck();" > 
	   <c:set var="sear0" value="${sessionScope.searcharr[0]}"/> <!--변수 길어서 set해서 사용함-->
      <c:if test="${not empty sessionScope.searcharr[1]}">
		<input type="hidden" value="true" name="isroundtrip">
	    <c:set var="sear1" value="${sessionScope.searcharr[1]}"/> <!--변수 길어서 set해서 사용함-->
	 </c:if>
	  <c:if test="${empty sessionScope.searcharr[1]}">
		<input type="hidden" value="false" name="isroundtrip">
	 </c:if>

<div class="container mt-5">
  
  <div class="row">
  	<!--오른쪽 /전체 예약정보 시작--> 
	<div class="col-md-3 order-md-2 mb-4 mt-5">
		<ul class="list-group mb-3" >
        	<li class="list-group-item d-flex justify-content-between lh-condensed bg-light text-center ">
          		<div><h5 class="ml-5 text-muted"> <b>전체 예약정보</b></h5></div>
			</li>
       	    
       	    <li class="list-group-item d-flex justify-content-between lh-condensed">
      			<div class="small text-muted">
					 <b>
        				1구간: ${ sear0.starting}- ${sear0.destination}<br>
						${sear0.date} ${sear0.departure_time}  →  ${sear0.arrival_time} <br><br>
        		 	</b>
				 <c:if test="${not empty sessionScope.searcharr[1]}">
          			<b>
  
					2구간: ${sear1.starting} - ${sear1.destination}<br>
					${ sear1.date} ${sear1.departure_time}  →  ${sear1.arrival_time}<br>
         	 		</b>
       			</c:if>


	   			</div>
     	 </li>
     	
		 <!--항공권 가격 계산/ format 시작-->
         <c:choose>
         <c:when test="${isround ==true}"> <!-- 왕복일경우 -->
         <fmt:formatNumber value="${sear0.price * sear0.people +sear1.price * sear1.people}" pattern="#,###" var="price1" />
         <fmt:formatNumber value="${32000*sear0.people*2}" pattern="#,###" var="price2" />
         <fmt:formatNumber value="${9000*sear0.people*2}" pattern="#,###" var="price3" />
         <fmt:formatNumber value="${sear0.price * sear0.people +sear1.price * sear1.people
         +32000*sear0.people*2 + 9000*sear0.people*2
         }" pattern="#,###" var="price4" />
         
         </c:when>
         
         <c:otherwise> <!-- 편도일경우 -->
         <fmt:formatNumber value="${sear0.price * sear0.people}" pattern="#,###" var="price1" />
         <fmt:formatNumber value="${32000*sear0.people}" pattern="#,###" var="price2" />
         <fmt:formatNumber value="${9000*sear0.people}" pattern="#,###" var="price3" />
         <fmt:formatNumber value="${sear0.price *sear0.people
 			+32000*sear0.people + 9000*sear0.people
         }" pattern="#,###" var="price4" />
         
        </c:otherwise>
         </c:choose>
         <!--항공권 가격 계산/ format 끝-->
        
        
        
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >
      		성인 ${sear0.people}명
		 </div>
          <span class="text-muted small"><b>${price1} KRW</b></span>
 		</li>

        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >
           	항공사용료
          </div>
          <span class="text-muted small"><b>${price2} KRW</b></span>
        </li>      
 
         <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >
           	유류할증료 
          </div>
          <span class="text-muted small"><b>${price3} KRW</b></span>
		 </li>       

         <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >
           	지불예상금액 
          </div>
          <span class="text-muted "><b>${price4} KRW</b></span>
        </li>    
             
        <li class="list-group-item d-flex justify-content-between bg-light">
          <div class="text-success small text-danger">
			상기 운임은 결제완료 전까지 좌석상황에 따라 실시간 변동될 수 있습니다.<br><br>
          </div>
   		</li>
 
        <li class="list-group-item d-flex justify-content-between bg-dark text-white mt-3">
          <span>지불예상금액 </span>
          <strong>
          ${price4}
          KRW</strong>
        </li>
        
  		<li class="list-group-item d-flex justify-content-between lh-condensed pl-0 pr-0 pt-0 pb-0 mt-3">
        	<input class="btn  btn-lg btn-block text-white " type="submit" value="다음단계 " style="background-color: #D60815" required>
        </li>	
      </ul>

 </div><!--오른쪽 /전체 예약정보끝 -->    

       
<!--왼쪽  / 좌석 선택부분 시작-->
<div class="col-md-9 order-md-1">

        
<!-- 선택된 좌석배정 -->
<div class="mb-3">
<h4 class="pt-2 mb-2 mb-3"><b>좌석배정</b></h4>
	    <c:if test="${isround ==true}"> <!-- 왕복인 경우 -->
	    <div class="row">       
	      <div class="col-6 " >
          <h6 class="text-muted pb-1"><b class="text-dark">01.</b>${sear0.starting}  - ${ sear0.destination} |&nbsp;&nbsp; ${sear0.date} 
          </h6>
          
        <table class="table">
        <c:forEach items="${sessionScope.pasinfoarr}" var="data" varStatus="varstatus">
      	 <tr><td class="border border-left-0" width="50%">${data.pafname} ${data.paname}</td><td class="border border-right-0 fre1_${varstatus.index}" width="50%"></td></tr>
        </c:forEach>
       </table>
          
       </div>
       <div class="col-6 ">
          <h6 class="text-muted pb-1"><b class="text-dark">02.</b>${sear1.starting} -${sear1.destination} |&nbsp;&nbsp; ${sear1.date} </h6>
        <table class="table">
        <c:forEach items="${sessionScope.pasinfoarr}" var="data" varStatus="varstatus">
      	 <tr><td class="border border-left-0" width="50%">${data.pafname} ${data.paname}</td><td class="border border-right-0 fre2_${varstatus.index}" width="50%"></td></tr>
      	  
        </c:forEach>
       </table>
       </div>
       </div>
 
     </c:if>
     
   <c:if test="${isround ==false}">  <!-- 편도인 경우 -->
	    	<div class="col-12 " >
          <h6 class="text-muted pb-1"><b class="text-dark">01.</b>${sear0.starting}  - ${sear0.destination} |&nbsp;&nbsp; ${sear0.date} 
          </h6>
          
        <table class="table">
        <c:forEach items="${sessionScope.pasinfoarr}" var="data" varStatus="varstatus">
      	 <tr><td class="border border-left-0" width="50%">${data.pafname} ${data.paname}</td><td class="border border-right-0 fre1_${varstatus.index}" width="50%"></td></tr>
        </c:forEach>
       </table>
          
       </div> 
  </c:if>	
</div>
<!-- 선택된 좌석배정끝 -->        
        
        

<!-- 구간선택부분 -->
<div class="col-12 border text-center">
	
	<div class="row border">
      <div class="col-6 border text-center partbtn mr-0 pt-1 pb-2" id="1partbtnid">
          <h5 class="text-muted">${sear0.starting} <i class='fas fa-plane-departure pt-3'></i> ${sear0.destination}</h5>
       </div>
       <c:if test="${isround ==true}">
       <div class="col-6 border partbtn mr-0 pt-1 pb-2" id="2partbtnid" >
          <h5 class="text-muted">${sear1.starting} <i class='fas fa-plane-departure pt-3'></i> ${sear1.destination}</h5>
       </div>
    </c:if>
 	</div>

</div>
<!-- 구간선택부분끝 -->       
      
      
 <!-- 좌석선택부분   :1구간 시작  -->
<div class="col border mr-0 pr-0">
<div id="1part">
<div class="row">
<div class="col-1"></div>
</div>

<c:set var="count" value="1"></c:set> <!-- 좌석 행 출력때문에 count해줌-> 
<br>

<!--좌석모양나오는 부분-->
  <div class="col row mt-3 engseat"></div> <!--좌석ABCDEF출력되는 부분 class로 html넣어줌 -->
	
	<c:forEach var="data" items="${possibleseats1}" varStatus="varStatus">
	<c:if test="${(varStatus.index mod 6)==0 }">  <!-- 좌석들을 6개씩 출력하기 위해서 mod해줌 -->
  	 <div class="col row mt-3">
  	 <div class="col-2"></div>
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
      <div class="col-1 border bseat_1 pl-0 pr-0 pb-0 pt-0">
        <input class="partseat 1partre" type="checkbox" id="seat_1_${varStatus.index}" name="selected_1" value="${varStatus.index}">
       <label  for="seat_1_${varStatus.index}" class=" col-12 pl-4 pr-4 border mb-0" ><i class='far fa-user'></i></label></label>
      </div>
      </c:when>
      <c:when test="${data eq 1 }">
      <div class="col-1 border bg-light pl-0 pr-0 pb-0 pt-0">
       <input  class="partseat 1partre" type="checkbox" id="seat_1_${varStatus.index}" name="selected_1"  value="${varStatus.index}" disabled="disabled">
       <label   for="seat_1_${varStatus.index}" class=" col-12 pl-4 pr-4 border mb-0"><B>X</B></label>
       </div>
      </c:when>
   </c:choose>

   
   <c:if test="${(varStatus.index mod 6)== 5 }">
   </div>
   </c:if>

</c:forEach> <!--좌석모양나오는 부분 끝-->
	<div class="col row mt-3 engseat"></div><!--좌석ABCDEF출력되는 부분 class로 html넣어줌 --><br><br>
</div>

<!-- 2구간 -->
<div id="2part">
<div class="row">
<div class="col-1"></div>
</div>


<c:set var="count" value="1"></c:set> <!-- 좌석 행 출력때문에 count해줌-> 
<br>


<!--좌석모양나오는 부분-->
  <div class="col row mt-3 engseat"> </div>
<c:forEach var="data" items="${possibleseats2}" varStatus="varStatus">

   <c:if test="${(varStatus.index mod 6)==0 }">  <!--좌석들을 6개씩 출력하기 위해서 mod해줌 -->
   <div class="col row mt-3">
     <div class="col-2"></div>
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
      <div class="col-1 border bseat_2 pl-0 pr-0 pb-0 pt-0">
        <input class="partseat 2partre" type="checkbox" id="seat_2_${varStatus.index}" name="selected_2"  value="${varStatus.index}" >
       <label  for="seat_2_${varStatus.index}" class=" col-12 pl-4 pr-4 border mb-0" ><i class='far fa-user  pl-0'></i></label>
      </div>
      </c:when>
      <c:when test="${data eq 1 }">
      <div class="col-1 border bg-light pl-0 pr-0 pb-0 pt-0">
       <input class="partseat 2partre" type="checkbox" id="seat_2_${varStatus.index}" name="selected_${aak.index}_2" value="${varStatus.index}" disabled="disabled">
       <label  for="seat_2_${varStatus.index}" class=" col-12 pl-4 pr-4 border mb-0" ><B>X</B></label>
       </div>
      </c:when>
   </c:choose>


   
   <c:if test="${(varStatus.index mod 6)== 5 }">
   </div>
   </c:if>

</c:forEach> <!--좌석모양나오는 부분 끝-->
  <div class="col row mt-3 engseat">
   </div>
<br><br>


</div>
<!-- 2구간끝 -->
</div>
</div> <!--왼쪽  / 좌석 선택부분 끝-->  
</div>




</form>     
<div class="mb-5"></div>

   
   <%-- Footer Start --%>
   <jsp:include page="../include/Footer.jsp"></jsp:include>
   <%-- Footer End --%>
</body>
</html>