
	$(function() {
		var dateFormat = "yymmdd", from = $("#from").datepicker(
				{
					minDate : 0,
					maxDate : "+12M",
					changeMonth : true,
					numberOfMonths : 2,
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년',
					dateFormat : 'yymmdd'
				}).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));
		}), to = $("#to").datepicker(
				{
					minDate : 0,
					maxDate : "+12M",
					changeMonth : true,
					numberOfMonths : 2,
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년',
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
			source : function(request, response) { //많이 봤죠? jquery Ajax로 비동기 통신한 후 
				var city = $("#starting").val();
				//json객체를 서버에서 내려받아서 리스트 뽑는 작업
				$.ajax({
					//호출할 URL 
					url : "${path}/endcheck",
					//우선 jsontype json으로 
					dataType : "json",
					// parameter 값이다. 여러개를 줄수도 있다. 
					data : { //request.term >> 이거 자체가 text박스내에 입력된 값이다. 
						city : city
					},
					success : function(result) { //return 된놈을 response() 함수내에 다음과 같이 정의해서 뽑아온다. 
						response($.map(result, function(item) {
							return {
								label : item.city,
								value : item.city
							}
						}));
					}
				});
			},
			//최소 몇자 이상되면 통신을 시작하겠다라는 옵션 
			minLength : 1,
			//자동완성 목록에서 특정 값 선택시 처리하는 동작 구현 
			//구현없으면 단순 text태그내에 값이 들어간다. 
			select : function(event, ui) {
			},
			focus : function(event, ui) {
				return false;
			}
		});
		$("#destination").autocomplete({
			source : function(request, response) { //많이 봤죠? jquery Ajax로 비동기 통신한 후 
				var city = $("#destination").val();
				//json객체를 서버에서 내려받아서 리스트 뽑는 작업
				$.ajax({
					//호출할 URL 
					url : "${path}/endcheck",
					//우선 jsontype json으로 
					dataType : "json",
					// parameter 값이다. 여러개를 줄수도 있다. 
					data : { //request.term >> 이거 자체가 text박스내에 입력된 값이다. 
						city : city
					},
					success : function(result) { //return 된놈을 response() 함수내에 다음과 같이 정의해서 뽑아온다. 
						response($.map(result, function(item) {
							return {
								label : item.city,
								value : item.city
							}
						}));
					}
				});
			},
			//최소 몇자 이상되면 통신을 시작하겠다라는 옵션 
			minLength : 1,
			//자동완성 목록에서 특정 값 선택시 처리하는 동작 구현 
			//구현없으면 단순 text태그내에 값이 들어간다. 
			select : function(event, ui) {
			},
			focus : function(event, ui) {
				return false;
			}
		});
	});
