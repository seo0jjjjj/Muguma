<%@page import="java.util.ArrayList"%>
<%@page import="dao.BorderDAO" %>
<%@page import="dto.BorderDTO" %>
<%@page import="dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<%
//�α��� ���� nabbar ó���κ�
UserDTO userdto = (UserDTO) session.getAttribute("userInfo"); //�α��� ������ ��� ���� ��ü
boolean isLogin = false; // �α��� ���� ����
String userName = "";
//�α��λ��°� �ƴ� ���
if (userdto == null) {
	//�α���,ȸ������ Ȱ��ȭ
	isLogin = false;
}
//�α��λ����� ���
else {
	//�α���,ȭ������ ��Ȱ��ȭ
	isLogin = true;
	userName = userdto.getUserName();
}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>���׸� ����� | �Խ��� ��ȸ</title>
<link rel="stylesheet" href="main_style.css">	
<!--����� �۾�ü-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<!--����� �۾�ü-->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!--����� �۾�ü-->
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap"
	rel="stylesheet">

	<script src="https://kit.fontawesome.com/68a70dfda4.js"
	crossorigin="anonymous"></script>
	<link href="border_style.css" rel="stylesheet">
<link href="basic_page_style.css" rel="stylesheet">



</head>
<body>


	<div id="navbar">
		<ul id="one">
			<li id="logo"><a class="white_font" href=""><i
					class="fa-solid fa-paintbrush"></i> MUGUMA</a></li>


			<li class="fl"><a class="white_font" href=""><i
					class="fa-solid fa-bag-shopping icon"></i></a></li>
			<li class="fl"><a class="white_font" href=""><i
					class="fa-solid fa-user icon"></i></a></li>
		</ul>

		<ul id="two">
			<%= isLogin ? " "+userName+"�� ȯ���մϴ�." : "�α����ϼ���." %>
			</a></li>


			<li class="fl"><a href="../login/logout.jsp"><%= isLogin ? "�α׾ƿ�" : "" %></a></li>
			<li class="fl"><a href="../login/loginForm.html"><%= isLogin ? "" : "�α���" %></a></li>
			<li class="fl"><a href="../register/registerForm.html"><%= isLogin ? "" : "ȸ������" %></a></li>
			<li class="fl"><a href="">������</a></li>
		</ul>
	</div>



<!-- NAB�� �Ʒ��κ� -->

<div class="border">

	<div class="row">
		<table class="table">
			<tr>
				<th>��ȣ</th>
				<th>����</th>
				<th>�ۼ���</th>
				<th>�ۼ���</th>
			</tr>
			<tbody>
				<%
					BorderDAO borderDAO = new BorderDAO();
					ArrayList<BorderDTO> list = borderDAO.getBorder();
					for(int i=0;i<list.size();i++) {
				%>
				<tr>
					<td><%=list.get(i).getBid() %></td>
					<td><%=list.get(i).getTitle()%></td>
					<td><%=list.get(i).getUserID() %></td>
					<td><%=list.get(i).getDate()%></td>
				</tr>
			<%
					}
				%>
			</tbody>
		</table>
		<center>
		<button onclick="location.href = './writeForm.jsp';" class="btn">�۾��� ����</button>
	</center>
	</div>
</div>

</body>
</html>