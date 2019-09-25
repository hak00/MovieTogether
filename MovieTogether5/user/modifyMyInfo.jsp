<%@page import="dao.UserDao"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
%>
<jsp:useBean id="vo" class="vo.UserVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
<%
	String passwd = request.getParameter("pass1");
	UserDao dao = new UserDao();
	int check = dao.updateUser(vo,passwd);
	response.setContentType("text/html;charset=utf-8");
	if(check==1){
		
%>
	<script>
		alert("수정 성공");
		location.href="MyInfo.jsp";
	</script>
<%	}else{
	
%>
	<script>
		alert("비밀번호 확인바람");
		alert(<%=vo.getPass()%>);
		history.back();
	</script>
<%}
%>