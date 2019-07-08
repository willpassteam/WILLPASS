<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<style type="text/css">
.subject{
	height: 70px;

}

#ma{


/*   background-image: url("../img/mainimg1.jpg"); */
  background-repeat: no-repeat;
  background-size: auto;

}

input[type="text"], textarea {
outline: none;
box-shadow:none !important;
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



</style>
<script>
  $( function() {
	  
    var dateFormat = "mm/dd/yy",
      from = $( "#from" )
        .datepicker({
          minDate: 0,
          changeMonth: true,
          numberOfMonths: 2,
          prevText: '이전 달',
          nextText: '다음 달',
          monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
          monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
          dayNames: ['일', '월', '화', '수', '목', '금', '토'],
          dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
          dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
          showMonthAfterYear: true,
          yearSuffix: '년'
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
         minDate: 0,
         maxDate: "+1M +10D",
        changeMonth: true,
        numberOfMonths: 2,
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
         
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
	
	
	<div class="border pt-5" id="ma">
	<h1 class="text-center "><b>푸동푸동 타이완</b> </h1>
	<h4 class="text-center ">두/근/거/림  가득한 여행지 대만 </h4>
	<h4 class="text-center ">한달에 한번 ,실속있는 가격으로 구매하는 얼리버드 이벤트  </h4>
	<p class="text-center mb-5 ">이벤트 기간 : 2019.7.10~ 2019.08.10</p>
	
	
<!-- 	잠시 -->
<div class="container mt-5 ">
<button class="btn btn-primary mr-0">왕복</button>
<button class="btn btn-outline-primary ml-0">편도</button>
</div>
<div class="container pb-5">

						<form autocomplete="off" >
							<div class="Search border pl-5 pr-5"  >
								<br>
								<div class="row 1row" >
									<div class="col-sm-3">
										<div class="input-group mb-3 border border-top-0 border-right-0 border-left-0">
											 <i class='fas fa-plane-departure pt-3'></i>
										    <input type="text" class="form-control shadow-none" placeholder="출발지">
										</div>
									</div>
									<div class="col-sm-3 ">
										<div class="input-group mb-3 border border-top-0 border-right-0 border-left-0 " >
										<i class='fas fa-plane-arrival pt-3'></i>
										<input type="text" class="form-control" placeholder="도착지">
										</div>
									</div>
									<div class="col-sm-6 row pt-0">
 									<div class="col-6" >
										<div class="input-group mb-3 input-daterange border border-top-0 border-right-0 border-left-0" id="datepicker1">
												<i class='	far fa-calendar-alt pt-3'></i>
										    <input type="text" class="form-control" id="from" name="from" placeholder="가는날" width="50px">
									    </div>
									</div>
									<div class="col-6">    
									    <div class="input-group mb-3 rt input-daterange border border-top-0 border-right-0 border-left-0" id="datepicker2">	
											
										    <input type="text" class="form-control" id="to" name="to" placeholder="오는날" width="50px">
										</div>
									</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-2">
										<div class="input-group mb-3 border border-top-0 border-right-0 border-left-0">
										<i class='far fa-user pt-3'></i>
									<input type="text" class="form-control" placeholder="성인">
										</div>
									</div>
									<div class="col-sm-2">
										<div class="input-group mb-3 border border-top-0 border-right-0 border-left-0">
										 	<i class='far fa-user pt-3'></i>
										    <input type="text" class="form-control" placeholder="소아">
										</div>
									</div>
									<div class="col-sm-2">
										<div class="input-group mb-3 border border-top-0 border-right-0 border-left-0">
										   		<i class='far fa-user pt-3'></i>
										    <input type="text" class="form-control" placeholder="유아">
										</div>
									</div>
									<div class="col-sm-6 border border-top-0 border-right-0 border-left-0 border">
											<input type="submit" class="btn btn-outline-primary " value="항공권 검색">
									</div>
								</div>
							</div>	
						</form>



</div>
	
	
	</div>
	
	
	
	

	
	
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
	
	
</body>
</html>
