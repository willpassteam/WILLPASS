<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WILL PASS</title>
<!-- Bootstrap사용을 위한것 -->
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<!-- 달력을 위한 css + js -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 아이콘을 위한 css -->

<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<!-- 캐러셀을 위한 css -->

<style type="text/css">
.nc{
	font-size: 15px;
}
.subject {
	height: 70px;
}
#ma {
	background-image: url("${path}/img/Main/2번.jpg");
	height: 800px;
	background-repeat: no-repeat;
	background-size: 100% 60%;
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
.maintx-1{
	color:	#FF4500;
}
.maintx{
	color: 	#F8F8FF;
}
input[type="radio"] {
	display: none;
}
.pushimg:HOVER{
	cursor: pointer;
	
}
.pushimg img{
	-webkit-filter:brightness(80%);
}
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
<script>
$(window).load(function() {//로딩이미지    
    $('#loading').hide();  
   });
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
	var user_email = "${user_email}";
	var round_trip = $("[name=round_trip]:checked").val();
	if(round_trip == "0"){
		check4 = "값존재";	
	}
	if(user_email == ""){
		alert("로그인 후 이용가능합니다.");
		location.href = '../user/Userlogin.jsp';
		return;
	}
	
	if(check1 != "" &&check2 != "" &&check3 != "" &&check4 != "" &&check8 != "" ){
		$('#loading').show();	
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
	<div id="loading"><img id="loading-image" src="${path}/img/loading.gif" alt="Loading..." /></div>
	

	<div class="pt-5" id="ma">
		<h1 class="text-center maintx-1 ">
			<b>푸동푸동 타이완</b>
		</h1>
		<h4 class="text-center maintx ">두/근/거/림 가득한 여행지 대만</h4>
		<h4 class="text-center maintx">한달에 한번 ,실속있는 가격으로 구매하는 얼리버드 이벤트</h4>
		<p class="text-center mb-5 maintx ">이벤트 기간 : 2019.7.10~ 2019.08.11</p>


		<!--잠시 -->

		<div class="container pb-5">
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
			<br>
			<div class="Air mt-5">

				<h3 class="text-dark">추천 여행지</h3>
				<br>
				<div class="row ">
					<div class="col-sm-3 pushimg">
						<img alt="" src="${path}/img/Main/바르셀로나.jpg" width="100%">
						<a class="text-light" style="font-size:25px;position: absolute;bottom:20px;left:28%;">바로셀로나</a>
					</div>
					<div class="col-sm-3 pushimg">
						<img alt="" src="${path}/img/Main/로스앤젤레스.jpg" width="100%">
						<a class="text-light" style="font-size:25px;position: absolute;bottom: 20px;left:24%;">로스앤젤레스</a>
					</div>
					<div class="col-sm-3 pushimg">
						<img alt="" src="${path}/img/Main/런던.jpg" width="100%">
						<a class="text-light" style="font-size:25px;position: absolute;bottom: 20px;left:40%;">런던</a>
					</div>
					<div class="col-sm-3 pushimg">
						<img alt="" src="${path}/img/Main/샌프란시스코.jpg" width="100%">
						<a class="text-light" style="color:white;font-size:25px;position: absolute;bottom: 20px;left:40%;">로마</a>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	

	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>