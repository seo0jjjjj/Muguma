<%@page import="dao.DBCon"%>
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

		PreparedStatement pstmt =  DBCon.getInstance().getConnection().prepareStatement("insert into test values(?,?)");
		
		pstmt.setString(1,"testID2");
		pstmt.setString(2,"testPW2");
		
		pstmt.executeUpdate();

		pstmt.close();
	
		
%>
</body>
</html>