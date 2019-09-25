<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--Google 번역기 API 사용하기위한 추가2.-->
<script type="text/javascript">
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage : 'ko',
			layout : google.translate.TranslateElement.InlineLayout.SIMPLE
		}, 'google_translate_element');
	}
</script>

<script type="text/javascript"
	    src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<!--Google 번역기 API 사용하기위한 추가2.-->
<header id="header">
			
		<div class="container">
			<div class="row">
				<div class="header clearfix">
					<h1>
						<a href="/MovieTogether5/index.jsp"> <em> <img src="/MovieTogether5/assets/img/logo2.PNG"
								alt="MovieTogether">
						</em>
						</a>
					</h1>
					<div class="searchBox">
						<input type="text" class="text" name="searchTitle"> 
						<button class="box btn" name="searchBox">검  색</button>
					</div>
					<nav id="mNav">
						<h2 class="ir_so">메가박스 전체메뉴</h2>
						<a href="#" class="ham"><span></span></a>
					</nav>
					<nav class="nav">
						<ul class="clearfix">
						<% 
								String id = (String)session.getAttribute("id");
				
									if(id == null){	//세션값이 없는 경우 로그인 x
						%>
							<li><a href="#login-box" class="login-window">로그인</a></li>
							
						<% 
									}else{
						%>
							<li><a href="/MovieTogether5/user/logout.jsp">로그아웃</a></li>
							<li><a href="/MovieTogether5/user/MyInfo.jsp">내 정보</a></li>
						<%			}
						%>
							<li><a href="/MovieTogether5/user/join2.jsp">회원가입</a></li>
							<li><a href="#">고객센터</a></li>
							<div id="google_translate_element"></div>
						</ul>
					</nav>
					
				</div>
			</div>
		</div>
	</header>