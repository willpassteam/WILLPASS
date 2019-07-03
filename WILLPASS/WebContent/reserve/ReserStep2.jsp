<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<!-- 아이콘을 위한 css -->
<style type="text/css">
#lab1{
 border-left: 5px solid blue;
}
</style>

</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
<div class="container mb-5 mt-3"> 

	<h2 ><b>국제선 예약</b></h2>

	</div>

	<img src="../img/Reser/step2.png" width="100%">


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
    
    
<!--  왼쪽  -->
    <div class="col-md-9 order-md-1">
  

        <div class="mb-3 small bg-light text-dark pl-3 pt-3 pr-3 pm-3 border">

		<b>공통</b> -<p class=" d-inline-block text-primary mb-0"> 항공권은 타인양도 및 명의 변경이 불가합니다.</p>
		 영문명과 성별 등 여권정보와 상이한 정보로 예약한 경우 탑승이 거절될 수 있으며,결제 후 변경 시에는 취소 환불 후 재예약 하셔야 합니다. 단, 원하는 항공권 및 좌석이 없을 수 있습니다. 탑승자 이름의 일부 글자 및 영문스펠링 오류의 경우 예약센터(1666-3060)를 통해 문의해주시기 바랍니다. 단, 수수료가 부과될 수 있습니다.<br><br>

		아시아나 항공 국제선(인천출발) 이용고객, 외국인 고객 - <p class=" d-inline-block text-primary mb-0">여권 또는 외국인 등록증과 동일한 영문 성함을 기입</p>
		<br><br>
		-영문이름 입력 : 성(Family Name)/이름(Given Name) 형태로 입력해 주시기 바랍니다.<br>
		-내국인 영문 예약 시, 반드시 영문 이름이 확인 가능한 신분증을(EX: 여권) 준비하여 주시기 바랍니다.<br>
		-공백 또는 특수문자는 입력이 불가합니다.<br><br>

        </div>
  
<!--   잠시테스트 -->
  	   <div class="mb-3 text-dark pl-3 pt-3 pr-3 pm-3 border">
  	   
  	   
  	   <div class="row">
  	   
  	   <div class="col-1 pl-0">
  	   <div class="bg-light ml-0 mr-0 pl-1" id="lab1">
<!-- 		<img src="../img/Reser/label_adult.png" width="125%"> -->
				<p class="pt-1"><b>성인</b></p>
  		</div>
  	   </div>
  	   
  	   <div class="col-11 pl-0 small">
			<table class="table">
			<tr>
			<td width="20%">승객구분</td>
			<td width="80%">
        	<label class="radio-inline "><input type="radio" name="optradio" class="custom-control-input"checked>남</label>
        	<label class="radio-inline "><input type="radio" name="optradio" >여</label>
			</td>
			</tr>
			
			<tr>
			<td width="20%">성(Family Name)</td>
			<td width="80%"><input type="text" class="form-control input-sm col-6" ></td>
			</tr>
			<tr>
			<td width="20%">이름(Given Name)</td>
			<td width="80%"><input type="text" class="form-control input-sm col-6"></td>
			</tr>			
			</table> 
  	   </div>
  	   
  	   </div>
  	   
  	   </div>
