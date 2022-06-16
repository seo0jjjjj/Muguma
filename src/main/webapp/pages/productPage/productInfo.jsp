<%@page import="dto.ProductDTO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

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
<%-- 클릭한 이미지를 바탕으로 db에서 테이터를 가져옴. --%>
<%
	//클릭한 이미지의 pid
	int pid = 0;
	//db에서 pid 검색
	ProductDTO db_product = new ProductDTO(); // 검색할 DTO
	
	if(request.getParameter("pid")==null){//db찾기 실패
		//메인으로 이동
		out.println("<script>");
		out.println("alert('[오류] 데이터베이스에서 해당 그림을 찾을 수 없습니다.');");
		out.println("location.href = './../main/main.jsp';");
		out.println("</script>");
	}
	//db에서 pid찾기 성공
	else{
		//pid를 가지고 db로 검색후 dto를 가져옴.
		pid = Integer.parseInt(request.getParameter("pid"));
		db_product = ProductDAO.getInstance().getbyPid(pid);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>무그마 스토어 | 상품 조회</title>
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
	<link href="productInfo_style.css" rel="stylesheet">
	


</head>
<body>


	<div id="navbar">
		<ul id="one">
			<li id="logo"><a class="white_font" href=""><i
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
			<li class="fl"><a href="../serviceCenter/serviceCenterForm.jsp">고객센터</a></li>
		</ul>
	</div>



<!-- NAB바 아래부분 -->
<div class="Content"> <!-- 상단여백 48-->
	<div class="imageBox"> <!--이미지 들어갈곳-->
	
		
		<image src="<%="./../../images/"+request.getParameter("pid")+".jpg"  %>" class="img" ></image>
	</div>	
	<div class="textInfo">
		
	<p class="brand" style="font-size:13px">제목</p><!--브랜드명> 13-->
	<p class="title" style="font-size:34px; font-weight:700; margin-left:30px"><%=db_product.getProductName() %></p> <!--제목> 34-->
		<p style="font-size:16px; font-weight:400; margin-left:30px">#<%=db_product.getProductCategory() %></p> <!--제목> 34-->
	
	<br>
	<hr>
	<br>
	
	<p style="font-size:28px"><%= Integer.toString(db_product.getPrice()) %> <!-- 가격 28폰트 미디움-->
	
	<span style="font-size:15px">원</span> <!-- 2픽셀> 원 15폰트-->
	</p>

	<hr> <!-- 위간격 24 hr 14폰트-->
	<button onclick="location.href = './../basket/basket_add.jsp?pid=<%=pid %>';" class="btn-buy">구매하기</button>
	<button onclick="location.href = './../basket/basket_add.jsp?pid=<%=pid %>';" class="btn-basket">장바구니에 담기</button>
	
	</div>
		
	
</div>

</body>
</html>