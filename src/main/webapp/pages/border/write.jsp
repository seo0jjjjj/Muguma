<%@page import="java.io.PrintWriter"%>
<%@page import="dao.BorderDAO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<jsp:useBean id="borderInfo" class="dto.BorderDTO"></jsp:useBean>
<jsp:setProperty property="title" name="borderInfo"/>
<jsp:setProperty property="content" name="borderInfo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String userID=null;
	if(session.getAttribute("userInfo")!=null){
		userID=(String)session.getAttribute("userInfo");
	} // ����� ������ �� �޾ƿ� 
	
	if(userID==null){
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('�α����� �ϼ���')");
		script.println("location.href='./../main/main.jsp'"); 
		script.println("</script>");
	}else {
		if(borderInfo.getTitle()==null||borderInfo.getContent()==null){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('�� ������ �ֽ��ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			BorderDAO borderDAO=new BorderDAO();
			int result=borderDAO.setBorder(borderInfo.getTitle(), userID, borderInfo.getContent());
			if(result==-1){
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('�۾��⿡ �����Ͽ����ϴ�.')");
				script.println("history.back()");
				script.println("</script>");

			}else {
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('���� ���������� ��ϵǾ����ϴ�.')");
				script.println("location.href='borderForm.jsp'");
				script.println("</script>");
  
			}
		}
	}
%>
</body>
</html>