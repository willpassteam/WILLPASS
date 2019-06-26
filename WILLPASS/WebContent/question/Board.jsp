<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 사항</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<style type="text/css">
	.floatMenu{
		position:absolute;
		bottom: 650px;
		left:250px; 
		 
		
	}
</style>

</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>

	<div class="container" id="con1" >
		<div class="row">
			<div class="col-sm-12" align="center">
				<h2>공지 사항</h2>
				<br>
				<table class="table mx-3 table-hover">
					<thead class="thead-light">
						<tr>
							<th width="10%" style="text-align: center">번호</th>
							<th width="60%">제목</th>
							<th width="15%" style="text-align: center">조회수</th>
							<th width="15%">등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td align="center">0</td>
							<td>안녕하세요</td>
							<td align="center">3</td>
							<td>2019-06-26</td>
						</tr>
						<tr>
							<td align="center">0</td>
							<td>안녕하세요</td>
							<td align="center">3</td>
							<td>2019-06-26</td>
						</tr>
						<tr>
							<td align="center">0</td>
							<td>안녕하세요</td>
							<td align="center">3</td>
							<td>2019-06-26</td>
						</tr>
						<tr>
							<td align="center">0</td>
							<td>안녕하세요</td>
							<td align="center">3</td>
							<td>2019-06-26</td>
						</tr>
						<tr>
							<td align="center">0</td>
							<td>안녕하세요</td>
							<td align="center">3</td>
							<td>2019-06-26</td>
						</tr>
						<tr>
							<td align="center">0</td>
							<td>안녕하세요</td>
							<td align="center">3</td>
							<td>2019-06-26</td>
						</tr>
						<tr>
							<td align="center">0</td>
							<td>안녕하세요</td>
							<td align="center">3</td>
							<td>2019-06-26</td>
						</tr>
						<tr>
							<td align="center">0</td>
							<td>안녕하세요</td>
							<td align="center">3</td>
							<td>2019-06-26</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4">
								<ul class="pagination">
								  <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
								  <li class="page-item"><a class="page-link" h="#">1</a></li>
								  <li class="page-item"><a class="page-link" href="#">2</a></li>
								  <li class="page-item"><a class="page-link" href="#">3</a></li>
								  <li class="page-item"><a class="page-link" href="#">Next</a></li>
								</ul>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	<div class="floatMenu" style="width:200px" >
		<a href="../question/Board.jsp" class="btn btn-primary w-100 mb-1" >공지사항</a><br>
		<a href="../question/Chatting.jsp" class="btn btn-primary w-100 mb-1">1:1 문의</a><br>
		<a href="../question/Cscenter.jsp" class="btn btn-primary w-100 mb-1">자주 묻는 질문</a><br>
		<a href="../question/Question.jsp" class="btn btn-primary w-100 mb-1">문의 게시판</a>
	</div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>