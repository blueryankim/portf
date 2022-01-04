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
<title>프로젝트 페이지</title>
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
    
       #search_select{
    	width:100px;
    	height:27px;
 
    	font-family:inherit;
    	border-radius:0px;
   
    }
    
    #search_project{
    	
    margin:3px 0px;
    width:200px;
    height:4px;
    line-height:normal;
    padding:.8em .5em;
    font-family:inherit;
    border-radius:0;
    outline-style:none;
    -webkit-appearance:none;
    -moz-appearance:none;
    appearance:none;
    }
    
    #search_button{
    width:50px;
    height:27px;
	line-height:normal;
    cursor:pointer;
    font-family:inherit;
    border-radius:0;
    outline-style:none;
    background-color:#003399;
    border:1px solid #003399;
    color:white;
  
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
    	
    #content{
    

    	width:100%;
    	
    	margin:0 auto;
    	overflow:hidden;
    }    
    
    #main_section{
    	width:100%;
    	height:auto;
    	text-align:center;
    	position:relative;
    	
    }
    
    #topdiv{
    	width:100%;
    	height:110px;
    
    }
    
    #topdiv > h2{
    	font-size:20px;
    }
    
    #topdiv > h3{
 		margin:15px 0px;   
 		font-weight:normal;
 		font-size:14px;
 		color:#4C4C4C;
    }
    
    #projectcontentdiv > img{
    	width:600px;
    }
    
    #bottomdiv{
    	width:100%;
    	position:absolute;
    	bottom:0px;
    	border-bottom:1px solid #dcdcdc;
    	font-size:12px;
    }
    #bottomdiv > a{
    	color:#5D5D5D;
    	font-weight:bold;
    	font-size:13px;
    }
    
    #bottomdiv a:hover{
    	text-decoration:underline;
   		color:#00d8ff;
    
    }
    
    #subcontentdiv{
    	width:900px;
    	height:auto;
    	margin: 20px auto;
		overflow: hidden;
    }
    
    #sub_section{
    	width:600px;
    	height:auto;
    	float:left;
    }
    
    #sub_section > img{
    	width:600px;
    	height:350px;
    
    }
    
    #sub_aside{
    	width:280px;
    	height:auto;
    	float:right;
    	
    }
    
    #buttondiv{
    	
    	left:115px;
    	position:relative;
   		
    }
    
    #buttondiv input[type=button]{
     width:50px;
    height:27px;
	line-height:normal;
    cursor:pointer;
    font-family:inherit;
    border:1px solid #00d8ff;
    border-radius:0;
    outline-style:none;
    background-color:#00d8ff;
    color:white;
    
    }
    
    #applybuttondiv{
  	 text-align:center;
  	vertical-align:middle;
  
   	width:200px;
   	height:50px;
   	margin:0 1px;
    display:inline-block;
    padding:.5em .75em;
    color:white;
    font-size:13px;
    line-height:normal;
    vertical-align:middle;
    background-color:#00d8ff;
    cursor:pointer;
    border:1px solid #ebebeb;
    border-bottom-color:#e2e2e2;
 
    
    line-height:15px;
    }
    
    
     
     #main_footer{
     
     	margin-bottom:0px;
     	width:100%;
     	height:30px;
    	
		background-color:white;
    	color:#003399;
    	font-size:13px;
    	text-align:center;
    	border-top:1px solid #dcdcdc;
    }
		
	
</style>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript">

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

function applyProject(){
	
	projectemail=$("#projectemail").val();
	memberemail=$("#memberemail").val();
	
	if(projectemail==memberemail){
		alert("작성자가 프로젝트에 참여할 수 없습니다.");
		return false;
	}
	
	else if(memberemail==""||memberemail==null){
		alert("프로젝트에 참여하기 위해서 로그인을 해주세요.");
		return false;
	}
	else{
		
		
		var pnum=$("#projectNum").val();


		$.ajax({
			data:false,
			type:"GET",
			url:"/hooray/project/applyproject.do?pnum="+pnum,
			dataType:"json",
			contentType:"application/json; charset=utf-8",
			cache:false,
			contentType:false,
			processData:false,
			success:function(data){
			if(data=="1"){
			alert("이미 프로젝트에 등록이 되었습니다.");
			return false;
			}
			
			else if(data=="2"){
			alert("성공적으로 참여하였습니다.");	
    		$(location).attr("href","/hooray/project/getaproject.do?projectNum="+pnum+"&flag=1");
			return false;
			}

			else{
			alert("참여에 실패하였습니다.(정원초과, 서버에러, 프로젝트 기한 초과)");	
			return false;
			}
			
			}
		});
		
	}
}

	function cancelProject(){
		
		
		var pnum=$("#projectNum").val();
	

		$.ajax({
			data:false,
			type:"GET",
			url:"/hooray/project/cancelappproject.do?pnum="+pnum,
			dataType:"json",
			contentType:"application/json; charset=utf-8",
			cache:false,
			contentType:false,
			processData:false,
			success:function(data){
			
			if(data=="1"){
			alert("성공적으로 취소가 되었습니다");
			
			$("#applybuttondiv").attr('onClick','applyProject()');
			$("#applybuttondiv").css('background-color','#00d8ff');
			
			
			var innerHtml='<p style="font-size:15px; margin:5px 0px;font-weight:bold;">프로젝트 지원하기</p><p style="font-size:12px;font-weight:bold;">소신있는 지원 부탁드립니다!!</p>';
			
			$("#applybuttondiv").html(innerHtml);
			
			var appvalue;
			var num;
			appvalue=$("#appvalue").text();
			num=Number(appvalue);
			num=num-1;
			$("#appvalue").text(num);
			

			
			return false;
			}
			
			else{
			alert("취소가 실패하였습니다.");
			return false;
			}
			
			}
		});
		
		
	}
