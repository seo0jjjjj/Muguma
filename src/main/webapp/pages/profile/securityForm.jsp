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
					<li> <a href="myHome.jsp">개인정보</a></li>
					<li> <a><h3>보안설정</h3></a></li>
					<li> <a href="adminMangerForm.jsp"><%= isO ? "관리자 페이지" : "" %></a>
				</ul>
			</div>
		</div>
		<div class="main">
			<!-- 첫번째 박스 -->		
			<div class="main_item">
				<h3>비밀번호 변경</h3>
				<p>비밀번호</p>
			</div>
			
			
		</div>
	</div>
</body>
</html>