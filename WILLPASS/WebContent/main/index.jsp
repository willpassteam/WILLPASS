<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style type="text/css">

.Search{
	
}

.subject{
	height: 70px;

}


</style>
  <script>
  $( function() {
	  
	  $.datepicker.setDefaults({
	        dateFormat: 'yymmdd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
	    });
	  
	  
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 2
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 2
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  </script>



</head>
<body>
	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	
 

	
	<div class="container">
		<div class="row" >
			
				<div class="col-sm-12">
					<div class="col-sm-12">
						<form autocomplete="off" >
							<div class="Search" style="padding:10px;border-radius: 5px; " >
								<div class="row">
									<div class="col-sm-12">
										<input type="radio" name="one" value="왕복"><label for="one">왕복</label>
										<input type="radio" name="one" value="편도" checked="checked"><label for="one">편도</label>
									</div>
								</div>
								<div class="row 1row" >
									<div class="col-sm-2">
										<label for="">출발지</label>
										<input type="text" class="form-control" name="">
									</div>
									<div class="col-sm-2">
										<label for="">도착지</label>
										<input type="text" class="form-control" name="">
									</div>
									<div class="col-sm-3">
										<label for="">가는날</label>
										<input type='text' class="form-control" id='from' name=""  />
									</div>
									<div class="col-sm-3">
										<label for="">오는날</label>
										<input type='text' class="form-control" id='to' name="" />
									</div>
									<div class="col-sm-1">
										<label for="">인원수</label>
									    <select class="form-control" id="" name="">
									        <option>1</option>
									        <option>2</option>
									        <option>3</option>
									        <option>4</option>
									    </select>
									</div>
									<div class="col-sm-1">
										<br>
										<input type="submit" class="btn btn-success" value="검색">
									</div>
								</div>
							</div>	
						</form>
						
						<br>
						<!-- <div class="row">
							<div class="col-sm-12">
								<div class="col-sm-3">
									<h4>싱가포르</h4>
									<img alt="" src="../img/01.jpg" width="250">
								</div>
								<div class="col-sm-3">
									<h4>파리</h4>
									<img alt="" src="../img/02.jpg" width="250">
								</div>
								<div class="col-sm-3">
									<h4>타이페이</h4>
									<img alt="" src="../img/03.jpg" width="250">
								</div>
								<div class="col-sm-3">
									<h4>도쿄</h4>
									<img alt="" src="../img/04.jpg" width="250">
								</div>
							</div>
						</div> -->
						<br>
						<div class="row">
							<div class="col-sm-12">
								<img alt="" src="../img/MainLogo.PNG" width="100%">
							</div>
						</div>
						
						<div class="row">
							<div class="col-sm-3">
								<h3 class="subject">공식 소셜 미디어 채널</h3>
								
								<h5>전세계 6천만명이 사용하고 있는 앱스토어 WILLPASS 앱을 만나보세요. 아이폰, 안드로이드, 테블릿을 지원합니다.</h5>
							
							</div>
							<div class="col-sm-3">
								<h3 class="subject">인기추천 여행지 스캔하기</h3>
								
								<h5>여행 관련 뉴스, 사진, 그리고 이벤트에 관심이 있으시다면 WILLPASS 공식 페이스북 과 인스타그램 을 방문해 주세요.</h5>
							</div>
							<div class="col-sm-3">
								<h3 class="subject">여행 뉴스와 블로그</h3>
								
								<h5>WILLPASS 뉴스 와 함께 전문 여행자가 알려주는 여행 관련 팁, 여행 블로그 포스트 를 확인하세요.</h5>
							</div>
							<div class="col-sm-3">
								<h3 class="subject">스카이스캐너로 가격비교</h3>
								
								<h5>WILLPASS는 수백만개의 항공권 가격을 국내외 항공사와 여행사로부터 비교하여 가장 저렴한 항공권을 쉽고 빠르게 찾아드립니다. 항공사, 여행사, 땡처리, 얼리버드 그리고 특가 항공권까지 검색 할 수 있습니다. 전세계 호텔과 렌터카 가격 비교도 지원합니다. 고객을 먼저 생각하는 당사의 서비스를 더 자세히 알아보세요.</h5>
							</div>
							
						</div>
					</div>
				</div>
			
		</div>		
	
	</div>
	
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
	
	
</body>
</html>
