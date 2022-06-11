
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
	<%
	MailSender.getInstance().sendMail("seo0jjjjj@gmail.com");

	%>
</body>
</html>