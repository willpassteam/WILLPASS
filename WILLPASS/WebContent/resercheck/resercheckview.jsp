<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>

<style type="text/css">
input[type="text"], textarea {
	box-shadow: none !important;
	font-weight: 200;
	padding-left: 0;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resercheck/datejs.js"></script>
<script type="text/javascript" >
function fncheckresult(){ //날짜로 예약 검색 할때 
	
	if(($("#to").val()=="") &&($("#from").val()=="")){
		
		return true;
	}
	
	if(($("#to").val()!="") &&($("#from").val()!="")){
		
		return true;
	}
	alert("날짜를 선택해주세요.");
	return false;
}

function fnpage(clickpage,clickrange){

	location.href="${pageContext.request.contextPath}/reservationcheck/viewall?page="+clickpage+"&range="+clickrange;
	}
	
	function fnnext(startpage,nowrange){
		location.href="${pageContext.request.contextPath}/reservationcheck/viewall?page="+(startpage+5)+"&range="+(nowrange+1);
		
	}
	function fnprev(startpage,nowrange){
		location.href="${pageContext.request.contextPath}/reservationcheck/viewall?page="+(startpage-5)+"&range="+(nowrange-1);
		
	}
	
	function changeSeat(seatnum){ // 좌석숫자를 문자+숫자로 바꿔줌
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
	
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}


	function fnview(num){ //예약상세 모달에 출력 

		$.ajax({
			type : 'POST',
			url  : '${pageContext.request.contextPath}/reservationcheck/onereser',
			data: {num : num},
		    dataType: "json",
			success: function(result){
				$("#tbodyresult").text("");
				$("#tbodyresult1").text("");
				
				  var aa="<tr class='text-center'>"+
				  "<td>1구간</td>"+
				  "<td>"+result[0].reser_date+"</td>"+
				  "<td>"+ result[0].reser_Starting +"&nbsp;&nbsp;<i class='fas fa-plane-departure pt-3 text-muted '></i>&nbsp;&nbsp;"+
				  result[0].reser_destination +"<br> <small>"+result[0].reser_departure_time+" →"+ result[0].reser_arrival_time+" </small></td>"+
				  
				  "<td>"+result[0].reser_airline+"</td>"+
				  "<td>"+result[0].reser_flight+"</td>"+
				  "</tr>";
				  var part2="";
					  $("#tbodyresult1").append(aa);
				  if(result[0].isrou=="true"){
				  
					  part2="<tr>"+
					  "<td>2구간</td>"+
					  "<td>"+result[result.length-1].reser_date+"</td>"+
					  "<td>"+ result[result.length-1].reser_Starting +"&nbsp;&nbsp;<i class='fas fa-plane-departure pt-3 text-muted '></i>&nbsp;&nbsp;"+
					  result[result.length-1].reser_destination +"<br> <small>"+result[result.length-1].reser_departure_time+" →"+ result[result.length-1].reser_arrival_time+" </small></td>"+
					 
					  "<td>"+result[result.length-1].reser_airline+"</td>"+
					  "<td>"+result[result.length-1].reser_flight+"</td>"+
					  "</tr>";
					  $("#tbodyresult1").append(part2);
					  
					  
				  }
				  
				  var totalprice = 0;
				
				for(var i=0;i<result.length;i++){
					  var value=result[i].reser_familyname;
					  var value1=result[i].reser_airline;
					  var value2=result[i].reser_destination;
					  var value3=result[i].reser_flight;
					  var value4=result[i].reser_givename;
					  var value5=result[i].reser_Starting;
					  var value6=result[i].reser_departure_time;
					  var value7=result[i].reser_reserved_seat;
					  value7 =changeSeat(value7)+parseInt((value7/6)+1);
					  var value8=result[i].reser_date;
					  var value9=result[i].reser_price;
					  totalprice +=value9;
					  value9=  numberWithCommas(value9);
					  var value10=result[i].isrou;
					  
			
					$("#tbodyresult").append( "<tr><td>"+value8+"</td>"+ "<td>"+value5+"->"+value2+"</td>"+"<td>"+value+" "+value4+"</td>"+"<td>"+value7+"</td>"+"<td>"+value9+"</td>"+"</tr>");
					  
				}
				
				totalprice=  numberWithCommas(totalprice);
				$("#totalpr").text(totalprice+"KRW");
				$("#resernum").text("예약번호:"+num);
				
				$("#tribtn").trigger("click");
			 
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
		
	}

</script>
</head>
<body>
<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
<%-- Top End --%>
	<div class="bg-light mt-0 pb-5 mb-5">
		<div class="container border bg-white pb-5 mt-0 pt">
			<h2 class="text-center mt-5 mb-4">예약 조회/변경</h2>
			<div class="container pl-5 border">
				<div class="mt-3 col-12 mb-5 pb-5">

<!-- 예약목록 검색부분 시작 -->
					<form
						action="${pageContext.request.contextPath}/reservationcheck/showreservations"method="post" onsubmit="return fncheckresult();">
						<div class="pt-2">
							<table class="table  pt-0 border border-right-0">
								<tr>
									<td width="20%" class=" bg-light ">상태</td>
									<td width="80%"><label for="defaultRadio0">전체</label> <input
										type="radio" id="defaultRadio0" name="resersta" value="0"
										checked="checked"> <label for="defaultRadio1">예약완료</label>
										<input type="radio" id="defaultRadio1" name="resersta"
										value="1"> <label for="defaultRadio2">탑승완료</label> <input
										type="radio" id="defaultRadio2" name="resersta" value="2">
									</td>
								</tr>

								<tr>
									<td width="20%" class="bg-light">탑승날짜</td>
									<td width="80%">
										<div class="row">
											<div class="input-group mb-3 col-4">
												<input type="text" class=" form-control" id="from"
													name="from" width="50px" autocomplete="off">
												<div class="input-group-prepend">
													<span class="input-group-text"><i
														class='far fa-calendar-alt'></i></span>
												</div>
											</div>
											<b>―</b>
											<div class="input-group mb-3 col-4">
												<input type="text" class=" form-control" id="to" name="to"
													width="50px" autocomplete="off">
												<div class="input-group-prepend">
													<span class="input-group-text"><i
														class='far fa-calendar-alt'></i></span>
												</div>
											</div>

											<div class="col-2">
												<input type="submit" class="btn text-white" style="background-color: #D60815" value="조회">
											</div>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</form>
<!-- 예약목록 검색부분 끝 -->

<!-- 예약목록 출력부분 시작 -->
					<table class="table text-center table-hover mt-5 pt-5">
						<tr style="background-color: #6D6E71" class="text-white">
							<td>예약번호</td>
							<td>탑승일</td>
							<td>여정</td>
							<td>상태</td>
							<td>예약상세</td>
						</tr>

						<c:if test="${empty reserresult}">
							<tr class="small">
								<td class="pt-3" colspan="5">예약중인 항공권이 없습니다.</td>
							</tr>
						</c:if>

						<c:forEach items="${reserresult}" varStatus="varstatus" var="reser">
<%-- 							<c:if test="${varstatus.index !=0}"> --%>
							<c:if test="${reserresult[varstatus.index].reser_round_trip != reserresult[varstatus.index -1].reser_round_trip}">
							<c:set var="now" value="<%=new java.util.Date()%>" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="fmtnow" />

							<tr class="small">
								<td class="pt-3" width="10%">${reser.reser_round_trip}</td>
								<td class="pt-3" width="15%">${reser.reser_date}</td>
								<td class="pt-3 " width="20%">${reser.reser_Starting}-
									${reser.reser_destination}</td>
								<c:choose>
									<c:when test="${fmtnow <= reser.reser_date}">
										<td class="pt-3 text-dark" width="20%">예약완료</td>
									</c:when>
									<c:otherwise>
										<td class="pt-3 " width="20%">탑승완료</td>
									</c:otherwise>
								</c:choose>
								<td width="15%" onclick="fnview(${reser.reser_round_trip});">
									<button type="button" class="btn"><b class="small">예약상세</b></button>
								</td>
										
							</tr>
<%-- 							</c:if> --%>
							</c:if>
						</c:forEach>

					</table>
<!-- 예약목록 출력부분 끝 -->

				</div>

<!-- 예약상세 모달부분 -->
				<button style="display: none;" data-toggle="modal" data-target="#myModal" id="tribtn"></button>
				<div class="modal fade" id="myModal">
					<div class="modal-dialog  modal-lg">
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body border bg-light">
								<div class="container">
									<div class="row">
										<div class="col-12">
											<div class="card">
												<div class="card-body p-0">
													<div class="row pt-5 pl-3 pr-3">
														<div class="col-md-3 mt-0">
															<img
																src="${pageContext.request.contextPath}/img/Logoicon.png"
																class="col">
														</div>
														<div class="col-md-6  text-center pt-3">
															<h4>
																<b>예약상세</b>
															</h4>
														</div>

														<div class="col-md-3 text-right  ">
															<p class="font-weight-bold mb-1" id="resernum">Invoice #550</p>
														</div>
													</div>

													<hr class="my-5">

													<div class="row">

														<table class="table  text-center col-10" align="center">
															<thead>
																<tr class="bg-light text-dark">
																	<th>구간</th>
																	<th>출발일</th>
																	<th>출발도착시간</th>
																	<th>항공사</th>
																	<th>편명</th>
																</tr>
															</thead>
															<tbody id="tbodyresult1">

															</tbody>
														</table>

													</div>

													<div class="row p-5">
														<div class="col-md-12">
															<table class="table">
																<thead>
																	<tr>

																		<th
																			class="border-0 text-uppercase small font-weight-bold">탑승일</th>
																		<th
																			class="border-0 text-uppercase small font-weight-bold">여정</th>
																		<th
																			class="border-0 text-uppercase small font-weight-bold">탑승객</th>
																		<th
																			class="border-0 text-uppercase small font-weight-bold">좌석번호</th>
																		<th
																			class="border-0 text-uppercase small font-weight-bold">
																			가격</th>
																	</tr>
																</thead>
																<tbody id="tbodyresult">

																</tbody>
															</table>
														</div>
													</div>

													<div class="bg-dark text-white p-4" align="right">
														<div class=" text-right">
															<div class="mb-2">총액</div>
															<div class="h2 font-weight-light" id="totalpr">$234,234</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
							</div>

						</div>
					</div>
				</div>
<!-- 예약상세 모달부분끝 -->
			</div>
		</div>
	</div>

	<div class="pb-5"></div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>