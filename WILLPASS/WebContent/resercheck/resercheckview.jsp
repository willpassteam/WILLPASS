<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WILL PASS</title>
<!-- Bootstrap����� ���Ѱ� -->
<jsp:include page="../include/Bootstrap.jsp"></jsp:include>
<!-- �޷��� ���� css + js -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- �������� ���� css -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<!-- ĳ������ ���� css -->
<link rel="stylesheet" href="/path/to/slick.css">
<link rel="stylesheet" href="/path/to/slick-theme.css">
<style type="text/css">

input[type="text"], textarea {
	box-shadow: none !important;

	font-weight: 200;
	padding-left: 0;
}
</style>
<script type="text/javascript">

function fnpage(clickpage,clickrange){

	location.href="${pageContext.request.contextPath}/reservationcheck/viewall?page="+clickpage+"&range="+clickrange;
	}
	
	function fnnext(startpage,nowrange){
		location.href="${pageContext.request.contextPath}/reservationcheck/viewall?page="+(startpage+5)+"&range="+(nowrange+1);
		
	}
	function fnprev(startpage,nowrange){
		location.href="${pageContext.request.contextPath}/reservationcheck/viewall?page="+(startpage-5)+"&range="+(nowrange-1);
		
	}

</script>
<script>
	$(function() {
		var dateFormat = "yymmdd", from = $("#from").datepicker(
				{
					minDate : 0,
					maxDate : "+12M",
					changeMonth : true,
					numberOfMonths : 2,
					prevText : '���� ��',
					nextText : '���� ��',
					monthNames : [ '1��', '2��', '3��', '4��', '5��', '6��', '7��',
							'8��', '9��', '10��', '11��', '12��' ],
					monthNamesShort : [ '1��', '2��', '3��', '4��', '5��', '6��',
							'7��', '8��', '9��', '10��', '11��', '12��' ],
					dayNames : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					dayNamesShort : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					dayNamesMin : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					showMonthAfterYear : true,
					yearSuffix : '��',
					dateFormat : 'yymmdd'
				}).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));
		}), to = $("#to").datepicker(
				{
					minDate : 0,
					maxDate : "+12M",
					changeMonth : true,
					numberOfMonths : 2,
					prevText : '���� ��',
					nextText : '���� ��',
					monthNames : [ '1��', '2��', '3��', '4��', '5��', '6��', '7��',
							'8��', '9��', '10��', '11��', '12��' ],
					monthNamesShort : [ '1��', '2��', '3��', '4��', '5��', '6��',
							'7��', '8��', '9��', '10��', '11��', '12��' ],
					dayNames : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					dayNamesShort : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					dayNamesMin : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					showMonthAfterYear : true,
					yearSuffix : '��',
					dateFormat : 'yymmdd'
				}).on("change", function() {
			from.datepicker("option", "maxDate", getDate(this));
		});
		function getDate(element) {
			var date;
			try {
				date = $.datepicker.parseDate(dateFormat, element.value);
			} catch (error) {
				date = null;
			}
			return date;
		}
		$("#starting").autocomplete({
			source : function(request, response) { //���� ����? jquery Ajax�� �񵿱� ����� �� 
				var city = $("#starting").val();
				//json��ü�� �������� �����޾Ƽ� ����Ʈ �̴� �۾�
				$.ajax({
					//ȣ���� URL 
					url : "${path}/endcheck",
					//�켱 jsontype json���� 
					dataType : "json",
					// parameter ���̴�. �������� �ټ��� �ִ�. 
					data : { //request.term >> �̰� ��ü�� text�ڽ����� �Էµ� ���̴�. 
						city : city
					},
					success : function(result) { //return �ȳ��� response() �Լ����� ������ ���� �����ؼ� �̾ƿ´�. 
						response($.map(result, function(item) {
							return {
								label : item.city,
								value : item.city
							}
						}));
					}
				});
			},
			//�ּ� ���� �̻�Ǹ� ����� �����ϰڴٶ�� �ɼ� 
			minLength : 1,
			//�ڵ��ϼ� ��Ͽ��� Ư�� �� ���ý� ó���ϴ� ���� ���� 
			//���������� �ܼ� text�±׳��� ���� ����. 
			select : function(event, ui) {
			},
			focus : function(event, ui) {
				return false;
			}
		});
		$("#destination").autocomplete({
			source : function(request, response) { //���� ����? jquery Ajax�� �񵿱� ����� �� 
				var city = $("#destination").val();
				//json��ü�� �������� �����޾Ƽ� ����Ʈ �̴� �۾�
				$.ajax({
					//ȣ���� URL 
					url : "${path}/endcheck",
					//�켱 jsontype json���� 
					dataType : "json",
					// parameter ���̴�. �������� �ټ��� �ִ�. 
					data : { //request.term >> �̰� ��ü�� text�ڽ����� �Էµ� ���̴�. 
						city : city
					},
					success : function(result) { //return �ȳ��� response() �Լ����� ������ ���� �����ؼ� �̾ƿ´�. 
						response($.map(result, function(item) {
							return {
								label : item.city,
								value : item.city
							}
						}));
					}
				});
			},
			//�ּ� ���� �̻�Ǹ� ����� �����ϰڴٶ�� �ɼ� 
			minLength : 1,
			//�ڵ��ϼ� ��Ͽ��� Ư�� �� ���ý� ó���ϴ� ���� ���� 
			//���������� �ܼ� text�±׳��� ���� ����. 
			select : function(event, ui) {
			},
			focus : function(event, ui) {
				return false;
			}
		});
	});