<!--   잠시테스트 -->
        <div class="mb-3 small">
        	<h5 class="mt-3 mb-4 text-dark"> <i class='fas fa-plane'></i><b>여정 정보</b></h5>
        
        </div>  
  				
         <div class="mb-3 small">
	<h5 class="mt-3 mb-4 text-dark"> <i class='fas fa-plane'></i><b>탑승자 정보</b></h5>
  <table class="table">
    <thead class="bg-light ">
      <tr class="col row ">
        <td class="col-1">유형</td>
        <td class="col-2">성(Family Name)</td>
        <td class="col-2">이름(Given Name)</td>
        <td class="col-2">성별</td>
        <td class="col-5">기타</td>
      </tr>
    </thead>
    <tbody>
      <tr class="col row">
        <td class="border border-left-0 col-1 pt-5">성인1</td>
        <td class="border col-2  pt-5"> <input type="text" class="form-control input-sm "></td>
        <td class="border col-2  pt-5"><input type="text" class="form-control input-sm"></td>
        <td class="border col-2  pt-5 pl-4">
        <label class="radio-inline "><input type="radio" name="optradio" checked>남</label>
        <label class="radio-inline "><input type="radio" name="optradio" >여</label>
        
        </td>
        <td class="border border-right-0 col-5 pt-4">
        <div class="row ml-1 mb-1">
        <input type="text" class="form-control col-3 input-sm">-
        <input type="text" class="form-control  col-3 input-sm">-
        <input type="text" class="form-control  col-3 input-sm">
        </div>
        <p class="text-muted  d-inline-block pl-0 ml-0">
           탑승자가 회원인 경우만 탑승자 휴대폰번호(회원정보상) 입력
           </p>
        </td>

  
      </tr>

    </tbody>
  </table>      
      
      </div>

		

 

    <div class="mb-3 small mt-5 ">
    <div class="mt-3 mb-4 text-dark">
  	<h5 class="d-inline-block"> <i class='fas fa-plane'></i><b>예매자정보</b></h5>
  	<p class="d-inline-block ml-2">(반드시 연락 가능한 연락처/이메일을 입력하세요. 지연/결항 안내 시 사용될 수 있습니다.)</p>
    </div>
  		<table class="table">

    		<tbody>
				<tr>
				<th width="20%" class="bg-light">SMS수신 연락처</th>
				<td width="80% ">
				<div class="col row">
  				<select class="form-control col-4 ml-1" id="sel1">
   				 <option>국가/지역번호</option>
   				 <option>1</option>
    			 <option>2</option>
				</select>				
				-<input type="text" class="form-control  col-2 input-sm ml-2">- 
				 <input type="text" class="form-control  col-2 input-sm ml-2">-
				 <input type="text" class="form-control  col-2 input-sm ml-2">
				</div>
				<p class="ml-1 mt-2">
				연락처 오기입 및 변경 발생 시, 예약센터(1666-3060)을 통해 연락처 수정 바랍니다.
				연락처를 수정하지 않을실 경우, 운항정보(스케쥴 변경, 지연, 결항 등)에 대한 사전 SMS 서비스 이용이 불가할 수 있습니다.
				</p>
				</td>
				</tr>
				<tr>
				<th width="20%" class="bg-light">이메일주소</th>
				<td width="80%">
				<div class="col row">
			
				<input type="text" class="form-control  col-4 input-sm ml-2"> @
				 <input type="text" class="form-control  col-4 input-sm ml-2">
				 
				</div>
				<p class="ml-1 mt-2">
				이메일을 통해 예약상황을 알려드립니다.
				</p>
				</td>
				</tr>
				<tr>
				<th width="20%" class="bg-light">인증코드인증코드</th>
				<td  width="80%"></td>
				</tr>								
		    </tbody>
  		</table>		
		
	</div>
 	<hr class="mb-4">

    
    <div class="mb-3 small bg-light text-dark pl-3 pt-3 pr-3 pm-3 border mt-3">
	<b>유의사항</b><br>
	<ul>
	<li>국제선 탑승수속을 위한 준비물 확인하기</li>
	<li><p class="text-danger d-inline-block mb-0">누락된 스탬프는 FLY & STAMP 누락스탬프에서 적립 가능합니다.</p></li>
	<li>소아/유아의 나이구분은 여행일(탑승일) 기준이며, 나이를 확인 할 수 있는 서류(여권)를 반드시 지참 하시기 바랍니다.</li>
	<li>동명이인의 경우 인터넷으로 동시 예약이 불가능 하오니, 각 탑승자 별로 인터넷 예약을 진행해 주시기 바랍니다. </li>
	<li><p class="text-danger d-inline-block mb-0">동시 예약을 하고자 하시는 분은 예약센터(1666-3060)를 통해 예약바랍니다.</p></li>
	<li>기내반입제한품목을 반드시 확인하시기 바랍니다.</li>
	</ul>
    </div>
    </div>
  </div>


</div>





	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>