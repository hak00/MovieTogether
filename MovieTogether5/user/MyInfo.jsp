<%@page import="vo.UserVO"%>
<%@page import="dao.UserDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	UserDao dao = new UserDao();
	UserVO vo = dao.getUser(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#content {
	position: relative;
	height: 800px;
	top: 140px;
}

.main {
	font-size: 100px;
	font-family: 'Cute Font', cursive;
}

table.type09 {
	margin-left : 150px;
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border: 1px solid #f3f6f7;

}
table.type09 tbody th {
	height : 45px;
    width: 180px;
    padding: 10px;
    font-weight: bold;
    border-bottom: 1px solid #ccc;
    border-right :1px solid #ccc;
    background: #f3f6f7;
    text-align: center;
    font-size: 16px;
}

table.type09 tbody td{
	height : 45px;
	width : 350px;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	font-size: 16px;
}

#input2{
	background-image: none;
    border-radius: 0px;
    padding-left: 0px;
    
}

#btn{
	margin-left: 100px;
}

#pass1{
	background-image: none;
    border-radius: 0px;
    padding-left: 0px;
	float:left;
	width: 230px;
	height : 40px;
	font-size: 18px;
}

#searchBox{
	margin-left: 560px;
}
</style>
<link rel="stylesheet" href="../assets/css/reset19.css">
<link rel="stylesheet" href="../assets/css/style01.css">
<link rel="stylesheet" href="../assets/css/swiper.css">
<link rel="stylesheet" href="../assets/css/style02.css">
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap"
	rel="stylesheet">

</head>
<body>
	<jsp:include page="../user/header.jsp"></jsp:include>
	<!-- //header -->
	<jsp:include page="../user/nav.jsp"></jsp:include>
	<form action="modifyMyInfo.jsp" method="post">
	<div id="content" class="content">
		<div class="container">
			<span class="main">내 정보</span>
		</div>
		<br><br><br>
		<div class="container">
			<table class="type09">
				<tbody>
					<tr>
						<th scope="row">아이디</th>
						<td align="center"><%=vo.getId() %></td>
						<th scope="row">이름</th>
						<td align="center"><%=vo.getName() %></td>
					</tr>
					<tr>
						<th scope="row" >현재 비밀번호</th>
						<td align="center" colspan="3"><input type="password" name="pass1" id="pass1"></td>
					</tr>
					<tr>
						<th scope="row">새 비밀번호</th>
						<td align="center"><input type="password" name="pass" id="pass1"></td>
						<th scope="row">새 비밀번호 확인</th>
						<td align="center"><input type="password" id="pass1" ></td>
					</tr>
					<tr>
						<th scope="row">나이</th>
						<td align="center"><%=vo.getAge() %></td>
						<th scope="row">주소</th>
						<td align="center"><input type="text" name="addr" id="pass1" value="<%=vo.getAddr() %>"></td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td colspan="3" align="center"><%=vo.getEmail() %></td>
					</tr>
				</tbody>
			</table>
			<div class="searchBox" id="searchBox">
				<input type="submit" value="수정하기" class="btn">
				<input type="button" value="메인화면" class="btn" onclick="location.href='../index.jsp'">
			</div>
		</div>
	</div>
	</form>
	<jsp:include page="../user/footer.jsp"></jsp:include>
	<jsp:include page="../user/loginpopup.jsp"></jsp:include>
</body>
</html>