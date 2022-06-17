<%@page import="java.io.PrintWriter"%>
<%@page import="dao.BorderDAO" %>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="borderInfo" class="dto.BorderDTO"></jsp:useBean>
<jsp:setProperty property="title" name="borderInfo"/>
<jsp:setProperty property="content" name="borderInfo"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String userID=null;
	String userName=null;
	UserDTO userdto = (UserDTO) session.getAttribute("userInfo"); //로그인 정보를 담는 세션 객체
	
	if(userdto!=null){
		userID = userdto.getUserID();
		userName= userdto.getUserName();	
	}else{
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='./../main/main.jsp'"); 
		script.println("</script>");
	}
	
	//session을 받아 아무것도 없는 경우 
	if(userID==null){
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='./../main/main.jsp'"); 
		script.println("</script>");
		//session을 받아 userID가 있을 경우 
	}else {
		String title=borderInfo.getTitle();
		String content=borderInfo.getContent();
		//글쓸때 빈 공간이 있을 경우 
		if(borderInfo.getTitle()==null||borderInfo.getContent()==null){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('빈 공간이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		//글 쓰기 
		}else{
			BorderDAO borderDAO=new BorderDAO();
			int result=borderDAO.setBorder(borderInfo.getTitle(), userName, borderInfo.getContent());
			//DB오류 
			if(result==-1){
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			//글 쓰기 
			}else {
				PrintWriter script= response.getWriter();
				script.println("<script>");
				System.out.println("▶ 작성자:"+userID);
				System.out.println("▶ 제목:"+title);
				System.out.println("▶ 내용:"+content);
				script.println("alert('글이 정상적으로 등록되었습니다.')");
				script.println("location.href='borderForm.jsp'");
				script.println("</script>");
  
			}
		}
	}
%>
</body>
</html>