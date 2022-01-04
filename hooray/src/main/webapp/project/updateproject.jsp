<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String email=(String)session.getAttribute("email"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Hooray 프로젝트 수정</title>

	<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>

	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.4/css/font-awesome.min.css" rel="stylesheet">
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
    <link href="../dist/summernote.css" rel="stylesheet">
	<script src="../dist/summernote.js"></script>
	<script src="../dist/summernote.min.js"></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	
<style>
*{
		margin:0;
		padding:0;
	}
	
	a{
	    text-decoration:none;
	 	color:black;
	 }
	 
	 
	
	
    #main_header{
      
      	width:100%;
    	margin:0 auto;
    	height:35px;
    	color:white;
    	border-bottom:1px solid #dcdcdc;
    	position:relative;
    	background: white;
 		

 		
    }
    
        
     #main_header > #title{
    	position:absolute;
    	left:10px;
    	top:0px;
    	font-weight:bold;
    	height:35px;
    	font-size:23px;
    	
    
    
    }
    
    #searchdiv{
    	text-align:center;
   
    }
    
    #search_button{
		background-color:white;
		color:black;
		border:1px solid white;
	}
    
  #main_nav{
    	position:absolute;
    	right:10px; top:3px;
    	
   }
   
    #text{
      	font-size:12px;
  	}
    
    #main_nav > ul{
    	overflow:hidden;
    	
    }
    
    
    #main_nav > ul > li {
    	float:left;
 		height:25px;
    
    }
    
    #main_nav > ul > li > a{
    	display:block;
  	}
   
     ul{
    	list-style:none;
    }
    
    #contentdiv{
    	position:relative;
		width:951px; height:auto;
		top:30px;
		margin: 0px auto;
		overflow: hidden;
    	
    }
    
    #contentdiv > h2{
    	font-size:23px;
    	font-weight:bold;
    }
    
    #inputdiv{
    	position:relative;
    }
    
 
    
    #inputdiv input[type="text"]{
    height:auto;
    line-height:normal;
    padding:.8em .5em;
    font-family:inherit;
    border:1px solid #999;
    border-radius:0;
    outline-style:none;
    -webkit-appearance:none;
    -moz-appearance:none;
    appearance:none;
    }
    
    #summernote{
    	
    }
    
    #maintitle{
    	width:775px;
    	height:25px;
    	border:1px solid #4C4C4C;
    	background-color:white;
    }
    
    #categori{
    	width:170px;
    	height:40px;
 
    	font-family:inherit;
    	border:1px solid #999;
    	border-radius:0px;
    	
    
    	
    }
    
    #subtitle{
    	width:640px;
    	height:25px;
    	border:1px solid #4C4C4C;
    	background-color:white;
    }
    
    #limitpeople{
    	width:151px;
    	height:25px;
    	border:1px solid #4C4C4C;
    	background-color:white;
    }
    
    #period{
    	width:150px;
    	height:25px;
    	border:1px solid #4C4C4C;
    	background-color:white;
    }
    
      #state{
    	width:170px;
    	height:40px;
 		font-family:inherit;
    	border:1px solid #999;
    	border-radius:0px;
    	
    }
    
    #city{
    	width:337px;
    
    }
    
    
    #introimg{
    	width:948px;
    	height:25px;
    	border:1px solid #4C4C4C;
    	background-color:white;
    	position:absolute;
    	width:1px;
    	height:1px;
    	padding:0;
    	margin:-1;
    	overflow:hidden;
    	clip:rect(0,0,0,0);
    	border:0;
    }
    
       #filebox{
    display:inline-block;
    }
    
    #filebox label{
   
   	margin:0 1px;
    display:inline-block;
    padding:.5em .75em;
    color:white;
    font-size:inherit;
    line-height:normal;
    vertical-align:middle;
    background-color:#00d8ff;
    cursor:pointer;
    border:1px solid #ebebeb;
    border-bottom-color:#e2e2e2;
  
    }
    
    #filebox #upload-name{
    width:300px;
    display:inline-block;
    padding:.5em .75em;
    font-size:inherit;
    font-family:inherit;
    line-height:normal;
    vertical-align:middle;
    background-color:#f5f5f5;
    border:1px solid #ebebeb;
    border-bottom-color:#e2e2e2;
    border-radius:.25em;
    -webkit-appearance:none;
    -moz-appearance:none;
    appearance:none;
    }
    
    
   

    
    #buttondiv{
    	text-align:center;
    }
    
    #buttondiv > input[type=button]{
    	
    	
    background-color:#003399;
 	color:white;
 	height:auto;
    line-height:normal;
 	padding:.5em .75em;
    font-family:inherit;
    border:1px solid #ebebeb;
    border-radius:0;
    outline-style:none;
    -webkit-appearance:none;
    -moz-appearance:none;
    appearance:none;
 	width:110px;
 	display:inline-block;
 	cursor:pointer;
    border-bottom-color:#e2e2e2;
    font-weight:bold;
    	
    }
    
    
     #main_footer{
    	width:100%;
    	margin:0;
    	background-color:white;
    	color:#003399;
    	font-size:15px;
    	font-weight:bold;
    	text-align:center;
    	bottom:0px;
    	position:absolute;
    	
    	border-top:1px solid #dcdcdc;
    	
    	
    }
   

