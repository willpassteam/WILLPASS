
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>WIllPASS회원가입_2단계</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(function() {
	$("#user_pwd2").keyup(function(){
		
		 if($("#user_pwd").val() != ($("#user_pwd2").val())){ 	
			$("#passcheck").removeClass("text-success");
			$("#passcheck").addClass("text-danger");
			$("#passcheck").html("비밀번호가 틀립니다.");
		 }else{
			$("#passcheck").removeClass("text-danger");
			$("#passcheck").addClass("text-success");
			$("#passcheck").html("<b class='text-info'>√ </b>비밀번호가 같습니다.");
		 }
	});

});
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
				$("#checklabel").html("사용할 수 없는 아이디입니다.");
			}				
		}
	});}

	





function getAddressInfo(){
	        new daum.Postcode({
	        	oncomplete: function(data) {
 	 				var fullAddress = data.zonecode + ', ' + data.address+ ', ' + data.buildingName ;
	 				$('#user_address').val(fullAddress);
	            },
	        }).open();
	    }



function checkAll(){
    if( $("#allCheck").is(':checked') ){
      $("input[name=Check]").prop("checked", true);
    }else{
      $("input[name=Check]").prop("checked", false);
    }
}


	 function checkz() {
      var hobbyCheck = false;
      var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
      var getCheck= RegExp(/^[a-z0-9]{10,15}$/);
      var getName= RegExp(/^[가-힣]{2,6}$/); //{2,6}
      var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
      var buf = new Array(13); //주민등록번호 배열
      
      var getId= RegExp(/^[a-z0-9]{6,15}$/);
      
      var getMobile = RegExp(/^01([0|1|6|7|8|9]?)[0-9]{7,8}$/);
      
      //아이디 공백 확인
      if($("#user_id").val() == ""){
        alert("아이디 입력바람");
        $("#user_id").focus();
        return false;
      }		
      
      
      if (!getId.test($("#user_id").val())) {
          alert("한글성명은 2자에서 6자 사이입니다");
          $("#user_id").val("");
          $("#user_id").focus();
          return false;
        }
      
          
          if (!getName.test($("#user_name").val())) {
              alert("한글성명은 2자에서 6자 사이입니다");
              $("#user_name").val("");
              $("#user_name").focus();
              return false;
            }
          
          
        //비밀번호
          if(!getCheck.test($("#user_pwd").val())) {
          alert("10-15자의 영문,숫자조합으로 가능합니다 ");
          
          $("#user_pwd").val("");
          $("#user_pwd").focus();
          return false;
          }
    
      
      if(!getMail.test($("#user_email").val())){
        alert("이메일형식에 맞게 입력해주세요")
        $("#user_email").val("");
        $("#user_email").focus();
        return false;
      }
      
      //mobile
      if (!getMobile.test($("#user_mobile").val())) {
          alert("-없이  쓰세용");
          $("#user_mobile").val("");
          $("#user_mobile").focus();
          return false;
        }
      
      
      if(!($("input[name='Check']:checked").length>=3)){
		   alert("개인정보이용을 동의하셔야 함여하실수 있습니다.");
		   $("#allCheck").focus();
		   return false;
		}
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
	<form action="./member/MemberJoinAction.me" method="post" onSubmit="return checkz()">
	<input type="hidden" value="1" name="user_non">
	<div class="bg-light mt-0 pt-5 pb-5">   
	<div class="container border bg-white pb-5 ">
	<h2 class="text-center mt-5 mb-4">회원가입</h2>
	<h6 class="text-center text-muted">WILLPASS 회원가입을 환영합니다!</h6>
	<h6 class="text-center text-muted mb-4 small">회원으로 가입하시면 할인쿠폰 등 다양한 혜택을 받으실 수 있으며, 항공권 특가 정보와 이벤트 소식을 이메일로 받아보실 수 있습니다.</h6>
	<div class="container pl-5 border">
	<div class="row pl-3 mt-4">
	<h5 class=" d-inline-block col-9">회원정보 입력</h5>
	 <b class="text-danger small col-3 text-center pl-5">* 는 필수 입력 항목입니다.</b>
	</div>
	<div class="mt-3 col-12">
	 <table class="table table-bordered">
    <tbody>
      <tr>
      
        <td width="20%" class="bg-light" >아이디 <b class="text-danger">*</b></td>
        
        <td width="80%" class="pb-0 pt-0">
        <div class="row mb-0 pb-0 pt-2">
      <div class="input-group col-5 pl-0 pt-1 pb-1 mr-0 pr-3 ml-3">
 			<input type="text" class="form-control col-7" id="user_id" name="user_id" autofocus required/>
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
        <input type="password" placeholder="" id="user_pwd" class="form-control col-5 ml-3" name="user_pwd" 
          required/>
        <p class=" d-inline-block col-5 ml-4 pt-2 small text-muted">10의 영문,숫자 조합으로 가능합니다.</p>
        </div>
        </td>
      </tr>
      
       <tr>
        <td width="20%" class="bg-light">비밀번호 확인<b class="text-danger">*</b></td>
        
        <td width="80%" class="pb-0 pt-0">
        <div class="row mb-0 pb-0 pt-2">
        <input type="password" placeholder="" id="user_pwd2" name="user_pwd2"class="form-control col-5 ml-3" required>
        <p id="passcheck" class=" d-inline-block col-6 ml-4 pt-2 small text-success "></p>
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
        <input type="text" placeholder="" class="form-control col-10 ml-3" id="user_name" name="user_name" required>
        </div>
   </td>
   <td width="20%" class="bg-light">성별<b class="text-danger">*</b></td>
   <td width="20%">
     <div class="row ml-2">
     <div class="custom-control custom-radio">
      <input type="radio" class="custom-control-input" id="customRadio1" name="user_gender">
      <label class="custom-control-label" for="customRadio1">남</label>
    </div> 
	  <div class="custom-control custom-radio ml-2">
      <input type="radio" class="custom-control-input" id="customRadio2" name="user_gender"checked="checked" >
      <label class="custom-control-label" for="customRadio2">여</label>
      </div>
	</div> 
   </td>
   </tr>
       <tr>
        <td width="20%" class="bg-light" >영문이름<b class="text-danger">*</b></td>
        
        <td width="80%" class="pb-0 pt-0" colspan="3">
        <div class="row mb-0 pb-0 pt-2">
        <input type="text" placeholder="성(LAST NAME)" class="form-control col-2 ml-3" required>
        <input type="text" placeholder="성명(FIRST NAME)" class="form-control col-3 ml-1" required>
       <p class=" d-inline-block col-6 ml-4 pt-2 small text-muted ">여권상의 영문 이름과 동일하게 기재해 주시기 바랍니다.</p>

        </div>
      
        </td>
      </tr> 
       <tr>
        <td width="20%" class="bg-light" >핸드폰번호<b class="text-danger">*</b></td>
        
        <td width="80%" class="pb-0 pt-0" colspan="3">
        <div class="row mb-0 pb-0 pt-2">
        <input type="text" class="form-control col-5 ml-3" id="user_mobile" name="user_mobile" required/>
     	       <p class=" d-inline-block col-6 ml-4 pt-2 small text-muted ">'-'제외하고 숫자만 입력해주세요.</p>
     	 </div>
     </td>
      </tr>       
       <tr>
        <td width="20%" class="bg-light" >이메일<b class="text-danger">*</b></td>
        
        <td width="80%" class="pb-0 pt-0" colspan="3">
        <div class="row mb-0 pb-0 pt-2 pb-1">
        <input type="text" class="form-control-plaintext col-5 ml-3 border pb-1" id="user_email" name="user_email" >
         <p class=" d-inline-block col-6 ml-4 pt-2 small text-success "><b>√ </b>이메일 계정 인증 완료</p>
     	 </div>
     </td>
      </tr>  
       <tr>
        <td width="20%" class="bg-light" >주소<b class="text-danger">*</b></td>
        
        <td width="80%" class="pb-0 pt-0" colspan="3">
    <div class="input-group col-12 pl-0 pt-1 pb-1">
 	<input type="text" class="form-control col-6" id="user_address" name="user_address" required/>
<!--  	<input type="text" id="address" name="address"  class="form-control" placeholder="Address"> -->
	 <div class="input-group-prepend">
       <button type="button" class="btn btn-outline-primary  btn-xs pt-0 pb-0 pr-3" onclick="getAddressInfo()"><i class="material-icons pl-2"
     >search</i></button>
       
<!--        <button type="button" class="btn btn-secondary" onclick="getAddressInfo()">Check</button> -->
       																			 
      </div>
  	</div>
     </td>
      </tr>
      
       <tr>
        <td width="20%" class="bg-light" >상세주소<b class="text-danger">*</b></td>
        
     <td width="80%" class="pb-0 pt-1" colspan="3" >
    <div class="row col-12">
    <input type="text" class="form-control col-6" id="user_address2" name="user_address" required>
<!-- 박스뺏음 	<input type="text" class="form-control col-5 ml-2" name="user_address1"> -->
  	</div> 
  	 </td>
      </tr>                     
    </tbody>
  </table>
	
	</div>	

	
	</div>

	<div class="border bg-light mt-0 border-top-0" >
	<div class="col-7 pl-5 pt-2">
	  <label class="checkbox-inline pl-3">
	  					<input type="checkbox" autocomplete="on" onclick="checkAll()" name="Check" class="press" id="allCheck" ><b>아래 약관 및 개인정보 수집,이용 등에 모두 동의 합니다.</b></label><a href="#" class="pull-right">보기</a><br>
                        <label class="checkbox-inline" class="press pl-3"><input type="checkbox" name="Check" >서비스 약관</label><a href="#" class="">보기</a><br>
                        <label class="checkbox-inline" class="press pl-3"><input type="checkbox" name="Check" >개인정보 수집,이용 동의</label><a href="#" class="pull-right">보기</a><br>
                        <label class="checkbox-inline" class="press pl-3"><input type="checkbox" name="Check" >고유식별정보의 수집,이용 동의</label><a href="#" class="pull-right">보기</a><br>
	</div>
	</div>
	<div class="row mt-3">
	<div class="col-4"></div>
	<input class="btn col-4 btn-primary " type="submit" value="가입하기" > 
<!--  	<button class="btn col-4 btn-primary " onclick="fnjoinbtn();">가입하기</button>   -->
<!--  original 인듯 하답 19일찾음  <button class="btn btn-danger" type="submit">가입취소<i class="fa fa-times spaceLeft"></i></button> -->
	<div class="col-4"></div>
	</div>
	</div>
	
	</div>
	

</form>
<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>

</html>