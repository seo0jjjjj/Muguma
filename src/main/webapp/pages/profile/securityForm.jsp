<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="profile_style.css" rel="stylesheet">

</head>
<body>
<%
boolean isO = false;
%>
	<div class=container>
		<div class="side">
			<div class="side_logo">
				<a href="main.jsp"><img class="logo" src="#"></a>
				<h1>MUGEMA</h1>
			</div>
			<div class="side_profile">
		</div>
			<div class="side_state">
				<ul>
					<li> <a href="myHome.jsp">��������</a></li>
					<li> <a><h3>���ȼ���</h3></a></li>
					<li> <a href="adminMangerForm.jsp"><%= isO ? "������ ������" : "" %></a>
				</ul>
			</div>
		</div>
		<div class="main">
			<!-- ù��° �ڽ� -->		
			<div class="main_item">
				<h3>��й�ȣ ����</h3>
				<p>��й�ȣ</p>
			</div>
			
			
		</div>
	</div>
</body>
</html>