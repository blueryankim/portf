function writeCheck() {
	if (document.writeForm.writer.value == "") {
		alert("작성자를 입력해 주세요");
		document.write.writer.focus();
		return;
	}
	if (document.writeForm.pass.value == "") {
		alert("비밀번호를 입력해 주세요");
		document.write.pass.focus();
		return;
	}
	/* if (document.writeForm.email.value == "") {
		alert("이메일을 입력해 주세요");
		document.write.email.focus();
		return;
	} */
	if (document.writeForm.subject.value == "") {
		alert("제목을 입력해 주세요");
		document.write.subject.focus();
		return;
	}
	if (document.writeForm.content.value == "") {
		alert("내용을 입력해 주세요");
		document.write.content.focus();
		return;
	}
	document.writeForm.submit();
}
function addFile(num) {
	var v = document.getElementById('list_dis');
	if (num == "b") {
		v.style.display = "";
	}
	if (num == "a") {
		v.style.display = "none";
	}
}