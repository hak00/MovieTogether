<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!public int getRandom() {
		int random = 0;
		random = (int) Math.floor((Math.random() * (99999 - 10000 + 1))) + 10000;
		return random;
	}%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>로그인 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../assets/css/style11.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=adfc149762f6f4a0ba4240d19dfe9f6f&libraries=services"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	var id_Check = false;
	var pass_Check = false;
	var Age_Check = false;
		
	$(function(){	
		$("#btn3").click(function() {
			if ($("#receiver").val() == '') {
				alert("주소를 입력하세요!")
			} else {
				$("#EmailCheck").html("이메일 발송시까지 잠시만 기다려주세요.")
				$("#EmailCheck").css("color","red")

				$.ajax({
					url : "/MovieTogether5/User/send.do",
					type : "post",
					async:true,
					data : {
						receiver : $("#receiver").val(),
						code_check : $("#code_check").val()
					},
					
					dataType : "text",
					success : function(data) {
						if($("#hidden3").css("display")=="none"){$("#hidden3").show(1000)}
						$("#EmailCheck").html("인증메일을 보내드렸습니다 확인하고 인증하세요!")
						$("#EmailCheck").css("color","green")
					
					},
					error : function(request, status, error) {
					}
				});//end of mail ajax
			}//end of if
		});//end of "btn3" click
	
		
		$("#btn4").click(function() {
			
			if( $("#number").val()== $("#code_check").val()){
				$("#EmailCheckProc").html("인증완료.")
				$("#EmailCheckProc").css("color","green")
				
			}else{
				$("#EmailCheckProc").html("인증실패, 인증번호를 확인해주세요") 
				$("#EmailCheckProc").css("color","red")	
			}
		}); //end of "btn4" click
		
	});//$(function(){}) 끝부분	
	
	
		function isAcceptableId(input) {
			if(input == "") {
				return false;
			}
			
			if(input.length < 3 || input.length > 15) {
				return false;
			}
			
			for(var i = 0; i < input.length; i++) {
				if(input.charAt(i) < '0' || input.charAt(i) > '9') {
					if(input.charAt(i) < 'a' || input.charAt(i) > 'z') {
						return false;
					}
				}
			}
			return true;
		}//end of isAceeptabledId (아이디 유효성 검사.)
		
		function checkId() {
			
			if(!isAcceptableId($("#id1").val())) {
				$("#idCheck").css("color", "red");
				$("#idCheck").text("3~15글자 사이의 소문자영어, 숫자만 입력 가능합니다.");
				id_Check = false;
				return;
			}
			
			$.ajax({
				type:"post",
				url: "/MovieTogether5/User/idCheck.do",
				data: ({id: $("#id1").val()}),
				success: function(data) {
					if(data == 1) {
						$("#idCheck").css("color", "green");
						$("#idCheck").text("사용가능한 아이디입니다.");
						id_Check = true;
					} else {
						$("#idCheck").css("color", "red");
						$("#idCheck").text("이미 사용중인 아이디입니다.");
						id_Check = false;
					}
				}
			})//end of idCheck()
		};
		
		function checkAge() {

			if($("#age").val()<7) {
				$("#ageCheck").css("color", "red");
				$("#ageCheck").text("7세 미만은 회원가입이 불가합니다.");
				Age_Check = false;
			}else{
				$("#ageCheck").css("color", "green");
				$("#ageCheck").text("가입가능한 나이입니다.");
				Age_Check = true;
			}
		}
		
		function checkPass() {
			if($("#pass").val() != "") {
				if($("#pass").val() != $("#pass2").val()) {
					$("#passCheck").css("color", "red");
					$("#passCheck").text("비밀번호가 다릅니다.");
					pass_Check = false;
				} else {
					$("#passCheck").css("color", "green");
					$("#passCheck").text("비밀번호가 동일합니다.");
					pass_Check = true;
				}
			} else {
				$("#passCheck").html("&nbsp;");
			}
		}//end of checkPass

		function checkForm() {
			
			if(!id_Check) {
				alert("아이디 체크안됨.")
				$("#id").focus();
				return false;
			}
			
			if(!pass_Check) {
				alert("비밀번호 체크안됨.")
				$("#pass2").focus();
				return false;
			}

			if(!Age_Check){
				alert("나이 체크안됨.")
				$("#age").focus();
				return false;
			}
			
			return true;
		}//end of checkForm
	
	
