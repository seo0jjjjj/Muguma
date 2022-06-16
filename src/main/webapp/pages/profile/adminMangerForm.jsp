<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dto.BorderDTO"%>
<%@page import="dao.BorderDAO"%>
<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
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
	    return ;
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
			<div class="side_profile"></div>
			<div class="side_state">
				<ul>
					<li><a href="myHome.jsp">개인정보</a></li>
					<li><a href="securityForm.jsp">보안설정</a></li>
					<li><a><%= isAuthority ? "<h3>관리자 페이지</h3>" : "" %></a>
				</ul>
			</div>
		</div>
		<div class="main">
			<table class="userTable"
				style="width: 100%; border: 1px solid #444444; border-collapse: collapse;">
				<!-- 유저 데이터 -->
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
						<td style="border: 1px solid #444444; text-align: center;"><%=list.get(i).getUid()%></td>
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
			<table class="borderTable"
				style="width: 100%; border: 1px solid #444444; border-collapse: collapse;">
				<!-- 게시판 데이터 -->
				<h3>게시판 출력</h3>
				<tr>
					<th style="border: 1px solid #444444;">번호</th>
					<th style="border: 1px solid #444444;">제목</th>
					<th style="border: 1px solid #444444;">작성자</th>
					<th style="border: 1px solid #444444;">날짜</th>
				</tr>
				<tbody>
					<%
						BorderDAO borderDAO=new BorderDAO();
						ArrayList<BorderDTO> borderList=borderDAO.getBorder();
							for(int i=0;i<borderList.size();i++){
					%>
					<tr>
						<td style="border: 1px solid #444444; text-align: center;"><%=borderList.get(i).getBid()%></td>
						<td style="border: 1px solid #444444; text-align: center;"><%=borderList.get(i).getTitle()%></td>
						<td style="border: 1px solid #444444; text-align: center;"><%=borderList.get(i).getUserID()%></td>
						<td style="border: 1px solid #444444; text-align: center;"><%=borderList.get(i).getDate()%></td>
						<td style="border: 1px solid #444444; text-align: center;"><button
								onclick="location.href='./border_remove.jsp?id=<%=borderList.get(i).getBid() %>'"
								class="btn-remove">삭제하기</button></td>
					</tr>
					<%
							
						
							}
					%>
				</tbody>
			</table >
			<hr>
			<h3>전체 이미지 출력</h3>
			<!-- 이미지 상품 전체출력 -->
			<table border="1" style="width: 100%; border: 1px solid #444444; border-collapse: collapse;">
				<tr>
					<th>번호</th>
					<th>그림</th>
					<th>그림제목</th>
					<th>작가</th>
					<th>가격</th>
					<th>카테고리</th>
				</tr>
				<tbody>
					<%
					//바스켓

					ArrayList<ProductDTO> plist = ProductDAO.getInstance().getDBList();
					for (ProductDTO temp_product : plist) {
	
					%>
					<tr align="center">
					<td><%=temp_product.getPid()%></td>
					<td><image src='<%="./../../images/"+String.valueOf(temp_product.getPid())+".jpg"%>' width="100" height="100" alt="이미지그림"></image></td>
					<td><%=temp_product.getProductName()%></td>
					<td><%=temp_product.getProductDescript()%></td>
					<td><%=Integer.toString(temp_product.getPrice())%></td>
					<td><%="#" + temp_product.getProductCategory()%></td>

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