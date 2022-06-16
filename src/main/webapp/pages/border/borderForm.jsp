<%@page import="java.util.ArrayList"%>
<%@page import="dao.BorderDAO" %>
<%@page import="dto.BorderDTO" %>
<%@page import="dto.UserDTO" %>
<%@page import="date.DateManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
//로그인 정보 nabbar 처리부분
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>무그마 스토어 | 게시판 조회</title>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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


	<link href="border_style.css" rel="stylesheet">
<link href="basic_page_style.css" rel="stylesheet">

</head>
<body>

	<div id="navbar">
		<ul id="one">
			<li id="logo"><a class="white_font" href="./../main/main.jsp"><i
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

	<div class="row" style="    background: white;
    text-align: center;">
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
				<tr onClick="location.href=<%=""+"'./bordershow.jsp?bid="+list.get(i).getBid()+"';"%>">
					<td><%=list.get(i).getBid() %></td>
					<td><%=list.get(i).getTitle()%></td>
					<td><%=list.get(i).getUserID() %></td>
					<td><%=list.get(i).getDate()%></td>
				</tr>
			<%
					}
				%>
			</tbody>
			<tfoot>
		
   <tr><td colspan=4>각 항목을 클릭할 경우 상세글을 볼 수 있습니다!</td></tr>
			</tfoot>
		</table>
		<center>
		<button onclick="location.href = './writeForm.jsp';" class="btn">글쓰러 가기</button>
	</center>
	</div>
</div>
</body>
</html>