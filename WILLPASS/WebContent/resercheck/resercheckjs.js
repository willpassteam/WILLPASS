function fncheckresult(){ //날짜로 예약 검색 할때 
	
	if(($("#to").val()=="") &&($("#from").val()=="")){
		
		return true;
	}
	
	if(($("#to").val()!="") &&($("#from").val()!="")){
		
		return true;
	}
	alert("날짜를 선택해주세요.");
	return false;
}

function fnpage(clickpage,clickrange){

	location.href="${pageContext.request.contextPath}/reservationcheck/viewall?page="+clickpage+"&range="+clickrange;
	}
	
	function fnnext(startpage,nowrange){
		location.href="${pageContext.request.contextPath}/reservationcheck/viewall?page="+(startpage+5)+"&range="+(nowrange+1);
		
	}
	function fnprev(startpage,nowrange){
		location.href="${pageContext.request.contextPath}/reservationcheck/viewall?page="+(startpage-5)+"&range="+(nowrange-1);
		
	}
	
	function changeSeat(seatnum){ // 좌석숫자를 문자+숫자로 바꿔줌
		var col;
		switch (seatnum%6) {
		case 0:col='A';break;
		case 1:col='B';break;
		case 2:col='C';break;
		case 3:col='D';break;
		case 4:col='E';break;
		case 5:col='F';break;
	}
		return col;
	}
	
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}


	function fnview(num){ //예약상세 모달에 출력 

		$.ajax({
			type : 'POST',
			url  : '${pageContext.request.contextPath}/reservationcheck/onereser',
			data: {num : num},
		    dataType: "json",
			success: function(result){
				$("#tbodyresult").text("");
				$("#tbodyresult1").text("");
				
				  var aa="<tr class='text-center'>"+
				  "<td>1구간</td>"+
				  "<td>"+result[0].reser_date+"</td>"+
				  "<td>"+ result[0].reser_Starting +"&nbsp;&nbsp;<i class='fas fa-plane-departure pt-3 text-muted '></i>&nbsp;&nbsp;"+
				  result[0].reser_destination +"<br> <small>"+result[0].reser_departure_time+" →"+ result[0].reser_arrival_time+" </small></td>"+
				  
				  "<td>"+result[0].reser_airline+"</td>"+
				  "<td>"+result[0].reser_flight+"</td>"+
				  "</tr>";
				  var part2="";
					  $("#tbodyresult1").append(aa);
				  if(result[0].isrou=="true"){
				  
					  part2="<tr>"+
					  "<td>2구간</td>"+
					  "<td>"+result[result.length-1].reser_date+"</td>"+
					  "<td>"+ result[result.length-1].reser_Starting +"&nbsp;&nbsp;<i class='fas fa-plane-departure pt-3 text-muted '></i>&nbsp;&nbsp;"+
					  result[result.length-1].reser_destination +"<br> <small>"+result[result.length-1].reser_departure_time+" →"+ result[result.length-1].reser_arrival_time+" </small></td>"+
					 
					  "<td>"+result[result.length-1].reser_airline+"</td>"+
					  "<td>"+result[result.length-1].reser_flight+"</td>"+
					  "</tr>";
					  $("#tbodyresult1").append(part2);
					  
					  
				  }
				  
				  var totalprice = 0;
				
				for(var i=0;i<result.length;i++){
					  var value=result[i].reser_familyname;
					  var value1=result[i].reser_airline;
					  var value2=result[i].reser_destination;
					  var value3=result[i].reser_flight;
					  var value4=result[i].reser_givename;
					  var value5=result[i].reser_Starting;
					  var value6=result[i].reser_departure_time;
					  var value7=result[i].reser_reserved_seat;
					  value7 =changeSeat(value7)+parseInt((value7/6)+1);
					  var value8=result[i].reser_date;
					  var value9=result[i].reser_price;
					  totalprice +=value9;
					  value9=  numberWithCommas(value9);
					  var value10=result[i].isrou;
					  
			
					$("#tbodyresult").append( "<tr><td>"+value8+"</td>"+ "<td>"+value5+"->"+value2+"</td>"+"<td>"+value+" "+value4+"</td>"+"<td>"+value7+"</td>"+"<td>"+value9+"</td>"+"</tr>");
					  
				}
				
				totalprice=  numberWithCommas(totalprice);
				$("#totalpr").text(totalprice+"KRW");
				$("#resernum").text("예약번호:"+num);
				
				$("#tribtn").trigger("click");
			 
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
		
	}
