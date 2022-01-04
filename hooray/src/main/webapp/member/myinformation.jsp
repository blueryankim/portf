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
<title>나의 정보</title>
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>

	html {
    position: relative;
    height: 100%;
    overflow:hidden;
}

	body{
	

    height: 100%;
    overflow:hidden;
	
	}

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
    	height:26px;
 		margin:3px 0px;
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
 
    
    #main_nav > ul{
    	overflow:hidden;
    	
    }
    
    #text{
    	font-size:12px;
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
    	height:100%;
    	margin:0 auto;
    	overflow:hidden;
    }    
    
    
     #main_aside{
   	width:300px;
   	height:100%;
   	border-right:1px solid #dcdcdc;
   	float:left;
   	position:relative;
   	padding:10px 10px;
   }
   
   #aside_top{
   width:310px;
   height:140px;
   
   }
   
   
   
   #aside_bottom{
   	width:300px;
   	height:100%;
   	text-align:center;
   	font-size:14px;
   	line-height:25px;
   	font-weight:bold;
   	margin:10px 0px;
   }
   
   #aside_bottom p{
      line-height:15px;
       font-size:14px;
   }
   
   #aside_top > #imagearea{
   
   float:left;
   }
   
   #imagearea > #imagechangebutton{
   
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
   
   
   #myinformationdiv{
  

   width:170px;
   padding:10px;
   float:right;
   margin:0px 23px 0px 5px;
   
   }
   
   #myinformationdiv p{
      line-height:10px;
       font-size:13px;
     
   }
   
   #main_section{
    width:1000px;
    height:100%;
    text-align:center;
    position:relative;
	margin:0 auto;
    overflow:hidden;
    
    	
    }
    
    
    #maincontentdiv{
    width:900px;
    height:auto;
  	margin:130px auto;
    }
    
    #sub_nav{
    height:40px;
    width:390px;
    position:absolute;
    right:0;
    top:0;
    
    }
    
    #sub_nav > ul{
    	overflow:hidden
    }
    
    #sub_nav > ul > li{
    	float:right;
    	font-size:12px;
    	
    }
    
    #sub_nav > ul > li > a{
    	display:block;
    	padding:10px 20px;
    	border: 1px solid black;
    	
   	}
   	
  
    
 
  
     
     #main_footer{
     
     	margin-bottom:0px;
     	width:100%;
     	height:30px;
    	background-color:white;
    	color:#003399;
    	
    	text-align:center;
    	border-top:1px solid #dcdcdc;
    	position: absolute;
    	left: 0;
    	bottom: 0;
    }
		
	
