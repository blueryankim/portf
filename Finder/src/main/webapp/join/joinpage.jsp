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
			$errmess.html("<p>????????? ??????????????? ????????????.</p>");
			$("#memberid").focus();
			return false;
		}
		
		if($("#memberid").val()=="" || $("#memberid").val()==null){
			
			var $errmess=$("#idval");
			$errmess.html("<p>???????????? ??????????????????.</p>");
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
			$errmess.html("<p>??????????????? ??????????????????.</p>");
			$("#pass").focus();
			return false;
		}
		
		if ($("#pass").val().length<6){
			var $errmess = $("#passval");
			$errmess.html("<p>??????????????? 6??? ????????? ?????? ????????????.</p>");
			$("#pass").val("");
			$("#repassword").val("");
			$("#pass").focus();
			return false;
		}
		
		if ($("#pass").val() != $("#repassword").val()) {
			var $errmess = $("#passval");
			$errmess.html("<p>??????????????? ?????? ????????????.</p>");
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
			$errmess.html("????????? ??????????????????.");
			$("#name").focus();
			return false;
		}
		
		var kor_check= /^[???-???]+$/;
		
		if(!(kor_check.test($("#name").val()))){
			var $errmess = $("#nameval");
			$errmess.html("????????? ??????????????????.");
			$("#name").val("");
			$("#name").focus();
			return false;
		}
		
		if($("#name").val().length<2 || $("#name").val().length>6){
			var $errmess = $("#nameval");
			$errmess.html("????????? 2??? ?????? 6??? ????????? ??????????????????.");
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
			$errmess.html("???????????? ??????????????????.");
			$("#email").focus();
			return false;
		}
		
	    var email_check = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    if(!email_check.test($("#email").val())){
			var $errmess = $("#emailval");
			$errmess.html("????????? ????????? ???????????? ????????????.");
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
			$errmess.html("???????????? ???????????????.");
			$("#profileimg").focus();
			return false;
			
		}
	
		var checkimage=$("#profileimg").val().substring($("#profileimg").val().lastIndexOf(".")+1);
	
		if(checkimage !="jpg" && checkimage !="jpeg" && checkimage !="png" && checkimage !="bmp" && checkimage !="JPG" && checkimage !="JPEG" && checkimage !="PNG"){
	
			var $errmess=$("#profileimgval");
			$errmess.html("????????? ????????? ????????????.");
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
	

	
		
	   //???????????? ????????? ?????? ?????? ????????? Ajax.
	function joinResult(xmlInfo){
		
			var $errmess=$("#errpopup");
			$errmess.html("<p>??????????????? ????????? ???????????????!</p><input type='button' data-inline='true' data-mini='true'  data-theme='b' onclick='confirm()' value='??????'>").trigger('create');
		
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
		$errmess.html("???????????? ?????? ????????????.");
		$("#memberid").focus();
		return false;	
		}
		
		if ($("#memberid").val().replace(/^[a-z,0-9]*$/, "") != "") {
	    var $errmess = $("#idval");
	    $errmess.html("???????????? ????????? ???????????? ??????????????????.");
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
		$errmess.html("?????? ????????? ????????? ?????????.");
		$("#id").attr("disabled",true);
		$("#pass").focus();
		idcheckflag=1;
		return;		
		}
		
		else{
		var $errmess = $("#idval");
		$errmess.html("?????? ???????????? ????????? ?????????.");
		$("#id").val("");
		$("#id").focus();
		return;	
		}
	}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Finder ????????????</title>
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
<div class="visual" data-inset="false"><img src="./image/IMG_1650.JPG"><div class="text">Finder???<br/>????????? ???????????????!!</div></div>
</div>

<div data-role="content">
<form id="joinform" method="post" action="/Finder/member/addmember.do" data-ajax="false" enctype="multipart/form-data">
<ul data-role="listview" data-theme="a" data-inset="false">
<li><div id="listheader"><h2>????????????</h2><p id="notice">????????? ????????? ??????????????????.</p></div></li>
<li>
<div data-role="fieldcontain">
<label for="memberid">?????????:</label>
<input type="text" name="memberid" id="memberid" value="" data-inline="true"/>
<br/><a href="#" data-rel="dialog" data-role="button" data-mini="true" data-theme="b" data-inline="true" onclick="idCheck()">????????????</a>
<div id="idval"></div>
</div>
</li>
<li>
<div data-role="fieldcontain">
<label for="pass">????????????:</label>
<input type="password" name="pass" id="pass" value=""/>
</div>
</li>
<li>
<div data-role="fieldcontain">
<label for="repass">???????????? ??????:</label>
<input type="password" name="repassword" id="repassword" value=""/>
<div id="passval"></div>
</div>
</li>
<li>
<div data-role="fieldcontain">
<label for="name">??????:</label>
<input type="text" id="name" name="name" value=""/>
<div id="nameval"></div>
</div>
</li>
<li>
<div data-role="fieldcontain">
<label for="email">?????????:</label>
<input type="text" name="email" id="email" value=""/>
<div id="emailval"></div>
</div>
</li>

<li>
<div data-role="fieldcontain">
<label for="profileimg">????????? ?????????:</label>
<input data-theme="a" type="file" name="profileimg" id="profileimg" value=""/>
<div id="profileimgval"></div>
</div>
</li>
<li>
<div id="bottongroup" data-role="controlgroup" data-mini="true" data-type="horizontal">
    <a href="#" onclick="joinValidation()" data-role="button" data-icon="check" data-theme="b">??????</a>
    <a href="javascript:history.go(-1)" data-role="button" data-icon="home" data-theme="b">?????????</a>
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