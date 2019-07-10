<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 사항</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>

</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>

	<div class="container-flude" id="con1" >
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-1 w-100" style="padding-top: 92px">
				<a href="../question/Board.jsp" class="btn btn-primary w-100 mb-1" >공지사항</a><br>
				<a href="../question/Chatting.jsp" class="btn btn-primary w-100 mb-1">1:1 문의</a><br>
				<a href="../question/Cscenter.jsp" class="btn btn-primary w-100 mb-1">자주 묻는 질문</a><br>
				<a href="../question/Question.jsp" class="btn btn-primary w-100 mb-1">문의 게시판</a>
			</div>
			<div class="col-sm-6" align="center">
				<br>
				<h2>공지 사항</h2>
				<br>
				<table class="table mx-3 table-hover">
					<thead class="thead-light">
						<tr>
							<th width="7%" style="text-align: center">번호</th>
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
							<td colspan="2">
								<ul class="pagination">
								  <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
								  <li class="page-item"><a class="page-link" h="#">1</a></li>
								  <li class="page-item"><a class="page-link" href="#">2</a></li>
								  <li class="page-item"><a class="page-link" href="#">3</a></li>
								  <li class="page-item"><a class="page-link" href="#">Next</a></li>
								</ul>
								
							</td>
							<td colspan="2">
								<a href="Boardwrite.jsp" class="btn btn-dark float-right btn-sm"><i class="fas fa-pen-fancy"></i>글 쓰기</a>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
	
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>