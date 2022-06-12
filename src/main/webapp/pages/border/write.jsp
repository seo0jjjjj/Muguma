<%@page import="java.io.PrintWriter"%>
<%@page import="dao.BorderDAO" %>
<%@page import="dto.UserDTO"%>
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
	String userName=null;
	UserDTO userdto = (UserDTO) session.getAttribute("userInfo"); //�α��� ������ ��� ���� ��ü
	
	if(userdto!=null){
		userID = userdto.getUserID();
		userName= userdto.getUserName();	
	}else{
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('�α����� �ϼ���')");
		script.println("location.href='./../main/main.jsp'"); 
		script.println("</script>");
	}
	
	//session�� �޾� �ƹ��͵� ���� ��� 
	if(userID==null){
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('�α����� �ϼ���')");
		script.println("location.href='./../main/main.jsp'"); 
		script.println("</script>");
		//session�� �޾� userID�� ���� ��� 
	}else {
		String title=borderInfo.getTitle();
		String content=borderInfo.getContent();
		//�۾��� �� ������ ���� ��� 
		if(borderInfo.getTitle()==null||borderInfo.getContent()==null){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('�� ������ �ֽ��ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		//�� ���� 
		}else{
			BorderDAO borderDAO=new BorderDAO();
			int result=borderDAO.setBorder(borderInfo.getTitle(), userName, borderInfo.getContent());
			//DB���� 
			if(result==-1){
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('�۾��⿡ �����Ͽ����ϴ�.')");
				script.println("history.back()");
				script.println("</script>");
			//�� ���� 
			}else {
				PrintWriter script= response.getWriter();
				script.println("<script>");
				System.out.println("�� �ۼ���:"+userID);
				System.out.println("�� ����:"+title);
				System.out.println("�� ����:"+content);
				script.println("alert('���� ���������� ��ϵǾ����ϴ�.')");
				script.println("location.href='borderForm.jsp'");
				script.println("</script>");
  
			}
		}
	}
%>
</body>
</html>