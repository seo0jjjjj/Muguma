<%@page import="java.io.PrintWriter"%>
<%@page import="dao.BorderDAO" %>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="borderInfo" class="dto.BorderDTO"></jsp:useBean>
<jsp:setProperty property="title" name="borderInfo"/>
<jsp:setProperty property="content" name="borderInfo"/>

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

<title>���׸� ����� | �Խ��� �۾���</title>
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
<center>


</div>
	<!-- �۾��� ��� �������� ��-->
	<div class="border">	
		<div class="row">
		<div class="table">
			<form action="write.jsp" method="post">
				<table style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">�Խ��� �۾���</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						<td><input type="text" class=" " placeholder="�� ����" name="title" maxlength="50"> 
						</td>
						</tr>
						<tr>
						<td><textarea placeholder="�� ����" name="content" maxlength="1024" style="height:350px; width: 600px"></textarea>
						</td>
						</tr>
					</tbody>
				</table>
				<center>
					<button class="btn">�� ����</button>
				</center>

				</form>
		</div>
	</div>
</center>
</body>
</html>