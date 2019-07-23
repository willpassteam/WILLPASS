<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지 사항</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<!-- 아이콘 사용을 위한 css -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style type="text/css">
	
	
	
</style>
</head>
<body>
	<c:if test="${MSG != null }">
		<script type="text/javascript">
			alert("${MSG}");
		</script>
		
	</c:if>
	<c:set var="Board_page_num" value="${Board_page_num }" scope="request"></c:set>
	
	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	

	
	<div class="container-flude" id="con1" >
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-1  w-100" style="padding-top: 85px" >
				<a href="Board.Notice" class="btn btn-dark w-100 mb-1" >공지사항</a><br>
				<a href="" class="btn btn-dark w-100 mb-1">1:1 문의</a><br>
				<a href="../question/Cscenter.jsp" class="btn btn-dark w-100 mb-1">자주 묻는 질문</a><br>
				<a href="Question.Board" class="btn btn-dark w-100 mb-1">문의 게시판</a>
			</div>
			<div class="col-sm-6" align="center">
				<br>
				<h2 align="center">문의 게시판</h2>
				<br>
				<table class="table mx-3 table-hover">
					<thead class="thead-light">
						<tr>
							<th width="7%" style="text-align: center">번호</th>
							<th width="60%">제목</th>
							<th width="20%" style="text-align: center">작성자</th>
							<th width="15%" style="text-align: center">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="boardList" items="${BoardList}" >
							<tr>
								
								<td align="center">${boardList.BOARD_NUM}</td>
								<td>
									<c:if test="${boardList.BOARD_DEPTH == 1 }">
										&nbsp;&nbsp;<i class="fas fa-caret-up" style="color: red"></i>
									</c:if>
									<i class="fas fa-unlock"></i><a href="View.Board?Board_num=${boardList.BOARD_NUM}&Board_page_num=${Board_page_num}">${boardList.BOARD_TITLE}</a></td>
								<td align="center">
									<c:choose>
										<c:when test="${boardList.BOARD_DEPTH == 1 }">
											관리자
										</c:when>
										<c:otherwise>
											${boardList.BOARD_EMAIL}
										</c:otherwise>
									</c:choose>
									</td>
								<td align="center">${boardList.BOARD_DATE}</td>
								
							</tr>
						</c:forEach>
					
						
						
						
						
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								<ul class="pagination">
								
								
								<!--  페이지 넘버가 0이 아닐때   ㅁㅁㅁ 중 가운데에 현페이지 넘버  -->
								<c:choose>
									<c:when test="${Board_page_num == 0 }">
										<li class="page-item active"><a class="page-link" href="Question.Board?Board_page_num=${Board_page_num}">${Board_page_num +1}</a></li>
										<c:choose>
											<c:when test="${BoardCount > 10 && BoardCount < 21 }">
												<li class="page-item"><a class="page-link" href="Question.Board?Board_page_num=${Board_page_num + 1 }">${Board_page_num +2}</a></li>	
											</c:when>
											<c:when test="${BoardCount > 20 }">
												<li class="page-item"><a class="page-link" href="Question.Board?Board_page_num=${Board_page_num + 1 }">${Board_page_num +2}</a></li>
												<li class="page-item"><a class="page-link" href="Question.Board?Board_page_num=${Board_page_num + 2 }">${Board_page_num +3}</a></li>
											</c:when>
										</c:choose>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="Question.Board?Board_page_num=${Board_page_num - 1}">${Board_page_num }</a></li>
								  		<li class="page-item active"><a class="page-link" href="Question.Board?Board_page_num=${Board_page_num}">${Board_page_num +1}</a></li>
								  		<c:choose>
								  			<c:when test="${BoardCount > (Board_page_num+1)*10 }">
								  				<li class="page-item"><a class="page-link" href="Question.Board?Board_page_num=${Board_page_num + 1 }">${Board_page_num +2}</a></li>
								  			</c:when>
								  		</c:choose>
									</c:otherwise>
								</c:choose>
								
								</ul>
							</td>
							<td colspan="3">
								<a href="writePage.Board" class="btn btn-dark float-right btn-sm"><i class="fas fa-pen-fancy"></i>문의하기</a>
								
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>