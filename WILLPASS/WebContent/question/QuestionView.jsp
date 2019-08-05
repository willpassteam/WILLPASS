<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<script src="https://cdn.ckeditor.com/ckeditor5/12.2.0/classic/ckeditor.js"></script>
		.

</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>

	<div class="container">
		<div class="col-sm-12">
			<br>
			<h2>문의 사항 </h2>
			<hr>
			<div class="float-left">
				<h5>${BoardDTO.BOARD_TITLE } | 작성자 : ${BoardDTO.BOARD_ID }님</h5>
			</div>
			<div class="float-right">
				<h6> 작성일자 ${BoardDTO.BOARD_DATE }</h6>
				
			</div>
			<div class="clearfix"></div>
			<div class="col-sm-12 border mb-3 py-3" style="min-height: 500px">
				<p >${BoardDTO.BOARD_CONTENT }</p>
			</div>
			<div class="float-right mb-3">
				<c:if test="${user_id == 'admin' && BoardDTO.BOARD_DEPTH != 1 }">
					<a href="reply.Board?Board_num=${BoardDTO.BOARD_NUM }" class="btn btn-primary">답글</a>
				</c:if>	
				<c:choose>
					<c:when test="${BoardDTO.BOARD_DEPTH == 1}">
						<c:if test="${user_id =='admin' }">
							<a href="Delete.Board?Board_num=${BoardDTO.BOARD_NUM }" class="btn btn-danger">삭제</a>		
						</c:if>
					</c:when>
					<c:otherwise>
						<a href="Delete.Board?Board_num=${BoardDTO.BOARD_NUM }" class="btn btn-danger">삭제</a>	
					</c:otherwise>
				</c:choose>
				
				<a href="Question.Board?Board_page_num=${Board_page_num }" class="btn btn-light border">목록</a>
			</div>
			<div class="clearfix"></div>
			
		</div>
	</div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>