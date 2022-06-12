<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.UserDAO"%>
<%@page import="mail.MailSender"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<!-- 스크립트 추가 <script src="./security_mailAuth.js"></script> -->




<%
String hashcode = ""; 
String resultbody = "";
//POST 요청 이외의 접근 금지
if (!request.getMethod().equals("POST")) {
	//메인 페이지로 이동
	out.println("<script>");
	out.println("alert('잘못된 접근입니다.');");
	out.println("location.href = './../../main/main.jsp';");
	out.println("</script>");
}
//정상적인 POST 접근
else {

	// id와 Email

	String userId = request.getParameter("userId");
	String userEmail = request.getParameter("userEmail");
	hashcode = ""; // 인증 메일 정답= 해시코드
	resultbody = "test";
	int resultUid = 0; // 비밀번호로 uid 검색한 결과
	String resultId; // ID찾기 검색결과
	
	//이메일보내기		
	hashcode = MailSender.getInstance().sendMail(userEmail);

	
	// 이메일 보내기 실패
	if (hashcode.equals("error")) {
		out.println("<script>");
		out.println("alert('[이메일보내기 실패] 이메일을 보낼수없는 이메일 주소입니다. 또는 연타하면 안됩니다!!');");
		out.println("location.href = './../security_form.html';");
		out.println("</script>");
		System.out.println("[security] 이메일 보내기 오류");
	}

	// id 찾기
	if (userId == null) {

		//디비에 검색
		resultId = UserDAO.getInstance().findId(userEmail);
		// 아이디 찾기실패
		if (resultId.equals("error")) {
	out.println("<script>");
	out.println("alert('아이디가 존재하지않음.');");
	out.println("location.href = './../security_form.html';");
	out.println("</script>");
	System.out.println("[아이디찾기] DB검색 결과 : 이메일에 데이터가 존재하지않음.");
		}
		// 아이디 찾기 성공
		else {
	
			 StringBuffer buff = new StringBuffer();
			 buff.append("아이디 찾기 성공! ");
			 buff.append("아이디는 [ ");
			 buff.append(resultId);
			 buff.append(" ] 입니다.");
			
			 resultbody = buff.toString();
		}

	}
	// pw 찾기
	else {
		//디비에 검색 
		resultUid = UserDAO.getInstance().findUid(userEmail, userId);
		//DB존재x
		if (resultUid == -1) {
		out.print("<script>");

		out.println("alert('해당 이메일에 존재하는 아이디 또는 이메일이 없습니다. 이메일 또는 아이디를 다시 확인하세요');");
		out.println("location.href = './../security_form.html';");
		out.println("</script>");
		System.out.println("[비밀번호찾기] DB검색 결과 : 아이디와 이메일에 맞는 데이터 존재하지않음.");
		} else {
			//비밀번호찾기성공
			UserDAO.getInstance().updatePW(resultUid, hashcode);
	
	resultbody = "비밀번호 찾기 성공!  임시비밀번호는 [ " + hashcode + " ] 입니다.  로그인후 비밀번호를 변경해주세요.";
		
		
		}

	}

}
%>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>메일 인증 페이지</title>
<!-- 이메일과 인증코드를 맞추는 곳 -->


<!--css파일 -->
<link href="./../security_style.css" rel="stylesheet">
<!--노토산 글씨체-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<!--노토산 글씨체-->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!--노토산 글씨체-->
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&amp;display=swap"
	rel="stylesheet">


<script>
//alert를 띄우고 페이지를 이동하는 함수
function alertAndRedirect(str, href) {
	alert(str);
	location.href = href;
}

var limit = 10;

function checkInput() {
	const input = document.getElementById('inputbox').value;
	if (!isNull(input)) {

	}
	else {
		isCorrect(input);

	}
	//폼 이동방지

}

//입력값 NULL인지 확인
function isNull(input) {
	if (input == "") {
		alert('난수를 입력해주세요.');
		return false;
	}

	return true;
}
function isCorrect(input) {
	var answer = "<%=hashcode%>";
	console.log(answer);
	var resultbody = "<%=resultbody%>";
	//정답을 맞힐 경우
	if (answer == input) {
		alertAndRedirect(resultbody, "./../../main/main.jsp");
		} else {
		//틀릴 경우
		penalty(); //허용횟수 줄이기
		return false;
	}
}
//해시값이 입력값과 틀릴때, 호출하는 함수
function penalty() {
	var x = document.getElementsByClassName("security_limit")[0];
	x.innerText = "남은 시도 횟수 :" + (--limit);

	//10번 시도 실패
	if (limit == 0) {
		alertAndRedirect("오답 허용 횟수를 초과하였습니다. 페이지를 이동합니다.",
			"./../security_form.html");
	}
}
</script>
</head>
<body>




	<div id="security_div">
		<!-- 인증 이메일 -->
		<span class="security_txt"> 이메일 인증 </span>
		<hr>

		<!-- form action="" method="post" name="form" accept-charset="UTF-8"
			onclick="return checkInput(form.input_hash.value)"></form> -->
		<div class="margin8px">
			<p class="security_h2">이메일로 보내드린 암호를 확인해주세요.</p>

			<p class="security_info">코드입력하기</p>
			<input type="text" name="input_hash" class="inputbox" id="inputbox"
				placeholder="난수입력" maxlength="20" value=""> <br>
			<p class="security_limit"></p>

		</div>
		<div class="margin8px">
			<button id="security_button" onclick="checkInput();">확인하기</button>

		</div>
</body>
</html>
