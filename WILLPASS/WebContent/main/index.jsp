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

</style>
	<script>

  $( function() {
	  
    var dateFormat = "yymmdd",
      from = $( "#from" )
        .datepicker({
          minDate: 0,
          maxDate: "+2M",
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
          yearSuffix: '년',
          dateFormat : 'yymmdd'
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
         minDate: 0,
         maxDate: "+2M",
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
        yearSuffix: '년',
        dateFormat:'yymmdd'
         
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
    $("#starting").autocomplete({ 
	    		source : function(request, response) { //많이 봤죠? jquery Ajax로 비동기 통신한 후 
	    			var city=$("#starting").val();
	    			//json객체를 서버에서 내려받아서 리스트 뽑는 작업
	    			$.ajax({ 
	    				//호출할 URL 
	    				url: "${path}/endcheck", 
	    				//우선 jsontype json으로 
	    				dataType: "json", 
	    				// parameter 값이다. 여러개를 줄수도 있다. 
	    				data: { //request.term >> 이거 자체가 text박스내에 입력된 값이다. 
	    					city: city }, 
	    				success: function( result ) { //return 된놈을 response() 함수내에 다음과 같이 정의해서 뽑아온다. 
	    					
	    					response(
	                                $.map(result, function(item) {
	                                    return {
	                                    	label: item.city,
	                                        value: item.city
	                                        
	                                    }
	                                })
	                                );
	    				}
	    			}); 
			    	}, 
			    	//최소 몇자 이상되면 통신을 시작하겠다라는 옵션 
			    	minLength: 1, 
			    	//자동완성 목록에서 특정 값 선택시 처리하는 동작 구현 
			    	//구현없으면 단순 text태그내에 값이 들어간다. 
			    	select: function( event, ui ) {
			    	},
			    	 focus: function(event, ui) {
			             return false;
			         }

		    	});
    $("#destination").autocomplete({ 
		source : function(request, response) { //많이 봤죠? jquery Ajax로 비동기 통신한 후 
			var city=$("#destination").val();
			//json객체를 서버에서 내려받아서 리스트 뽑는 작업
			$.ajax({ 
				//호출할 URL 
				url: "${path}/endcheck", 
				//우선 jsontype json으로 
				dataType: "json", 
				// parameter 값이다. 여러개를 줄수도 있다. 
				data: { //request.term >> 이거 자체가 text박스내에 입력된 값이다. 
					city: city }, 
				success: function( result ) { //return 된놈을 response() 함수내에 다음과 같이 정의해서 뽑아온다. 
					
					response(
                            $.map(result, function(item) {
                                return {
                                	label: item.city,
                                    value: item.city
                                    
                                }
                            })
                            );
				}
			}); 
	    	}, 
	    	//최소 몇자 이상되면 통신을 시작하겠다라는 옵션 
	    	minLength: 1, 
	    	//자동완성 목록에서 특정 값 선택시 처리하는 동작 구현 
	    	//구현없으면 단순 text태그내에 값이 들어간다. 
	    	select: function( event, ui ) {
	    	},
	    	 focus: function(event, ui) {
	             return false;
	         }

    	});
    
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
					<div class="col-sm-12 ">
						<form autocomplete="off" action="searchpro.jin" method="post" >
							<div class="Search bg-light" style="padding:10px;border-radius: 5px; " >
								<div class="row">
									<div class="col-sm-12">
										<div class="custom-control custom-radio custom-control-inline">
									      <input type="radio" class="custom-control-input" id="customRadio1" name="round_trip" value="0" checked="checked">
									      <label class="custom-control-label" for="customRadio1">편도</label>
									    </div>
									    <div class="custom-control custom-radio custom-control-inline">
									      <input type="radio" class="custom-control-input" id="customRadio2" name="round_trip" value="1">
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
										    <input type="text" class="form-control" name="starting" id="starting" placeholder="출발지">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="input-group mb-3">
										    <div class="input-group-prepend">
										      <span class="input-group-text"><i class='fas fa-plane-arrival	' style='font-size:14px'></i></span>
										    </div>
										    <input type="text" class="form-control" name="destination" id="destination" placeholder="도착지">
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
