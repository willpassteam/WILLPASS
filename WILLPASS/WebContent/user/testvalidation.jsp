<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
  <script>
 
    function checkz() {
      var hobbyCheck = false;
      var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
      var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
      var getName= RegExp(/^[가-힣]+$/);
      var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
      var buf = new Array(13); //주민등록번호 배열
 
 
      //아이디 공백 확인
      if($("#tbID").val() == ""){
        alert("아이디 입력바람");
        $("#tbID").focus();
        return false;
      }
 
      //이름의 유효성 검사
      if(!getCheck.test($("#tbID").val())){
        alert("형식에 맞게 입력해주세요");
        $("#tbID").val("");
        $("#tbID").focus();
        return false;
      }
 
      //비밀번호
      if(!getCheck.test($("#tbPwd").val())) {
      alert("형식에 맞춰서 PW를 입력해줘용");
      $("#tbPwd").val("");
      $("#tbPwd").focus();
      return false;
      }
 
      //아이디랑 비밀번호랑 같은지
      if ($("#tbID").val()==($("#tbPwd").val())) {
      alert("비밀번호가 ID와 똑같으면 안!대!");
      $("#tbPwd").val("");
      $("#tbPwd").focus();
    }
 
      //비밀번호 똑같은지
      if($("#tbPwd").val() != ($("#cpass").val())){ 
      alert("비밀번호가 틀렸네용.");
      $("#tbPwd").val("");
      $("#cpass").val("");
      $("#tbPwd").focus();
      return false;
     }
 
     //이메일 공백 확인
      if($("#mail").val() == ""){
        alert("이메일을 입력해주세요");
        $("#mail").focus();
        return false;
      }
           
      //이메일 유효성 검사
      if(!getMail.test($("#mail").val())){
        alert("이메일형식에 맞게 입력해주세요")
        $("#mail").val("");
        $("#mail").focus();
        return false;
      }
 
      //이름 유효성
      if (!getName.test($("#name").val())) {
        alert("이름 똑띠 쓰세용");
        $("#name").val("");
        $("#name").focus();
        return false;
      }
 
      //주민번호
      if(($("#id_num").val() == "") || ($("#id_num_back").val() == "")){
        alert("주민등록번호를 입력해주세요");
        $("#id_num").focus();
        return false;
      }
 
      if(check_jumin() ==false){
        return false;
      }
 
      //관심분야
      for(var i=0;i<$('[name="hobby[]"]').length;i++){
        if($('input:checkbox[name="hobby[]"]').eq(i).is(":checked") == true) {
          hobbyCheck = true;
          break;
            }
          }
 
          if(!hobbyCheck){
            alert("하나이상 관심분야를 체크해 주세요");
            return false;
          }
 
 
 
  //주민번호 확인 함수
  function check_jumin() {
    var jumins3 = $("#pnum").val() + $("#nnum").val();
      //주민등록번호 생년월일 전달
          
      var fmt = RegExp(/^\d{6}[1234]\d{6}$/)  //포멧 설정
      var buf = new Array(13);
 
      //주민번호 유효성 검사
      if (!fmt.test(jumins3)) {
        alert("주민등록번호 형식에 맞게 입력해주세요");
        $("#pnum").focus();
        return false;
      }
 
      //주민번호 존재 검사
      for (var i = 0; i < buf.length; i++){
        buf[i] = parseInt(jumins3.charAt(i));
      }
 
      var multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];// 밑에 더해주는 12자리 숫자들 
      var sum = 0;
 
      for (var i = 0; i < 12; i++){
      sum += (buf[i] *= multipliers[i]);// 배열끼리12번 돌면서 
    }
 
    if ((11 - (sum % 11)) % 10 != buf[12]) {
      alert("잘못된 주민등록번호 입니다.");
      $("#pnum").focus();
      return false;
    }
 
    var birthYear = (jumins3.charAt(6) <= "2") ? "19" : "20";
    birthYear += $("#pnum").val().substr(0, 2);
    var birthMonth = $("#pnum").val().substr(2, 2);
    var birthDate = $("#pnum").val().substr(4, 2);
    var birth = new Date(birthYear, birthMonth, birthDate);
                              
             
    $("#year").val(birthYear);
    $("#month").val(birthMonth);
    $("#day").val(birthDate);
        
        }
 
  </script>

</head>
<body>

<form onsubmit="return checkz()" method="post" action="mailto:szx0228@naver.com" enctype="text/plain" > 
<h2 align="center">회원가입</h2>
 
   <table align="center" border="3" cellspacing="0"  >
       <tr>
          <td colspan="5" height="30" align="center" bgcolor=#000000" span style="color:white;">회원기본정보</td>
          
        </tr>
        <tr> 
          <td align="left">아이디:</td>
          <td colspan="4"><input type="text" name="id" maxlength="12" id="tbID" > 4~12자리의 영문 대소문자와 숫자로만 입력</td>
       </tr>
    
       <tr>
          <td >비밀번호:</td> 
           <td colspan="4"><input type="password" maxlength="12" id="tbPwd" > 4~12자리의 영문 대소문자와 숫자로만 입력</td>
       </tr>
       <tr>
          <td >비밀번호확인:</td>
           <td colspan="5"><input type="password" id="cpass" maxlength="12"></td>
           
       </tr>
       
        <tr>
          <td>메일주소:</td>
          <td colspan="4"><input type="text" name="addr" id="mail">
          예)id@domain.com</td>
       </tr>
       <tr>
          <td>이름:</td>
          <td colspan="3"><input type="text" name="nam" id="name"></td>
        </tr>
       <tr>
          <td colspan="5" height="30" align="center" bgcolor=#000000" span style="color:white;">개인신상정보</td>
        </tr>
        
        <tr>
          <td>주민등록번호:</td>
          <td colspan="4"><input type="text" name="jum" id="pnum">-<input type="password" name="jumin" id="nnum">예)123456789</td>
       </tr>
 
       <tr>
          <td >생일:</td>
          <td>
            <input type="text" autocomplete="OFF" name="nyear" id="year" style="width: 70px" readonly  disabled> 년
          <input type="text" autocomplete="OFF" name="nmonth" id="month" style="width: 50px" readonly  disabled> 월
            <input type="text" autocomplete="OFF" name="nday" id="day" style="width: 50px" readonly  disabled> 일
    </tr>
 
    <tr>
      <td>관심분야:</td>
      <td colspan="3"><input type="checkbox" name="hobby[]" value="컴퓨터" >컴퓨터
          <input type="checkbox" name="hobby[]" value="인터넷" >인터넷
         <input type="checkbox" name="hobby[]" value="여행">여행
         <input type="checkbox" name="hobby[]" value="영화감상">영화감상
         <input type="checkbox" name="hobby[]" value="음악감상">음악감상
      </td>
    </tr>
 
      
    
 
</table>
 
<p align="center">
        <input type="submit" value="회원가입">
         <input type="reset" value="다시입력">
  </p>
 
   </form>


</body>
</html>