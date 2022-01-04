<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
<style>

	
	
	.ui-page{
	background-image:url('image/unnamed.jpg');
	background-size:100% 100%;
	background-repeat:no-repeat;
		}
	
	
	a { text-decoration:none }

	
	.ui-header { background:none;
				 
				
	}
				
	.ui-footer { background:none;
		}		
				 
			
	#title{
	
	font-size:60px;
	font-family: 'Pacifico', cursive;	
	color:white;
	text-align:center;
	}		
	
	#header1{
			height:100px;
			text-align:center;
			border:0px;
			
			}
		
	
	
	#footer1{
			border:0px;
			color:white;
			}		
			
	#bottongroup{
			text-align:center;}		
			
	#errpopup{text-align:center;
			}		
	
	div.ui-input-text{
			background:white;}
	/*
	div.ui-input-button{
			width:2}		*/
			
	#maintitle{
	
			font-size:60px;
			text-align:center;
			font-weight:bold;
	}
	

		
</style>
<script type="text/javascript">
	$('input, textarea').placeholder();
 	
	

	
	//로그인 유효성 검사
	function loginValidation(){
		
		if($("#loginid").val()=="" || $("#loginid").val()== null){
		
			var $errmess=$("#errpopup");
			$errmess.html("<p>아이디를 입력해주세요.</p><input type='button' data-inline='true' data-mini='true' data-theme='b' onclick='idFocus()' value='확인'>").trigger('create');

			$("#errpopup").popup("open");
			
			
			//alert("아이디를 입력해주세요.");
			$("#loginid").focus();
			$("#loginid").val("");
			
			return false;
		}
		
		if($("#loginid").val().replace(/^[a-z,0-9 ]*$/, "") != ""){
			
			var $errmess=$("#errpopup");
			$errmess.html("<p>아이디는 영문과 숫자만 넣어주세요.</p><input type='button' data-inline='true' data-mini='true'  data-theme='b' onclick='idFocus()' value='확인'>").trigger('create');
			
			$("#errpopup").popup("open");
			//alert("아이디는 영문과 숫자만 넣어주세요");
			
			
			return false;
		}
		
		//$(document).on('click','#idonlycnn',function(){$("#loginid").focus()});
		/*
		$( ".selector" ).bind({
  		 popupafterclose: function(event, ui) { alert("hello"); }
			});*/
		/*	
		$("#errpopup").on("popupafterclose",function(event,ui){
			alert("hello");
		});	*/
		
		if($("#loginpass").val()=="" || $("#loginpass").val()==null){
			
			var $errmess=$("#errpopup");
			$errmess.html("<p>비밀번호를 입력해주세요.</p><input type='button'  data-inline='true' data-mini='true'  data-theme='b' onclick='passFocus()' value='확인'>").trigger('create');
			$("#errpopup").popup("open");
			//alert("비밀번호를 입력해주세요.");
			$("#loginpass").val("");
			$("#loginpass").focus();
			return false;
		}
		
		var param={loginid:$("#loginid").val(),loginpass:$("#loginpass").val()};
		$.post("/Finder/login/idconfirmandlogin.do",param,idConfirmResult,"xml");
		
		//var param={loginid:$("#loginid").val(),loginpass:$("#loginpass").val()};
		//$.post("/circle/member/idconfirmandlogin.do",param,idConfirmResult,"xml");
	
		
	}
	
	function idConfirmResult(xmlInfo){
		
		var idconfirmmessage= $(xmlInfo).find("idconfirmmessage").text();
		var idconfirmflag=$(xmlInfo).find("idconfirmflag").text();
		if(idconfirmflag=="0"||idconfirmflag=="1"){
		var $errmess=$("#errpopup");
		$errmess.html("<p>"+idconfirmmessage+"</p><input type='button' data-inline='true' data-mini='true'  data-theme='b' onclick='idnpassFocus()' value='확인'>").trigger('create');
		$("#errpopup").popup("open");
			//alert("비밀번호를 입력해주세요.");
		
		
		return false;
		}
		
		else{
			$("#loginform").submit();
		}
		
	}
	function idnpassFocus(){
		$("#errpopup").popup("close");
		$("#loginid").val("");
		$("#loginpass").val("");
		$("#errpopup").on("popupafterclose",function(event,ui){
			$("#loginid").focus();
		});
		
	}
	//팝업 닫은 후 아이디 입력 input에 초점 이동
	function idFocus(){
		$("#errpopup").popup("close");
		$("#loginid").val("");
		$("#errpopup").on("popupafterclose",function(event,ui){
			$("#loginid").focus();
		});
		
	}
	
	function passFocus(){
		$("#errpopup").popup("close");
		$("#errpopup").on("popupafterclose",function(event,ui){
			$("#loginpass").focus();
		});
	}
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Finder 로그인</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="../js/jquery.mobile-1.4.5.min.css"/>
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript" src="../js/jquery.placeholder.js"></script>
</head>
<body>

