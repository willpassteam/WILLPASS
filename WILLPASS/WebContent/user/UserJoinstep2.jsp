<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>WIllPASS회원가입_2단계</title>
<script type="text/javascript">

function fnjoinbtn(){
	location.href="UserJoinstep3.jsp";
}
function idcheck() {
	var id=$("#user_id").val();
	$.ajax({
		type : 'POST',
		url  : '/WILLPASS/idcheck',
		data: { id : id }, //{parameterName, data} 형식
		success: function(result){
			if(result==0){ //결과가 1이면 사용할수 있는 아이디
				$("#checklabel").removeClass("text-danger");
				$("#checklabel").addClass("text-success");
				$("#checklabel").html("<b class='text-info'>√ </b>사용할 수 있는 아이디입니다.");
			
			}else{//결과가 1이 아니라면 사용할수 없는 아이디
				$("#checklabel").removeClass("text-success");
				$("#checklabel").addClass("text-danger");
				$("#checklabel").html("<b class='text-info'>√ </b>사용할 수 없는 아이디입니다.");
			}				
		}
	});
}

</script>
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<!-- 아이콘을 위한 css -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
	<div class="container pl-5 border">
	<div class="row pl-3 mt-4">
	<h5 class=" d-inline-block col-9">회원정보 입력</h5>
	 <b class="text-danger small col-3 text-center pl-5">* 는 필수 입력 항목입니다.</b>
	</div>
	<div class="mt-3 col-12">
	 <table class="table table-bordered">
    <tbody>
      <tr>
        <td width="20%" class="bg-light">아이디 <b class="text-danger">*</b></td>
        
        <td width="80%" class="pb-0 pt-0">
        <div class="row mb-0 pb-0 pt-2">
      <div class="input-group col-5 pl-0 pt-1 pb-1 mr-0 pr-3 ml-3">
 			<input type="text" class="form-control col-7" name="user_id" id="user_id">
			 <div class="input-group-prepend col-5 pl-0 pr-0">
      	 <button type="button" class="btn btn-outline-primary  pt-0 pb-0 pr-3" onclick="idcheck()">중복확인</button>
      </div>
  	</div>
        <p class=" d-inline-block col-6 ml-4 pt-2 small text-success " id="checklabel"><b class="text-info">√ </b>사용 가능한 아이디.  6~15자의 영문 소문자 ,숫자만 사용가능</p>
        </div>
        </td>
      </tr>
      
      <tr>
        <td width="20%" class="bg-light">비밀번호 <b class="text-danger">*</b></td>
        
        <td width="80%" class="pb-0 pt-0">
        <div class="row mb-0 pb-0 pt-2">
        <input type="text" placeholder="" class="form-control col-5 ml-3">
        <p class=" d-inline-block col-5 ml-4 pt-2 small text-muted">10~15자의 영문,숫자 조합으로 가능합니다.</p>
        </div>
        </td>
      </tr>
      
       <tr>
        <td width="20%" class="bg-light">비밀번호 확인<b class="text-danger">*</b></td>
        
        <td width="80%" class="pb-0 pt-0">
        <div class="row mb-0 pb-0 pt-2">
        <input type="text" placeholder="" class="form-control col-5 ml-3">
        </div>
        </td>
      </tr>     
    </tbody>
  </table>
	
	</div>
	
	
	<div class="mt-4 col-12">
	 <table class="table table-bordered">
    <tbody>
      <tr>
   <td width="20%" class="bg-light">한글성명<b class="text-danger">*</b></td>
   <td width="40%">
   		<div class="row mb-0 pb-0 pt-2">
        <input type="text" placeholder="" class="form-control col-10 ml-3">
        </div>
   </td>
   <td width="20%" class="bg-light">성별<b class="text-danger">*</b></td>
   <td width="20%">
     <div class="row ml-2">
     <div class="custom-control custom-radio">
      <input type="radio" class="custom-control-input" id="customRadio1" name="user_gender" >
      <label class="custom-control-label" for="customRadio1">남</label>
    </div> 
	  <div class="custom-control custom-radio ml-2">
      <input type="radio" class="custom-control-input" id="customRadio2" name="user_gender" >
      <label class="custom-control-label" for="customRadio2">여</label>
      </div>
	</div> 
   </td>
   </tr>
       <tr>
        <td width="20%" class="bg-light" >영문이름<b class="text-danger">*</b></td>
        
        <td width="80%" class="pb-0 pt-0" colspan="3">
        <div class="row mb-0 pb-0 pt-2">
        <input type="text" placeholder="성(LAST NAME)" class="form-control col-2 ml-3">
        <input type="text" placeholder="성명(FIRST NAME)" class="form-control col-3 ml-1">
       <p class=" d-inline-block col-6 ml-4 pt-2 small text-muted ">여권상의 영문 이름과 동일하게 기재해 주시기 바랍니다.</p>

        </div>
      
        </td>
      </tr> 
       <tr>
        <td width="20%" class="bg-light" >핸드폰번호<b class="text-danger">*</b></td>
        
        <td width="80%" class="pb-0 pt-0" colspan="3">
        <div class="row mb-0 pb-0 pt-2">
        <input type="text" class="form-control col-5 ml-3">
     	       <p class=" d-inline-block col-6 ml-4 pt-2 small text-muted ">'-'제외하고 숫자만 입력해주세요.</p>
     	 </div>
     </td>
      </tr>       
       <tr>
        <td width="20%" class="bg-light" >이메일<b class="text-danger">*</b></td>
        
        <td width="80%" class="pb-0 pt-0" colspan="3">
        <div class="row mb-0 pb-0 pt-2 pb-1">
        <input type="text" class="form-control-plaintext col-5 ml-3 border pb-1" readonly="readonly">
         <p class=" d-inline-block col-6 ml-4 pt-2 small text-success "><b>√ </b>이메일 계정 인증 완료</p>
     	 </div>
     </td>
      </tr>  
       <tr>
        <td width="20%" class="bg-light" >주소<b class="text-danger">*</b></td>
        
        <td width="80%" class="pb-0 pt-0" colspan="3">
    <div class="input-group col-12 pl-0 pt-1 pb-1">
 	<input type="text" class="form-control col-6">
	 <div class="input-group-prepend">
       <button type="button" class="btn btn-outline-primary  btn-xs pt-0 pb-0 pr-3"><i class="material-icons pl-2">search</i></button>
      </div>
  	</div>
     </td>
      </tr>
      
       <tr>
        <td width="20%" class="bg-light" >상세주소<b class="text-danger">*</b></td>
        
     <td width="80%" class="pb-0 pt-1" colspan="3">
    <div class="row col-12">
    <input type="text" class="form-control col-6">
 	<input type="text" class="form-control col-5 ml-2">
  	</div> 
  	 </td>
      </tr>                     
    </tbody>
  </table>
	
	</div>	

	
	</div>

	<div class="border bg-light mt-0 border-top-0" >
	<div class="col-7 pl-5 pt-2">
	  <label class="checkbox-inline pl-3"><input type="checkbox" autocomplete="off" name="Check" id="allCheck" ><b>아래 약관 및 개인정보 수집,이용 등에 모두 동의 합니다.</b></label><a href="#" class="pull-right">보기</a><br>
                        <label class="checkbox-inline  pl-3"></span><input type="checkbox" name="Check" >서비스 약관</label><a href="#" class="">보기</a><br>
                        <label class="checkbox-inline  pl-3"></span><input type="checkbox" name="Check" >개인정보 수집,이용 동의</label><a href="#" class="pull-right">보기</a><br>
                        <label class="checkbox-inline  pl-3"></span><input type="checkbox" name="Check" >고유식별정보의 수집,이용 동의</label><a href="#" class="pull-right">보기</a><br>
	</div>
	</div>
	<div class="row mt-3">
	<div class="col-4"></div>
	<button class="btn col-4 btn-primary " onclick="fnjoinbtn();">가입하기</button>
	<div class="col-4"></div>
	</div>
	</div>
	
	</div>
	

</div>
<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>