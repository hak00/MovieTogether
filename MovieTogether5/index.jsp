<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("utf-8");
    
	if(request.getParameter("check")!=null){
	int check = Integer.parseInt(request.getParameter("check"));
	String id = request.getParameter("id");
	if (check == 1) {
		session.setAttribute("id", id);

		response.sendRedirect("../index.jsp");
	} else if (check == 0) {
%>
<script type="text/javascript">
	alert("비밀번호 틀림");
	history.back(); //이전페이지로 이동
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("아이디 없음");
	history.back();
</script>
<%
	}
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="author" content="webstoryboy">
<meta name="description" content="MovieTogether">
<meta name="keywords" content="메가박스, 유투브, 영화, 최신영화, 영화관, CGV, 롯데시네마, 웹스토리보이, 웹스, 사이트 만들기, 따라하기, 이미지 슬라이드">
<title>MovieTogether</title>

<!-- css -->
<link rel="stylesheet" href="assets/css/reset19.css">
<link rel="stylesheet" href="assets/css/style01.css">
<link rel="stylesheet" href="assets/css/swiper.css">
<link rel="stylesheet" href="assets/css/style02.css">

<!-- 파비콘 -->
<link rel="shortcut icon" href="assets/icons/favicon.ico">
<link rel="apple-touch-icon-precomposed"
	href="assets/icons/favicon_72.png" />
<link rel="apple-touch-icon-precomposed" sizes="96x96"
	href="assets/icons/favicon_96.png" />
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="assets/icons/favicon_144.png" />
<link rel="apple-touch-icon-precomposed" sizes="192x192"
	href="assets/icons/favicon_192.png" />

<!-- 웹 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet">

<!-- HTLM5shiv ie6~8 -->
<!--[if lt IE 9]> 
      <script src="assets/js/html5shiv.min.js"></script>
      <script type="text/javascript">
         alert("현재 브라우저는 지원하지 않습니다. 크롬 브라우저를 추천합니다.!");
      </script>
   <![endif]-->
 

</head>
<body>

	<jsp:include page="/user/header.jsp"></jsp:include>
	<!-- //header -->
	<jsp:include page="/user/nav.jsp"></jsp:include>
		<section id="banner">
		<div class="slider">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide ss1">
						<div class="container">
							<div class="row">
								<h3>어벤져스 : 앤드게임</h3>
								<p>역대 최단 기간 1000만 관객 돌파 기록</p>
							</div>
						</div>
					</div>
					<div class="swiper-slide ss2">
						<div class="container">
							<div class="row">
								<h3>어벤져스 : 앤드게임</h3>
								<p>역대 최단 기간 1000만 관객 돌파 기록</p>
							</div>
						</div>
					</div>
					<div class="swiper-slide ss3">
						<div class="container">
							<div class="row">
								<h3>어벤져스 : 앤드게임</h3>
								<p>역대 최단 기간 1000만 관객 돌파 기록</p>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-pagination"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
		</div>
	</section>
	<!-- //banner -->
	 <section id="event">
        <div class="container">
            <div class="row">
                <div class="event">
                    <h2><em>새로운 이벤트</em></h2>
                    <div class="event_left">
                        <div class="event_slider">
                            <img src="assets/img/event01.jpg">
                        </div>
                        <figure class="event_box1">
                            <img src="assets/img/event02.jpg">
                        </figure>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- //event -->
	
	<jsp:include page="/user/footer.jsp"></jsp:include>
    <jsp:include page="/user/loginpopup.jsp"></jsp:include>
    
</body>
</html>