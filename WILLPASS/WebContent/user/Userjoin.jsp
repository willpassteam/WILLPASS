<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<script type="text/javascript">
function fn_img(){
	document.getElementById("con1").setAttribute('style',"display:none");
	document.getElementById("con2").setAttribute('style',"display:inline");
}
</script>

</head>
<body>
	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	<div class="container" id="con1" >
		<div class="row">
			<div class="col-sm-12" align="center">
				<h2>회원가입을 환영합니다.</h2>
				<br>
				<h5>여행의 지혜, FLY SMART 에어부산 회원가입을 시작하세요!</h5>
				<br>
				<h4>가입유형</h4>
				<img id="click"alt="" src="../img/회원가입창.PNG" width="60%" onclick="fn_img();">
			</div>
		</div>
	</div>
	
	
	<div class="container" id="con2" style="display: none;">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<div class="row well">
					
				</div>
			</div>
			<div class="col-sm-2"></div>
			
		</div>
	
	
	</div>
	
	
	
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
	
	

</body>
</html>