<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 문의 사이트</title>

<!-- 아이콘 사용을 위한 CDN링크 -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
</head>
<script type="text/javascript">
function fnchatStart() {
	   
	   window.open("Chatting_popup.jsp", "회원가입","width=500 height=640 menubar=no status=no");

}
</script>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	<div class="m-3 p-3">
		<div class="container" style="min-height: 600px; max-height: 700px;">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-3 border rounded p-2">
					<div class="border p-2" style="height: 60px">
						<h6 class="float-left align-center pt-2">나의 문의내역</h6>
						<a href="javascript:fnchatStart()" class="btn btn-primary float-right">문의하기</a>
					</div>
					<div class="border" style="height: 600px;overflow-y:auto">
						<div class="ChatLog" >
							<a href="#" class="btn btn-light btn-outline-primary" style="font-size: 20px;width: 265px" >2019-07-29/22:14</a>
						</div>
					</div>
				</div>
				<div class="col-sm-7 border rounded p-2"></div>
				<div class="col-sm-1"></div>

			</div>


		</div>
	</div>

	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>