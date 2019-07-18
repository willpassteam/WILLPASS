<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의 게시판 글 작성 페이지</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<script src="../ckeditor/ckeditor.js"></script>
		

</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>

	<div class="container" style="margin-top: 10px;">
		<div class="col-sm-12">
			<form action="replyWrite.Board" method="post">
				<input type="hidden" name="board_num" value="${BoardDTO.BOARD_NUM }">
				<br>
				<h2>문의 게시판 글 작성</h2>
				<br>
				<table class="table">
					<tr>.
						<th  width="100px" style="padding: auto;"><h5>
								<b>제목</b>
							</h5></th>
						<td><input type="text" class="form-control" name="board_title" value="${BoardDTO.BOARD_TITLE }의 답글 입니다." readonly="readonly"></td>
					</tr>
					<tr>
						<th width="100px" style="padding: auto;"><h5>
								<b>내용</b>
							</h5></th>
						<td height="400px">
							<textarea name="board_content" id="editor1" rows="20" cols="80" placeholder="내용을 입력해주세요.">
				               	문의하신 내용 :
				               ${BoardDTO.BOARD_CONTENT }
				               	<hr>
				               	<br>
				            </textarea>
				            <script>
				                // Replace the <textarea id="editor1"> with a CKEditor
				                // instance, using default configuration.
				                CKEDITOR.replace( 'editor1' );
				            </script>
			            </td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="submit" class="btn btn-primary" value="작성" />&nbsp;
							<a class="btn btn-danger" onclick="location.href='Question.Board'">취소</a>
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