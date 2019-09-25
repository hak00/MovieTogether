<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<%
	request.setCharacterEncoding("utf-8");
	String search = request.getParameter("search");
	BoardDAO dao = new BoardDAO();
	int count = dao.getCount(search);
	int pageSize = 7;
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize;
	List<BoardVO> list = null;
	
	if(count >0){
		list = dao.getBoardList(startRow, pageSize,search);
	}
	SimpleDateFormat sdf = new SimpleDateFormat("yyy.MM.dd");
%>
<meta charset="UTF-8">
<title>게시판</title>
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
    width: 40px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
    text-align: center;
}

table.type09 tbody td{
	border-right: 1px solid #ccc;
}

.td1 {
    width: 100px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
.td2 {
    width: 1000px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
.td3 {
    width: 70px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
.td4 {
    width: 50px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    
}
.searchBox .text{height: 30px; width: 230px; border: 2px solid black; border-radius: 4px;}
input[type=text]:focus {
	border: 1px solid black;
}

#searchBox{
	clear: both;
	margin-left: 800px;
}
</style>
<!-- css -->
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
			<span class="main">자유게시판</span><br>
			<span>전체 글갯수 : <%=count %></span>
		</div>
		<div class="container">
			<table class="type09">
				<thead>
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
			<%
				if(count > 0){
					for(int i=0; i<list.size(); i++){
						BoardVO vo = list.get(i);
			%>
					<tr onclick="location.href='content.jsp?num=<%=vo.getNum() %>&pageNum=<%=pageNum%>'">
						<th scope="row"><%=vo.getNum() %></th>
						<td class="td1"><%=vo.getName() %></td>
						<td class="td2">
						<%
							int wid=0;
							if(vo.getRe_lev()>0){
								wid = vo.getRe_lev() * 10;
						%>
						<img src="../assets/icons/캡처.PNG" width="<%=wid%>" height="15">	
						<%	}
						%>
						<%=vo.getSubject() %></td>
						<td class="td3"><%=sdf.format(vo.getDate()) %></td>
						<td class="td4"><%=vo.getReadcount() %></td>
			<%		}
				}else{
			%>		
				<tr>
					<th colspan="5">게시판 글 없음</th>
				</tr>
			<%	}
			
			%>
				</tbody>
			</table>
			<%
				if(count>0){
					int pageCount=count/pageSize+(count%pageSize==0?0:1);
					int pageBlock=1;
					int startPage=((currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock+1;
					int endPage=startPage+pageBlock-1;
					if(endPage > pageCount){
						endPage = pageCount;
					}
					if(startPage > pageBlock){
			%>
			<a href="boardSearch.jsp?pageNum=<%=startPage-pageBlock %>&search=<%=search%>">[이전]</a>			
			<%		}
			for(int i=startPage; i<endPage; i++){
			%>
				<a href="boardSearch.jsp?pageNum=<%=i %>&search=<%=search%>">[<%=i %>]</a>	
			<%
			}
			if(endPage < pageCount){
			%>
				<a href="boardSearch.jsp?pageNum=<%=startPage+pageBlock %>&search=<%=search%>">[다음]</a>	
			<%}
				}
			%>
			<div class="searchBox" id="searchBox">
			<input type="text" name="search" class="text" width="200" height="70">
			<input type="button" value="찾기" class="btn">
			<% 
				String id = (String)session.getAttribute("id");
				if(id!=null){
			%>
				<input type="button" value="글쓰기" class="btn" id="writebtn" onclick="location.href='writeBoard.jsp'">
				
			<%	}
			%>
			</div>
		</div>
	</div>

	<jsp:include page="../user/footer.jsp"></jsp:include>
	<jsp:include page="../user/loginpopup.jsp"></jsp:include>
</body>
</html>