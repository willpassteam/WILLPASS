<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="../css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="../js/bootstrap.min.js"></script>
<style type="text/css">

.1row p{
	color:white;
}
.1row span{
	color:white;
}



</style>
<script type="text/javascript">
            $(function () {
                $('#datetimepicker1').datetimepicker();
            });
        </script>



</head>
<body>
	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
		
	
	<div class="container">
		<div class="row 1row" >
			<form>
				<div class="col-sm-12" style="background-image: url('../img/searchback.jpg');">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-12">
								<input type="radio" name="one" value="왕복"><span>왕복</span>
								<input type="radio" name="one" value="편도" checked="checked"><span>편도</span>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<p>출발지</p>
								<input type="text" class="form-control" name="Departures">
							</div>
							<div class="col-sm-3">
								<p>도착지</p>
								<input type="text" class="form-control" name="Arrivals">
							</div>
							<div class="col-sm-2">
								<p>가는날</p>
								<input type='text' class="form-control" id='datetimepicker4' />




								
							</div>
							<div class="col-sm-2"></div>
							<div class="col-sm-2"></div>
						</div>
					</div>
				</div>
			</form>
		</div>		
	
	</div>
	
	<%-- Fotter Start --%>
	<jsp:include page="../include/Fotter.jsp"></jsp:include>
	<%-- Fotter End --%>
	
	
</body>
</html>
