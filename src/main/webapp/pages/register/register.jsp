<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="registerData" class="dto.UserDTO"  scope="page"></jsp:useBean>>
<jsp:setProperty property="*" name="registerData"/>
<!DOCTYPE html>


<%//회원가입
	registerData.setAuthority("user"); // 유저 권한 부여
	UserDAO.getInstance().insertDB(registerData); // 유저 권한 + 입력받은 정보로 INSERT (Uid는 Insert에서 자동부여)
	

%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>