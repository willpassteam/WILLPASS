<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WIllPASS회원가입_1단계</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<script type="text/javascript">


//이메일인증이미지 클릭했을떄
//새로운 window창 open
function emailverif() {
	   
	   window.open("Userjoinemail.jsp", "회원가입","width=550 height=650 menubar=no status=no");

}

</script>
</head>
<body>
	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	
	<div class="bg-light mt-0 pt-5 pb-5">   
	<div class="container border bg-white pb-5 ">
	<h2 class="text-center mt-5 mb-4">회원가입</h2>
	<h6 class="text-center text-muted">WILLPASS 회원가입을 환영합니다!</h6>
	<h6 class="text-center text-muted mb-4 small">회원으로 가입하시면 할인쿠폰 등 다양한 혜택을 받으실 수 있으며, 항공권 특가 정보와 이벤트 소식을 이메일로 받아보실 수 있습니다.</h6>
<!-- 	<img src="../img/user/join1.png" class="col-12"> -->
	
	<div class="container">
	
		<div class="row ml-0 mr-0">
			<div class="col-6 text-primary text-center  border pr-0 pl-0 border-bottom-0 border-top-0" >
				<hr class="bg-primary mt-0 mb-0 pl-0 pr-0"><hr class="bg-primary mt-0">
				<a class="text-decoration-none" href="#"><b>대한민국 국적자</b></a>
			</div>
			<div class="col-6 text-center border pt-2 pl-0">
				<b class="">해외 국적자</b>
			</div>
		</div>
		
		<div class="border border-top-0 pt-4 pl-4 pr-5">
			<div class="container pl-5 pt-5">
				<h6 class=" mb-4">원하시는 인증방법을 선택해 주세요.</h6>
				<div class="row ">
					<div class="col-6 border">
						<a href="#"><img src="../img/user/smartphone.png" width="100%" height="80%"></a>
						<p class=" small text-center">본인 명의로 가입된 휴대폰 번호를 통한 인증 </p>
					</div>

					<div class="col-6 border">
						<a><img src="../img/user/email.png" width="100%" height="80%" onclick="emailverif()"></a>
						<p class=" small text-center">이메일으로 인증</p>
					</div>
				</div>
				
				<div class="mt-5 text-muted small">
					<ul>
						<li>만 14세 미만 미성년자의 경우 보호자의 동의 및 인증이 필요합니다. </li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>