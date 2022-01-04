<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<% String email=(String)session.getAttribute("email"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Shake Hand 회원 가입</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>


	
* {
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
    	font-weight:bold;
    	height:35px;
    	font-size:23px;
    	
    
    
    }
    
 ul{
    	list-style:none;
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
 		height:30px;
    
    }
    
    #main_nav > ul > li > a{
    	display:block;
	}
    
    #contentdiv{
 		
    	height:780px;
    	background-color:white;
  		text-align:center;
    	vertical-align:middle;
    	
    }
    
    #logindiv{
    		
    	font-size:13px;
    	display:inline-block;
    	width:300px;
    	height:500px;
		background-color:white;
		border:1px solid black;
    	
    	
        }
    
  
    #logindiv > h2{
  		
    }
    
    
    #inputdiv{
    	text-align:left;
    	margin:0px 25px;
 	 }
 	 
 	 
 	input[type=text]{
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
 	width:235px;
 	}	
	
	input[type=password]{
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
 	width:235px;
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
    width:140px;
    height:20px;
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
    
	
	
 	#joinclick{
 	position:relative;
 	left:8px;
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
 	width:235px;
 	cursor:pointer;
 	background-color:#003399;
 	color:white;
 	
 	}
 	
 	#confirmemail{
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
 	width:80px;
 	cursor:pointer;
 	background-color:#003399;
 	color:white;
 	}
    
    #main_footer{
    	width:100%;
    	margin:0;
    	background-color:white;
    	color:#003399;
    	font-size:13px;
    	text-align:center;
    	float:bottom;
    	position:absolute;
    	bottom:0px;
    	border-top:1px solid #dcdcdc;
    }
	

</style>

<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript">
   
	var idcheckflag = 0;
	
	
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
	
	function joinValidation(){
		
	 var email_check = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		   
		
		if (idcheckflag == 0) {
			alert("이메일 중복확인을 해주세요.");
			$("#memberemail").focus();
			return false;
		}
		
		 if(!email_check.test($("#memberemail").val())){
			alert("입력한 이메일에 오류가 있습니다.")
				$("#memberemail").focus();
				return false;
			}
		
		
		
		if($("#password").val()=="" || $("#password").val()==null || $("#repassword").val=="" || $("#repassword").val==null){
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		}
		
		if ($("#password").val().length<6){
			
			alert("비밀번호는 6자 이상 입력하세요.");
			$("#password").val("");
			$("#repassword").val("");
			$("#password").focus();
			return false;
		}
		
		if ($("#password").val() != $("#repassword").val()) {
			
			alert("비밀번호가 같지 않습니다.");
			$("#password").val("");
			$("#repassword").val("");
			$("#password").focus();
			
			return false;
		}
		
		if($("#name").val()=="" || $("#name").val()==null){
			
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		
		var kor_check= /^[가-힣]+$/;
		
		if(!(kor_check.test($("#name").val()))){
			alert("입력하신 이름에 오류가 있습니다.");
			$("#name").focus();
			return false;
		}
		
		if($("#name").val().length<2 || $("#name").val().length>6){
			
			alert("이름은 2자 이상 6자 이하로 입력해주세요.");
			$("#name").focus();
			return false;
		}
		

    	if($("#introimg").val()=="" || !$("#introimg").val==null){
			alert("회원 이미지는 필수입니다..");
			$("#introimg").focus();
			return false;
		}

		var checkimage=$("#introimg").val().substring($("#introimg").val().lastIndexOf(".")+1);
	
		
		if(checkimage !="jpg" && checkimage !="jpeg" && checkimage !="png" && checkimage !="bmp" && checkimage !="JPG" && checkimage !="JPEG" && checkimage !="PNG"){
	
			alert("이미지 파일이 아닙니다");
			$("#upload-name").val("");
			$("#introimg").focus();
			return false;
			}
		
		
		 joinMember();
	}
	
	function emailConfirm(){
		
		if($("#memberemail").val()==""|| $("#memberemail").val()==null){
			
			alert("이메일을 입력해주세요.");
			$("#memberemail").focus();
			return false;
		}
		
		
		 var email_check = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		 if(!email_check.test($("#memberemail").val())){
				alert("입력한 이메일에 오류가 있습니다.")
					$("#memberemail").focus();
					return false;
				} 
		
		data = new FormData();
		var email=$("#memberemail").val();
		data.append("email",email);
		
	
		
		
		$.ajax({
    		data:data,
    		type:"POST",
    		url:"/hooray/member/checkemail.do",
    		dataType:"json",
    		contentType:"application/json; charset=utf-8",
    		cache:false,
    		contentType:false,
    		processData:false,
    		
    		success:function(data){
			if(data=="0"){
				idcheckflag=1;
	    		$("#memberemail").attr("disabled",true);
	    		alert("사용 가능한 이메일입니다.");
	    		$("#password").focus();
			}
			
			else{
				
				alert("이미 존재하는 이메일입니다.");
				$("#memberemail").val("");
				$("#memberemail").focus();
				return false;
			}

    		
    		
    			
    		}
    	});
	}
	
		
		
	
	function joinMember(){
		
		var memberemail=$("#memberemail").val();
		$("#email").val(memberemail);
		
		$.ajax({
    		data:new FormData($("#joinform")[0]),
    		type:"POST",
    		url:"/hooray/member/joinmember.do",
    		contentType:false,
    		cache:false,
    		processData:false,
    		enctype:'multipart/form-data',
    		success:function(data){
    		
    			
    			if(data=="1"){
    				alert("성공적으로 가입이 되셨습니다.");
    				$(location).attr("href","/hooray/home/homepage.do");
    			}
    			
    			else{
    				
    				alert("회원가입에 실패하셨습니다.");
    				
    			}
    
    	
    			
    		}
    	});
		
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
<body bgcolor="#F6F6F6">

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


	<br/><br/><br/>
		<div id="logindiv">
			<br />
			<h2>Hooray. 가입</h2>
			<br/>
			<br/>
			<div id="inputdiv">
			<form id="joinform" method="post">
					
					<label for="memberemail">이메일</label><br/>
					<input type="text" name="memberemail" id="memberemail" placeholder="이메일 입력" size="20" /><br/><input
						type="button" id="confirmemail" value="중복확인" onclick="emailConfirm()" />
						<br/><br/>
					<label for="password">비밀번호</label><br/>
					<input type="password" name="password" id="password" placeholder="비밀번호" size="20" />
					<br/>
					<input type="password" id="repassword" placeholder="비밀번호 확인"
						size="20" /><br/><br/>
					<label for="name">이름</label><br/>
					<input type="text" name="name" id="name" placeholder="이름 입력" size="20" /><br/><br/>
					<div id="filebox">
					<input type="text" id="upload-name" value="파일선택" disabled="disabled">
					<label for="introimg">회원 사진</label>
					<input type="file" name="introimg" id="introimg" value=""/>
					<input type="text" name="email" id="email" style="display:none;"/>
					</div>
					
			<br/><br/>
					<input type="button" id="joinclick" value="가입하기" onclick="joinValidation()"  />
				</form></div>
		</div>
	</div>

<footer id="main_footer">
<h3>Copy Right. Hooray.</h3>
</footer>	


</body>
</html>