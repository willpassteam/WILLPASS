<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
</head>
<body>
	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>
	<div class="container">
		<div class="row" align="center">
			<div class="col-sm-12">
				<h2>로그인</h2>
				<br>
				<h5>개인 정보 보호를 위해 20분 동안 작동이 없으면 로그아웃 됩니다.</h5>
			</div>
		</div>
		<br>
		<div class="row ">
			<div class="col-sm-12 ">
				<h3>회원 로그인</h3>
				<div class="row ">
					<div class="col-sm-6">
							<form action="./member/MemberloginAction.me">
						<div class="row">
							<div class="col-sm-1"></div>
							<div class="col-sm-7">
								<input type="email" name="user_email" id="user_email" class="form-control" placeholder="이메일 주소" ><br>
<!--                                 	<input type="id" class="form-control" name="user_id" placeholder="아이디"> -->
								<input type="password" id="user_pwd" name="user_pwd" class="form-control" placeholder="비밀번호">
<!-- 					<input type="id" name="user_id" class="form-control" placeholder="id"> -->
								<br>
								<h6>* 아이디 / 비밀번호는 영문 대소문자를 구분합니다. </h6>
							</div>
							<div class="col-sm-3">
								<br>
								<input type="submit" class="btn btn-primary btn-lg" value="로그인">
							</div>
							<div class="col-sm-1"></div>
						</div>
					</form>
					</div>
					
					<div class="col-sm-6">	
						<div class="col-sm-12">
							<br>
							<br>
							<h4><a href="../user/Userfind.jsp">아이디 찾기</a> | <a href="../user/Userfind.jsp">비밀번호 찾기</a></h4>
						</div>
					</div>
				</div>
			</div>
			<br>
			<br>
			<h3>비회원 로그인</h3>
			<div class="col-sm-12">
				<div class="col-sm-6">
					<form>
						<div class="row">
							<div class="col-sm-1"></div>
							<div class="col-sm-7">
								<input type="email" class="form-control" name="user_email" placeholder="이메일 주소" ><br>
								<input type="password" class="form-control" name="user_pwd" placeholder="비밀번호">
							
								
							</div>
							<div class="col-sm-3">
								<br>
								<input type="submit" class="btn btn-primary btn-lg" value="로그인">
							</div>
							<div class="col-sm-1"></div>
						</div>
					</form>
					<br>
					<div class="row">
						<div class="col-sm-1"></div>
						<div class="col-sm-10">
							<h5>SNS로그인</h5>
							<img alt="" src="../img/naver.PNG"><img alt="" src="../img/Google.PNG"><img alt="" src="../img/kakao.PNG">
							<ul>
								<li><h6><small>비회원 로그인 시 이벤트 참여 및 스탬프 적립할 수 없습니다.</small></h6></li>
								<li><h6><small>예약내역은 [마이페이지 > 나의 예약 조회]에서 확인 가능합니다.</small></h6></li>
								<li><h6><small>비회원 로그인 시 계정정보를 반드시 기억해 두셔야 예약 내역을
								<br>조회하실 수 있습니다.</small></h6></li>
								<li><h6><small>에어부산 홈페이지 FAQ에서 비회원 로그인 및 예약조회 방법
								<br>확인이 가능합니다.</small></h6></li>
							</ul>							
						</div>
						<div class="col-sm-1"></div>
					</div>
				</div>
				<div class="col-sm-6">
					
					<h4>개인정보보호를 위한 이용자 동의(필수)</h4>
					<textarea rows="10" cols="70" style="text-align: left;resize: none;" readonly="readonly">
