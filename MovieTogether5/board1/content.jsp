<%@page import="java.sql.Timestamp"%>
<%@page import="vo.BoardVO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	BoardDAO dao = new BoardDAO();
	dao.updateReadCount(num);
	
	BoardVO vo = dao.getBoard(num);
	int number = vo.getNum();
	int readcount = vo.getReadcount();
	String name = vo.getName();
	Timestamp date = vo.getDate();
	String subject = vo.getSubject();
	String fileName = vo.getFile();
	String content = "";
	if(vo.getContent() != null){
		content = vo.getContent().replace("\r\n", "<br/>");
	}
	int re_ref = vo.getRe_ref();
	int re_lev = vo.getRe_lev();
	int re_seq = vo.getRe_seq();
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
    border-right :1px solid #ccc;
    background: #f3f6f7;
    text-align: center;
}

table.type09 tbody td{
	width : 300px;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;

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
	<div id="content" class="content">
		<div class="container">
			<span class="main">글 상세 내용</span>
		</div>
		<br><br><br>
		<div class="container">
			<table class="type09">
				<tbody>
					<tr>
						<th scope="row">글번호</th>
						<td align="center"><%=number %></td>
						<th scope="row">조회수</th>
						<td align="center"><%=readcount %></td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td align="center"><%=name %></td>
						<th scope="row">작성일</th>
						<td align="center"><%=date %></td>
					</tr>
					<tr>
						<th scope="row">글제목</th>
						<td align="center"><%=subject %></td>
						<th scope="row">파일</th>
						<td align="center"><a href="/MovieTogether5/Board/filedown.do?filename=<%=fileName%>"><%=fileName %></a></td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td colspan="3" align="center"><%=content %></td>
					</tr>
				</tbody>
			</table>
			<div class="searchBox">
			<%
				String id=(String)session.getAttribute("id");
				if(id!= null){
			%>
				<input type="button" value="글 수정" class="btn" id="btn" onclick="location.href='update.jsp?pageNum=<%=pageNum%>&num=<%=num%>'">
				<input type="button" value="글 삭제" class="btn" width="70pt" onclick="location.href='delete.jsp?pageNum=<%=pageNum%>&num=<%=num%>'"> 
				<input type="button" value="답글 쓰기" class="btn" width="70pt" 
				onclick="location.href='reWrite.jsp?num=<%=num%>&re_ref=<%=re_ref%>&re_lev=<%=re_lev%>&re_seq=<%=re_seq%>'">
			<%	}
			%>
				<input type="button" value="목록보기" class="btn" onclick="location.href='board.jsp'">
			</div>
		</div>
	</div>

	<jsp:include page="../user/footer.jsp"></jsp:include>
	<jsp:include page="../user/loginpopup.jsp"></jsp:include>
</body>
</html>