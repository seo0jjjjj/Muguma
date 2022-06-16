<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="changePassword" class="dto.UserDTO" scope="page"/>
<jsp:setProperty property="uid" name="changePassword" />
<jsp:setProperty property="userPassword" name="changePassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		int uid=0;
		UserDTO userdto=(UserDTO) session.getAttribute("userInfo");
		uid=userdto.getUid();
		
		if(UserDAO.getInstance().updatePW(uid, changePassword.getUserPassword())==true){
			System.out.println("uid ▶"+uid);
			System.out.println("변경된 비밀번호 ▶"+changePassword.getUserPassword());
			out.println("<script>");
	    	out.println("alert('변경되었습니다.');");
	    	out.println("history.back()");
	    	out.println("</script>");
		}else{
			out.println("<script>");
	    	out.println("alert('비밀번호 변경에 실패하였습니다.');");
	    	out.println("history.back()");
	    	out.println("</script>");
		}
	%>
</body>
</html>