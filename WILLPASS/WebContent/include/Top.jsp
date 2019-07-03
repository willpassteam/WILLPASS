<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<style type="text/css">
nav a{
	color: black;

}


.second-nav li{
	padding:10px 50px;
	font-size: 25px;
}
.second-nav li:HOVER{
	color: #FACC2E;
	cursor: pointer
	
}
.nt{
	font-size: 20;
	font-weight: bold;
	
	
}
.navrow{
	padding-top:25px;
}
.menubar{
	z-index: 5;
	position: absolute;
	
	
}

</style>

<script type="text/javascript">
$(function(){
	$(".nt").on("mouseover",function(){
		var index = $(".nt").index(this);
		console.log(index);
		$(".nc").removeClass('show');
		$(".nc:eq("+index+")").addClass('show');
	});
	$(".nt").on("mouseleave",function(){
		var t = 0;
		$(".menubar").on("mouseenter",function(){
			$(".menubar").on("mouseleave",function(){
				$(".nc").removeClass('show');
			});
		});
		
	});
})	

</script>

</head>
<body>
	
 <div class="col">
 	
 	<div class="row bg-primary">
 		<div class="col-sm-7"></div>
 		<div class="col-sm-3 pl-5">
	 		<h6 class="text-dack float-right py-1">
	 		<small>
	 			<a class="text-light" href="../user/Userlogin.jsp">로그인</a> | 
	 			<a class="text-light" href="../user/Userjoinimg.jsp">회원가입</a> | 
	 			<a class="text-light" href="../question/Board.jsp">고객센터</a> | 
	 			<a class="text-light" href="#">사이트맵</a>
	 		</small>
	 		</h6>
 		</div>	
 		<div class="col-2"></div>
 </div>
	</div>
	
 	<div class="clearfix"></div>
 	
	<div class="container">
	<div class="container">
		<div class="row mb-3" height="130px" >
			<div class="col-sm-4">
				<a href="../main/index.jsp">
					<img alt="" src="../img/Logo.PNG">
				</a>
			</div>
			<div class="col-sm-8 mt">
				<div class="row navrow">
					<div class="col">
						<a href="#" class="nt">예약/스케쥴</a>
						<!-- <div class="nv" style="display:none;">
							<ul>
								<li><a href="#">항공권예약</a></li>
								<li><a href="#">번개 간편 예약</a></li>
								<li><a href="#">단체 예약문의</a></li>
								<li><a href="#">실시간출도착</a></li>
								<li><a href="#">취향노선</a></li>
								<li>
									<dl>
										<dt>운임 안내</dt>
										<dd>국내선</dd>
										<dd>국제선</dd>
									</dl>
								</li>
								<li><a href="#">스케줄 조회</a></li>	
							</ul>
						</div> -->
					</div>
					<div class="col">
						<a href="#" class="nt" >예약조회</a>
					</div>
					<div class="col">
						<a href="#" class="nt">FLY & STAMP</a>
						
					</div>
					<div class="col">
						<a href="#" class="nt">서비스 안내</a>
						
					</div>
					<div class="col">
						<a href="#" class="nt">이벤트</a>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container menubar">
		<div class="row w-100 menurow">
			<div class="collapse nc w-100">
				<div class="nv w-100" >
					<ul class="list-group list-group-horizontal" >
						<li class="list-group-item w-25"><a href="#">항공권예약</a></li>
						<li class="list-group-item w-25"><a href="#">번개 간편 예약</a></li>
						<li class="list-group-item w-25"><a href="#">단체 예약문의</a></li>
						<li class="list-group-item w-25"><a href="#">실시간출도착</a></li>
						<li class="list-group-item w-25"><a href="#">취향노선</a></li>
						<li class="list-group-item w-25">
							<dl>
								<dt>운임 안내</dt>
								<dd>국내선</dd>
								<dd>국제선</dd>
							</dl>
						</li>
						<li class="list-group-item w-25"><a href="#">스케줄 조회</a></li>	
					</ul>
				</div>
			</div>
			<div class="collapse nc w-100">
				<div class="nv w-100" >
					<ul class="list-group list-group-horizontal">
						<li class="list-group-item w-50"><a href="#">나의 예약조회</a></li>
						<li class="list-group-item w-50"><a href="#">구매내역</a></li>
						<li class="list-group-item w-50">
							<dl>
								<dt>제휴사 예약조회</dt>
								<dd>호텔</dd>
								<dd>렌터카</dd>
								<dd>여행자보험</dd>
								<dd>와이파이</dd>
								<dd>금호리조트</dd>	
							</dl>
						</li>
					</ul>
				</div>
			</div>
			<div class="collapse nc w-100">
				<div class="nv w-100">
					<ul class="list-group list-group-horizontal">
						<li class="list-group-item w-25">
							<dl>
								<dt>FLY & STAMP 안내</dt>
								<dd>혜택 및 이용방법</dd>
								<dd>MINI STAMP</dd>
								<dd>규정</dd>
							</dl>
						</li>
						<li class="list-group-item w-25">
							<dl>
								<dt>나의 STAMP</dt>
								<dd>전체조회</dd>
								<dd>상세조회</dd>									
							</dl>
						</li>
						<li class="list-group-item w-25">
							<a href="#">STAMP 구매/환불</a>
						</li>
						<li class="list-group-item w-25">
							<a href="#">STAMP 양도</a>
						</li>
						<li class="list-group-item w-25">
							<a href="#">누적 STAMP 적립</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="collapse nc w-100">
				<div class="nv w-100">
					<ul class="list-group list-group-horizontal">
						<li class="list-group-item w-25">
							<dl>
								<dt>예약/항공권</dt>
								<dd>홈페이지/모바일/전화 예약</dd>
								<dd>전자항공권(여정안내서)</dd>
								<dd>항공권 환불	</dd>
								<dd>항공권 재발행</dd>
							</dl>
						</li>
						<li class="list-group-item w-25">
							<dl>
								<dt>도움이 필요하신 고객</dt>
								<dd>투게더 서비스</dd>
								<dd>혼자 여행하는 어린이</dd>
								<dd>임산부/유아동반 고객</dd>
								<dd>반려동물과 여행 시</dd>
								<dd>의사소견서가 필요한 고객</dd>
							</dl>
						</li>
						<li class="list-group-item w-25">
							<dl>
								<dt>공항 서비스</dt>
								<dd>탑승수속</dd>
								<dd>연결탑승수속</dd>
								<dd>탑승권 자동발급</dd>
								<dd>홈페이지/모바일 탑승권</dd>
								<dd>취항지 공항/카운터정보</dd>
								<dd>출입국 신고서</dd>
								<dd>라운지 안내</dd>
							</dl>
						</li>
						<li class="list-group-item w-25">
							<dl>
								<dt>수하물</dt>
								<dd>무료 수하물</dd>
								<dd>초과 수하물</dd>
								<dd>특수 수하물</dd>
								<dd>포장용품구입</dd>
								<dd>운송제한 물품</dd>
								<dd>수하물 배상</dd>
								<dd>유실물 안내</dd>
							</dl>
						</li>
						<li class="list-group-item w-25">
							<dl> 
								<dt>수하물</dt>
								<dd>무료 수하물</dd>
								<dd>초과 수하물</dd>
								<dd>특수 수하물</dd>
								<dd>포장용품구입</dd>
								<dd>운송제한 물품</dd>
								<dd>수하물 배상</dd>
								<dd>유실물 안내</dd>
							</dl>
						</li>
						<li class="list-group-item w-25">
							<dl>
								<dt>기내 서비스</dt>
								<dd>기내 서비스</dd>
								<dd>기내 면세품</dd>
							</dl>
						</li>
						<li class="list-group-item w-25">
							<dl>
								<dt>부가서비스</dt>
								<dd>부가서비스 번들</dd>
								<dd>수하물 구매</dd>
								<dd>좌석 구매</dd>
								<dd>옆 좌석 구매</dd>
								<dd>기내식 구매</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
			<div  class="collapse nc w-100">
				<div class="nv w-100">
					<ul class="list-group list-group-horizontal">
						<li class="list-group-item w-50">
							<dl>
								<dt>FLY & FUN</dt>
								<dd>국내</dd>
								<dd>해외</dd>
								<dd>웹진</dd>
							</dl>
						</li>
						<li class="list-group-item w-50"><a href="#">이벤트</a></li>
						<li class="list-group-item w-50">
							<dl>
								<dt>여행상품</dt>
								<dd>호텔</dd>
								<dd>렌터카</dd>
								<dd>여행자보험</dd>
								<dd>와이파이</dd>
								<dd>금호리조트</dd>
								<dd>후쿠오카 짐 배송 서비스</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
 	
 						
 	
 </div>
 <hr class="bg-primary mb-0">
 <hr class="bg-primary mt-0 mb-0">


</body>
</html>
