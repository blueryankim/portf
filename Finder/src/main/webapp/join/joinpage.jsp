<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>

<style>

	a { text-decoration:none }
	
	#idval{
		display:inline;
		font-size:12px;
		color:red;
	}
	
	#passval{
		display:inline;
		font-size:12px;
		color:red;
	}
	
	#nameval{
		display:inline;
		font-size:12px;
		color:red;
	}
	
	#emailval{
		display:inline;
		font-size:12px;
		color:red;
	}
	
	#profileimgval{
		display:inline;
		font-size:12px;
		color:red;
	}
	
	#header1 { background:#4086cd;
				overflow:hidden;
				}
	
	.ui-footer { background:silver;}
	
	#title{ font-size:40px;
			color:white;
			display:inline;
			font-family: 'Pacifico', cursive;
			}
	
	#header1{
			height:50px;
			text-align:center;
			border:0px;}
		
	#footer1{
			
			background:black;
			color:white;
			border:0px;}		
			
	#bottongroup{
			text-align:center;}		
			
	h2{
		display:inline;}	
	
	/*div.ui-input-text{
			display:inline-block;
			height:20px; width:250px;
			}

	div.ui-input-button{
		display:inline;
			}		
			*/
			
	#notice{
		font-size:12px;
		color:red;
	}		
	
	
	#page * {
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    -o-user-select: none;
    user-select: none;
}
/* Arrow only buttons in the header. */
	#page .ui-header .ui-btn {
    background: none;
    border: none;
    top: 9px;
}

	.ui-navbar{
 	 color:white;
     border: none;
    
}

	#page .ui-header .ui-btn-inner {
    border: none;
}

	#errpopup{text-align:center;
			}		

	#content1[data-role=content]{
	height: 100%;
    width: 100%;
    margin: 0px;	
    padding: 0px;
}
	
	.visual { width:100%;  margin:0 auto; 
		position:relative; float:left; }
	.visual img { max-width:1024; max-height:150px;  width:100%; height:100%; }
	.visual .text{position:absolute; 
			bottom:20px; left:10px; max-width:1024px;
			font-size:16px;
		
	}	
			
		
</style>