</style>
<script type="text/javascript">
	
		var imageNum;
	
    $(document).ready(function() {
    	imageNum=$("#lastimgnum").val();
    	
    	
        $('#summernote').summernote({
         height:400,
         placeholder:"프로젝트의 내용을 자세하게 설명 및 어필해주세요.",
         callbacks:{
        
         onImageUpload:function(files){
        	 sendFile(files[0]);	 
        	 
         },
		lang: 'ko-KR'
         }
        });
    });
    
    
    function sendFile(file){
    	imageNum++;
    	alert(imageNum);
    	var data = new FormData();
    	var projectNum=$("#projectNum").val();
    	data.append("uploadFile",file);
    	data.append("babo",imageNum);
    	data.append("projectNum",projectNum);
    	
    	
    	$.ajax({
    		data:data,
    		type:"POST",
    		url:"/hooray/write/updateimage.do",
    		contentType:false,
    		cache:false,
    		processData:false,
    		enctype:'multipart/form-data',
    		success:function(data){

    		alert(data);
    		$('#summernote').summernote("insertImage","../memberimages/"+data+"/"+imageNum+".jpg",function ($image) {
    			$("#lastimgnum").val(imageNum); 
    			if($image.width()>600)
    			$image.css('width', 600);
    		});
    		alert(data);
    	
    			
    		}
    	});
    }
   
    	$(document).ready(function() {
    	    	
    	    	var fileTarget=$("#filebox #introimg");
    	    	
    	    	fileTarget.on("change", function(){
    	    		if(window.FileReader){
    	    			var filename=$(this)[0].files[0].name;
    	    		}
    	    		else{
    	    			var filename=$(this).val().split('/').pop().split('\\').pop();
    	    			
    	    		}
    	    		
    	    		$(this).siblings("#upload-name").val(filename);
    	    		
    	    	})	;
    });
    
    
    	$(function() {
    		  $( "#period" ).datepicker({
    		    dateFormat: 'yy-mm-dd'
    		  });
    		});
    	
    
    function writingValidation(){
    	
    	if($("#categori").val()==0){
    			alert("카테고리를 선택해주세요.");
    			$("#categori").focus();
    		return false;
    		
    	}
    	
    	if($("#maintitle").val()=="" || $("#maintitle").val()==null){
    			alert("주제목을 입력해주세요.");
    			$("#maintitle").focus();
    		return false;	
    	}
    	
    	if($("#maintitle").val().length<6){
    		alert("주제목은 5자 이상으로 해주세요.");
    		$("#maintitle").focus();
    		return false;
    	}
    
    	if($("#subtitle").val()==""||$("#subtitle").val()==null){
    		alert("부제목을 입력해주세요.");
    		$("#subtitle").focus();
    		return false;
    	}
    	
    	if($("#subtitle").val().length < 11){
    		alert("부제목은 10자 이상으로 해주세요.");
    		$("#subtitle").focus();
    		return false;
    	}
    	
    	if($("#state").val()=="0" || $("#state").val()==0){
    		alert("지역을 선택해주세요.");
    		$("#state").focus();
    		return false;
    	}
    	
    	if($("#city").val()=="" || $("#city").val()==null){
    		alert("시,군,구를 입력해주세요.");
    		$("#city").focus();
    		return false;
    	}
    	
    	
    	
    	if($("#limitpeople").val()==null|| $("#limitpeople").val()==""){
    		alert("참여인원을 설정해주세요.");
    		$("#limitpeople").focus();
    		return false;
    	}
    	
		var num_check= /^[0-9]+$/;
		
		if(!(num_check.test($("#limitpeople").val()))){
			alert("숫자만 입력해주세요.");
			$("#limitpeople").val("");
			$("#limitpeople").focus();
			return false;
		}
		
		var period_check=/^(201[6-9]|20[2-9][0-9])-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])/;
		
    	if($("#period").val()==null || $("#period").val()==""){
    		alert("모집기한을 설정해주세요.");
    		$("#period").focus();
    		return false;
    	}
    	
    	if(!(period_check.test($("#period").val()))){
    		alert("모집기한 형태에 오류가 있습니다.");
    		$("#period").val("");
    		$("#period").focus();
    		return false;
    		
    	}
    	
    	var year=$("#period").val();
    	var yearIndex=year.indexOf("-",0);
    	year=year.substring(0,yearIndex);
    	year=parseInt(year);
    	var month=$("#period").val();
    	var monthIndex=month.indexOf("-",yearIndex+1);
    	month=month.substring(yearIndex+1,monthIndex);
    	month=parseInt(month);
    	var day=$("#period").val();
    	day=day.substring(monthIndex+1,day.length);
    	day=parseInt(day);
    	
    	
    	var now=new Date();
    	var currentYear=now.getFullYear();
    	var currentMonth=now.getMonth()+1;
    	var currentDay=now.getDate();
    	
    	
    	if(year < currentYear){
    		alert("모집기한 설정에 오류가 있습니다.(당일 기한, 과거 날짜 설정 불가)");
    		$("#period").val("");
    		$("#period").focus();
    		return false;
    	}
    	 
    	if(year == currentYear && month < currentMonth){
    		alert("모집기한 설정에 오류가 있습니다.(당일 기한, 과거 날짜 설정 불가)");
    		$("#period").val("");
    		$("#period").focus();
    		return false;
    		
    	}
    	
    	if(year == currentYear && month == currentMonth && day <= currentDay){
    		alert("모집기한 설정에 오류가 있습니다.(당일 기한, 과거 날짜 설정 불가)");
    		$("#period").val("");
    		$("#period").focus();
    		return false;
    		
    	}
    	
    	
    	
    	if($("#upload-name").val()=="" || !$("#upload-name").val==null){
			alert("처음 소개 이미지는 필수입니다.");
			$("#introimg").focus();
			return false;
		}

		var checkimage=$("#upload-name").val().substring($("#upload-name").val().lastIndexOf(".")+1);
	
		
		if(checkimage !="jpg" && checkimage !="jpeg" && checkimage !="png" && checkimage !="bmp" && checkimage !="JPG" && checkimage !="JPEG" && checkimage !="PNG"){
	
			alert("이미지 파일이 아닙니다");
			$("#upload-name").focus();
			return false;
			}
		
		
		
		var markupStr = $('#summernote').summernote('code');
		alert(markupStr);
		
		if ($('#summernote').summernote('isEmpty')) {
	    	  alert("내용을 입력해주세요.");
	    	  return false;
	    	}
		
		$("#content").val( $('#summernote').summernote('code'));
		
		
		$.ajax({
    		data:new FormData($("#writingprojectform")[0]),
    		type:"POST",
    		url:"/hooray/write/updateproject.do",
    		contentType:false,
    		cache:false,
    		processData:false,
    		enctype:'multipart/form-data',
    		success:function(data){
    		
    			if(data=="0"){
    	    		alert("프로젝트 업로드에 실패했습니다.");
    	    		return false;
    	    	}
    	    	
    	    	else{
    	    		alert("프로젝트 업로드에 성공했습니다.");
    	    		$(location).attr("href","/hooray/project/getaproject.do?projectNum="+data);
    	    		
    	    	}
    
    	
    			
    		}
    	});
    }
    

 	function changeMainImg(){
 			$("#imgchangeflag").val("1");
 	}
    
 	
 	function logout(){
 		
 		$.ajax({
 			data:false,
 			type:"POST",
 			url:"/hooray/member/logout.do",
 			dataType:"json",
 			contentType:"application/json; charset=utf-8",
 			cache:false,
 			contentType:false,
 			processData:false,
 			success:function(data){
 			if(data=="1"){
 			alert("로그아웃 하였습니다.");	
 			$(location).attr("href","/hooray/home/homepage.do");


 			return false;
 	    	}
 			
 			else{
 				
 			alert("로그아웃에 실패했습니다.")	
 			return false;
 			}
 			
 			}
 		});
 		
 	}

 	function cantUpload(){
 		
 		alert("프로젝트를 업로드 하기 위해서 로그인을 해주세요!");
 		return false;
 		
 	}
 	
 	
 	
