<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>

<style>

	a { text-decoration:none }
	
	
	.ui-header { background:#4086cd;
				overflow:hidden;}
	
	.ui-footer { background:silver;}
	
	#title{ font-size:40px;
			color:white;
			display:inline;
			font-family: 'Pacifico', cursive;
			
			}
			
	#top{
		background:#4086cd;
		font-size:15px;
		color:white;
	}		
	
	#header1{
			height:50px;
			text-align:center;
			border:0px;}
		
	#footer1{
			border:0px;}		
			
	#bottongroup{
			text-align:center;}		
	
	#categorigroup{
			text-align:center;}				
		
			
	h2{
		display:inline;}	
		
	#writing{
	background:rgb(115,217,251);
	
	color:white;
	}	
	
	#errpopup{text-align:center;
			}	
	
	
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

	
	
		
</style>
<script type="text/javascript">
	
	function contentValidation(){
	
		if($("#writingkind").val()==0){
			
			
			var $errmess=$("#errpopup");
			$errmess.html("<p>글의 종류를 선택해주세요.</p><input type='button' data-inline='true' data-mini='true'  data-theme='b' onclick='writingkindFocus()' value='확인'>").trigger('create');

			$("#errpopup").popup("open");
			
			
			//alert("아이디를 입력해주세요.");
			
			
			return false;
		}
		
		if($("#openscope").val()==0){
			
			
			var $errmess=$("#errpopup");
			$errmess.html("<p>글의 공개범위를 선택해주세요.</p><input type='button' data-inline='true' data-mini='true'  data-theme='b' onclick='openscopeFocus()' value='확인'>").trigger('create');
			
			$("#errpopup").popup("open");
			
			
			//alert("아이디를 입력해주세요.");
			
			
			return false;
		}
		
		if($("#contenttitle").val()=="" || $("#contenttitle").val()== null){
			
			var $errmess=$("#errpopup");
			$errmess.html("<p>제목을 입력해주세요.</p><input type='button' data-inline='true' data-mini='true'  data-theme='b' onclick='titleFocus()' value='확인'>").trigger('create');
			
			$("#errpopup").popup("open");
			
			
			//alert("아이디를 입력해주세요.");
			
			
			return false;
		}
		
		if($("#contenttitle").val().length<3 || $("#contenttitle").val().length >21){
			
			var $errmess=$("#errpopup");
			$errmess.html("<p>제목은 3~20자로 해주세요.</p><input type='button' data-inline='true' data-mini='true'  data-theme='b' onclick='titleFocus()' value='확인'>").trigger('create');
			
			$("#errpopup").popup("open");
			
			
			//alert("아이디를 입력해주세요.");
			
			
			return false;
		}
		
		
		if($("#subtitle").val()=="" || $("#subtitle").val()== null){
			
			var $errmess=$("#errpopup");
			$errmess.html("<p>부제목을 입력해주세요.</p><input type='button' data-inline='true' data-mini='true'  data-theme='b' onclick='subtitleFocus()' value='확인'>").trigger('create');
			
			$("#errpopup").popup("open");
			
			
			//alert("아이디를 입력해주세요.");
			
			
			return false;
		}
		
		if($("#subtitle").val().length<2 || $("#subtitle").val().length >30){
			
			var $errmess=$("#errpopup");
			$errmess.html("<p>부제목은 2~30자로 입력 해주세요(공백포함).</p><input type='button' data-inline='true' data-mini='true'  data-theme='b' onclick='subtitleFocus()' value='확인'>").trigger('create');
			
			$("#errpopup").popup("open");
			
			
			//alert("아이디를 입력해주세요.");
			
			
			return false;
		}
		
		
		if($("#content").val()=="" || $("#content").val()== null){
			
			var $errmess=$("#errpopup");
			$errmess.html("<p>내용을 입력해주세요.</p><input type='button' data-inline='true' data-mini='true'  data-theme='b' onclick='contentFocus()' value='확인'>").trigger('create');
			
			$("#errpopup").popup("open");
			
			
			//alert("아이디를 입력해주세요.");
		
			
			return false;
		}
		
		
		if($("#content").val().length < 10){
			
			var $errmess=$("#errpopup");
			$errmess.html("<p>내용은 10자이상 입력해주세요.</p><input type='button' data-inline='true' data-mini='true'  data-theme='b' onclick='contentFocus()' value='확인'>").trigger('create');
			
			$("#errpopup").popup("open");
			
			
			//alert("아이디를 입력해주세요.");
	
			
			return false;
		}
		
		
		if($("#imagefile").val()==0 || $("#imagefile").val==null){
			var $errmess=$("#errpopup");
			$errmess.html("<p>이미지는 필수입니다.</p><input type='button' data-inline='true' data-mini='true'  data-theme='b' onclick='imagefileFocus()' value='확인'>").trigger('create');
			
			$("#errpopup").popup("open");
			
			return false;
			
		}
	
		var checkimage=$("#imagefile").val().substring($("#imagefile").val().lastIndexOf(".")+1);
		if(checkimage !="jpg" && checkimage !="jpeg" && checkimage !="png" && checkimage !="PNG" && checkimage !="bmp" && checkimage !="JPG" && checkimage !="JPEG"){
	
			var $errmess=$("#errpopup");
			$errmess.html("<p>이미지 파일이 아닙니다.</p><input type='button' data-inline='true' data-mini='true'  data-theme='b' onclick='imagefileFocus()' value='확인'>").trigger('create');
			
			$("#errpopup").popup("open");
			
				
			return false;
			}
		
		
		$("#makecontentform").submit();
	
	}
		
	function titleFocus(){
		$("#errpopup").popup("close");
		
		$("#errpopup").on("popupafterclose",function(event,ui){
			$("#contenttitle").focus();
		});
	}
	
	function subtitleFocus(){
		$("#errpopup").popup("close");
		
		$("#errpopup").on("popupafterclose",function(event,ui){
			$("#subtitle").focus();
		});
	}
	
	function contentFocus(){
		$("#errpopup").popup("close");
		
		$("#errpopup").on("popupafterclose",function(event,ui){
			$("#content").focus();
		});
	}

	function writingkindFocus(){
		$("#errpopup").popup("close");
		
		$("#errpopup").on("popupafterclose",function(event,ui){
			$("#writingkind").focus();
		});
		
	}
	
	function openscopeFocus(){
		$("#errpopup").popup("close");
		
		$("#errpopup").on("popupafterclose",function(event,ui){
			$("#openscope").focus();
		});
		
	}

	function imagefileFocus(){
		$("#errpopup").popup("close");
		
		$("#errpopup").on("popupafterclose",function(event,ui){
			$("#imagefile").val("");
			$("#imagefile").focus();
		});
		
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
	
	
	
	
	
	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>앨범,책, 글쓰기 </title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="../js/jquery.mobile-1.4.5.min.css"/>
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript" src="../js/jquery.placeholder.js"></script>

</head>
<body>

<div id="page" data-role="page" data-theme="a">

<div id="left-panel" data-role="panel" data-theme="c" data-display="reveal" data-position-fixed="true" data-position="left" data-inset="false">
  
          <ul data-role="listview" data-theme="a" data-insert="true">
          	<li  id="top" data-role="list-divider" data-theme="c"><h3>${loginerinfor.id}</h3></li>
            <li data-icon="edit" data-iconpos="left"><a href="/Finder/makecontent/bringpostpage.do"  data-ajax="false"  title="글쓰기" >글쓰기</a></li>
        	<li data-icon="false"><a href="#" title="Profile">나의 책 생각들<span class="ui-li-count">${loginerinfor.mybookcount}</span></a></li>
            <li data-icon="false"><a href="#" title="Setting">나의 앨범 생각들<span class="ui-li-count">${loginerinfor.myalbumcount}</span></a></li>
            <li data-icon="false"><a href="#" title="Logout">나의 다양한 글들<span class="ui-li-count">${loginerinfor.mywritingcount}</span></a></li>
            <li data-icon="false"><label for="name"></label><input type="search" name="name" id="name" value="" /></li>
	
        </ul>
      
	 </div>

<div id="header1" data-role="header" data-position="fixed" data-theme="c" data-id="header">
<a class="ui-icon-nodisc" href="#left-panel" data-iconpos="notext" data-iconshadow="false" data-shadow="false" data-theme="d" data-icon="bars"></a>
<h1 id="title">Finder</h1>
<!-- <div data-role="controlgroup" data-type="horizontal" class="ui-btn-right"> -->
<a href="#" data-iconpos="notext" data-iconshadow="false" data-shadow="false" data-theme="d" data-icon="user"></a>
</div>

<div  data-role="content">
<form id="makecontentform" method="post" action="/Finder/postcontent/postcontent.do" data-ajax="false" enctype="multipart/form-data">

<ul data-role="listview" data-theme="a" data-inset="false">
<li><div><h2>글쓰기</h2></div></li>
<li>
<div data-role="fieldcontain">
<div id="categorigroup" data-role="controlgroup" data-mini="true" data-type="horizontal">
<label for="categori"></label>
<select name="categori" id="categori" data-theme="b" data-inline="true">
<option value="0">글의 종류</option>
<option value="1">글나누기</option>
<option value="2">책생각</option>
<option value="3">앨범생각</option>
</select>
<label for="openscope"></label>
<select name="openscope" id="openscope" data-theme="b" data-inline="true">
<option value="0">글의 공개범위</option>
<option value="1">개인 소장하기</option>
<option value="2">모두와 함께하기</option>
</select>
</div>
</div>
</li>
<li>
<div>
<label for="contenttitle"></label>
<input type="text" name="contenttitle" id="contenttitle" data-inline="true"  value="" placeholder="제목"/>
<label for="subtitle"></label>
<input type="text" name="subtitle" id="subtitle" data-inline="true"  value="" placeholder="부제목"/>
<label for="content"></label>
<textarea name="content" id="content" cols="40" rows="9" id="content1" placeholder="글쓰기"></textarea>
</div>
</li>
<li>
<div>
<label for="imagefile"></label>
<input name="imagefile" id="imagefile" data-theme="a" type="file" value="">
</div>
</li>

<li>
<div id="bottongroup" data-role="controlgroup" data-mini="true" data-type="horizontal">
  
    <a href="#" onclick="contentValidation()" data-role="button" data-icon="check" data-theme="b">확인</a>
    <a href="/Finder/home/homepage.do" data-ajax="false" data-role="button" data-icon="home" data-theme="b">홈으로</a>
</div>
</li>
</ul>
<div data-role="popup" id="errpopup" data-dismissible="false" data-theme="b"  class="ui-content">
	
</div>
</form>

</div>


<div id="footer1" data-theme="b" data-role="footer" data-position="fixed">
<div data-role="navbar"  data-position="fixed" data-id="homenav">
<ul>
	<li><a href="/Finder/home/homepage.do" data-ajax="false"  data-id="home">홈</a></li>
	<li><a href="#" data-id="bookinfo">책 생각</a></li>
	<li><a href="#" data-id="albuminfo">앨범 생각</a></li>
	<li><a href="#" data-id="writinginfo">글나누기</a></li>
</ul>
</div></div>
</div>

</body>
</html>