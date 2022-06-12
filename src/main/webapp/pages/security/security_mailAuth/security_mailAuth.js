
//alert를 띄우고 페이지를 이동하는 함수
function alertAndRedirect(str, href) {
	alert(str);
	location.href = href;
}

var limit = 10;

function checkInput() {
	const input = document.getElementsByClassName('inputbox').value;
	if (!isNull(input)) {
		return false;
	}
	else {
		isCorrect(input);
		return false;
	}
	//폼 이동방지
return true;
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
	
	const answer = document.getElementsByClassName('hashcode').value;
	const resultbody = document.getElementsByClassName('resultBody').value;
	//정답을 맞힐 경우
	if (answer == input) {
		alertAndRedirect("resultbody", "./../../main/main.jsp");
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