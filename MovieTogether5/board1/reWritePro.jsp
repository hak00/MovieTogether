<%@page import="dao.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="vo" class="vo.BoardVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
<%

response.setContentType("text/html;charset=utf-8");
	vo.setDate(new Timestamp(System.currentTimeMillis()));
	vo.setIp(request.getRemoteAddr());
	BoardDAO dao = new BoardDAO();
	dao.reInsertBoard(vo);
	
	response.sendRedirect("board.jsp");
%>