<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<script type="text/javascript">
function fn_img(){
	document.getElementById("con1").setAttribute('style',"display:none");
	document.getElementById("con2").setAttribute('style',"display:inline");
}

$("#allCheck").on('toggle',function(){
	$("[name=Check]").attr('checked','checked');
	
	
});


</script>
<style>
	.box{
		border: 1px solid #D8D8D8;
		margin-bottom: 10px;
		padding:10px;
		border-radius: 3px;
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
				<h2>회원가입을 환영합니다.</h2>
				<br>
				<h5>여행의 지혜, FLY SMART 에어부산 회원가입을 시작하세요!</h5>
				<br>
				<h4>가입유형</h4>
				<img id="click"alt="" src="../img/회원가입창.PNG" width="60%" onclick="fn_img();">
			</div>
		</div>
	</div>
	
	
	<div class="container" id="con2" style="display: none;">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="row">
					
					<form >
						<div class="col-sm-2"></div>	
						<div class="col-sm-8">
							<div class="box" align="left" data-toggle="buttons">
								<label class="checkbox-inline"><input type="checkbox" autocomplete="off" name="Check" id="allCheck" ><b>아래 약관 및 개인정보 수집,이용 등에 모두 동의 합니다.</b></label><a href="#" class="pull-right">보기</a><br>
								<label class="checkbox-inline"></span><input type="checkbox" name="Check" >서비스 약관</label><a href="#" class="pull-right">보기</a><br>
								<label class="checkbox-inline"></span><input type="checkbox" name="Check" >개인정보 수집,이용 동의</label><a href="#" class="pull-right">보기</a><br>
								<label class="checkbox-inline"></span><input type="checkbox" name="Check" >고유식별정보의 수집,이용 동의</label><a href="#" class="pull-right">보기</a><br>
							</div>
							<br>
							<div class="box" >
								<input type="text" class="form-control" placeholder="아이디를 적어주세요"><br>
								<input type="password" class="form-control" placeholder="비밀번호 8 ~ 10자의 영문 숫자 조합(특수문자제외)"><br>
								<input type="password" class="form-control" placeholder="비밀번호 확인"><br>
								<input type="email" class="form-control" placeholder="이메일을 적어주세요"><br>
								<input type="text" class="form-control" placeholder="휴대폰 번호를 적어주세요"><br>
								<input type="text" class="form-control" placeholder="주소를 입력해주세요"><br>
								<input type="text" class="form-control" placeholder="생년 월일을 적어주세요 Ex) 1996-01-01"><br>
								
							</div>
							<br>
							<div align="center">
								<input type="submit" value="회원 가입" class="btn btn-success">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-danger" value="이전 페이지로">
							</div>
					
						</div>
						<div class="col-sm-2"></div>
					</form>	
					
				</div>
			</div>
			<div class="col-sm-3"></div>
			
		</div>
	
	
	</div>
	
	
	
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
	
	

</body>
</html>