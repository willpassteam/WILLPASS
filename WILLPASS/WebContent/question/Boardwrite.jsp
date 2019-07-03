<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<div class="container" style="margin-top: 10px;">
		<div class="col-sm-12">
			<form action="bbsWriter" method="post" class="" name="bbsWriter" enctype="multipart/form-data">
				<br>
				<h2>공지사항 글 작성</h2>
				<br>
				<table class="table">
					<tr>
						<th  width="100px" style="padding: auto;"><h5>
								<b>제목</b>
							</h5></th>
						<td><input type="text" class="form-control" name="bbs_title"></td>
					</tr>
					<tr>
						<th width="100px" style="padding: auto;"><h5>
								<b>내용</b>
							</h5></th>
						<td><textarea class="form-control" rows="50" name
						="bbs_content" style="height: 300px;"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="submit" class="btn btn-primary" value="작성" />&nbsp;
							<a class="btn btn-danger" onclick="location.href='Board.jsp'">취소</a>
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