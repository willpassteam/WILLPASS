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

	<script type="text/javascript">
		$(function(){
			$("#startLine").change(function(){
				var startLine=$("#startLine").val();
				$.ajax({
					type : 'POST',
					url  : '${path}/endcheck',
					dataType:'json',
					data : { startLine : startLine }, //{parameterName, data} 형식
					success: function(result){
						
						var list=result.list;
						$("#endLineI").empty();
						$("#endLineD").empty();
						for(var i=0; i<list.length;i++){
							
							if(list[i].international=="I"){
								$("#endLineI").append("<option value='"+list[i].endvalue+"'>"+list[i].endLine+"</option>");
							}
							else if(list[i].international=="D"){
								$("#endLineD").append("<option value='"+list[i].endvalue+"'>"+list[i].endLine+"</option>");
							}
						}
					}
	
				});
			});
			  
		    var dateFormat = "mm/dd/yy",
		      from = $( "#from" )
		        .datepicker({
				  dateFormat : 'yy-mm-dd',	        	
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
		});
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="searchpro.jin" method="post">
	출발지 : <select name="startLine" id="startLine">
			<optgroup label="국내공항">
				<option value="KUV">군산</option>
				<option value="RSU">여수</option>
				<option value="KPO">포항</option>
				<option value="USN">울산</option>
				<option value="WJU">원주</option>
				<option value="HIN">사천</option>
				<option value="KWJ">광주</option>
			</optgroup>
			<optgroup label="국제공항">
				<option value="GMP">김포</option>
				<option value="CJU">제주</option>
				<option value="PUS">김해</option>
				<option value="CJJ">청주</option>
				<option value="TAE">대구</option>
				<option value="YNY">양양</option>
				<option value="MWX">무한</option>
			</optgroup>
			</select>
			<br>
		목적지 : <select name="endLine" id="endLine">
			<optgroup label="국내선" id="endLineD">
				<option value="CJU">제주</option>
			</optgroup>
			<optgroup label="국제선" id="endLineI">
				
			</optgroup>
			</select>
			<br>
	날짜 : <input type="text" name="from" id="from"><br>
	<input type="submit" value="검색"> 
	</form>
</body>
</html>