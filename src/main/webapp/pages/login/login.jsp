<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%//GET 요청으로 접속시 
	if(request.getMethod().equals("get")){
	//메인 페이지로 이동
		response.sendRedirect("./../main/main.html");
	}
	//POST 요청으로 로그인 요청시
	else{
		request.getParameter("userID");
		request.getParameter("userPassword");
		
		session.setAttribute("sid", request.)
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>