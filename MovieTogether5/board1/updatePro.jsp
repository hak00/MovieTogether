<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String pageNum=request.getParameter("pageNum");
%>
<jsp:useBean id="vo" class="vo.BoardVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
<%
	BoardDAO dao = new BoardDAO();
	int check = dao.updateBoard(vo);
	response.setContentType("text/html;charset=utf-8");
	if(check==1){
%>
	<script>
		alert("수정성공");
		location.href="board.jsp";
	</script>
			
<%	}else{
%>

	<script>
		alert("비밀번호 틀림");
		history.back();
	</script>	
<%}
%>