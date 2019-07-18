<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fntest(){
	
	
	alert("dodod");
	var test= $(this).children('.pri').text();
	alert(test);
	
	
}
</script>
<!-- 아이콘을 위한 css -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	<div class="container mb-5 mt-3"> 
		<form autocomplete="off" >
			<div class="Search bg-light" style="padding:10px;border-radius: 5px; " >
				<div class="row">
					<div class="col-sm-12">
						<div class="custom-control custom-radio custom-control-inline">
					      <input type="radio" class="custom-control-input" id="customRadio1" name="example1" value="편도" checked="checked">
					      <label class="custom-control-label" for="customRadio1">편도</label>
					    </div>
					    <div class="custom-control custom-radio custom-control-inline">
					      <input type="radio" class="custom-control-input" id="customRadio2" name="example1" value="왕복">
					      <label class="custom-control-label" for="customRadio2">왕복</label>
					    </div>
					</div>
				</div>
				<br>
				<div class="row 1row" >
					<div class="col-sm-3">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text"><i class='fas fa-plane-departure' style='font-size:14px'></i></span>
						    </div>
						    <input type="text" class="form-control" placeholder="출발지">
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text"><i class='fas fa-plane-arrival	' style='font-size:14px'></i></span>
						    </div>
						    <input type="text" class="form-control" placeholder="도착지">
						</div>
					</div>
						<div class="col-sm-3" >
						<div class="input-group mb-3 input-daterange" id="datepicker1">
						    <div class="input-group-prepend">
						      <span class="input-group-text"><i class='	far fa-calendar-alt' style='font-size:14px'></i></span>
						    </div>
						    <input type="text" class="form-control" id="from" name="from" placeholder="가는날" width="50px">
					    </div>
					</div>
					<div class="col-sm-3">    
					    <div class="input-group mb-3 rt input-daterange" id="datepicker2">	
						    <div class="input-group-prepend">
						      <span class="input-group-text"><i class='	far fa-calendar-alt' style='font-size:14px'></i></span>
						    </div>
						    <input type="text" class="form-control" id="to" name="to" placeholder="오는날" width="50px">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text"><i class='far fa-user	' style='font-size:14px'></i></span>
						    </div>
						    <input type="text" class="form-control" placeholder="성인">
						</div>
					</div>
					<div class="col-sm-2">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text"><i class='far fa-user	' style='font-size:14px'></i></span>
						    </div>
						    <input type="text" class="form-control" placeholder="소아">
						</div>
					</div>
					<div class="col-sm-2">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text"><i class='far fa-user	' style='font-size:14px'></i></span>
						    </div>
						    <input type="text" class="form-control" placeholder="유아">
						</div>
					</div>
					<div class="col-sm-6">
							<input type="submit" class="btn btn-outline-primary " value="항공권 검색">
					</div>
				</div>
			</div>	
		</form>
	</div>

	<img src="../img/Reser/step1.png" width="100%" class="mb-3">
	<div class="container">


  <div class="row">
<!--  오른쪽 		 -->
     <div class="col-md-3 order-md-2 mb-4 mt-5">

      <ul class="list-group mb-3" >
              
        <li class="list-group-item d-flex justify-content-between lh-condensed bg-light text-center ">
          <div>
           <h5 class="ml-5 text-muted"> <b>선택 항공편</b></h5>
          </div>

        </li>
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted">
          <b>
        	부산 - 오사카(간사이)<br>
			2019-06-28 (금) 11:05 → 12:35<br><br>
			오사카(간사이) - 부산<br>
			2019-07-09 (화) 13:30 → 15:00<br>
          </b>
          </div>
     
        </li>
        
        
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="small text-muted" >
           	성인 1명
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
          <span class="text-muted "><b>140,700 KRW</b></span>
        </li>         
        <li class="list-group-item d-flex justify-content-between bg-light">
          <div class="text-success small text-danger">
			상기 운임은 결제완료 전까지 좌석상황에 따라 실시간 변동될 수 있습니다.<br><br>
			※한국출발 세금(BP)은 국제여객공항이용료 12,000원, 출국납부금 10,000원, 국제빈곤퇴치기여금 1,000원이 포함되어 있습니다.
          </div>
   
        </li>
 
        <li class="list-group-item d-flex justify-content-between bg-dark text-white mt-3">
          <span>지불예상금액 </span>
          <strong>140,700 KRW</strong>
        </li>
        
  		<li class="list-group-item d-flex justify-content-between lh-condensed pl-0 pr-0 pt-0 pb-0 mt-3">
        <input class="btn  btn-lg btn-block btn-primary" type="submit" value="다음단계 ">
        </li>	
      </ul>

  		    </div>
<!--  왼쪽 -->
 <div class="col-md-9 order-md-1">
	<p class="text-danger small mt-2 mb-4">운임규정은 항공권에 따라 상이하며, 자세한 내용은 하단의 운임규정 ‘필독사항’를 통해 확인 바랍니다.</p>
	
	<i class='fas fa-plane' style='font-size:30px'></i>
	1구간 부산 큐슈(후쿠오카) 07/14(일)

  		<table class="table mt-3">

    		<tbody>
			<tr class="bg-light">
			<td>출발-도착시간</td>
			<td>항공사</td>		
			<td>항공편</td>		
			<td>금액</td>
			</tr>
												
		    </tbody>
		    <tr>
		    <td>08:35 - 10:05</td>
		    <td>에어부산</td>
		    <td>BX 124</td>
		    <td> 15,000 KRW</td>
		    </tr>
		    
		    <tr>
		    <td>10:35- 12:05</td>
		    <td>대한항공</td>
		    <td>KE112</td>
		    <td>30,000 KRW</td>
		    </tr>		    
  		</table>	

	<i class='fas fa-plane' style='font-size:30px'></i>
	2구간 부산 큐슈(후쿠오카) 07/14(일)

  		<table class="table mt-3">

    		<tbody >
			<tr class="bg-light">
			<td>출발-도착시간</td>
			<td>항공사</td>		
			<td>항공편</td>		
			<td >금액</td>
			</tr>
												
		    </tbody>
		    <tr onclick="fntest();">
		    <td>08:35 - 10:05</td>
		    <td>에어부산</td>
		    <td>BX 124</td>
		    <td class="pri">15,000 KRW</td>
		    </tr>
		    
		    <tr onclick="fntest();">
		    <td>10:35- 12:05</td>
		    <td>대한항공</td>
		    <td>KE112</td>
		    <td class="pri">30,000 KRW</td>
		    </tr>		    
  		</table>	
 
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