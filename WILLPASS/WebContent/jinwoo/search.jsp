<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- 아이콘을 위한 css -->
	<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="searchpro.jin" method="post">
		<input type="radio" class="custom-control-input" id="customRadio1" name="round_trip" value="0" checked="checked">
		<label class="custom-control-label" for="customRadio1">편도</label>
		<input type="radio" class="custom-control-input" id="customRadio2" name="round_trip" value="1">
		<label class="custom-control-label" for="customRadio2">왕복</label><br>
		출발지 : <input type="text" class="form-control" placeholder="출발지" name="starting" id="starting"> 
		
				
		목적지 : <input type="text" class="form-control" placeholder="도착지" name="destination" id="destination">
		날짜 : <input type="text" class="form-control" id="from" name="from" placeholder="가는날" width="50px">
		 <input type="text" class="form-control" id="to" name="to" placeholder="오는날" width="50px"><br>
		<input type="submit" value="검색"> 
	</form>
</body>
</html>