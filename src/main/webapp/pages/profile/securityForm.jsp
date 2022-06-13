<%@page import="java.io.PrintWriter" %>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="profile_style.css" rel="stylesheet">

<%
	UserDTO userdto = (UserDTO) session.getAttribute("userInfo"); //로그인 정보를 담는 세션 객체
	boolean isAuthority=false; // 권한페이지 출력여부 
	
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
					<li> <a href="myHome.jsp">개인정보</a></li>
					<li> <a><h3>보안설정</h3></a></li>
					<li> <a href="adminMangerForm.jsp"><%= isAuthority ? "관리자 페이지" : "" %></a>
					
				</ul>
			</div>
		</div>
		<div class="main">
			<!-- 첫번째 박스 -->		
			<div class="main_item">
				<h3>비밀번호</h3>
				<p><%=userdto.getUserPassword() %></p>
			</div>
			
			
			
		</div>
	</div>
</body>
</html>