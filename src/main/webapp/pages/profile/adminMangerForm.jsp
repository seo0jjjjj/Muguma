<%@page import="dao.UserDAO"%>
<%@page import="java.util.ArrayList"%>
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
				<h1>MUGEMA</h1>
			</div>
			<div class="side_profile">
		</div>
			<div class="side_state">
				<ul>
					<li> <a href="myHome.jsp">개인정보</a></li>
					<li> <a href="securityForm.jsp">보안설정</a></li>
					<li> <a><%= isAuthority ? "<h3>관리자 페이지</h3>" : "" %></a>
					
				</ul>
			</div>
		</div>
		<%
			UserDAO userDAO=UserDAO.getInstance();
			ArrayList<UserDTO> list=userDAO.getDBList();
			for(int i=0;i<list.size();i++){
		%>
		<div class="main">
			<!-- 첫번째 박스 -->		
			<div class="main_item">
				<h3>유저 데이터 출력</h3>
				<table class="userTable">
					<th>
						<th>고유번호</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>성</th>
						<th>권한</th>
					</th>
					<tr>
						<td><%=list.get(i).getUid()%></td>
						<td><%=list.get(i).getUserID() %></td>
						<td><%=list.get(i).getUserPassword() %></td>
						<td><%=list.get(i).getUserName() %></td>
						<td><%=list.get(i).getUserEmail() %></td>
						<td><%=list.get(i).getUserTel() %></td>
						<td><%=list.get(i).getSex() %></td>
						<td><%=list.get(i).getAuthority() %></td>
					</tr>
				</table>
			</div>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>