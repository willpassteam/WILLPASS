<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<script src="../ckeditor/ckeditor.js"></script>


</head>
<body>
	<c:if test="${NoticeDTO.notice_title != null }">
		<c:set var="notice_title" value="${NoticeDTO.notice_title }" />
	</c:if>
	<c:if test="${NoticeDTO.notice_content != null }">
		<c:set var="notice_content" value="${NoticeDTO.notice_content }" />
	</c:if>
	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	
	<div class="container" style="margin-top: 10px;">
		<div class="col-sm-12">
			<c:choose>
				<c:when test="${NoticeDTO.notice_num != null }">
					<form action="Update2.Notice" method="post">
					<input type="hidden" name="notice_num" value="${NoticeDTO.notice_num }">
				</c:when>
				<c:otherwise>
					<form action="write.Notice" method="post">
				</c:otherwise>
			</c:choose>
				
					<br>
					<h2 align="center">공지사항 게시판 글 작성</h2>
					<br>
					<table class="table">
						<tr>
							<th  width="100px" style="padding: auto;"><h5>
									<b>제목</b>
								</h5></th>
							<td><input type="text" class="form-control" name="notice_title" value="${notice_title }"></td>
						</tr>
						<tr>
							<th width="100px" style="padding: auto;"><h5>
									<b>내용</b>
								</h5></th>
							<td>
								<textarea name="notice_content" id="editor1" rows="20" cols="80" placeholder="내용을 입력해주세요." >
					               ${notice_content }
					            </textarea>
					            <script>
					                CKEDITOR.replace( 'editor1' );
					                
					            </script>
				            </td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<c:choose>
									<c:when test="${NoticeDTO != null }">
										<input type="submit" class="btn btn-dark" value="작성" />	
									</c:when>
									<c:otherwise>
										<input type="submit" class="btn btn-dark" value="수정" />
									</c:otherwise>
								</c:choose>
								&nbsp;
								<a class="btn btn-danger" onclick="location.href='Board.Notice'">취소</a>
							</td>
						</tr>
					</table>
				</form>
		</div>
	</div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>

</body>
</html>