</script>
</head>
<body  bgcolor="#F6F6F6">

<header id="main_header">
	<hgroup id="title"><a href="/hooray/home/homepage.do"><font color="#003399">Hooray.</font></a></hgroup>
	<nav id="main_nav">
	<ul>
	<li><span id="text"><a href="/hooray/project/getprojectsfirst.do?search_type=latest"><font color="#003399">프로젝트 보기</font></a></span>&nbsp;&nbsp;
	<c:if test="${ email != null}">
	<li><span id="text"><a href="../write/writingpage.jsp"><font color="#003399">프로젝트 올리기</font></a></span>&nbsp;&nbsp;
	</c:if>
	<c:if test="${ email == null}">
	<li><span id="text"><a href="javascript:;" onclick="cantUpload()"><font color="#003399">프로젝트 올리기</font></a></span>&nbsp;&nbsp;
	</c:if>
	<c:if test="${ email != null}">
	<li><span id="text"><a href="/hooray/member/myinformation.do?flag=1" id="logout"><font color="#003399">나의정보</font></a></span>&nbsp;&nbsp;
	</c:if>
	<c:if test="${ email != null}">
	<li><span id="text"><a href="javascript:;" onclick="logout()" id="logout"><font color="#003399">로그아웃</font></a></span>&nbsp;&nbsp;
	</c:if>
	<c:if test="${ email == null}">
	<li><span id="text"><a href="../login/loginpage.jsp"><font color="#003399">로그인</font></a></span>&nbsp;&nbsp;
	</c:if>
	<li><span id="text"><a href="../Join/joinpage.jsp"><font color="#003399">회원가입</font></a></span>
	</ul>
	</nav>
	</header>

