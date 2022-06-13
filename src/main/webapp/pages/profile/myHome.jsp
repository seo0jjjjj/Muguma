<%@page import="java.io.PrintWriter" %>
<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="profile_style.css" rel="stylesheet">

<%
	UserDTO userdto = (UserDTO) session.getAttribute("userInfo"); //�α��� ������ ��� ���� ��ü
	boolean isAuthority=false; // ���������� ��¿��� 
	
	if(userdto.getAuthority().equals("admin")){
		isAuthority=true;
	}else {
		isAuthority=false;
	}
%>

</head>
<body>
	<div class=container>
		<div class="side">
			<div class="side_logo">
				<a href="../main/main.jsp" style="color: inherit;"><h1>MUGEMA</h1></a>
			</div>
			<div class="side_profile">
		</div>
			<div class="side_state">
				<ul>
					<li> <a><h3>��������</h3></a></li>
					<li> <a href="securityForm.jsp">���ȼ���</a></li>
					<li> <a href="adminMangerForm.jsp"><%= isAuthority ? "������ ������" : "" %></a>
					
				</ul>
			</div>
		</div>
		<div class="main">
			<!-- ù��° �ڽ� -->		
			<div class="main_item">
				<h3>��ȭ��ȣ</h3>
				<p><%=userdto.getUserTel()%></p>
			</div>
			<!-- �ι�° �ڽ� -->
			<div class="main_item">
				<h3>�̸���</h3>
				<p><%=userdto.getUserEmail() %></p>
			</div>
			
			
		</div>
	</div>
</body>
</html>