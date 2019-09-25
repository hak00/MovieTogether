<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = dao.getBoard(num);
	
	int number = vo.getNum();
	String name = vo.getName();
	String subject = vo.getSubject();
	String content = "";
	if(vo.getContent()!=null){
		content = vo.getContent().replace("\r\n", "<br/>");
	}
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

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid black;
   	text-align: center;
}
table.type09 tbody th {
    width: 130px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
    text-align: center;
}

table.type09 tbody td{
	width : 300px;
	border-right: 1px solid #ccc;
}


.searchBox .text{height: 30px; width: 230px; border: 2px solid black; border-radius: 4px;}
input[type=text]:focus {
	border: 1px solid black;
}

#input2{
	background-image: none;
    border-radius: 0px;
    padding-left: 0px;
}

#btn{
	margin-left: 100px;
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
	<form action="deletePro.jsp?num=<%=number %>" method="post" name="fr">
		<input type="hidden" name="num" value="<%=num %>">
	<div id="content" class="content">
		<div class="container">
			<span class="main">게시물 삭제</span>
		</div>
		<div class="container">
			<table class="type09">
				<tbody>
					<tr>
						<th scope="row">비밀번호</th>
						<td><input type="password" name="pass"></td>
				</tbody>
			</table>
			<div class="searchBox">
				<input type="submit" value="삭제" class="btn" id="btn">
				<input type="button" value="목록보기" class="btn" width="70pt" onclick="location.href='board.jsp'">
			</div>
		</div>
	</div>
	</form>

	<jsp:include page="../user/footer.jsp"></jsp:include>
	<jsp:include page="../user/loginpopup.jsp"></jsp:include>
</body>
</html>