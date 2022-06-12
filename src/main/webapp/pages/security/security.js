// 폼의 유효성 검사하는 페이지

// 이메일 형식 확인
function checkEmail(form){
		var email = form.userEmail.value
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;



			if ((form.userEmail.value=="")) {
				form.userEmail.focus();
				alert("이메일을 작성해주세요");
				return false;
			}
			
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
			if(exptext.test(email)==false){
				form.userEmail.focus();
				alert("이메일형식이 올바르지 않습니다.");
			
				return false;
			}
			return true;
}

//id 형식 확인
function checkUserId(form) {//Id가 입력되었는지 확인하기
    //입력을 안했을 경우
    if (form.userId.value==""){
        form.userId.focus();
        alert("아이디를 입력해주세요.");
        return false;
    }
  
    return true; //확인이 완료되었을 때
}


//이메일과 Id체크
function checkEmailAndId(form){
    if(!checkUserId(form)){
        return false;
    }
    if(!checkEmail(form)){
        return false;
    }
   
    return true;
}
