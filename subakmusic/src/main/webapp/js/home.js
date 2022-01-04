function idCheck(){
	if(document.loginForm.id.value == ""){
		alert("ID를 입력해 주세요.");
		document.loginForm.id.focus();
		return;
	}
	if(document.loginForm.pass.value == ""){
		alert("비밀번호를 입력해 주세요.");
		document.loginForm.pass.focus();
		return;
	}
	document.loginForm.submit();
}