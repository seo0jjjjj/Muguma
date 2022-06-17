<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dto.BasketDTO"%>
<%@page import="dao.BasketDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BorderDAO"%>
<%@page import="dto.BorderDTO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
//로그인 정보 nabbar 처리부분
UserDTO userdto = (UserDTO) session.getAttribute("userInfo"); //로그인 정보를 담는 세션 객체
boolean isLogin = false; // 로그인 상태 여부
int uid = 3;
String userName = "";
//로그인상태가 아닐 경우
if (userdto == null) {
	out.println("<script>");
	out.println("alert('장바구니를 확인하려면 로그인을 해주세요.')");
	out.println("location.href='./../login/loginForm.html'");
	out.println("</script>");
	isLogin = false;
}
//로그인상태일 경우
else {
	//로그인,화원가입 링크 비활성화
	isLogin = true;
	uid = userdto.getUid();
	userName = userdto.getUserName();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>무그마 스토어 | 게시판 조회</title>
<link rel="stylesheet" href="main_style.css">
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
<link href="basket_style.css" rel="stylesheet">
<link href="basic_page_style.css" rel="stylesheet">



</head>
<body>


		<div id="navbar">
		<ul id="one">
			<li id="logo"><a class="white_font" href="../main/main.jsp"><i
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



	<!-- NAB바 아래부분 -->

	<div class="border">

		<div class="row">
			<table class="table">
				<tr>
					<th>그림고유번호</th>
					<th>그림</th>
					<th>그림제목</th>
					<th>작가</th>
					<th>가격</th>
					<th>카테고리</th>
					<th>장바구니에서 삭제</th>
				</tr>
				<tbody>
					<%
					//바스켓
					BasketDTO basketDTO = new BasketDTO();
					ArrayList<BasketDTO> list = BasketDAO.getInstance().getDBList(uid);

					ArrayList<ProductDTO> plist = ProductDAO.getInstance().getDBList();
					
					for (BasketDTO temp_basket : list) {
						int bpid = temp_basket.getPid();
						
					%>
					<tr>
						<td><%=Integer.toString(bpid)%></td>
						<%
						for (ProductDTO temp_product : plist) {
						
							if (temp_product.getPid()==bpid) {
			
						%>

						<td><image src="<%="./../../images/"+bpid+".jpg"  %>" width="100" height="100" alt="이미지그림"></image></td>
						<td><%=temp_product.getProductName()%></td>
						<td><%=temp_product.getProductDescript()%></td>
						<td><%=Integer.toString(temp_product.getPrice())%></td>
						<td><%="#" + temp_product.getProductCategory()%></td>
						<td><button
								onclick="location.href = './basket_remove.jsp?removeAll=false&pid=<%=bpid%>';"
								class="btn-remove">삭제하기</button></td>
						<%
						}
							
						}
						%>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<center>
				<button onclick="location.href = './basket_remove.jsp?removeAll=true&pid=-100';" class="btn-buy">구매하기</button>
			</center>
		</div>
	</div>

</body>
</html>