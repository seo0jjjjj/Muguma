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
	
	if(userdto==null){
		out.println("<script>");
	    out.println("alert('잘못된 접근입니다.');");
	    out.println("location.href = './../main/main.jsp';");;
	    out.println("</script>");
	}
	
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
					<li> <a href="securityForm.jsp">보안설정</a></li>
					<li> <a><%= isAuthority ? "<h3>관리자 페이지</h3>" : "" %></a>
					
				</ul>
			</div>
		</div>
		<div class="main">
				<table class="userTable" style="width: 100%;border: 1px solid #444444;border-collapse: collapse;">
				<h3>유저 데이터 출력</h3>
					<tr>
						<th style="border: 1px solid #444444;">고유번호</th>
						<th style="border: 1px solid #444444;">아이디</th>
						<th style="border: 1px solid #444444;">비밀번호</th>
						<th style="border: 1px solid #444444;">이름</th>
						<th style="border: 1px solid #444444;">이메일</th>
						<th style="border: 1px solid #444444;">전화번호</th>
						<th style="border: 1px solid #444444;">성</th>
						<th style="border: 1px solid #444444;">권한</th>
					</tr>
					<tbody>
					<%
						UserDAO userDAO=UserDAO.getInstance();
						ArrayList<UserDTO> list=userDAO.getDBList();
							for(int i=0;i<list.size();i++){
					%>
						<tr>
							<td style="border: 1px solid #444444;"><%=list.get(i).getUid()%></td>
							<td style="border: 1px solid #444444;"><%=list.get(i).getUserID() %></td>
							<td style="border: 1px solid #444444;"><%=list.get(i).getUserPassword() %></td>
							<td style="border: 1px solid #444444;"><%=list.get(i).getUserName() %></td>
							<td style="border: 1px solid #444444;"><%=list.get(i).getUserEmail() %></td>
							<td style="border: 1px solid #444444;"><%=list.get(i).getUserTel() %></td>
							<td style="border: 1px solid #444444;"><%=list.get(i).getSex() %></td>
							<td style="border: 1px solid #444444;"><%=list.get(i).getAuthority() %></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
		</div>

	</div>
</body>
</html>