</script>
</head>
<body>
	<%-- Top Start --%>
	<jsp:include page="../include/Top.jsp"></jsp:include>
	<%-- Top End --%>


	
	<div class="bg-light mt-0 pt-5 pb-5">   
	<div class="container border bg-white pb-5 ">
	<h2 class="text-center mt-5 mb-4">���� ��ȸ/����</h2>
	<div class="container pl-5 border">

	<div class="mt-3 col-12">
			<form action="${pageContext.request.contextPath}/reservationcheck/showreservations"  >
			<div>
		
			<table class="table  pt-0 border border-right-0">
			<tr>
			<td width="20%"  class=" bg-light ">�������</td>
			<td width="80%">    
			<div class="row pl-3 pr-3">
		<label for="total" class="small">��ü</label>	<input type="radio" name="selectoption" id="total" value="1" class="mt-1">
		    <div class="custom-control custom-radio">

 
    </div> 
			</div>
			</td>
			</tr>
			
			<tr>
			<td width="20%" class="bg-light">ž�³�¥</td>
			<td width="80%">
			<div class="row pl-1 pb-2">
			<button class="btn btn-outline-dark col-1 mr-1 ml-2">3����</button>
			<button class="btn btn-outline-dark col-1 mr-1">6����</button>
			<button class="btn btn-outline-dark col-1 mr-1">1��</button>
			</div>
	
				<div class="row">
	
				<div class="input-group mb-3 col-4">
    			<div class="input-group-prepend">
     				<span class="input-group-text"><i class='far fa-calendar-alt'></i></span>
   				 </div>
				<input type="text" class=" form-control" id="from" name="from" width="50px" autocomplete="off">
  				</div>
					~
				  <div class="input-group mb-3 col-4">
    				<div class="input-group-prepend">
     					 <span class="input-group-text"><i class='far fa-calendar-alt'></i></span>
   				 </div>
				<input type="text" class=" form-control" id="to" name="to" width="50px" autocomplete="off">	
  				</div>

				</div>
				
			</td>
			</tr>
	
			
			</table> 
	</div>
	<div class="row ">
	<div class="col-4"></div>
	<input type="submit"  class="btn col-4 text-white mt-5 mb-5" style="background-color: #D60815" value="��ȸ">
	<div class="col-4"></div>
	</div>	<table class="table text-center table-hover">
	
	<tr style="background-color: #6D6E71" class="text-white">
	<td>�����ȣ</td> 
	<td>ž����</td>
	<td>ž���� </td>
	<td>����</td>
	<td>���� </td>
	<td> </td>
	</tr>

	 
	 <c:forEach items="${reserresult}" varStatus="varstatus" var="reser" >
	 
	 <fmt:formatNumber value="${reser.reser_reserved_seat}" type="number" var="seatnum" />
	 <fmt:parseNumber integerOnly="true" value="${seatnum div 6}" var="seatnum2"  />
	 <tr class="small" >
	 <fmt:formatNumber value="${varstatus.index}" type="number" var="strnum" />


	 <td class="pt-3" width="10%">${reser.reser_round_trip}</td>
	
	 <td class="pt-3" width="15%">${reser.reser_date}</td>	 
	 <td width="20%">${reser.reser_familyname} ${reser.reser_givenname}</td>
	 <td class="pt-3 " width="20%">${reser.reser_Starting} - ${reser.reser_destination}</td>
	 <td class="pt-3" width="20%">����Ϸ�</td>
	 <td width="15%"> <a href="${pageContext.request.contextPath}/reservationcheck/onereser?reser_round_trip=?${reser.reser_round_trip}" onclick="window.open(this.href);return false;">�����</a> 
	 </td>
	

	 </tr>
	 </c:forEach>
	 
	 </table>

	</form> 
</div>
	
<!-- 	������ -->
<div class="d-flex justify-content-center  mb-3 mt-5">
	<c:if test="${paginginfo.prev eq true}">	
		<button class="btn col-1" onclick="fnprev(${paginginfo.startpage},${paginginfo.range})" >prev</button>
	</c:if>
	
	<c:forEach var="data2"  begin="${paginginfo.startpage}" step="1"  end="${paginginfo.endpage}">
		<button class="btn col-1" onclick="fnpage(${data2},${paginginfo.range})">${data2}</button>
	</c:forEach>

	<c:if test="${paginginfo.next eq true}">	
		<button class="btn col-1" onclick="fnnext(${paginginfo.startpage},${paginginfo.range})">next</button>
	</c:if>
</div>

</div>
	<div class="mt-4 col-12">
	</div>
	</div>
	</div>
	

<!-- </div> -->



	 <div class="pb-5"></div>
	<%-- Footer Start --%>
	<jsp:include page="../include/Footer.jsp"></jsp:include>
	<%-- Footer End --%>
</body>
</html>