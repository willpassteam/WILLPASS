<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<script type="text/javascript">
var newPwdCheck = "";
function fnModify(){
	
	var newPwd1 = $("[name=Newpwd1]").val();
	var newPwd2 = $("[name=Newpwd2]").val();
	if(newPwd1 != newPwd2){
		$(".pwdcheck").show();
		newPwdCheck = "No";
	}else{
		$(".pwdcheck").hide();
		newPwdCheck = "Check";
	}
	
	
	
	
}
function fnModifyCheck(){
	var user_pwd = $("[name=user_pwd]").val()
	var user_pwd1 = "${mem.user_pwd}";
	if(user_pwd != user_pwd1){
		alert("비밀번호가 틀립니다.")
		return;
	}else if(user_pwd == user_pwd1 && newPwdCheck =="Check" || newPwdCheck ==""  ){
		$("[name=Check]").val(newPwdCheck);
		document.modify.submit();
	}else if(newPwdCheck =="No"){
		alert("새로운 비밀번호가 틀립니다.")
		return;
	}
		
	
	
}

</script>
</head>
<body>

	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	<br>
	<br>
	<div class="container" style="min-height: 640px">
		<h2 align="center">회원정보 수정</h2>
		<br>
		<div class="row ">
			
			<div class="col-sm-2"></div>
			<div class="col-sm-8 p-3">
				<form action="./MemberUpdateAction.me" method="post" name="modify">
				<input type="hidden" name="Check" value="">
				
<!-- 				<form action="./member/MemberUpdateAction.me"> -->
<!-- 				<input type="hidden" value="1" name="user_non"> -->

				<div class="row ">
					<div class="col-sm-6">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">아이디</span>
						    </div>
						    <input type="text" class="form-control" value="${mem.user_id}" name="user_id"  readonly="readonly">
						</div>
					</div>	
					<div class="col-sm-6">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">비밀번호</span>
						    </div>
						    <input type="text" class="form-control" name="user_pwd">
						    <div class="input-group-prepend">
						      <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#modifypwd">비밀번호 수정</button>
						    </div>
						</div>
					</div>
				</div>
					<div id="modifypwd" class="collapse row">
						<div class="col-sm-6">
							<div class="input-group mb-3">
							    <div class="input-group-prepend">
							      <span class="input-group-text">새로운 비밀번호</span>
							    </div>
							    <input type="password" class="form-control" onchange="fnModify()" name="Newpwd1">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="input-group mb-3">
							    <div class="input-group-prepend">
							      <span class="input-group-text">새로운 비밀번호 확인</span>
							    </div>
							    <input type="password" class="form-control" onchange="fnModify()" name="Newpwd2">
							</div>
						</div>							
				  	</div>
				  	<div class="text-danger ml-3 pwdcheck" style="display: none;">
				  		비밀번호가 다릅니다.
				  	</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">휴대폰번호</span>
						    </div>
						    <input type="text" class="form-control" value="${mem.user_mobile}" name="user_mobile">
						</div>
					</div>
					<!-- <div class="col-sm-6">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">생년월일</span>
						    </div>
						    <input type="text" class="form-control" value="Userage">
						</div>
					</div> -->
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">이메일</span>
						    </div>
						    <input type="text" class="form-control" value="${mem.user_email}" name="user_email" readonly="readonly">
						</div>
					</div>	
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						      <span class="input-group-text">주소</span>
						    </div>
						    <input type="text" class="form-control" value="${mem.user_address}" name="user_address">
						</div>
					</div>	
				</div>
				
				<div class="row">
					<div class="col-sm-12" align="center">
						<input type="button" value="정보 수정" class="btn btn-primary" onclick="fnModifyCheck()"> <input type="reset" value="다시 작성" class="btn btn-danger">
					</div>
				</div>
				
				</form>
			</div>
			
			<div class="col-sm-2"></div>
			
		</div>
	</div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>

</body>
</html>