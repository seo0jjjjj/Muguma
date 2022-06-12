<%@page import="java.util.ArrayList"%>
<%@page import="dao.BorderDAO" %>
<%@page import="dto.BorderDTO" %>
<%@page import="dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--css파일 --><link href="border_style.css" rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	
%>
<div class="border">
	<div class="row">
		<table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<tbody>
				<%
					BorderDAO borderDAO = new BorderDAO();
					ArrayList<BorderDTO> list = borderDAO.getBorder();
					for(int i=0;i<list.size();i++) {
				%>
				<tr>
					<td><%=list.get(i).getBid() %></td>
					<td><%=list.get(i).getTitle()%></td>
					<td><%=list.get(i).getUserID() %></td>
					<td><%=list.get(i).getDate()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<a href="writeForm.jsp" class="btn btn-write">글쓰기</a>
	</div>
</div>

</body>
</html>