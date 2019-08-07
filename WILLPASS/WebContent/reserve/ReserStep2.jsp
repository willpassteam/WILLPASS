<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>2.탑승자정보입력</title>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- 아이콘을 위한 css -->


<style type="text/css">
#lab1{
 border-left: 5px solid blue;
}
.rebo{
	outline: none;
	box-shadow: none !important;
 	border:1px solid #ccc !important; 
	border: none;
 	background: transparent;
	border-top: transparent !important;
	border-left: transparent !important;
	border-right: transparent !important;
	border-bottem: transparent !important;
	font-weight: 200;
	padding-left: 0;
}
.inbox{
	outline: none;
	box-shadow: none !important;
 	background: transparent;
	font-weight: 200;
	padding-left: 0;
}
</style>

<script type="text/javascript">
$(function(){
	
	$(".namecheck").on("blur",function(){ //이름 유효성검사
		var nameref=/^[a-zA-Z]{2,10}$/;
	 if(nameref.test($(this).val())==false){
	
			if($(this).val()!=""){
				alert("영문자를 입력해주세요!");
			}
			$(this).val("");
		} 
		});
	
	$(".tel2c").on("blur",function(){//전화번호 유효성검사1
		
		var tel2ref =/^[0-9]{3,4}$/;
	 if(tel2ref.test($(this).val())==false){
			

			if($(this).val()!=""){
				alert("올바른 전화번호를 입력하세요!");
			}
			$(this).val("");
			
		}
		
	});
	$(".tel3c").on("blur",function(){//전화번호 유효성검사2
		
		var tel3ref =/^[0-9]{4}$/;
		
	 if(tel3ref.test($(this).val())==false){
			
			if($(this).val()!=""){
				alert("올바른 전화번호를 입력하세요!");
			}
			$(this).val("");
			
		}
		
	});
	
	$(".emailc1").on("blur",function(){//이메일 유효성검사1
		
		var emailc1ref =/^[0-9a-zA-Z]{2,15}$/;
		 if(emailc1ref.test($(this).val())==false){
				
				if($(this).val()!=""){
					alert("올바른 이메일을 입력하세요");
				}
				$(this).val("");
		}
		
	});
	
	$(".emailc2").on("blur",function(){//이메일 유효성검사2
		
		var emailc1ref =/^((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	 if(emailc1ref.test($(this).val())==false){
			
			if($(this).val()!=""){
				alert("올바른 이메일을 입력하세요");
			}
			$(this).val("");
		}
	});	
	
});
</script>
	
</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	<c:set var="sear0" value="${sessionScope.searcharr[0]}"/>
	
	<form action="${pageContext.request.contextPath}/reservation/passengerInfoaction" >
	<input type="hidden" value="${ sessionScope.searcharr[0].people}" name="num_people">
<div class="container mt-5">

  <div class="row">
 
<!--오른쪽 /전체 예약정보 --> 
<div class="col-md-3 order-md-2 mb-4">
		<ul class="list-group mb-3" >
        	<li class="list-group-item d-flex justify-content-between lh-condensed bg-light text-center ">
          		<div><h5 class="ml-5 text-muted"> <b>전체 예약정보</b></h5></div>
			</li>
       	    <li class="list-group-item d-flex justify-content-between lh-condensed">
          	<div class="small text-muted">
      			<b>
        		1구간:${sear0.starting}- ${sear0.destination}<br>
				${sear0.date} ${sear0.departure_time}  →  ${sear0.arrival_time} <br><br>
      			<c:if test="${not empty sessionScope.searcharr[1]}">
      			<c:set var="sear1" value="${sessionScope.searcharr[1]}"/>
				2구간: ${sear1.starting} - ${sear1.destination}<br>
				${sear1.date} ${sear1.departure_time}  →  ${sear1.arrival_time}<br>
         	 	</c:if>
         	 	</b>
 		 </div>
     	 </li>
     	  <!--항공권 가격 계산/ format 시작-->
         <c:choose>
         <c:when test="${not empty sessionScope.searcharr[1]}"> <!-- 왕복일경우 -->
         <fmt:formatNumber value="${sear0.price *sear0.people +sear1.price * sear1.people}" pattern="#,###" var="price1" />
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
         <fmt:formatNumber value="${sear0.price * sear0.people
 			+32000*sear0.people + 9000*sear0.people
         }" pattern="#,###" var="price4" />
         
        </c:otherwise>
         </c:choose>
        <!--항공권 가격 계산/ format 끝-->
    	 <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >성인 ${sear0.people}명</div>
          <span class="text-muted small"><b>${price1} KRW</b></span>
 		 </li>

        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >항공사용료</div>
          <span class="text-muted small"><b>${price2} KRW</b></span>
		</li>      
 
         <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >유류할증료 </div>
          <span class="text-muted small"><b>${price3} KRW</b></span>
		 </li>       

         <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >지불예상금액 </div>
          <span class="text-muted "><b>${price4} KRW</b></span>
        </li> 
                
        <li class="list-group-item d-flex justify-content-between bg-light">
          <div class="text-success small text-danger">
			상기 운임은 결제완료 전까지 좌석상황에 따라 실시간 변동될 수 있습니다.<br><br>
          </div>
		</li>
 
        <li class="list-group-item d-flex justify-content-between bg-dark text-white mt-3">
          <span>지불예상금액 </span>
          <strong>${price4}KRW</strong>
        </li>
        
  		<li class="list-group-item d-flex justify-content-between lh-condensed pl-0 pr-0 pt-0 pb-0 mt-3">
        <input class="btn  btn-lg btn-block text-white " type="submit" value="다음단계 " style="background-color: #D60815" required>
        </li>	
      </ul>

 </div><!--오른쪽 /전체 예약정보끝 -->    
    
<!-- 왼쪽  -->
    <div class="col-md-9 order-md-1">

		<!-- 탑승자 정보  -->
		<!-- 탑승자수 people이 string type이기때문에 numbertype으로 바꿈 -->
		<c:set var="num_people" value="${sessionScope.searcharr[0].people}" />
		<fmt:formatNumber value="${num_people}" type="number" var="numberpeople" />
									<!-- 		<h5 class="mt-3 mb-4 text-dark" id="passengerInfo"> <i class='fas fa-plane'></i><b>탑승자 정보</b></h5> -->
		<c:forEach begin="1" step="1" end="${numberpeople}" varStatus="status" >
		<h4 class="pt-1"><b>성인${status.index}</b></h4>
  	   		<div class="mb-3 pl-3 pt-3 pr-3 pm-3 ">
 			<div class="row">
			<div class="col-12 pl-0 small">
			<table class="table  pt-0 border border-right-0">
			<tr>
			<td width="20%" style="background-color: #6D6E71" class="text-white">승객구분</td>
			<td width="80%">    
				<div class="row pl-3 pr-3">
					<div class="form-check pr-3">
      				<label class="form-check-label" for="woman${status.index}">
       				<input type="radio" class="form-check-input" id="woman${status.index}" name="gender${status.index}"  value="남자" checked="checked">남자
     				</label>
    				</div>
    				<div class="form-check">
      				<label class="form-check-label" for="man${status.index}">
       				<input type="radio" class="form-check-input" id="man${status.index}" name="gender${status.index}"  value="여자">여자</label>
    				</div>
				</div>
			</td>
			</tr>
			<tr>
			<td width="20%" style="background-color: #6D6E71" class="text-white ">성(Family Name)</td>
			<td width="80%"><input type="text"   style="text-transform:uppercase"  class="mr-5 form-control input-sm col-6 border rebo namecheck" name="familyName${status.index}" required></td>
			</tr>
			<tr>
			<td width="20%" style="background-color: #6D6E71" class="text-white">이름(Given Name)</td>
			<td width="80%"><input type="text"   style="text-transform:uppercase"  class="form-control input-sm col-6 border rebo namecheck" name="givenName${status.index}" required ></td>
			</tr>
	   </table> 
  	   </div>
 	   </div>
  	   </div>

</c:forEach> 	<!-- 탑승자 정보 끝-->

<!-- 예매자정보 -->

    <div class="mb-3 small mt-5 ">
    <div class="mt-3 mb-4 text-dark">
  	<h4 class=" text-center"><b>예매자 연락처 정보</b></h4>

    </div>
  		<table class="table">
			<tbody>
				<tr>
				<td width="20%" class="text-white" style="background-color: #6D6E71" >SMS수신 연락처</td>
				<td width="80%">
				<div class="col row">
  				<select class="form-control col-4 ml-1 " id="sel1">
   				 <option>+82(대한민국)</option>
   				 <option>+86(중국)</option>
    			 <option>+81(일본)</option>
				</select>				
				 &nbsp;&nbsp;_<input type="text" class="form-control  col-2 input-sm ml-2 inbox tel2c" name="tel1" required>&nbsp;&nbsp;_ 
				 <input type="text" class="form-control  col-2 input-sm ml-2 inbox tel2c"name="tel2" required>&nbsp;&nbsp;_
				 <input type="text" class="form-control  col-2 input-sm ml-2 inbox tel3c"name="tel3" required>
				</div>
				<p class="ml-1 mt-2 text-muted">
				전화번호를 통해 탑승권 안내 및 예약상황을  알려드립니다.<br>
				전화번호변경을 원할시 고객센터로 문의해주시기 바랍니다.
				</p>
				</td>
				</tr>
				<tr>
				<c:set var="array" value="${fn:split(user_email, '@') }" />

				<td width="20%" class="text-white" style="background-color: #6D6E71">이메일주소</td>
				<td width="80%">
				<div class="col row">
			

				<input type="text" class="form-control  col-4 input-sm ml-2 inbox emailc1" name="email1" value="${array[0]}" readonly="readonly">&nbsp;&nbsp;<p class="pt-1 d-inline-block">@</p>
				 <input type="text" class="form-control  col-4 input-sm ml-2 inbox emailc2" name="email2" value="${array[1]}" readonly="readonly">
				 
				</div>
				<p class="ml-1 mt-2 text-muted">
				이메일을 통해 예약상황을 알려드립니다.
				</p>
				</td>
				</tr>
							
		    </tbody>
  		</table>		
		
	</div> <!-- 예매자정보끝-->
 	<hr class="mb-4">
    <div class="mb-3 small bg-light text-dark pl-3 pt-3 pr-3 pm-3 border mt-3 mb-5">
	<b>유의사항</b><br>
	<ul>
	<li>기내반입제한품목을 반드시 확인하시기 바랍니다.</li>
	<li><p class="text-danger d-inline-block mb-0">소아/유아의 나이구분은 여행일(탑승일) 기준이며, 나이를 확인 할 수 있는 서류(여권)를 반드시 지참 하시기 바랍니다.</p></li>
	<li><p class="text-danger d-inline-block mb-0">동명이인의 경우 인터넷으로 동시 예약이 불가능 하오니, 각 탑승자 별로 인터넷 예약을 진행해 주시기 바랍니다.</p></li>
	</ul>
    </div>
    
    </div>
  </div>


</div>
 </form> 
 <div class="pb-5"></div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>