<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
<c:if test="${MSG != null }">
		<script type="text/javascript">
			alert("${MSG}");
		</script>
		
	</c:if>


</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>

	<div class="container">
		<div class="col-sm-12">
			<br>
			<h2 align="center">공지 사항</h2>
			<hr>
			<div class="" style="padding:10px">
				<div class="float-left">
					<h5>${NoticeDTO.notice_title}</h5>
				</div>
				<div class="float-right">
					<small>조회수 ${NoticeDTO.notice_count} | 작성일자 ${NoticeDTO.notice_date}</small>
	
				</div>
			</div>
			<div class="clearfix mb-3"></div>
			<div class="col-sm-12 border mb-3 py-3" style="min-height: 500px">
				<p>${NoticeDTO.notice_content}</p>
			</div>
			<div class="float-right mb-3">
				<!-- 수정 삭제는 admin에게만 보임 -->
				<c:if test="${user_id == 'admin'}">
					<a href="Update1.Notice?Notice_num=${NoticeDTO.notice_num}" class="btn btn-dark">수정</a>
					<a href="Delete.Notice?notice_num=${NoticeDTO.notice_num}" class="btn btn-danger">삭제</a> 
				</c:if>
				<a href="Board.Notice" class="btn btn-default border">목록</a>
			</div>
			<div class="clearfix"></div>

		</div>
	</div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>