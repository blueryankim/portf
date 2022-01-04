function writeCheck() {
	if(document.updateForm.pass.value == "") {
		alert("현재 사용중인 비밀번호를 입력해주세요.");
		document.updateForm.pass.focus();
		return;
	}
	
	if(document.updateForm.phone1.value == "") {
		alert("전화번호를 입력해주세요.");
		document.updateForm.phone1.focus();
		return;
	}
	
	if(document.updateForm.phone2.value == "") {
		alert("전화번호를 입력해주세요.");
		document.updateForm.phone2.focus();
		return;
	}
	
	if(document.updateForm.phone3.value == "") {
		alert("전화번호를 입력해주세요.");
		document.updateForm.phone3.focus();
		return;
	}
	
	if(document.updateForm.email.value == "") {
		alert("이메일주소를 입력해주세요.");
		document.updateForm.email.focus();
		return;
	}
	
	var fsinger = "";
	if(document.updateForm.f_singer1.value != "") {
		fsinger += document.updateForm.f_singer1.value + ",";
	}
	if(document.updateForm.f_singer2.value != "") {
		fsinger += document.updateForm.f_singer2.value + ",";
	}
	if(document.updateForm.f_singer3.value != "") {
		fsinger += document.updateForm.f_singer3.value + ",";
	}
	if(document.updateForm.f_singer4.value != "") {
		fsinger += document.updateForm.f_singer4.value + ",";
	}
	if(document.updateForm.f_singer5.value != "") {
		fsinger += document.updateForm.f_singer5.value;
	}
	document.updateForm.f_singer.value = fsinger;
	
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
	document.updateForm.f_genre.value = fgenre;
	
	alert("성공적으로 정보가 수정되었습니다.");
	document.updateForm.submit();
}

function passCheck(value){
	if(value=="pass" || value.equals("pass")){
		alert("현재 비밀번호가 일치하지 않습니다.");
	}
}
window.onload = passCheck("${value}");