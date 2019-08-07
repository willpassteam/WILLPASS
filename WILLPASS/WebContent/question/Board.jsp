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
<c:if test="${MSG != null }">
		<script type="text/javascript">
			alert("${MSG}");
		</script>
		
	</c:if>

</head>
<body>
	<c:set var="Notice_page" value="${Notice_page}" scope="request"></c:set>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>

	<div class="container-flude" style="min-height: 630px" id="con1" >
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-1 w-100" style="padding-top: 92px">
				<a href="Board.Notice" class="btn btn-dark w-100 mb-1" >공지사항</a><br>
				<a href="ChatStart.chat" class="btn btn-dark w-100 mb-1">1:1 문의</a><br>
				<a href="../question/Cscenter.jsp" class="btn btn-dark w-100 mb-1">자주 묻는 질문</a><br>
				<a href="Question.Board" class="btn btn-dark w-100 mb-1">문의 게시판</a>
				<c:if test="${user_id == 'admin' }">
					<a href="ChattingSystem.jsp" class="btn btn-danger w-100 mb-1">1:1문의시스템</a><br>
				</c:if>
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
						<c:forEach var="List" items="${NoticeList }" >
							<tr>
								<td align="center">${List.notice_num }</td>
								<td><a href="View.Notice?Notice_num=${List.notice_num }">${List.notice_title }</a></td>
								<td align="center">${List.notice_count }</td>
								<td>${List.notice_date }</td>
							</tr>
						</c:forEach>
						
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								<ul class="pagination">
								  <!--  페이지 넘버가 0이 아닐때   ㅁㅁㅁ 중 가운데에 현페이지 넘버  -->
								<c:choose>
									<c:when test="${Notice_page == 0 }"><!-- 현재페이지가 0 번일때  -->
										<li class="page-item active"><a class="page-link" href="Board.Notice?Notice_page=${Notice_page}">${Notice_page +1}</a></li>
										<c:choose>
											<c:when test="${NoticeAllCount > 10 && NoticeAllCount < 21 }">
												<li class="page-item"><a class="page-link" href="Board.Notice?Notice_page=${Notice_page + 1 }">${Notice_page +2}</a></li>	
											</c:when>
											<c:when test="${NoticeAllCount > 20 }">
												<li class="page-item"><a class="page-link" href="Board.Notice?Notice_page=${Notice_page+ 1 }">${Notice_page +2}</a></li>
												<li class="page-item"><a class="page-link" href="Board.Notice?Notice_page=${Notice_page + 2 }">${Notice_page +3}</a></li>
											</c:when>
										</c:choose>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="Board.Notice?Notice_page=${Notice_page - 1}">${Notice_page }</a></li>
								  		<li class="page-item active"><a class="page-link" href="Board.Notice?Notice_page=${Notice_page}">${Notice_page +1}</a></li>
								  		<c:choose>
								  			<c:when test="${NoticeAllCount > (Notice_page+1)*10 }">
								  				<li class="page-item"><a class="page-link" href="Board.Notice?Notice_page=${Notice_page + 1 }">${Notice_page +2}</a></li>
								  			</c:when>
								  		</c:choose>
									</c:otherwise>
								</c:choose>
								</ul>
								
							</td>
							<td colspan="2">
								<c:if test="${user_id == 'admin' }">
									<a href="writePage.Notice" class="btn btn-dark float-right btn-sm"><i class="fas fa-pen-fancy"></i>글 쓰기</a>
								</c:if>
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