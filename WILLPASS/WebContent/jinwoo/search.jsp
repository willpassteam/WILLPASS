<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	날짜 : <input type="date" name="date"><br>
	<input type="submit" value="검색"> 
	</form>
</body>
</html>