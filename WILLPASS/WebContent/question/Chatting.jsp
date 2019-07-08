<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 문의 사이트</title>

<!-- 아이콘 사용을 위한 CDN링크 -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	<div class="m-3 p-3">
	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6 border rounded" >
				<br>
				<h4 class="bg-light shadow-sm p-2 rounded" >1:1 채팅 문의<a class="float-right btn btn-primary btn-sm" href="#">대화 종료</a></h4>
				<br>
				<div class="media border p-1 mb-3 bg-light rounded border-success shadow-sm">
					<div class="media-body">
						<h6>안녕하세요 ㅁㅁㅁ님. 문의하고 싶은 내용을 적어주세요<small><i style="float: right;">07-03/23:30</i></small></h6>
					</div>
				</div>
				<div class="media border p-1 mb-3 border-primary rounded shadow-sm">
					<div class="media-body">
						<h6>예약번호 조회가 안되네요 예약번호는 2019070320154 입니다.<small><i style="float: right;">07-03/23:46</i></small></h6>
				    </div>
			 	</div>
				<div class="media border p-1 mb-3 bg-light rounded border-success shadow-sm">
					<div class="media-body">
						<h6><small><i style="float: right;">07-03/23:30</i></small></h6>
					</div>
				</div>
				<div class="media border p-1 mb-3 border-primary rounded shadow-sm">
					<div class="media-body">
						<h6>예약번호 조회가 안되네요 예약번호는 2019070320154 입니다.<small><i style="float: right;">07-03/23:46</i></small></h6>
				    </div>
			 	</div>
			 	<div class="media border p-1 mb-3 bg-light rounded border-success shadow-sm">
					<div class="media-body">
						<h6>안녕하세요 ㅁㅁㅁ님. 문의하고 싶은 내용을 적어주세요<small><i style="float: right;">07-03/23:30</i></small></h6>
					</div>
				</div>
				<div class="media border p-1 mb-3 border-primary rounded shadow-sm">
					<div class="media-body">
						<h6>예약번호 조회가 안되네요 예약번호는 2019070320154 입니다.<small><i style="float: right;">07-03/23:46</i></small></h6>
				    </div>
			 	</div>
				<form>
					<div class="input-group mb-3">
				      	<input type="text" class="form-control" placeholder="내용을 입력해주세요.">
				      	<div class="input-group-append">
				       		 <button class="btn btn-primary" type="button">메시지입력</button>  
				      	</div>
				  	</div>
				</form>
			</div>
			<div class="col-sm-3"></div>
		</div>	
		
		
	</div>
	</div>

	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>