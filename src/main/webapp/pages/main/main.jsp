<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserDTO userdto = (UserDTO) session.getAttribute("userInfo"); //로그인 정보를 담는 세션 객체
boolean isLogin = false; // 로그인 상태 여부
String userName = "";
//로그인상태가 아닐 경우
if (userdto == null) {
	//로그인,회원가입 활성화
	isLogin = false;
}
//로그인상태일 경우
else {
	//로그인,화원가입 비활성화
	isLogin = true;
	userName = userdto.getUserName();
}


%>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<title>무그마 스토어</title>
<link rel="stylesheet" href="main_style.css">	

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<!--노토산 글씨체-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<!--노토산 글씨체-->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!--노토산 글씨체-->
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap"
	rel="stylesheet">

<script src="https://kit.fontawesome.com/68a70dfda4.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="navbar">
		<ul id="one">
			<li id="logo"><a class="white_font" href="./../main/main.jsp"><i
					class="fa-solid fa-paintbrush"></i> MUGUMA</a></li>


			<li class="fl"><a class="white_font" href="../basket/basket_show.jsp"><i
					class="fa-solid fa-bag-shopping icon"></i></a></li>
			<li class="fl"><a class="white_font" href="../profile/myHome.jsp"><i
					class="fa-solid fa-user icon"></i></a></li>
		</ul>

		<ul id="two">
			<%= isLogin ? " "+userName+"님 환영합니다." : "로그인하세요." %>
			</a></li>


			<li class="fl"><a href="../login/logout.jsp"><%= isLogin ? "로그아웃" : "" %></a></li>
			<li class="fl"><a href="../login/loginForm.html"><%= isLogin ? "" : "로그인" %></a></li>
			<li class="fl"><a href="../register/registerForm.html"><%= isLogin ? "" : "회원가입" %></a></li>
			<li class="fl"><a href="../border/borderForm.jsp">게시판</a></li>
		</ul>
	</div>

</body>
<script type="module" src="app.js"></script>
</html>