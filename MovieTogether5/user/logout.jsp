<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//세션값 제거
	session.invalidate();

	//"로그아웃" <--메시지창 띄우고
%>
<script type="text/javascript">
	alert("로그아웃");
	loaction.href="../user/index.jsp"
</script>