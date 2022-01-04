<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session ="true" %>	   	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="utf-8" />
<title>Circle에 오신 것을 환영합니다.</title>
<style>

@font-face {
    font-family: 'NanumGothic';
    src: url(NanumFont_TTF_ALL/NanumGothic.ttf) format('truetype');
}


* {
	margin: 0;
	padding: 0;
}

body {
	background-image: url('image/people.jpg');
	background-size: 100%;
	font-family:NanumGothic;
}

input[type=button] {
	background: #4086cd;
	color: white;
}

input[type=submit] {
	background: #4086cd;
	color: white;
}

#logindiv {
	position: absolute;
	right: 20px;
	top: 30px;
}

#header {
	width:1270px;
	height: 80px;
	background: #4086cd;
	position: relative;
}

#header span {
	color: white;
}

h1 {
	color: white;
	font-size: 50px;
	position: absolute;
	left: 10px;
	top: 10px;
}

#footer {
	position: relative;
	width:1270px;
	height: 40px;
	background: white;
	text-align: center;
}

#section {
	position: relative;
	width:1270px;
	height: 620px;
}

#join {
	width: 400px;
	height: 580px;
	background-color: white;
	opacity: 0.9;
	position: absolute;
	right: 20px;
	top: 25px;
	border-radius: 20px;
}

#joinform p {
	font-size: 25px;
	height: 50px;
	text-align: start;
}

#join h2 {
	font-size: 30px;
	position: absolute;
	top: 20px;
	left: 10px;
}

#joinform [type=text] {
	height: 45px;
	width: 300px;
	position: absolute;
	left: 10px;
}

#joinform [type=password] {
	height: 45px;
	width: 300px;
	position: absolute;
	left: 10px;
}

#joinform [type=button] {
	background: #808080;
	height: 45px;
	position: absolute;
	right: 25px;
}

#joinform select:nth-child(1) {
	height: 45px;
	width: 100px;
	position: absolute;
	left: 10px;
}

#joinform select:nth-child(2) {
	height: 45px;
	width: 100px;
	position: absolute;
	left: 120px;
}

#joinform select:nth-child(3) {
	height: 45px;
	width: 100px;
	position: absolute;
	left: 230px;
}

#joinclick {
	background: #808080;
	height: 60px;
	width: 150px;
	position: absolute;
	left: 8px;
	bottom: 70px;
}

.placeholder{
	color:grey;
}

</style>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://rawgithub.com/mathiasbynens/jquery-placeholder/master/jquery.placeholder.js"></script>

