<%@page import="java.util.ArrayList"%>
<%@page import="dao.BorderDAO" %>
<%@page import="dto.BorderDTO" %>
<%@page import="dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--css���� --><link href="border_style.css" rel="stylesheet">

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
				<th>��ȣ</th>
				<th>����</th>
				<th>�ۼ���</th>
				<th>�ۼ���</th>
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
		<a href="writeForm.jsp" class="btn btn-write">�۾���</a>
	</div>
</div>

</body>
</html>