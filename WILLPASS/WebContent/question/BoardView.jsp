<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>


</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>

	<div class="container">
		<div class="col-sm-12">
			<br>
			<h2>공지 사항</h2>
			<hr>
			<div class="float-left">
				<h5></h5>
			</div>
			<div class="float-right">
				<h6>조회수 10 | 작성일자 2019-07-03</h6>

			</div>
			<div class="clearfix"></div>
			<div class="col-sm-12 border mb-3 py-3" style="min-height: 500px">
				<p>내용을 적어놓은칸ㅇ비니다내용을 적어놓은칸ㅇ비니다내용을 적어놓은칸ㅇ비니다내용을 적어놓은칸ㅇ비니다내용을 적어놓은칸ㅇ비니다내용을 적어놓은칸ㅇ비니다내용을 적어놓은칸ㅇ비니다내용을 적어놓은칸ㅇ비니다 내용을 적어놓은칸ㅇ비니다내용을 적어놓은칸ㅇ비니다내용을 적어놓은칸ㅇ비니다내용을 적어놓은칸ㅇ비니다</p>
			</div>
			<div class="float-right mb-3">
				<!-- 수정 삭제는 admin에게만 보임 -->
				<a href="" class="btn btn-primary">수정</a> <a href="" class="btn btn-danger">삭제</a> <a href="" class="btn btn-success">목록</a>
			</div>
			<div class="clearfix"></div>

		</div>
	</div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>