</style>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript">

	
	$(document).ready(function(){
 		

	
		
		setInterval('autoGetMyInfor()',4000);
	


	 	
	 	});
	
    
    var flag=0;
    
    
    function autoGetMyInfor(){
    
    	$.ajax({
    		data:false,
    		type:"GET",
    		url:"/hooray/member/automyinformation.do",
    		dataType:"json",
    		contentType:"application/json; charset=utf-8",
    		cache:false,
    		contentType:false,
    		processData:false,
    		success:function(data){
    		
    			
    		var plist=data.pList;
    		
    		for(var i=0;i<plist.length;i++){
    			
    			var projectNum=plist[i].projectNum;
    			var unreadcount=plist[i].unreadcount;
    			var chattingpeople=plist[i].onchattingpeople;
    			if(unreadcount>=1){
    			$("#"+projectNum+"button").val(unreadcount);
    			$("#"+projectNum+"button").css("display","inline");
    			}
    			
    			$("#"+projectNum+"span").text(chattingpeople);
    			
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
 	

 	
 	function cantOpenChattingRoom(){
 		var email;
 		var projectemail;
 		var projectNum;
 		email=$("#memberemail").val();
 		projectemail=$("#projectemail").val();
 		projectNum=$("#projectNum").val();
 		if(email==null || email==""){
 			
 			alert("로그인을 해주세요.");
 			return false;
 		}
 		
 		if(email==projectemail){
 			
 			
 	 		window.open('/hooray/chatting/getchamessagefirst.do?projectNum='+projectNum+'','','width=280, height=460, scrollbars=no, menubar=no, location=no, resizable=no');

 		}
 		
 		else{
 		alert("프로젝트에 참여한 사람만 알림방 입장이 가능합니다.");
 		return false;
 		}
 	}
 	
 	
 	  function searchProjectsValidation(){
 	    	if($("#search_select").val()==null || $("#search_select").val()==""){
 	    		alert("검색 목록을 선정해주세요.");
 	    		return false;
 	    	}
 	    	
 	    	if($("#search_project").val()==null || $("#search_project").val()==""){
 	    		alert("검색 내용을 작성해주세요.");
 	    		return false;
 	    		
 	    	}
 	    	
 	    	$("#searchprojectform").submit();
 	    }
	
 	  
 	 function openChattingRoom(projectNum){
  		
  		
  		window.open('/hooray/chatting/getchamessagefirst.do?projectNum='+projectNum+'','','width=280, height=460, scrollbars=no, menubar=no, location=no, resizable=no');
  		$("#"+projectNum+"button").css("display","none");
  		
 	 
 	 }
 	 
 	 function changeProfileImg(){
 		 
   		window.open('/hooray/member/profileimgchange.jsp','','width=400, height=150, scrollbars=no, menubar=no, location=no, resizable=no');

 	 }
 	 
 	  
</script>
</head>

<body >

<header id="main_header">
	<hgroup id="title"><a href="/hooray/home/homepage.do"><font color="#003399">Hooray.</font></a></hgroup>
	
	<form name="searchprojectform" id="searchprojectform" method="post" enctype="multipart/form-data" action="/hooray/project/getprojectselect.do">
	<div id="searchdiv">
	<select  id="search_select" name="search_select" style="color:black;">
	<option value="writer">작성자</option>
	<option value="title">제목</option>
	<option value="region">지역</option>
	</select>
	<input type="text" id="search_project" name="search_project" size="50" placeholder="프로젝트 검색"/>
	<input type="button" id="search_button" onclick="searchProjectsValidation()" value="검색" />
	</div>
	</form>
	
	
	
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
	

	
	<div id="content">
	
		<aside id="main_aside">
		<div id="aside_top"> 
		<div id="imagearea" style="width:110px; height:110px; background-image:url('../memberprofileimg/${myInformationVO.email}.jpg'); background-size:110px 110px; background-repeat: no-repeat;">
		<input id="imagechangebutton" onclick="changeProfileImg()" type="button" value="변경"/>
		
		</div>
		<div id="myinformationdiv">
		<p><b>이름:</b>${myInformationVO.name}</p>
		<p><b>이메일:</b></p>
		<p>${myInformationVO.email }</p>
		<p><b>봉사지수:</b>${myInformationVO.v_count }</p>
		<p><b>재능기부지수:</b>${myInformationVO.d_count }</p>
		
		</div>
		
		
		</div>
		<div id="aside_bottom">
		<p>나의 프로젝트(${myProjectCount})</p>
		<p>참여중인 프로젝트(${appProjectCount })</p>
		<p>마감 프로젝트(${endProjectCount})</p>
		</div>
	</aside>	
		
	<section id="main_section">
	<nav id="sub_nav">
	<ul>
		<c:if test="${flag==3 }">
		<li style="background:#D5D5D5;"><a href="/hooray/member/myinformation.do?flag=3">마감 프로젝트</a></li>
		<li><a href="/hooray/member/myinformation.do?flag=2">참여중인 프로젝트</a></li>
		<li><a href="/hooray/member/myinformation.do?flag=1">나의 프로젝트</a></li>
		</c:if>
		<c:if test="${flag==2 }">
		<li><a href="/hooray/member/myinformation.do?flag=3">마감 프로젝트</a></li>
		<li style="background:#D5D5D5;"><a href="/hooray/member/myinformation.do?flag=2">참여중인 프로젝트</a></li>
		<li><a href="/hooray/member/myinformation.do?flag=1">나의 프로젝트</a></li>
		</c:if>
		<c:if test="${flag==1 }">
		<li><a href="/hooray/member/myinformation.do?flag=3">마감 프로젝트</a></li>
		<li><a href="/hooray/member/myinformation.do?flag=2">참여중인 프로젝트</a></li>
		<li style="background:#D5D5D5;"><a href="/hooray/member/myinformation.do?flag=1">나의 프로젝트</a></li>
		</c:if>
		
	</ul>
	</nav>
	<div id="maincontentdiv">
	<div id="tablediv">
	<table class="table table-bordered">
	<c:if test="${flag==1 }">
	<caption>나의 프로젝트</caption>
	</c:if>
	<c:if test="${flag==2 }">
	<caption>참여중인 프로젝트</caption>
	</c:if>
	<c:if test="${flag==3 }">
	<caption>마감 프로젝트</caption>
	</c:if>
	<thead>
		<tr class="info">
			<th width='350px'>프로젝트</th>
			<th width='100px'>참여인원</th>
			<th width='100px'>남은 기한</th>
			<th width='250px'>실시간 채팅</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="vo" items="${projectList }">
	<tr>
		<td><a href="/hooray/project/getaproject.do?projectNum=${vo.projectNum}&flag=1" target="_blank">${vo.maintitle }</a></td>
		<td>${vo.currentpeople }명/${vo.limitpeople}명</td>
		<td>${vo.leavedate+1 }일</td>
			<td><div style="cursor: pointer; font-size:12px;" onclick="openChattingRoom(${vo.projectNum})">Hooray. Talk <br/><img src="../projectimage/user.png" style="width:15px; height:15px;">&nbsp;<span id="${vo.projectNum}span">${vo.onchattingpeople }</span>&nbsp;<c:if test="${vo.unreadcount >=1 }"><input type="button" id="${vo.projectNum}button" class="btn btn-danger btn-xs" value="${vo.unreadcount }"></c:if><c:if test="${vo.unreadcount <1}"><input type="button" id="${vo.projectNum}button" class="btn btn-danger btn-xs" value="" style="display:none;"></c:if></div></td>
	
		</tr>
	</c:forEach>	
	</tbody>		
	</table>
	</div>
	<div id="pagingdiv">
		<c:if test="${pP.isPre() }">
	<a href="myinformation.do?flag=${flag }&pageNum=${pP.getPage_Start()-pP.p_size }">[이전]</a>
	</c:if>
	<c:forEach var="counter" begin="${pP.getPage_Start() }" end="${pP.getPage_End() }">
	<a href="javascript:window.location='myinformation.do?flag=${flag }&pageNum=${counter}&flag=2'">[${counter }]</a>
	
	</c:forEach>
	<c:if test="${pP.isNext() }">
	<a href="myinformation.do?flag=${flag }&pageNum=${pP.getPage_Start()+pP.p_size }">[다음]</a>
	</c:if>
	</div>
	
	
	</div>
	</section>

	
	
	<a href="#"><div></div></a>
	
	</div>	
		
	
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
<footer id="main_footer">
<h3 style="font-size:15px;">Copy Right. Hooray.</h3>
</footer>	

</body>
</html>