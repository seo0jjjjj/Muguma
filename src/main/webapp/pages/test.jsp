
<%@page import="mail.HashCreater"%>
<%@page import="mail.MailSender"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 비밀번호 찾기  -->
	<%-- 
	<%=	UserDAO.getInstance().findUid("seo0jjjjj@gmail.com","sample1234")%>
	--%>


			<button id="security_button" onsubmit="jiral()">확인하기</button>


	<script>
	function jiral() {

		alert("ㅈㄹ");	
	}
	</script>
</body>
</html>