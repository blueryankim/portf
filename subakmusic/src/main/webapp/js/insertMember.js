function inputCheck(){
	if(document.registForm.id.value==""){
		alert("아이디를 입력해 주세요.");
		document.registForm.id.focus();
		return;
	}
	
	if(document.registForm.name.value==""){
		alert("이름을 입력해 주세요.");
		document.registForm.name.focus();
		return;
	}
	
	if(document.registForm.pass.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.registForm.pass.focus();
		return;
	}
	
	if(document.registForm.repass.value==""){
		alert("비밀번호를 확인해 주세요.");
		document.registForm.repass.focus();
		return;
	}
	
	if(document.registForm.phone1.value=="번호 선택"){
		alert("통신사를 확인해 주세요.");
		document.registForm.phone1.focus();
		return;
	}
	
	if(document.registForm.phone2.value==""){
		alert("전화번호를 확인해 주세요.");
		document.registForm.phone2.focus();
		return;
	}
	
	if(document.registForm.phone3.value==""){
		alert("전화번호를 확인해 주세요.");
		document.registForm.phone3.focus(); 
		return;
	}
	
	if(document.registForm.email.value==""){
		alert("이메일을 확인해 주세요.");
		document.registForm.email.focus();
		return;
	}
	
	var str = document.registForm.email.value;
	var atPos = str.indexOf('@');
	var atLastPos = str.lastIndexOf('@');
	var dotPos = str.indexOf('.');
	var spacePos = str.indexOf(' ');
	var commaPos = str.indexOf(',');
	var eMailSize = str.length;
	if (atPos> 1 && atPos == atLastPos && dotPos>3 &&spacePos==-1 && commaPos==-1 && atPos+1 <dotPos&&dotPos+1<eMailSize);
	else {
		alert("E-mail주소 형식이 잘못 되었습니다 \n\r다시 확인해 주세요.");
		document.registForm.email.focus();
		return;
	}
	
	if(document.registForm.birth1.value=="선택"){
		alert("생년을 확인해 주세요.");
		document.registForm.birth1.focus();
		return;
	}
	
	if(document.registForm.birth2.value=="월"){
		alert("월을 확인해주세요.");
		document.registForm.birth2.focus();
		return;
	}
	
	if(document.registForm.birth3.value=="일"){
		alert("생년월일을 확인해주세요.");
		document.registForm.birth3.focus();
		return;
	}
	
	// 좋아하는 가수 입력 (회원가입 버튼 클릭시 콤마자동입력)
	var fsinger = "";
	if(document.registForm.f_singer1.value != "") {
		fsinger += document.registForm.f_singer1.value + ",";
	}
	if(document.registForm.f_singer2.value != "") {
		fsinger += document.registForm.f_singer2.value + ",";
	}
	if(document.registForm.f_singer3.value != "") {
		fsinger += document.registForm.f_singer3.value + ",";
	}
	if(document.registForm.f_singer4.value != "") {
		fsinger += document.registForm.f_singer4.value + ",";
	}
	if(document.registForm.f_singer5.value != "") {
		fsinger += document.registForm.f_singer5.value;
	}
	document.registForm.f_singer.value = fsinger;
	
	// 좋아하는 장르 입력 (회원가입 버튼 클릭시 콤마자동입력)
	var fgenre = "";
	genrec = document.getElementsByName("fgenre_c");
	for(var i=0; i<genrec.length; i++) {
		if(genrec[i].checked == true) {
			fgenre += genrec[i].value;
			if(i != (genrec.length-1)) {
				fgenre += ",";
			}
		}
	}
	document.registForm.f_genre.value = fgenre;
	
	// 상단의 스크립트가 모두 정상적으로 실행될 때 submit 되도록..
	alert("수박뮤직에 가입하신 것을 진심으로 환영합니다.");
	document.registForm.submit();
}

function idCheck(){
	url="idCheck.do";
	window.open(url,"post","width=300,height=170");
}