<script type="text/javascript">
	var idcheckflag = 0;

	$(document).ready(function() {
	history.go(1); 
	$("input").placeholder();	
	});

	function idCheck(){
		
		if($("#id").val()==null || $("#id").val()==""){
		var $errmess = $("#errmessage");
		$errmess.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>아이디를 입력 해주세요.</p>");
		$("#id").focus();
		return false;	
		}
		
		if ($("#id").val().replace(/^[a-z,0-9]*$/, "") != "") {
	    var $errmess = $("#errmessage");
	    $errmess.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#f9bbcd; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>아이디는 영문과 숫자로만 작성해주세요.</p>");
	    $("#id").focus();
	    return false;
	    }
		
		
		var param={id:$("#id").val()};

	
		$.post("/circle/checkid/checkid.do",param,idCheckResult,"xml");
		
	}
	
	function idCheckResult(xmlInfo){
		var checkIdFlag= $(xmlInfo).find("checkIdflag").text();
		
		if(checkIdFlag==0){
		var $errmess = $("#errmessage");
		$errmess.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#f9bbcd; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>사용 가능한 아이디 입니다.</p>");
		$("#id").attr("disabled",true);
		$("#password").focus();
		idcheckflag=1;
		return;		
		}
		
		else{
		var $errmess = $("#errmessage");
		$errmess.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#f9bbcd; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>이미 사용중인 아이디 입니다.</p>");
		$("#id").val("");
		$("#id").focus();
		return;	
		}
	}
	
	function checkValidation() {

		if (idcheckflag == 0) {
			var $errmess = $("#errmessage");
			$errmess.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#f9bbcd; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>아이디 중복확인을 해주세요.</p>");
			$("#id").focus();
			return false;
		}

		if ($("#password").val() == null || $("#password").val() == "") {
			var $errmess = $("#errmessage");
			$errmess
					.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#f9bbcd; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>비밀번호를 입력해주세요.</p>");
			$("#password").focus();
			return false;
		}

		if ($("#password").val().length < 6 || $("#password").val().length > 10) {
			var $errmess = $("#errmessage");
			$errmess.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#f9bbcd; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>비밀번호는 6~10자리로 입력해주세요.</p>");
			$("#password").focus();
			return false;
		}

		if ($("#repassword").val() == null || $("#repassword").val() == "") {
			var $errmess = $("#errmessage");
			$errmess.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#f9bbcd; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>비밀번호 확인을 입력해주세요.</p>");
			$("#repassword").focus();
			return false;
		}

		if ($("#password").val() != $("#repassword").val()) {
			var $errmess = $("#errmessage");
			$errmess.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#f9bbcd; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>비밀번호가 같지 않습니다.</p>");
			$("#password").focus();
			return false;
		}

		if ($("#name").val() == null || $("#name").val() == "") {
			var $errmess = $("#errmessage");
			$errmess.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#f9bbcd; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>이름을 입력해주세요.</p>");
			$("#name").focus();
			return false;
		}

		if ($("#name").val().replace(/^[가-힣 ]*$/, "") != "") {
			var $errmess = $("#errmessage");
			$errmess.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#f9bbcd; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>이름은 한글만 입력해주세요.</p>");
			$("#name").focus();
			return false;
		}

		if ($("#university").val() == null || $("#university").val() == "") {
			var $errmess = $("#errmessage");
			$errmess.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#f9bbcd; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>대학교를 입력해주세요.</p>");
			$("#searchuni").focus();
			return false;
		}

		if ($("#birth1").val() == "년도") {
			var $errmess = $("#errmessage");
			$errmess.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#f9bbcd; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>년도를 입력해주세요.</p>");
			$("#birth1").focus();
			return false;

		}

		if ($("#birth2").val() == "월") {
			var $errmess = $("#errmessage");
			$errmess.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#f9bbcd; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>월을 입력해주세요.</p>");
			$("#birth2").focus();
			return false;

		}

		if ($("#birth3").val() == "일") {
			var $errmess = $("#errmessage");
			$errmess.html("<p style='border:1px solid #ff0000; width:320px; height:40px; background-color:#f9bbcd; text-align:center; position:absolute; bottom:20px; left:5px; font-size:15px; color:black; line-height:40px'>날을 입력해주세요.</p>");
			$("#birth3").focus();
			return false;

		}
		
		
		var param={id:$("#id").val(),pass:$("#password").val(),name:$("#name").val(),
				university:$("#university").val(),birth1:$("#birth1").val(),birth2:$("#birth2").val(),
				birth3:$("#birth3").val()};
		
	$.post("/circle/member/insertmember.do",param,joinResult,"xml");
	
	}
	

	function joinResult(xmlInfo){
		
			alert("성공적으로 가입이 되었습니다.");
			location.reload(true);
	}
	
	function searchUniversity(){
		window.open('/circle/member/checkuniversity.jsp','학교검색', 'width=340, height=300, scrollbars=yes, menubar=no, location=no, resizable=no' );
		
	}
	
	function loginValidation(){
		
		if($("#loginid").val()=="" || $("#loginid").val()== null){
			
			alert("아이디를 입력해주세요.");
			$("#loginid").focus();
			return false;
		}
		
		if($("#loginid").val().replace(/^[a-z,0-9 ]*$/, "") != ""){
			alert("아이디는 영문과 숫자만 넣어주세요");
			$("#loginid").val("");
			$("#loginid").focus();
			return false;
		}
		
		if($("#loginpass").val()=="" || $("#loginpass").val()==null){
			alert("비밀번호를 입력해주세요.");
			$("#loginpass").val("");
			$("#loginpass").focus();
			return false;
		}
		
		var param={loginid:$("#loginid").val(),loginpass:$("#loginpass").val()};
		$.post("/circle/member/idconfirmandlogin.do",param,idConfirmResult,"xml");
	
		
	}
	
		function idConfirmResult(xmlInfo){
			
			var idconfirmmessage= $(xmlInfo).find("idconfirmmessage").text();
			var idconfirmflag=$(xmlInfo).find("idconfirmflag").text();
			if(idconfirmflag=="0"||idconfirmflag=="1"){
			alert(idconfirmmessage);
			$("#loginid").val("");
			$("#loginpass").val("");
			$("#loginid").focus();
			return false;
			}
			
			else{
				$("#loginform").submit();
			}
			
		}
		
	function inputUniversity(uni){
		
		$("#university").val(uni);
		$("#university").attr("disabled",true);
	}	
</script>

</head>
<body>
	<div id="header">
		<h1>Circle</h1>
		<div id="logindiv">
			<form id="loginform" method="post" action="/circle/homepage/gethomecontent.do">
				<span>아이디:</span> <input type="text" id="loginid" name="loginid2" size="13" /> <span>비밀번호:</span>
				<input type="password" id="loginpass" size="13" /> <input type="button" value="로그인" onclick="loginValidation()"/> <input type="button" value="아이디/비밀번호 찾기"/>
			</form>
		</div>
	</div>

	<div id="section">

		<div id="join">
			<br />
			<h2>가입하기</h2>
			<br />
			<br />
			<br />
			<form id="joinform" method="post">
				<p>
					<input type="text" id="id" placeholder="아이디" size="20" /><input
						type="button" value="중복확인" onclick="idCheck()" />
				</p>
				<p>
					<input type="password" id="password" placeholder="비밀번호" size="20" />
				</p>
				<p>
					<input type="password" id="repassword" placeholder="비밀번호 확인"
						size="20" />
				</p>
				<p>
					<input type="text" id="name" placeholder="이름" size="20" />
				</p>
				<p>
					<input type="text" id="university"  placeholder="대학교" size="20" /><input
						type="button" value="학교검색" id="searchuni"  onclick="searchUniversity()" />
				</p>
				<br />
				<h3>&nbsp;생년월일</h3>
				<br />
				<p>
					<select id="birth1">
					<option value="년">년</option>
					<c:forEach var="year" begin="0" end="70" step="1">
						<option value="${ 2000-year }">${ 2000-year }</option>
						</c:forEach>
						</select>
					<select id="birth2">
					<option value="월">월</option>
					<c:forEach var="month" begin="1" end="12">	
						<option value="${month}">${month }</option>
						</c:forEach>
					</select> 
						<select id="birth3">
						<option value="일">일</option>
					<c:forEach var="day" begin="1" end="31">
						
						<option value="${day }">${ day}</option>
						</c:forEach>
						</select>
				</p>
				<p>
					<input type="button" id="joinclick" value="가입하기" onclick="checkValidation()"  />
				</p>
				<p id="errmessage"></p>
			</form>
		</div>
	</div>

	<div id="footer">
		<span>Circle by kim</span>
	</div>



</body>
</html>