<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅 관리 시스템</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<style type="text/css">


</style>
<script type="text/javascript">
$(function() {
	var body = document.body



	var height = Math.max( body.scrollHeight, body.offsetHeight);

	if(height < 802){
		
	}
	

	alert(height);
	
})

</script>
</head>

<body>
	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	<div class="container my-3" style="background-color:#f7f7f7 ">
		<h1 align="center" style="color:#dc3545;">채팅 관리 시스템</h1>
		<div class="row" >
			<div class="col-xl-5 scroll " style="overflow-y: auto;max-height: 600px;">
				<div class="border bg-light">
					<a href="#">
						<h4>sovla<span class="badge badge-danger">3</span></h4>
						<h6>안녕하세요 항공 예매번호 0000 관련 문의 드립니다.</h6>
						
					</a>
				</div>
				<div class="border bg-light">
					<h4>아이디</h4>
					<h6>님 이게 궁금합니다</h6>
				</div>
				<div class="border bg-light">
					<h4>아이디</h4>
					<h6>님 이게 궁금합니다</h6>
				</div> 
				<div class="border bg-light">
					<h4>아이디</h4>
					<h6>님 이게 궁금합니다</h6>
				</div>
				<div class="border bg-light">
					<h4>아이디</h4>
					<h6>님 이게 궁금합니다</h6>
				</div>
				<div class="border bg-light">
					<h4>아이디</h4>
					<h6>님 이게 궁금합니다</h6>
				</div>
				<div class="border bg-light">
					<h4>아이디</h4>
					<h6>님 이게 궁금합니다</h6>
				</div>
				
				
				
			</div>
			<div class="col-xl-7 border pt-3 bg-light" style="overflow-y: auto;max-height: 600px;">
				<!-- 관리자 문자 -->
				<div class="float-left">
					<div class="header">
						<small>상담사</small>
					</div>
					<div class="body">
						<p class="border p-1 float-left">안녕하세요 ooo 님 무엇을 도와드릴까요.</p><small class="float-left align-bottom mx-2 ">07-29/5:13</small>
					</div>
				</div>
				<div class="clearfix"></div>
				
				<!-- 사용자 문자 -->
				<div class="float-right">
					<small class="float-left align-bottom mx-2">07-29/5:13</small><pre class="border border-success p-1"> 안녕하세요 항공 예매번호 0000 관련 문의 드립니다.</pre>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>

</body>
</html>