<div id="contentdiv">

<h2>프로젝트 올리기</h2>
<div id="inputdiv">
<form name="writingprojectform" id="writingprojectform" method="post" enctype="multipart/form-data" action="#">

<select name="categori" id="categori" style="border:1px solid black;">

<option value="1" ${aProject.categori == 1 ? "selected" : "" }>자원봉사</option>
<option value="2" ${aProject.categori == 2 ? "selected" : "" }>재능기부</option>
<option value="3" ${aProject.categori == 3 ? "selected" : "" }>공연,행사</option>
<option value="4" ${aProject.categori == 4 ? "selected" : "" }>상품판매</option> 
</select>

<input name="maintitle" id="maintitle" type="text" size="0" placeholder="주제목" value="${aProject.maintitle}"/>

<input name="subtitle" id="subtitle" type="text" size="0"	 placeholder="부제목" value="${aProject.subtitle}"/>

<input type="text" name="limitpeople" id="limitpeople" size="0" placeholder="참여인원" value="${aProject.limitpeople}">

<input type="text" name="period" id="period" size="0" placeholder="모집 기한" value="${aProject.period }">
<select name="state" id="state" style="border:1px solid black;">

<option value="전체" ${aProject.state == "전체" ? "selected" : "" }>전체</option>
<option value="서울" ${aProject.state == "서울" ? "selected" : "" }>서울</option>
<option value="경기" ${aProject.state == "경기" ? "selected" : "" }>경기</option>
<option value="부산" ${aProject.state == "부산" ? "selected" : "" }>부산</option>
<option value="인천" ${aProject.state == "인천" ? "selected" : "" }>인천</option>
<option value="울산" ${aProject.state == "울산" ? "selected" : "" }>울산</option>
<option value="대구" ${aProject.state == "대구" ? "selected" : "" }>대구</option>
<option value="대전" ${aProject.state == "대전" ? "selected" : "" }>대전</option>
<option value="광주" ${aProject.state == "광주" ? "selected" : "" }>광주</option>
<option value="충남" ${aProject.state == "충남" ? "selected" : "" }>충남</option>
<option value="충북" ${aProject.state == "충북" ? "selected" : "" }>충북</option>
<option value="경남" ${aProject.state == "경남" ? "selected" : "" }>경남</option>
<option value="경북" ${aProject.state == "경북" ? "selected" : "" }>경북</option>
<option value="전북" ${aProject.state == "전북" ? "selected" : "" }>전북</option>
<option value="전남" ${aProject.state == "전남" ? "selected" : "" }>전남</option>
<option value="강원" ${aProject.state == "강원" ? "selected" : "" }>강원</option>
<option value="제주" ${aProject.state == "제주" ? "selected" : "" }>제주</option>  
<!--  -->

</select>

<input type="text" name="city" id="city" placeholder="(시,군,구)" value="${aProject.city }"/>
<div id="filebox">
<input type="text" id="upload-name" value="${aProject.email}/1.jpg"  disabled="disabled" >
<label for="introimg">대문 사진 올리기</label>
<input type="file" name="introimg" id="introimg" onchange="changeMainImg()" value=""/>
<textarea name="content" id="content" style="display:none;"></textarea>
<input type="text" name="lastimgnum" id="lastimgnum" value="${aProject.lastimgnum}" style="display:none;">
<input type="text" name="projectNum" id="projectNum" value="${aProject.projectNum}" style="display:none;">
<input type="text" name="imgchangeflag" id="imgchangeflag" value="0" style="display:none;">
</div>


<br/>
<div id="summernote">${aProject.content}</div>
</form>
</div>
<div id="buttondiv">
<input type="button" value="등록" onclick="writingValidation()"/>
<input type="button" value="메인화면으로"/>
</div>
</div>

<div id="main_footer">
<span>Copy Right. Hooray.</span>
</div>	

</body>
</html>