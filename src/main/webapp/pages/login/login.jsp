<%@page import="dao.UserDAO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="userInfo" class="dto.UserDTO"></jsp:useBean>
<jsp:setProperty property="userID" name="userInfo" />
<jsp:setProperty property="userPassword" name="userInfo" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	//POST이외의 요청으로 접근시
	if (!request.getMethod().equals("POST")) {
		//메인 페이지로 이동
		response.sendRedirect("./../main/main.jsp");
	}
	//
	else {
		String id, pw;
		id = userInfo.getUserID();
		pw = userInfo.getUserPassword();
		System.out.println("[login.jsp] 로그인 시도 : ID:" + id + " PW:" + pw);
		int uid = UserDAO.getInstance().login(id, pw);

		//로그인실패
		if (uid == -1) {
			System.out.println("▶ 로그인 실패 ");   
			out.println("<script>");
		    out.println("alert('아이디 또는 비밀번호를 확인해주세요.');");
		    out.println("history.back()");
		    out.println("</script>");
		}
		//로그인 성공
		else {
			userInfo = UserDAO.getInstance().getDB(uid);
			session.setAttribute("userInfo", userInfo);
			System.out.println("▶ 로그인 성공");
			System.out.println("▶▶ uid:"+userInfo.getUid());
			
			out.println("<script>");
		    out.println("alert('로그인되었습니다.');");
		    out.println("location.href = './../main/main.jsp';");
		    out.println("</script>");
		}
	}
	%>
</body>
</html>