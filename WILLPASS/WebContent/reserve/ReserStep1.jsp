
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   <%
   		request.setCharacterEncoding("UTF-8");
   %>

<c:if test="${!empty newlist2}">
	<c:set var="roundtrip" value="true"/>
</c:if>
<c:if test="${empty newlist2}">
	<c:set var="roundtrip" value="false"/>
</c:if>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1.여정선택</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<!-- 아이콘을 위한 css -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



	<style type="text/css">
	.nt{
		color: black;
		font-weight: bold;
	}
		input[type="text"], textarea {
		outline: none;
		box-shadow: none !important;
		/* border:1px solid #ccc !important; */
		border: none;
		background: transparent;
		border-top: transparent !important;
		border-left: transparent !important;
		border-right: transparent !important;
		border-bottem: transparent !important;
		font-weight: 200;
		padding-left: 0;
		
	}
	input[type="radio"] {
		display: none;
	}
	</style>
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
			 
			 if(!(td7 == "마감" || td7 == "예약불가")){
			 				 				 								 
			 	$(".reserve1").html("${newlist[0].starting} -> ${newlist[0].destination}"+ "&nbsp;/" +"<br>"+  "${newlist[0].date}" + "<br>"
			 						+ td3 + "&nbsp;"+ td1);
		
				$(".select:eq("+ index +") >td").css("background-color","Gainsboro");
				$(".select:not(:eq("+ index +")) >td").css("background-color","white");
			 	
			//항공편요금
			depart1 = parseInt($(".select:eq("+ index +") >td")[6].innerHTML );
			if(depart2 == null){
				$("#subtotal").html(makeComma((depart1)* "${newlist[0].people}"));
				$(".price1").val(depart1);
			}else{
				$("#subtotal").html(makeComma((depart1 + depart2)*"${newlist[0].people}"));
				$(".price1").val(depart1);
			}
			
			//항공사용료
			usage1 = 32000;
			if(usage2 == null){
				$("#usage").html(makeComma((usage1)*"${newlist[0].people}"));
			}else{
				$("#usage").html(makeComma((usage1 + usage2)*"${newlist[0].people}"));
			}			
			//유류할증료
			fuelfee1 = 9000;
			if(fuelfee2 == null){
				$("#fuelfee").html(makeComma((fuelfee1)*"${newlist[0].people}"));
			}else{
				$("#fuelfee").html(makeComma((fuelfee1 + fuelfee2)*"${newlist[0].people}"));
			}				
			//지불예상금액
			sum1 = depart1 + usage1 + fuelfee1;
			if(sum2 == null){
				$(".sum").html(makeComma((sum1)*"${newlist[0].people}"));
			}else{
				$(".sum").html(makeComma((sum1 + sum2)*"${newlist[0].people}"));
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
			 	}		
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
			 
			 if(!(td8 == "마감" || td8 == "예약불가")){

			 	$(".reserve2").html("${newlist2[0].starting} -> ${newlist2[0].destination}" + "&nbsp;/" +"<br>"+ "${newlist2[0].date}" +"<br>" 
			 							+ td4 + "&nbsp;"+ td2);

 				$(".select2:eq("+ index2 +") >td").css("background-color","Gainsboro");
				$(".select2:not(:eq("+ index2 +")) >td").css("background-color","white");

				//항공편요금
				depart2 = parseInt($(".select2:eq("+ index2 +") >td")[6].innerHTML);
				$("#subtotal").html(makeComma((depart1 + depart2)*"${newlist2[0].people}"));
				$(".price2").val(depart2);
				
				//항공사용료
				usage2 = 32000;
				$("#usage").html(makeComma((usage1 + usage2)*"${newlist2[0].people}"));
			
				//유류할증료
				fuelfee2 = 9000;
					$("#fuelfee").html(makeComma((fuelfee1 + fuelfee2)*"${newlist2[0].people}"));
					
				//지불예상금액				
				sum2 = depart2 + usage2 + fuelfee2;
					$(".sum").html(makeComma((sum1 + sum2)*"${newlist2[0].people}")); 
					
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
			 }
			});
		});
	
	$(function () {
			$("#nextBtn").click(function() {
				var user_email = "${user_email}";
				if(user_email == ""){
					alert("로그인 후 이용가능합니다.");
					location.href = '../user/Userlogin.jsp';
					return;
				}
				if("${roundtrip}" == "true"){
					if(depart2 != ""){
		 				if($(".airline1").val() == "" || $(".airline2").val() == ""){
		 					alert("항공편을 선택해 주세요!");
						}else if($(".airline1").val() == "" && $(".airline2").val() == ""){
							alert("항공편을 선택해 주세요!");
						}else{
							
							$("#nextRes").submit();
						}	
					}else if(depart1 != ""){
		 				if($(".airline1").val() == ""){
		 					alert("항공편을 선택해 주세요!");
						}else{
							$("#nextRes").submit();
						}
					}
				}else{
					if($(".airline1").val() == ""){
	 					alert("항공편을 선택해 주세요!");
					}else{
						$("#nextRes").submit();
					}
				} 
			
			});
		}); 
		
		function makeComma(str) {
			var str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		$(function() {
			var dateFormat = "yymmdd", from = $("#from").datepicker(
					{
						minDate : 0,
						maxDate : "+2M",
						changeMonth : true,
						numberOfMonths : 2,
						prevText : '이전 달',
						nextText : '다음 달',
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
								'8월', '9월', '10월', '11월', '12월' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						showMonthAfterYear : true,
						yearSuffix : '년',
						dateFormat : 'yymmdd'
					}).on("change", function() {
				to.datepicker("option", "minDate", getDate(this));
			}), to = $("#to").datepicker(
					{
						minDate : 0,
						maxDate : "+2M",
						changeMonth : true,
						numberOfMonths : 2,
						prevText : '이전 달',
						nextText : '다음 달',
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
								'8월', '9월', '10월', '11월', '12월' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						showMonthAfterYear : true,
						yearSuffix : '년',
						dateFormat : 'yymmdd'
					}).on("change", function() {
				from.datepicker("option", "maxDate", getDate(this));
			});
			function getDate(element) {
				var date;
				try {
					date = $.datepicker.parseDate(dateFormat, element.value);
				} catch (error) {
					date = null;
				}
				return date;
			}
			// 편도 왕복 기능 
			$(".round_trip_div").on("click",function(){
				var temp = $(':radio[name="round_trip"]:checked').val();
				if(temp == "1"){
					
					$(".to_div").attr("style","display:none");
				}else{
					$(".to_div").attr("style","display:flex");
				}
				

			})
			
			
			$("#starting").autocomplete({
				source : function(request, response) { //많이 봤죠? jquery Ajax로 비동기 통신한 후 
					var city = $("#starting").val();
					//json객체를 서버에서 내려받아서 리스트 뽑는 작업
					$.ajax({
						//호출할 URL 
						url : "${path}/endcheck",
						//우선 jsontype json으로 
						dataType : "json",
						// parameter 값이다. 여러개를 줄수도 있다. 
						data : { //request.term >> 이거 자체가 text박스내에 입력된 값이다. 
							city : city
						},
						success : function(result) { //return 된놈을 response() 함수내에 다음과 같이 정의해서 뽑아온다. 
							response($.map(result, function(item) {
								return {
									label : item.city,
									value : item.city
								}
							}));
						}
					});
				},
				//최소 몇자 이상되면 통신을 시작하겠다라는 옵션 
				minLength : 1,
				//자동완성 목록에서 특정 값 선택시 처리하는 동작 구현 
				//구현없으면 단순 text태그내에 값이 들어간다. 
				select : function(event, ui) {
				},
				focus : function(event, ui) {
					return false;
				}
			});
			$("#destination").autocomplete({
				source : function(request, response) { //많이 봤죠? jquery Ajax로 비동기 통신한 후 
					var city = $("#destination").val();
					//json객체를 서버에서 내려받아서 리스트 뽑는 작업
					$.ajax({
						//호출할 URL 
						url : "${path}/endcheck",
						//우선 jsontype json으로 
						dataType : "json",
						// parameter 값이다. 여러개를 줄수도 있다. 
						data : { //request.term >> 이거 자체가 text박스내에 입력된 값이다. 
							city : city
						},
						success : function(result) { //return 된놈을 response() 함수내에 다음과 같이 정의해서 뽑아온다. 
							response($.map(result, function(item) {
								return {
									label : item.city,
									value : item.city
								}
							}));
						}
					});
				},
				//최소 몇자 이상되면 통신을 시작하겠다라는 옵션 
				minLength : 1,
				//자동완성 목록에서 특정 값 선택시 처리하는 동작 구현 
				//구현없으면 단순 text태그내에 값이 들어간다. 
				select : function(event, ui) {
				},
				focus : function(event, ui) {
					return false;
				}
			});
			


		});
		function captureReturnKey(e) {// 엔터키 막는 구간
		    if(e.keyCode==13)
		    return false;
		}
		function fnSubmit(){
			var check1 = $("[name=starting]").val();
			var check2 = $("[name=destination]").val();
			var check3 = $("[name=from]").val();
			var check4 = $("[name=to]").val();
			var check5 = $("[name=adult]").val();
			var check6 = $("[name=child]").val();
			var check7 = $("[name=baby]").val();
			var check8 = check5 +check6 +check7;
			var round_trip = $("[name=round_trip]:checked").val();
			if(round_trip == "0"){
				check4 = "값존재";	
			}
			
			if(check1 != "" &&check2 != "" &&check3 != "" &&check4 != "" &&check8 != ""){
				document.search.submit();
			}else{
				for (var i = 0; i < 7; i++) {
					if($("input[type=text]:eq("+i+")").val() == ""){
						if(round_trip == "0" && i == 3 ){
							++i;
						}				
						alert('입력하지 않은 사항이 있습니다.');
						$("input[type=text]:eq("+i+")").focus();
						break;
					}
				}
			}
		}
	</script>

</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	<div class="container mb-5 mt-3  "> 
		<h2 ><b>국제선 예약</b></h2>

		<form autocomplete="off" onkeydown="return captureReturnKey(event)" onsubmit="return false;" action="searchpro.jin" method="post" name="search">
				<div class="container mt-5 ">
					<div class="btn-group btn-group-toggle mb-2 round_trip_div" data-toggle="buttons">
						<label for="round_trip" class="btn btn-outline-dark btn-light active"><input type="radio" name="round_trip" value="1" class="custom-radio mr-0" checked="checked">왕복</input></label> <label
							for="round_trip" class="btn btn-outline-dark btn-light"><input type="radio" name="round_trip" value="0" class="custom-radio ml-0">편도</input></label>
					</div>
				</div>
				<div class="Search border pl-5 pr-5 bg-light rounded">
					<br>
					<div class="row 1row">
						<div class="col-sm-3">
							<div class="input-group mb-3 border border-top-0 border-right-0 border-left-0">
								<i class='fas fa-plane-departure pt-3'></i> <input type="text" class="form-control shadow-none" name="starting" id="starting" placeholder="출발지">
							</div>
						</div>
						<div class="col-sm-3 ">
							<div class="input-group mb-3 border border-top-0 border-right-0 border-left-0 ">
								<i class='fas fa-plane-arrival pt-3'></i> <input type="text" class="form-control" name="destination" id="destination" placeholder="도착지">
							</div>
						</div>
						<div class="col-sm-6 row pt-0">
							<div class="col-6">
								<div class="input-group mb-3 input-daterange border border-top-0 border-right-0 border-left-0" id="datepicker1">
									<i class='	far fa-calendar-alt pt-3'></i> <input type="text" class="form-control" id="from" name="from" placeholder="가는날" width="50px">
								</div>
							</div>
							<div class="col-6">
								<div class="input-group mb-3 rt input-daterange border border-top-0 border-right-0 border-left-0 to_div" id="datepicker2">

									<input type="text" class="form-control" id="to" name="to" placeholder="오는날" width="50px">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2">
							<div class="input-group mb-3 border border-top-0 border-right-0 border-left-0">
								<i class='far fa-user pt-3'></i> <input type="text" class="form-control" name="adult" placeholder="성인">
							</div>
						</div>
						<div class="col-sm-2">
							<div class="input-group mb-3 border border-top-0 border-right-0 border-left-0">
								<i class='far fa-user pt-3'></i> <input type="text" class="form-control" name="child" placeholder="소아">
							</div>
						</div>
						<div class="col-sm-2">
							<div class="input-group mb-3 border border-top-0 border-right-0 border-left-0">
								<i class='far fa-user pt-3'></i> <input type="text" class="form-control" name="baby" placeholder="유아">
							</div>
						</div>
						<div class="col-sm-6 border border-top-0 border-right-0 border-left-0 border">
							<input type="button" class="btn btn-outline-primary" onclick="fnSubmit()" value="항공권 검색">
						</div>
					</div>
				</div>
			</form>

	</div>
<hr size="20px">
<!-- <hr> -->
<!-- 	<img src="../img/Reser/step1.png" width="100%" class="mb-3"> -->
	<div class="container">


  <div class="row">
<!--  오른쪽 -->
  
     <div class="col-md-3 order-md-2 mb-4 mt-5">
     
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
      
	<form id="nextRes" action="${contextPath}/reserve1/ReserStep2.do" method="post" > 
      	
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
        
        <li class="list-group-item d-flex justify-content-between lh-condensed" >
          <div class="small text-muted" >
           	성인 ${newlist[0].people} 명
          </div>
          <span class="text-muted small" id="subtotal" ></span>
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
  	  
  	  <%-- 	<c:if test="${sessionScope.newlist2 != null}"> --%>
  	  
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
  		<input type="hidden" name="time2" value="">
    	
    	<%-- </c:if> --%>
    		
        <input class="btn  btn-lg btn-block text-white" id="nextBtn" type="button" value="다음단계 " style="background-color: #D60815" >
        </li>	
      </ul>
     </form> 
   </div>
    
<!--  왼쪽 -->

 <div class="col-md-9 order-md-1">
	<!-- 가격 정렬 버튼 -->

 	<div align="right">
 		<form action="${contextPath}/reserve1/ReserStep1.do">
 		정렬 순서: 
	 		<select name="order" class="custom-select col-2" >
	 			<option value="3">시간순</option>
	 			<option value="1">낮은 가격순</option>
	 			<option value="2">높은 가격순</option> 		
	 		</select>
	 		<input type="submit" value="재검색" class="btn btn-outline-dark">
 		</form>
 	</div>
 	
	<i class='fas fa-plane' style='font-size:30px'></i>
	${newlist[0].starting} -> ${newlist[0].destination} : ${newlist[0].date} 
	
	<div style="overflow: auto;  height: 400px">
  		<table class="table mt-3">

    		<tbody>
			<tr class="bg-light">
			<td>출발-도착시간 (소요시간)</td>
			<td>항공사</td>		
			<td>항공편</td>	
			<td>금액</td>
			<td>잔여석</td>
			<td style="display: none;">소요시간</td>
			<td style="display: none;">금액</td>
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
			<c:if test="${air.departure_time == null}">
			</c:if>
			<c:if test="${air.departure_time != null}">
			<tr class="select">
				<td >${air.departure_time} - ${air.arrival_time} (${air.time})</td>
				<td >${air.airline}</td>
				<td >${air.flight}</td>
				<td ><fmt:formatNumber>${air.price}</fmt:formatNumber></td>
			<c:if test="${air.checkseat}">
				<td >${air.leftseat}</td>
			</c:if>	
			<c:if test="${!air.checkseat}">
				<c:if test="${air.leftseat <= 0}">
						<td >마감</td>
				</c:if>
				<c:if test="${air.leftseat > 0}">
						<td >예약불가</td>
				</c:if>
			</c:if>	
				<td style="display: none;">${air.time}</td>
				<td style="display: none;">${air.price}</td>				
			</tr>			
			
			</c:if>	
		</c:forEach>

	</c:when>
	</c:choose>	
	    
  		</table>	
</div>
 	<br>
 	<c:if test="${sessionScope.newlist2 != null}">
	<i class='fas fa-plane' style='font-size:30px'></i>
	<!-- 2구간 부산 큐슈(후쿠오카) 07/14(일) -->
	${newlist2[0].starting} -> ${newlist2[0].destination} : ${newlist2[0].date}
	
	<div style="overflow: auto;  height: 400px">
  		<table class="table mt-3">

    		<tbody>
			<tr class="bg-light">
			<td>출발-도착시간 (소요시간)</td>
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
			<c:if test="${air2.departure_time == null}">
			</c:if>
			<c:if test="${air2.departure_time != null}">
			<tr class="select2">
				<td >${air2.departure_time} - ${air2.arrival_time} (${air2.time})</td>
				<td >${air2.airline}</td>
				<td >${air2.flight}</td>
				<td ><fmt:formatNumber>${air2.price}</fmt:formatNumber></td>	
			<c:if test="${air2.checkseat}">
				<td >${air2.leftseat}</td>
			</c:if>	
			<c:if test="${!air2.checkseat}">
				<c:if test="${air2.leftseat <= 0}">
						<td >마감</td>
				</c:if>
				<c:if test="${air2.leftseat > 0}">
						<td >예약불가</td>
				</c:if>
			</c:if>		
				<td style="display: none;">${air2.time}</td>
				<td style="display: none;">${air2.price}</td>					
			</tr>	
		</c:if>			
		</c:forEach>
	</c:when>		
	</c:choose>		

  		</table>	
  	</div>
 	</c:if>

 		
 		<div class="border small text-dark mt-5 bg-light">
 		<ul class="mt-3">
 		<b>안내사항</b>
 		<li class="mt-2">이벤트항공권은 예약 변경이 불가능합니다.</li>
		<li> 선택하신 항공편에 따라 지불예상금액을 확인하여 주시기 바랍니다..</li>
		</ul>
 		</div>
 
 
 	</div>	<!--   왼쪽끝 -->
	</div><!--  row끝 -->
	</div><!--  container끝 -->
 <div class="pb-5"></div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>