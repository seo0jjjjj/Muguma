<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="registerData" class="dto.UserDTO" scope="page"></jsp:useBean>>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:setProperty property="*" name="registerData" />

<!DOCTYPE html>


<%
//회원가입

//POST이외의 요청으로 접근시
if (!request.getMethod().equals("POST")) {
	//메인 페이지로 이동
	out.println("<script>");
	out.println("alert('잘못된 접근입니다.');");
	out.println("location.href = './../main/main.jsp';");
	;
	out.println("</script>");
} else {
	registerData.setAuthority("user"); // 유저 권한 부여

	// 성별 설정
	String[] str = request.getParameterValues("Sex");
	String sex = str[0];
	registerData.setSex(sex); // 유저 권한 부여

	/* out.print(registerData.getAuthority()+"<br>"); // 유저 권한 + 입력받은 정보로 INSERT (Uid는 Insert에서 자동부여)
	out.print(registerData.getSex()+"<br>"); //
	out.print(registerData.getUid()+"<br>"); // 자동부여
	out.print(registerData.getUserAddress()+"<br>"); // 입력 x
	out.print(registerData.getUserEmail()+"<br>"); 
	out.print(registerData.getUserID()+"<br>");
	out.print(registerData.getUserName()+"<br>"); 
	out.print(registerData.getUserPassword()+"<br>");
	out.print(registerData.getUserTel());  */

	// DB에 등록
	boolean isDone = UserDAO.getInstance().insertDB(registerData);
	// DB 등록 실패시
	if (!isDone) {
		//오류 출력
		out.println("<script>");
		out.println("alert('계정을 등록할 수 없습니다.');");
		out.println("location.href = './../main/main.jsp';");
		;
		out.println("</script>");
	}
	// 등록 제대로 될 경우,
	else {
		// 가입한 아이디로 로그인해줌.
		out.println("<script>");
		out.println("alert('회원가입이 성공했습니다.');");
		out.println("location.href = './../main/main.jsp';");
		;
		out.println("</script>");
	}
}
%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>