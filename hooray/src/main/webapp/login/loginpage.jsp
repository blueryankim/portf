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
<title>Shake Hand 로그인</title>
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
    	top:0px;
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
	
 	#joinclick{
 	background-color:#003399;
 	color:white;
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
 	position:relative;
 	left:7px;
 	cursor:pointer;
 	
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
    <script type="text/javascript" src="../js/jquery.nivo.slider.js"></script>
    <script type="text/javascript">
  
	
	function loginValidation(){
		
		
		if($("#email").val()=="" || $("#email").val()==null){
			alert("이메일을 입력해주세요");
			$("#email").focus();
			return false;
			
		} 
		
		var email_check = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		    if(!email_check.test($("#email").val())){
				alert("이메일이 정확하지 않습니다.");
				$("#email").val("");
				$("#email").focus();
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
	    
		emailAndPassCheck();
		
	}
	
	function emailAndPassCheck(){
		
		data = new FormData();
		var email=$("#email").val();
		var pass=$("#password").val();
		data.append("email",email);
		data.append("password",pass);
		
	
		
		
		$.ajax({
    		data:data,
    		type:"POST",
    		url:"/hooray/member/login.do",
    		dataType:"json",
    		contentType:"application/json; charset=utf-8",
    		cache:false,
    		contentType:false,
    		processData:false,
    		success:function(data){
			if(data=="1"){
			alert("존재하지 않는 이메일입니다.");	
			return false;
	    	}
			
			else if(data=="2"){
			alert("비밀번호가 맞지 않습니다.");	
			return false;
			}
			
			else{
				alert("로그인이 되셨습니다.")
				$(location).attr("href","/hooray/home/homepage.do");
		
			
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
			<h2>Hooray. 로그인</h2>
			<br/>
			<br/>
			<div id="inputdiv">
			<form id="loginform" method="post" action="">
					
					<label for="id">이메일</label><br/>
					<input type="text" id="email" placeholder="이메일 입력" size="20" /><br/>
						<br/>
					<label for="password">비밀번호</label><br/>
					<input type="password" id="password" placeholder="비밀번호" size="20" />
						<br/><br/><br/>
					<input type="button" id="joinclick" value="로그인하기" onclick="loginValidation()"  />
				</form></div>
		</div>
	</div>

<footer id="main_footer">
<h3>Copy Right. Hooray.</h3>
</footer>	


</body>
</html>