상기 개인정보의 수집, 이용 사항에 동의합니다. 비회원으로 예매하실 경우 요금 할인과 각종 이벤트 혜택의 기회가 상실 됩니다. 항공권 예매정보는 마이 페이지에서 비회원 예매정보 보기에서 보실 수 있습니다.
1. 수집하는 개인정보 항목 및 수집방법1) 수집항목가. 부가 서비스 및 맞춤식 서비스 이용 과정에서 해당 서비스의 이용자에 한해서만 아래와 같은 정보들이 수집될 수 있습니다.
&lt;비회원 항공권 예약발권&gt;
- 필수항목 : 성명, 전화번호(휴대폰 번호), 이메일주소
&lt;비회원 항공권 예약발권(미주 노선)&gt;
- 필수 항목 : 탑승고객정보(여권유무, 성별, 생년월일, 여권번호, 여권만료일, 발급처, 국적), 미국 내 체류지 정보(탑승고객, 국가(COUNTRY), 주(STATE), 도시(CITY), 주소(ADDRESS), 우편번호(ZIP CODE))
&lt;홈페이지, Q&A 이용 및 이벤트 참여&gt;
- 필수항목 : 성명, 전화번호(휴대폰 번호), 이메일주소
&lt;비회원으로 예약센터 등을 통한 질의 및 이벤트 참여&gt;
- 필수항목 : 성명, 전화번호(휴대폰 번호, 자택번호, 이메일주소 중 택일)

나. 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
&lt;대금 결제&gt;
- 신용카드 결제시 : 카드번호 및 카드 인증정보 등
- 실시간 계좌이체 결제시 : 계좌번호 및 결제은행 코드 등
					
2) 수집 방법 및 동의
ㆍ개인정보 수집방법 : 홈페이지(모바일포함), 이벤트 참여, 제휴사로부터의 제공
ㆍ개인정보 수집 동의 방법
- 온라인 : 회사는 고객이 개인정보 처리방침 또는 이용약관의 내용에 대해 '동의함’ 버튼을 클릭할 수 있는 절차를 마련하고 있으며, '동의함' 버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.
					
2. 개인정보의 수집 및 이용목적
1) 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 : 콘텐츠 제공, 항공권 예약ㆍ발권, 항공권 등 각종 물품배송 또는 청구서 발송, 구매 및 요금결재, 요금추심 
2) 회원관리 : 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 만 14세 미만 아동 개인 정보 수집 시 법정 대리인 동의여부 확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달 
3) 신규서비스 개발 : 신규 서비스 개발, 이용자의 서비스 이용에 대한 통계
					
3. 개인정보의 보유 및 이용기간
이용자의 동의 하에 수집된 개인정보는 이용자가 에어부산 인터넷 웹사이트상의 서비스를 이용하는 동안 보유/이용됩니다. 당사는 아래와 같이 개인정보의 수집 및 이용 목적이 달성된 때 수집된 개인정보를 지체 없이 파기하겠습니다. 
- 회원 가입 정보의 경우: 회원 탈퇴 요청이 있거나 회원 자격을 상실한 때 
- 설문조사, 이벤트 등 일시적 목적을 위하여 수집한 경우: 당해 설문조사, 이벤트 등 종료한 때 
- 사업을 폐지하는 경우 
다만, 개인정보의 수집 및 이용 목적이 달성된 경우에도 상법, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요성이 있는 경우 및 사전에 보유기간을 이용자에게 고지하거나 명시한 경우 등은 그에 따라 개인정보를 보관할 수 있습니다. 
1) 계약 또는 청약철회 등에 관한 기록, 대금 결제 및 재화 등의 공급에 관한 기록 
보존 사유: 전자상거래 등에서의 소비자 보호에 관한 법률 
보존 기간: 5년 
2) 소비자의 불만 또는 분쟁 처리 기록 
보존 사유: 전자상거래 등에서의 소비자 보호에 관한 법률 
보존 기간: 3년 
3) 전자금융 거래에 관한 기록 
보존 사유: 전자금융거래법 
보존 기간: 3년 
4) 홈페이지 방문에 관한 기록 
보존 사유: 통신비밀보호법 
보존 기간: 3개월

4. 개인정보의 수집 및 이용에 대한 동의 거부 관련
당사는 서비스 제공에 필요한 최소한의 정보만을 수집합니다. 이용자는 개인정보의 수집 및 이용 동의에 거부하실 수 있으며, 다만 이 경우 서비스의 일부 또는 전부 이용이 어려울 수 있습니다.
				</textarea><br>
					<input type="checkbox" name=""><label for="">개인정보보호를 위한 이용자 동의(필수)</label>
					
				</div>
			
			</div>
			
		</div>
	
	</div>
	
	
	
	
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>