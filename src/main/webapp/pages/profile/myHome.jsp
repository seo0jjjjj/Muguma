<%@page import="dto.BorderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.BorderDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
//로그인되어있는지?
UserDTO userdto = (UserDTO) session.getAttribute("userInfo");

boolean isAuthority = false; // 권한페이지 출력여부 
if (userdto == null) {
	out.println("<script>");
	out.println("alert('보안설정 페이지에 접근하려면 로그인해주세요!')");
	out.println("location.href='./../login/loginForm.html'");
	out.println("</script>");
	return ;

}
//로그인 되어있을경우

%>

<%
if (userdto.getAuthority().equals("admin")) {
	isAuthority = true;
} else {
	isAuthority = false;
}

%>


<!DOCTYPE html>
<html>
<head>
<link href="profile_style.css" rel="stylesheet">

</head>
<body>
	<div class=container>
		<div class="side">
			<div class="side_logo">
				<a href="../main/main.jsp" style="color: inherit;"><h1>MUGEMA</h1></a>
			</div>
			<div class="side_profile"></div>
			<div class="side_state">
				<ul>
					<li><a><h3>개인정보</h3></a></li>
					<li><a href="securityForm.jsp">보안설정</a></li>
					<li><a href="adminMangerForm.jsp"><%=isAuthority ? "관리자 페이지" : ""%></a>
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
				<p><%=userdto.getUserEmail()%></p>
			</div>
			<!-- 세번째 박스 -->
			<div class="main_item">
				<h3><%=isAuthority ? "내가 쓴 글" : "고객센터 문의 글"%></h3>
				<table class="borderWriteTable" style="width: 100%;border: 1px solid #444444;border-collapse: collapse;">
					<tr>
						<th style="border: 1px solid #444444;">번호</th>
						<th style="border: 1px solid #444444;">제목</th>
						<th style="border: 1px solid #444444;">작성자</th>
						<th style="border: 1px solid #444444;">작성일</th>
					</tr>
					<%
						String userName=userdto.getUserName();
						BorderDAO borderDAO=new BorderDAO();
						ArrayList<BorderDTO> list=borderDAO.getWriteBorder(userName);
						for(int i=0;i<list.size();i++){
					%>
					<tr>
						<td style="border: 1px solid #444444;"><%= list.get(i).getBid() %></td>
						<td style="border: 1px solid #444444;"><%=list.get(i).getTitle() %></td>
						<td style="border: 1px solid #444444;"><%=list.get(i).getUserID() %></td>
						<td style="border: 1px solid #444444;"><%=list.get(i).getDate() %></td>
					</tr>
					<%
						}
					%>
				</table>
				<p></p>
			</div>

		</div>
	</div>
</body>
</html>