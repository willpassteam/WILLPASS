<%@page import="net.reservation.db.PassengerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:formatNumber value="${searchprice}" pattern="#,###" var="forprice" />

<c:set var="resultseat" />
<c:set var="num_people" value="${sessionScope.searcharr[0].people}" />
<fmt:formatNumber value="${num_people}" type="number" var="numberpeople" />
<c:set var="isround" value="${sessionScope.searcharr[0].round_trip}"/>
    
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

var selone="";
function fnsele(res){
//    alert(res);
   selone=res;
   
}

var isroundtr=${isround}//왕복인지 편도인지 
var totalse=0;


var maxChecked = ${numberpeople};   //선택가능한 체크박스 갯수

var totalChecked = 0; // 설정 끝

var maxChecked2 = ${numberpeople};   //선택가능한 체크박스 갯수

var totalChecked2 = 0; // 설정 끝



if(isroundtr==true){
	
	totalse=maxChecked *2;
}else{
	
	totalse=maxChecked;
}


function changeSeat(seatnum){
	
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


function fncheck(){
	

	if($('input:checked').length<totalse){
		
		alert("좌석을선택하세요!");
		
	return false;
		
	}else{
		
		return true;
	}
	
	
	
	
	
}


$(function(){
   
	
	$("#1part").show();
	$("#2part").hide();
	$(".1partbtn").css("background-color","#6D6E71");
	$(".1partbtn").children().removeClass("text-muted");
	$(".1partbtn").children().addClass("text-white");
   
$(".1partseat").on("click",function(){
	

	var aa=${numberpeople};
	
    if (this.checked){ totalChecked += 1;
    }else{ totalChecked -= 1;
	$(this).parent().removeClass("border-danger");
    }

       if (totalChecked > maxChecked) {

           alert ("최대"+${numberpeople}+"선택가능");

       	this.checked = false;
       	totalChecked -= 1;
       }else{
    	
    		$("input:checked").parent().addClass("border-danger");
    		
    		for(var i=0;i<${numberpeople};i++){    		
    	
    			
       			if(typeof $('input:checked').eq(i).val()== 'undefined'){
       				$(".fre1_"+i).text("");
       				
       			}else{
       				
    			var sss2=$('input:checked').eq(i).val();
    			$(".fre1_"+i).text((parseInt($('input:checked').eq(i).val()/6)+1)+changeSeat(sss2));	
       			}
    			
    		}

    	 
       }

       
});


$(".2partseat").on("click",function(){
	 
	var aa=${numberpeople};
	
	//최대개수check하는 부분
    if (this.checked){ totalChecked2 += 1;
    }else{ totalChecked2 -= 1;
	$(this).parent().removeClass("border-danger");
    }

       if (totalChecked2 > maxChecked2) {

           alert ("최대"+${numberpeople}+"선택가능");

       	this.checked = false;
       	totalChecked2 -= 1;
       }else{
    	
   		$("input:checked").parent().addClass("border-danger");

   		for(var i=${numberpeople};i<${numberpeople}+${numberpeople};i++){    		
			
   			if(typeof $('input:checked').eq(i).val()== 'undefined'){
   				$(".fre2_"+i).text("");
   				
   			}else{
   				
			var sss2=$('input:checked').eq(i).val();
			$(".fre2_"+i).text((parseInt($('input:checked').eq(i).val()/6)+1)+changeSeat(sss2));	
   			}
   			
		
		}
   
      }

       
});





//구간 선택부분 

$(".1partbtn").on("click",function(){
	
	$("#2part").hide();
	$(".1partbtn").css("background-color","#6D6E71");
	$(".1partbtn").children().removeClass("text-muted");
	$(".1partbtn").children().addClass("text-white");
	
	$(".2partbtn").children().addClass("text-muted");
	$(".2partbtn").children().removeClass("text-white");
	$(".2partbtn").css("background-color","white");
	$("#1part").show();
});

$(".2partbtn").on("click",function(){
	

	$("#2part").show();
	$("#1part").hide();
	
	$(".2partbtn").css("background-color","#6D6E71");
	$(".2partbtn").children().removeClass("text-muted");
	$(".2partbtn").children().addClass("text-white");
	
	$(".1partbtn").children().addClass("text-muted");
	$(".1partbtn").children().removeClass("text-white");
	$(".1partbtn").css("background-color","white");

});



});
</script>



</head>
<body>


   <%-- Top Start --%>
   <jsp:include page="../include/Top.jsp"></jsp:include>
   <%-- Top End --%>
<form action="${pageContext.request.contextPath}/reservation/selectseatsaction" method="get" name="formt" onsubmit="return fncheck();" > 
      <c:if test="${not empty sessionScope.searcharr[1]}">
		<input type="hidden" value="true" name="isroundtrip">
	 </c:if>
	  <c:if test="${empty sessionScope.searcharr[1]}">
		<input type="hidden" value="false" name="isroundtrip">
	 </c:if>

<div class="container mt-5">
  <div class="row">
  
   <!-- 오른 --> 
    <div class="col-md-3 order-md-2 mb-4 mt-5">
<div class="mt-3 pt-3"></div>

      <ul class="list-group mb-3" >
              
        <li class="list-group-item d-flex justify-content-between lh-condensed bg-light text-center ">
          <div>
           <h5 class="ml-5 text-muted"> <b>전체 예약정보</b></h5>
          </div>

        </li>
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted">
       <b>
           ${ sessionScope.searcharr[0].starting}- ${ sessionScope.searcharr[0].destination}<br>
         ${ sessionScope.searcharr[0].date} ${ sessionScope.searcharr[0].departure_time}  →  ${ sessionScope.searcharr[0].arrival_time} <br><br>
          </b>

       <c:if test="${not empty sessionScope.searcharr[1]}">
            <b>
         ${ sessionScope.searcharr[1].starting} - ${ sessionScope.searcharr[1].destination}<br>
         ${ sessionScope.searcharr[1].date} ${ sessionScope.searcharr[1].departure_time}  →  ${ sessionScope.searcharr[1].arrival_time}<br>
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
          <strong>${forprice} KRW</strong>
        </li>
        
        <li class="list-group-item d-flex justify-content-between lh-condensed pl-0 pr-0 pt-0 pb-0 mt-3">
        <input class="btn  btn-lg btn-block text-white " type="submit" value="다음단계 " style="background-color: #D60815" id="nextbtn" >
        </li>   
      </ul>

       </div>

       
<!--왼쪽 -->

       <div class="col-md-9 order-md-1">
<!-- <h4 class="col-12  text-center pb-3"><p class="pt-3">좌석 배정<p></h4> -->
<!-- <hr> -->

        
<!-- 선택된 좌석배정 -->
<div class="mb-3">
<h4 class="pt-2 mb-2 mb-3"><b>좌석배정</b></h4>
	    <c:if test="${not empty sessionScope.searcharr[1]}">
	    <div class="row">       
	    	<div class="col-6 " >
          <h6 class="text-muted pb-1"><b class="text-dark">01.</b>${ sessionScope.searcharr[0].starting}  - ${ sessionScope.searcharr[0].destination} |&nbsp;&nbsp; ${ sessionScope.searcharr[0].date} 
          </h6>
          
        <table class="table">
        <c:forEach items="${sessionScope.pasinfoarr}" var="data" varStatus="varstatus">
      	 <tr><td class="border border-left-0" width="50%">${data.pafname} ${data.paname}</td><td class="border border-right-0 fre1_${varstatus.index}" width="50%"></td></tr>
        </c:forEach>
       </table>
          
       </div>
       <div class="col-6 ">
          <h6 class="text-muted pb-1"><b class="text-dark">02.</b>${ sessionScope.searcharr[1].starting} -${ sessionScope.searcharr[1].destination} |&nbsp;&nbsp; ${ sessionScope.searcharr[1].date} </h6>
        <table class="table">
        <c:forEach items="${sessionScope.pasinfoarr}" var="data" varStatus="varstatus">
      	 <tr><td class="border border-left-0" width="50%">${data.pafname} ${data.paname}</td><td class="border border-right-0 fre2_${numberpeople+varstatus.index}" width="50%"></td></tr>
      	  
        </c:forEach>
       </table>
       </div>
       </div>
 
     </c:if>
   <c:if test="${empty sessionScope.searcharr[1]}">
       <div class="col-6 border text-center  mr-0 pt-1 pb-2"><h5 class="text-muted">${ sessionScope.searcharr[0].starting}- ${ sessionScope.searcharr[0].destination}</h5></div>
       </c:if>	
</div>
<!-- 선택된 좌석배정끝 -->        
        
        

<!-- 구간선택부분 -->
<div class="col-12 border text-center">
<div class="row border">
	     <c:if test="${not empty sessionScope.searcharr[1]}">
       <div class="col-6 border  1partbtn mr-0 pt-1 pb-2" >
          <h5 class="text-muted">${ sessionScope.searcharr[0].starting}  <i class='fas fa-plane-departure pt-3'></i> ${ sessionScope.searcharr[0].destination}</h5>
       </div>
       <div class="col-6 border 2partbtn mr-0 pt-1 pb-2">
          <h5 class="text-muted">${ sessionScope.searcharr[1].starting} <i class='fas fa-plane-departure pt-3'></i> ${ sessionScope.searcharr[1].destination}</h5>
       </div>
     </c:if>
      <c:if test="${empty sessionScope.searcharr[1]}">
       <div class="col-6 border text-center 1partbtn mr-0 pt-1 pb-2"><h5 class="text-muted">${ sessionScope.searcharr[0].starting}- ${ sessionScope.searcharr[0].destination}</h5></div>
       </c:if>		
 </div>

</div>


<!-- 구간선택부분끝 -->       
      
      
 <!-- 좌석선택부분     1구간  -->
<div class="col border mr-0 pr-0">
<div id="1part">
<div class="row">
<div class="col-1"></div>
</div>

<c:set var="count" value="1"></c:set> <!-- 좌석 행 출력때문에 count해줌-> 
<br>

<!--좌석모양나오는 부분-->
  <div class="col row mt-3">
   <div class="col-2"></div>
   <div class="col-1 text-center"><b>A</b></div>
   <div class="col-1 text-center"><b>B</b></div>
   <div class="col-1 text-center"><b>C</b></div>
   <div class="col-1 text-center"></div>
   <div class="col-1 text-center"><b>D</b></div>
   <div class="col-1 text-center"><b>E</b></div>
   <div class="col-1 text-center"><b>F</b></div>
   </div>
<c:forEach var="data" items="${possibleseats1}" varStatus="varStatus">


   <c:if test="${(varStatus.index mod 6)==0 }">  <!--    좌석들을 6개씩 출력하기 위해서 mod해줌 -->
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
        <input class="1partseat" type="checkbox" id="seat_1_${varStatus.index}" name="selected_1" value="${varStatus.index}">
       <label  for="seat_1_${varStatus.index}" class=" col-12 pl-4 pr-4 border mb-0" ><i class='far fa-user'></i></label></label>
      </div>
      </c:when>
      <c:when test="${data eq 1 }">
      <div class="col-1 border bg-light pl-0 pr-0 pb-0 pt-0">
       <input  class="1partseat" type="checkbox" id="seat_1_${varStatus.index}" name="selected_1"  value="${varStatus.index}" disabled="disabled">
       <label   for="seat_1_${varStatus.index}" class=" col-12 pl-4 pr-4 border mb-0"><B>X</B></label>
       </div>
      </c:when>
   </c:choose>

   
   <c:if test="${(varStatus.index mod 6)== 5 }">
   </div>
   </c:if>

</c:forEach> <!--좌석모양나오는 부분 끝-->
  <div class="col row mt-3">
   <div class="col-2"></div>
   <div class="col-1 text-center"><b>A</b></div>
   <div class="col-1 text-center"><b>B</b></div>
   <div class="col-1 text-center"><b>C</b></div>
   <div class="col-1 text-center"></div>
   <div class="col-1 text-center"><b>D</b></div>
   <div class="col-1 text-center"><b>E</b></div>
   <div class="col-1 text-center"><b>F</b></div>
   </div>
<br><br>

</div>

<!-- 2구간 -->
<div id="2part">
<div class="row">
<div class="col-1"></div>
</div>


<c:set var="count" value="1"></c:set> <!-- 좌석 행 출력때문에 count해줌-> 
<br>


<!--좌석모양나오는 부분-->
  <div class="col row mt-3">
   <div class="col-2"></div>
   <div class="col-1 text-center"><b>A</b></div>
   <div class="col-1 text-center"><b>B</b></div>
   <div class="col-1 text-center"><b>C</b></div>
   <div class="col-1 text-center"></div>
   <div class="col-1 text-center"><b>D</b></div>
   <div class="col-1 text-center"><b>E</b></div>
   <div class="col-1 text-center"><b>F</b></div>
   </div>
<c:forEach var="data" items="${possibleseats2}" varStatus="varStatus">

   <c:if test="${(varStatus.index mod 6)==0 }">  <!--    좌석들을 6개씩 출력하기 위해서 mod해줌 -->
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
        <input class="2partseat" type="checkbox" id="seat_2_${varStatus.index}" name="selected_2"  value="${varStatus.index}" >
       <label  for="seat_2_${varStatus.index}" class=" col-12 pl-4 pr-4 border mb-0" ><i class='far fa-user  pl-0'></i></label>
      </div>
      </c:when>
      <c:when test="${data eq 1 }">
      <div class="col-1 border bg-light pl-0 pr-0 pb-0 pt-0">
       <input class="2partseat" type="checkbox" id="seat_2_${varStatus.index}" name="selected_${aak.index}_2" value="${varStatus.index}" disabled="disabled">
       <label  for="seat_2_${varStatus.index}" class=" col-12 pl-4 pr-4 border mb-0" ><B>X</B></label>
       </div>
      </c:when>
   </c:choose>


   
   <c:if test="${(varStatus.index mod 6)== 5 }">
   </div>
   </c:if>

</c:forEach> <!--좌석모양나오는 부분 끝-->
  <div class="col row mt-3">
   <div class="col-2"></div>
   <div class="col-1 text-center"><b>A</b></div>
   <div class="col-1 text-center"><b>B</b></div>
   <div class="col-1 text-center"><b>C</b></div>
   <div class="col-1 text-center"></div>
   <div class="col-1 text-center"><b>D</b></div>
   <div class="col-1 text-center"><b>E</b></div>
   <div class="col-1 text-center"><b>F</b></div>
   </div>
<br><br>


</div>
<!-- 2구간끝 -->


</div>




<!-- 좌석선택부분끝       -->
</div>


    
<!--왼쪽끝 -->       
       
  

</div>
</div>

</form>     
<div class="mb-5"></div>

   
   <%-- Footer Start --%>
   <jsp:include page="../include/Footer.jsp"></jsp:include>
   <%-- Footer End --%>
</body>
</html>