<script type="text/javascript">

	var idcheckflag = 0;
	
	function joinValidation(){
		
		if (idcheckflag == 0) {
			var $errmess = $("#idval");
			$errmess.html("<p>아이디 중복확인을 해주세요.</p>");
			$("#memberid").focus();
			return false;
		}
		
		if($("#memberid").val()=="" || $("#memberid").val()==null){
			
			var $errmess=$("#idval");
			$errmess.html("<p>아이디를 입력해주세요.</p>");
			$("#memberid").focus();
			return false;
			
		}
		
		if(!($("#memberid").val()=="") || !($("#memberid").val()==null)){
			
			var $errmess=$("#idval");
			$errmess.html("");
			//$("#id").focus();
			
		}
		
		if($("#pass").val()=="" || $("#pass").val()==null || $("#repass").val=="" || $("#repassword").val==null){
			
			var $errmess=$("#passval");
			$errmess.html("<p>비밀번호를 입력해주세요.</p>");
			$("#pass").focus();
			return false;
		}
		
		if ($("#pass").val().length<6){
			var $errmess = $("#passval");
			$errmess.html("<p>비밀번호가 6자 이상이 되지 않습니다.</p>");
			$("#pass").val("");
			$("#repassword").val("");
			$("#pass").focus();
			return false;
		}
		
		if ($("#pass").val() != $("#repassword").val()) {
			var $errmess = $("#passval");
			$errmess.html("<p>비밀번호가 같지 않습니다.</p>");
			$("#pass").val("");
			$("#repassword").val("");
			$("#pass").focus();
			
			return false;
		}
		
	
		
		if(!($("#pass").val()=="") || !($("#pass").val()==null) || !($("#repassword").val=="") || !($("#repassword").val==null)){
			
			var $errmess=$("#passval");
			$errmess.html("");
		
		}
		
		if (!($("#pass").val() != $("#repassword").val())) {
			var $errmess = $("#passval");
			$errmess.html("");
			
		}
		
		
		if($("#name").val()=="" || $("#name").val()==null){
			var $errmess = $("#nameval");
			$errmess.html("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		
		var kor_check= /^[가-힣]+$/;
		
		if(!(kor_check.test($("#name").val()))){
			var $errmess = $("#nameval");
			$errmess.html("이름을 확인해주세요.");
			$("#name").val("");
			$("#name").focus();
			return false;
		}
		
		if($("#name").val().length<2 || $("#name").val().length>6){
			var $errmess = $("#nameval");
			$errmess.html("이름은 2자 이상 6자 이하로 입력해주세요.");
			$("#name").val("");
			$("#name").focus();
			return false;
		}
		
		if(!($("#name").val()=="") || !($("#name").val()==null)){
			var $errmess = $("#nameval");
			$errmess.html("");
		}
		
		if(kor_check.test($("#name").val())){
			var $errmess=$("#nameval");
			$errmess.html("");
		}
		
		if($("#email").val()=="" || $("#email").val()==null){
			var $errmess = $("#emailval");
			$errmess.html("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
		
	    var email_check = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    if(!email_check.test($("#email").val())){
			var $errmess = $("#emailval");
			$errmess.html("이메일 정보가 정확하지 않습니다.");
			$("#email").val("");
			$("#email").focus();
			return false;
		}
		
	    if(!($("#email").val()=="") || !($("#email").val()==null)){
			var $errmess = $("#emailval");
			$errmess.html("");
			
		}
	    
		if($("#profileimg").val()==0 || $("#profileimg").val==null){
			var $errmess=$("#profileimgval");
			$errmess.html("이미지는 필수입니다.");
			$("#profileimg").focus();
			return false;
			
		}
	
		var checkimage=$("#profileimg").val().substring($("#profileimg").val().lastIndexOf(".")+1);
	
		if(checkimage !="jpg" && checkimage !="jpeg" && checkimage !="png" && checkimage !="bmp" && checkimage !="JPG" && checkimage !="JPEG" && checkimage !="PNG"){
	
			var $errmess=$("#profileimgval");
			$errmess.html("이미지 파일이 아닙니다.");
			$("#profileimg").focus();
			
				
			return false;
			}
		
		
		if(!$("#profileimg").val()==0 || !$("#profileimg").val==null){
			var $errmess=$("#profileimgval");
			$errmess.html("");
			
		}
		
		if(checkimage =="jpg" || checkimage =="jpeg" || checkimage =="png" || checkimage =="bmp" || checkimage =="JPG" || checkimage =="JPEG"){
			
			var $errmess=$("#profileimgval");
			$errmess.html("");
		
			}
		
		$("#joinform").submit();
	
		//alert("jell");
		//var param={id:$("#id").val(),pass:$("#pass").val(),name:$("#name").val(),
		//		email:$("#email").val(),profileimg:$("#profileimg").val()};
		
		//$.post("/Finder/member/addmember.do",param,joinResult,"xml");
	
	}
	

	
		
	   //이부분에 데이터 저장 내용 보내면 Ajax.
	function joinResult(xmlInfo){
		
			var $errmess=$("#errpopup");
			$errmess.html("<p>성공적으로 가입이 되었습니다!</p><input type='button' data-inline='true' data-mini='true'  data-theme='b' onclick='confirm()' value='확인'>").trigger('create');
		
			$("#errpopup").popup("open");
			
	
		
			//location.reload(true);
	}
	
	function confirm(){
		$("#errpopup").popup("close");
		history.go(-1); 
	} 
	
	$( document ).on( "pageinit", "#demo-page", function() {
	    $( document ).on( "swipeleft swiperight", "#demo-page", function( e ) {
	        // We check if there is no open panel on the page because otherwise
	        // a swipe to close the left panel would also open the right panel (and v.v.).
	        // We do this by checking the data that the framework stores on the page element (panel: open).
	        if ( $.mobile.activePage.jqmData( "panel" ) !== "open" ) {
	           if ( e.type === "swiperight" ) {
	                $( "#left-panel" ).panel( "open" );
	            }
	        }
	    });
	});
	
	
	function idCheck(){
		
		if($("#memberid").val()==null || $("#memberid").val()==""){
		var $errmess = $("#idval");
		$errmess.html("아이디를 입력 해주세요.");
		$("#memberid").focus();
		return false;	
		}
		
		if ($("#memberid").val().replace(/^[a-z,0-9]*$/, "") != "") {
	    var $errmess = $("#idval");
	    $errmess.html("아이디는 영문과 숫자로만 작성해주세요.");
	    $("#memberid").focus();
	    return false;
	    }
		
		
		var param={id:$("#memberid").val()};

	
		$.post("/Finder/member/checkid.do",param,idCheckResult,"xml");
		
	}
	
	function idCheckResult(xmlInfo){
		var checkIdFlag= $(xmlInfo).find("checkIdflag").text();
		
		if(checkIdFlag==0){
		var $errmess = $("#idval");
		$errmess.html("사용 가능한 아이디 입니다.");
		$("#id").attr("disabled",true);
		$("#pass").focus();
		idcheckflag=1;
		return;		
		}
		
		else{
		var $errmess = $("#idval");
		$errmess.html("이미 사용중인 아이디 입니다.");
		$("#id").val("");
		$("#id").focus();
		return;	
		}
	}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Finder 회원가입</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="../js/jquery.mobile-1.4.5.min.css"/>
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript" src="../js/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript" src="../js/jquery.placeholder.js"></script>
</head>
<body>
<div id="page" data-role="page" data-theme="a">
<div id="header1" data-role="header" data-position="fixed" data-theme="c" data-id="header">
<a class="ui-icon-nodisc" href="/Finder/login/loginpage.jsp" data-ajax="false" data-iconpos="notext" data-iconshadow="false" data-shadow="false" data-theme="d" data-icon="back"></a>
<h1 id="title">Finder</h1>
<!-- <div data-role="controlgroup" data-type="horizontal" class="ui-btn-right"> -->
</div>

<div id="content1" data-role="content" data-inset="false">
<div class="visual" data-inset="false"><img src="./image/IMG_1650.JPG"><div class="text">Finder는<br/>당신을 환영합니다!!</div></div>
</div>

<div data-role="content">
<form id="joinform" method="post" action="/Finder/member/addmember.do" data-ajax="false" enctype="multipart/form-data">
<ul data-role="listview" data-theme="a" data-inset="false">
<li><div id="listheader"><h2>회원가입</h2><p id="notice">내용을 정확히 기입해주세요.</p></div></li>
<li>
<div data-role="fieldcontain">
<label for="memberid">아이디:</label>
<input type="text" name="memberid" id="memberid" value="" data-inline="true"/>
<br/><a href="#" data-rel="dialog" data-role="button" data-mini="true" data-theme="b" data-inline="true" onclick="idCheck()">중복확인</a>
<div id="idval"></div>
</div>
</li>
<li>
<div data-role="fieldcontain">
<label for="pass">비밀번호:</label>
<input type="password" name="pass" id="pass" value=""/>
</div>
</li>
<li>
<div data-role="fieldcontain">
<label for="repass">비밀번호 확인:</label>
<input type="password" name="repassword" id="repassword" value=""/>
<div id="passval"></div>
</div>
</li>
<li>
<div data-role="fieldcontain">
<label for="name">이름:</label>
<input type="text" id="name" name="name" value=""/>
<div id="nameval"></div>
</div>
</li>
<li>
<div data-role="fieldcontain">
<label for="email">이메일:</label>
<input type="text" name="email" id="email" value=""/>
<div id="emailval"></div>
</div>
</li>

<li>
<div data-role="fieldcontain">
<label for="profileimg">프로필 이미지:</label>
<input data-theme="a" type="file" name="profileimg" id="profileimg" value=""/>
<div id="profileimgval"></div>
</div>
</li>
<li>
<div id="bottongroup" data-role="controlgroup" data-mini="true" data-type="horizontal">
    <a href="#" onclick="joinValidation()" data-role="button" data-icon="check" data-theme="b">확인</a>
    <a href="javascript:history.go(-1)" data-role="button" data-icon="home" data-theme="b">홈으로</a>
</div>
</li>
</ul>
</form>
</div>

<div data-role="popup" id="errpopup" data-dismissible="false" data-theme="b"  class="ui-content">
</div>

<div id="footer1" data-theme="a"  data-role="footer" data-position="fixed">
<h4>Copyright Finder &copy; 2015</h4>
</div>
</div>

</body>
</html>