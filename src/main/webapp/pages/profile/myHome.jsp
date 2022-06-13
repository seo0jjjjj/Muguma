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
					<li> <a><h3>개인정보</h3></a></li>
					<li> <a href="securityForm.jsp">보안설정</a></li>
					<li> <a href="adminMangerForm.jsp"><%= isAuthority ? "관리자 페이지" : "" %></a>
					
				</ul>
			</div>
		</div>
		<div class="main">
			<!-- 첫번째 박스 -->		
			<div class="main_item">
				<h3>전화번호</h3>
				<p><%=userdto.getUserTel()%></p>
			</div>
			<!-- 두번째 박스 -->
			<div class="main_item">
				<h3>이메일</h3>
				<p><%=userdto.getUserEmail() %></p>
			</div>
			
			
		</div>
	</div>
</body>
</html>