</script>
</head>

<body>

	<div id="wrapper">
		<form action="/MovieTogether5/User/join.do" method="post" onsubmit="return checkForm();">
			
			<h5>
				<a href="../index.jsp"><img src="../assets/img/logo2.PNG"></a>	</h5>
			<hr class="sep" />
			<div class="group">
				<input type="text"  id="id1" name="id" onkeyup="checkId();"/>
				<span class="bar"></span> <label>아이디</label>
					<br> <span id="idCheck" class="check_status">&nbsp;</span>
			</div>

			<div class="group">
				<input type="text"  id="pass" name="pass" />
				<span class="bar"></span> <label>비밀번호</label>
				<br>
			</div>

			<div class="group">
				<input type="text" onkeyup="checkPass();" id="pass2"/>
				<span class="bar"></span> 
				<label>비밀번호 확인</label>
				<br> <span id="passCheck" class="check_status">&nbsp;</span>
			</div>
			
			<div class="group">
				<input type="text" id="name" name="name" required="required"/>
				<span class="bar"></span> <label>이름</label>
					<br>
			</div>
	
			<div class="group">
				<input type="number" id="age" name="age" onkeyup="checkAge();" />
				<span class="bar"></span> <label>나이</label>
					<br> <span id="ageCheck" class="check_status">&nbsp;</span>
			</div>

			<div class="group">
				<input type="text" class="addrs" id="sample5_address" name="addr"/>
				<button type="button" onclick="sample5_execDaumPostcode()" class="btn2">
					<span class="select">주소 검색</span>
				</button>
				<label>주소</label>
				<br> <span id="passCheck" class="check_status">&nbsp;</span>
			</div>
			<div id="map"
				style="width: 250px; height: 250px; margin-top: 10px; display: none; position: relative;"></div>
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				mapOption = {
					center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
					level : 4
				// 지도의 확대 레벨
				};

				//지도를 미리 생성
				var map = new daum.maps.Map(mapContainer, mapOption);
				//주소-좌표 변환 객체를 생성
				var geocoder = new daum.maps.services.Geocoder();
				//마커를 미리 생성
				var marker = new daum.maps.Marker({
					position : new daum.maps.LatLng(37.537187, 127.005476),
					map : map
				});

				function sample5_execDaumPostcode() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									var addr = data.address; // 최종 주소 변수

									// 주소 정보를 해당 필드에 넣는다.
									document.getElementById("sample5_address").value = addr;
									// 주소로 상세 정보를 검색
									geocoder
											.addressSearch(
													data.address,
													function(results, status) {
														// 정상적으로 검색이 완료됐으면
														if (status === daum.maps.services.Status.OK) {

															var result = results[0]; //첫번째 결과의 값을 활용

															// 해당 주소에 대한 좌표를 받아서
															var coords = new daum.maps.LatLng(
																	result.y,
																	result.x);
															// 지도를 보여준다.
															mapContainer.style.display = "block";
															map.relayout();
															// 지도 중심을 변경한다.
															map
																	.setCenter(coords);
															// 마커를 결과값으로 받은 위치로 옮긴다.
															marker
																	.setPosition(coords)
														}
													});
								}
							}).open();
				}
			</script>

			<div class="group">
				<input type="text" class="addrs2" id="receiver" name="receiver"/> 
				<span class="highlight"></span><span
					class="bar"></span> <input type="hidden" readonly="readonly"
					name="code_check" id="code_check" value="<%=getRandom()%>" />
				<button type="button" class="btn3" id="btn3">
					<span class="select">인증 발송</span>
				</button>
				<label>email</label>
				<br> <span id="EmailCheck" class="check_status">&nbsp;</span>
			</div>
			<div class="group" id="hidden3" style="display: none">
				<input type="number" class="addrs2" id="number"  /><span
					class="highlight"></span>
				<button type="button" class="btn2" id="btn4">
					<span class="select">인증 확인</span>
				</button>
				<label>인증번호 확인</label>
				<br> <span id="EmailCheckProc" class="check_status">&nbsp;</span>
			</div>
			<div class="btn-box">
				<button class="btn btn-submit" type="submit">submit</button>
				<button class="btn btn-cancel" type="reset">cancel</button>
			</div>
		</form>
	</div>
</body>
</html>
