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
<!-- 왼쪽 탭 바 -->
	<div class=container>
		<div class="side">
			<div class="side_logo">
				<a href="../main/main.jsp" style="color: inherit;"><h1>MUGEMA</h1></a>
			</div>
			<!-- 탭 바 메뉴 -->
			<div class="side_state">
				<ul>
					<li> <a href="myHome.jsp">개인정보</a></li>
					<li> <a><h3>보안설정</h3></a></li>
					<li> <a href="adminMangerForm.jsp"><%= isAuthority ? "관리자 페이지" : "" %></a>
					
				</ul>
			</div>
		</div>
		<!-- 메뉴 화면 출력 -->
		<div class="main">
			<!-- 첫번째 박스 -->		
			<div class="main_item">
				<h3>비밀번호</h3>
				<form action="changePassword.jsp" method="post" name="form" onsubmit="return checkPassword(form.userPassword.value,form.userPassword2.value);">
					변경하실 비밀번호 :
					<input type="text" name="userPassword" class="inputbox"  maxlength="20" placeholder="비밀번호를 입력하세요"><br>
			
					비밀번호 재입력:
					<input type="text" name="userPassword2" class="inputbox"  maxlength="20" placeholder="비밀번호를 입력하세요"><br>
				
					<button onsubmit=""> 비밀번호 변경</button>
				</form>
			</div>
			
			
			
		</div>
	</div>
	<script>
	/// 비밀번호 유효성 검사 
	function checkPassword(userPassword, userPassword2) {//비밀번호가 입력되었는지 확인하기


		var userPasswordRegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
		if (!userPasswordRegExp.test(userPassword)) {
			alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
			form.userPassword.value = "";
			form.userPassword2.value = "";
			form.userPassword.focus();
			return false;
		}
		if (userPassword!=userPassword2) {
			alert("비밀번호가 서로 일치하지 않습니다.");
			form.userPassword.value = "";
			form.userPassword2.value = "";
			form.userPassword.focus();
			return false;
		}
		//비밀번호 널방지
		if (!checkExistData(userPassword, "비밀번호를")) {
			form.userPassword2.focus();
			return false;
		}
	}
	
	</script>
</body>
</html>