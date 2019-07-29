<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<title>Insert title here</title>
<style>
div {
	word-breack: break-all;
}
</style>
</head>
<body>
	<div class="container-flude border p-3 chatBody " style="max-height: 680px;">
		<h2>
			WILL PASS 상담톡<a href="#" class="btn btn-primary float-right">대화종료</a>
		</h2>
		<div class="clearfix"></div>
		<hr>
			<!-- 관리자 문자 -->
		<div class="chatting w-100" style="min-height: 475px; overflow-y: auto;">
			<div class="float-left w-75">
				<div class="header">
					<small>상담사</small>
				</div>
				<div class="body">
					<div class="row ml-1">
						<small class="border w-75 float-left p-1">안녕하세요 ooo 님 무엇을 도와드릴까요.안녕하세요 ooo 님 무엇을 도와드릴까요.안녕하세요 ooo 님 무엇을 도와드릴까요.안녕하세요 ooo 님 무엇을 도와드릴까요.</small><small class="float-right w-25 " style="margin-top: auto">07-29/5:13</small>
					</div>

				</div>
			</div>
			<div class="clearfix my-2"></div>

			<!-- 사용자 문자 -->
			<div class="float-right w-75">

				<div class="row" style="width: 360px">
					<small class="" style="margin-top: auto">07-29/5:13</small>&nbsp;<small class="border border-success w-75 p-1">안녕하세요 항공 예매번호 0000 관련 문의 드립니다.안녕하세요 항공 예매번호 0000 관련 문의 드립니다.</small>

				</div>
			</div>
			<div class="clearfix my-2"></div>

			<div class="chttingbutton mb-3">
				<form action="">
					<input type="text" name="content" class=" mx-2" style="width: 360px; height: 40px"><input type="button" class="btn btn-danger mb-1" value="전송">
				</form>
			</div>
		</div>
	</div>

</body>
</html>