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
nav{
	height: 120px;
	margin-bottom:100px;
}

.second-nav li{
	padding:10px 50px;
	font-size: 25px;
}
.second-nav li:HOVER{
	color: #FACC2E;
	cursor: pointer
	
}


</style>

</head>
<body>
	<!-- <nav class="navbar">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#"><img alt="비행기 이미지" src="../img/Logo.PNG" width="400px"></a>
        </div>
        <div id="navbar">
          <ul class="nav navbar-nav navbar-right social first-nav">
          	<li><a href="#">Login</a></li>
            <li><a href="#">회원가입</a></li>
          </ul>
          
          <ul class="nav navbar-nav navbar-right second-nav">
          	<li><a href="#">예약조회</a></li>
          	<li><a href="#">서비스센터</a></li>
            <li><a href="#">고객센터</a></li>
            
            
          </ul>
        </div>
      </div>
    </nav> -->
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="#">Logo</a>

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="#">Link 1</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Link 2</a>
    </li>

    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Dropdown link
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Link 1</a>
        <a class="dropdown-item" href="#">Link 2</a>
        <a class="dropdown-item" href="#">Link 3</a>
      </div>
    </li>
  </ul>
</nav>
    


</body>
</html>
