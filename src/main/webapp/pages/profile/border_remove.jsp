<%@page import="dto.BorderDTO"%>
<%@page import="dao.BorderDAO"%>
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
		String bid=request.getParameter("id");
		int bbid=Integer.parseInt(bid);
		
		BorderDAO borderDAO = new BorderDAO();
		borderDAO.deleteBorder(bbid);
		System.out.println("삭제된 bid:"+bbid);
		out.println("<script>");
		out.println("alert('게시글이 삭제되었습니다..')");
		out.println("location.href = 'adminMangerForm.jsp'");
		out.println("</script>");
	%>
</body>
</html>