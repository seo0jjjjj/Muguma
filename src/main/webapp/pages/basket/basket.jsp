<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="basket" class="dto.BasketDTO" ></jsp:useBean>
<%
	//로그인되어있는지?
	UserDTO userdto = (UserDTO) session.getAttribute("userInfo");		
	if(userdto==null)
	{
		out.println("<script>");
		out.println("alert('장바구니에 등록하려면 로그인해주세요!')");
		out.println("location.href='./../login.jsp'");
		out.println("</script>");

	}
	else{
	//db 장바구니에 추가
	basket.setDate(date);
	basket.setPid(pid);
	basket.setUid(date);
	basket.setUserName(date);
	//세션에서 추가
	session.setAttribute("basket",basket);
	}
	

%>
<%


%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>