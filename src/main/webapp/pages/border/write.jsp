<%@page import="java.io.PrintWriter"%>
<%@page import="dao.BorderDAO" %>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<jsp:useBean id="borderInfo" class="dto.BorderDTO"></jsp:useBean>
<jsp:setProperty property="title" name="borderInfo"/>
<jsp:setProperty property="content" name="borderInfo"/>
<jsp:useBean id="userInfo" class="dto.UserDTO"></jsp:useBean>
<jsp:setProperty property="userID" name="userInfo" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String userID="";
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	}
	
	if(userID==null){
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='./../main/main.jsp'"); 
		script.println("</script>");
	}else {
		String title=borderInfo.getTitle();
		String content=borderInfo.getContent();
		if(borderInfo.getTitle()==null||borderInfo.getContent()==null){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('빈 공간이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			BorderDAO borderDAO=new BorderDAO();
			int result=borderDAO.setBorder(borderInfo.getTitle(), userID, borderInfo.getContent());
			if(result==-1){
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");

			}else {
				PrintWriter script= response.getWriter();
				script.println("<script>");
				System.out.println("▶▶ 로그인 된 uid:"+userInfo.getUid());
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