</script>
</head>

<body>

<header id="main_header">
	<hgroup id="title"><a href="/hooray/home/homepage.do"><font color="#003399">Hooray.</font></a></hgroup>
	
	<div id="searchdiv">
	<select id="search_select">
	<option>작성자</option>
	<option>제목</option>
	</select>
	<input id="search_project" type="text" size="50" placeholder="프로젝트 검색"/>
	<input type="button" id="search_button" value="검색" />
	</div>
	
	
	
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
	
	<br/>
	
	<div id="content">
		
	<section id="main_section">
	<div id="topdiv">
	<h2>${ aProject.maintitle }</h2>
	<h3>${ aProject.subtitle }</h3>	
	</div>
	<div id="bottomdiv">
	
	<c:if test="${chooseFlag==1 }">
	<a href="/hooray/project/getaproject.do?projectNum=${aProject.projectNum}&flag=1"><font
					color="#00d8ff">프로젝트 소개</font></a>&nbsp;&nbsp;
	<a href="/hooray/project/getcommentfirst.do?projectNum=${aProject.projectNum}&flag=2">댓글달기(${commentCount})</a>&nbsp;&nbsp;
	<a href="/hooray/project/getapplicant.do?projectNum=${aProject.projectNum}&flag=3">지원자(${ aProject.currentpeople })</a> 
	</c:if>
	
	
	</div>
	</section>
		
	<div id="subcontentdiv">
	<section id="sub_section">
	<img src="../memberimages/${aProject.email}/${aProject.projectNum}/1.jpg">
	<br/><br/>
	<div id="projectcontentdiv">
	${aProject.content}
	</div>
	</section>
	<aside id="sub_aside">
	

	<div id="buttondiv">
	<c:if test="${ aProject.email == email }">
	<input type="button" id="fixbutton" onclick="window.location='getaprojectforupdate.do?projectNum=${aProject.projectNum }'" value="수정"/>
	<input type="button" id="deletebutton" value="삭제"/>
	</c:if>
	</div>

	
	<div id="projectinfordiv">
	<p style="font-size:13px">남은 시간</p>
	<p style="font-size:20px">${aProject.leavedate}일</p>
	<br/>
	<p style="font-size:13px">기한</p>
	<p style="font-size:20px">${aProject.period}까지</p>
	<br/>
	<p style="font-size:13px">지원자</p>
	<p style="font-size:20px">${aProject.currentpeople}명/${aProject.limitpeople}명</p>
	<br/>
	<p style="font-size:13px">등록일</p>
	
	<p style="font-size:20px"><fmt:formatDate value="${aProject.regdate}" type="DATE" pattern="yyyy-MM-dd" /></p>
	<br/>

	<c:if test="${applyflag != 1 && email!=aProject.email}">
	<div id="applybuttondiv" onclick="applyProject()" style="background-color:#00d8ff;">
	<p style="font-size:15px; margin:5px 0px;font-weight:bold;">프로젝트 지원하기</p>
	<p style="font-size:12px;font-weight:bold;">소신있는 지원 부탁드립니다!!</p>
	</div>
	</c:if>
	<c:if test="${applyflag == 1 && email!=aProject.email}">
	<div id="applybuttondiv" onclick="cancelProject()" style="background-color:#5F00FF;">
	<p style="font-size:15px; margin:5px 0px;font-weight:bold;">프로젝트 취소하기</p>
	<p style="font-size:12px;font-weight:bold;">책임있는 취소 부탁드립니다!!</p>
	</div>
	</c:if>
	
	<input type="text" value="${aProject.email }" style="display:none;" id="projectemail"/>
	<input type="text" value="${email}" style="display:none;" id="memberemail"/>
	<input type="text" value="${aProject.projectNum}" style="display:none;" id="projectNum"/>
	</div>
	
	</aside>
	</div>	
		
		</aside>	
		
	</div>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
<footer id="main_footer">
<h3>Copy Right. Hooray.</h3>
</footer>	

</body>
</html>