<div data-role="page" data-theme="c">
<h1 id="title" >Finder</h1>
<!-- <div data-role="controlgroup" data-type="horizontal" class="ui-btn-right"> -->


<br/><br/><br/><br/>

<div data-role="content" data-theme="c">

<form id="loginform" method="post" action="/Finder/home/homepage.do" data-ajax="false">

<div>

<div>
<label for="loginid"></label>
<input type="text" name="loginid" id="loginid" data-rel="" data-position-to="origin"  placeholder="아이디를 입력하세요" />
</div>

<div data-role="popup" id="errpopup" data-dismissible="false" data-theme="b"  class="ui-content">
	
</div>


<label for="loginpass"></label>
<input type="password" name="loginpass" id="loginpass" size="10" placeholder="비밀번호를 입력하세요" />
</div>
<br/>
<div id="bottongroup"  data-role="controlgroup" data-mini="true" data-type="horizontal">
<a href="#" data-role="button" data-mini="true" data-theme="b" data-inline="true" id="loingbutton" onclick="loginValidation()" >로그인</a>
<a href="../join/joinpage.jsp" data-role="button" type="button" data-mini="true"  data-theme="b" data-inline="true" id="join" data-ajax="false">회원가입</a>
<a href="#dialog1"  data-rel="dialog" data-role="button" data-mini="true"  data-theme="b" data-inline="true" id="idandpasswdfinding">아이디/비밀번호찾기 </a>
</div>

</form>
</div>

<div id="footer1" data-role="footer" data-position="fixed">
<h4>Copyright Finder &copy; 2015</h4></div>
</div>

<div data-role="page" id="dialog1" data-theme="a">
<div data-role="header" data-theme="b">
<h1>아이디/비밀번호 찾기</h1>
</div>
<div data-role="content">
<div role="main" class="ui-content">
<div id="tabs" data-role="tabs">
<div data-role="navbar" data-position="fixed">
<ul>
<li><a href="#tab1"  class="ui-btn-active">아이디 찾기</a></li>
<li><a href="#tab2">비밀번호 찾기</a></li>
</ul>
</div>

<div id="tab1" class="tab-content">
<label for="inputemail"></label>
<input type="text" id="inputemail" value="" placeholder="메일주소 입력"/>
<label for="inputpasswd"></label>
<input type="password" id="inputpasswd" value=""  placeholder="비밀번호 입력">
<div id="bottongroup" data-role="controlgroup" data-mini="true" data-type="horizontal">
<a href="#" data-role="button" data-theme="b" data-icon="check" data-inline="true">전송</a>
</div>
</div>

<div id="tab2" class="tab-content">
<label for="inputid"></label>
<input type="text" id="inputid" value="" placeholder="아이디입력"/>
<label for="inputpasswd"></label>
<input type="text" id="inputemail" value=""  placeholder="메일주소 입력">
<div id="bottongroup" data-role="controlgroup" data-mini="true" data-type="horizontal">
<a href="#" data-role="button" data-theme="b" data-icon="check" data-inline="true">전송</a>
</div>
</div>
</div>
</div>
</div>
</div>


</body>
</html>