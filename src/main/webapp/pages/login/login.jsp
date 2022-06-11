<%@page import="dao.UserDAO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userInfo" class="dto.UserDTO"></jsp:useBean>
<jsp:setProperty property="userID" name="userInfo"/>
<jsp:setProperty property="userPassword" name="userInfo"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% //POST이외의 요청으로 접근시
	if(!request.getMethod().equals("POST")){
	//메인 페이지로 이동
		response.sendRedirect("./../main/main.html");
	}
	//
	else{
		String id, pw;
		id = userInfo.getUserID();
		pw = userInfo.getUserPassword();
		System.out.println("id :"+id+" pw:"+pw);
		int uid = UserDAO.getInstance().login(id,pw);
		
		if(uid == -1) {
		out.print("로그인에 실패하였습니다.");	
		}
		else{
		userInfo = UserDAO.getInstance().getDB(uid);
		session.setAttribute("userInfo", userInfo);
		
		UserDTO dto = (UserDTO) session.getAttribute("userInfo");
		out.print("<h1>"+dto.getUid()+"번 "+dto.getUserName()+"님 환영합니다 </h1>");
		}
	}
%>
</body>
</html>