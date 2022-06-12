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
					<li> <a><h3>개인정보</h3></a></li>
					<li> <a href="securityForm.jsp">보안설정</a></li>
					<li> <a href="adminMangerForm.jsp"><%= isO ? "관리자 페이지" : "" %></a>
				</ul>
			</div>
		</div>
		<div class="main">
			<!-- 첫번째 박스 -->		
			<div class="main_item">
				<h3>전화번호 수정</h3>
				<p>유저 데이터</p>
			</div>
			<!-- 두번째 박스 -->
			<div class="main_item">
				<h3>이메일 수정</h3>
				<p>비밀번호</p>
			</div>
			<!-- 세번째 박스 -->
			<div class="main_item">
				<h3>배송지 관리</h3>
				<p>현재 배송지</p>
			</div>
			
		</div>
	</div>
</body>
</html>