<%@page import="dao.BasketDAO"%>
<%@page import="dto.BasketDTO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%
 UserDTO userdto = (UserDTO) session.getAttribute("userInfo");
 String removeAll = request.getParameter("removeAll");

if(userdto==null){
		
	
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.')");
		out.println("location.href='./basket_show.jsp'");
		out.println("</script>");
		return;
	}
 
else{
	int uid = userdto.getUid();
	if(removeAll.equals("true")){
		BasketDAO.getInstance().deleteBasketbyUid(uid);
		out.println("<script>");
		out.println("alert('구매해주셔서 감사합니다.')");
		out.println("location.href='./../main/main.jsp'");
		out.println("</script>");
	}
	
	int pid = Integer.parseInt(request.getParameter("pid"));
	BasketDAO.getInstance().deleteBasket(uid, pid);
	out.println("<script>");
	out.println("alert('삭제 완료하였습니다.')");
	out.println("location.href='./basket_show.jsp'");
	out.println("</script>");
	

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