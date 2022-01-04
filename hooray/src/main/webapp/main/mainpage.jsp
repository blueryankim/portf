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
<title>Hooray에 오신 것을 환영합니다.</title>
<meta name="viewport" content="width=device-width,initial-scale=1">

   <link rel="stylesheet" href="../flickity/dis/flickity.css" media="screen"/>
   <link rel="stylesheet" href="https://npmcdn.com/flickity@1.1/dist/flickity.css">
   
   
   

<style>
	
	
	* {
		margin:0;
		padding:0;
	}

	#content{
		width:1100px;  margin:0 auto;
		overflow:hidden;
	}

	#first_content{
		position:relative;
		width:1100px; height:400px;
		margin: 0px auto;
		overflow: hidden;
		
		
	}
	
	#aside_content{
		position:relative;
		margin:0px; padding:0px;
	}
	
	
	#logo{
		position:relative;
		left:10px; top:9px;
		color:black;
	}
	

	
	#first_content > #main_section{
		width:1100px;
		height:390px;
	

	}
	
	#main_bottom{
		width: 1150px;
		margin: 0px auto;
		overflow: hidden;
	
	}
	
</style>

<style>

	 a{
	    text-decoration:none;
	 	color:black;
	 }
	
	
	.b-project-card{
			width:210px; height:380px;
			background-color:white;
			margin:0px 4px; padding:0px;
			float:left;
			border:1px solid #dcdcdc;
			
			}
			
	.b-project-card__head{
			margin:0px; padding:0px;
	}
	
	.b-project-card__head__pic{
			width:210px;
			height:130px;
			margin:0px;
			padding:0px;
	
	}
	
	.b-project-card__body{
			
			padding:0 10px;
			width:190px;
			height:140px;
			text-align:center;
		}
	

	
	.b-project-card__title{
			margin:10px 0px 0px 0px; 
		 	 font-size:14px; 
		 	 color:black;
		 	 width:190px;
		 	 height:40px;
		 	 hidden:overflow;
		 }
	
	.b-project-card__creator{
		font-size:12px;
		font-weight:bold;
		margin:5px 0px 0px 0px;

	}
			
	.b-project-card__blurb{
		font-size:11px;
		margin:5px 0px 0px 0px;
	}
	
	.b-project-card__figures{
			margin:5px 10px;
	}
	
	.b-project-card__figure-title{
		font-size:10px;
		margin:5px 5px;
		
	}
    .b-project-card__figure-item{
    	font-size:10px;
    	margin:5px 5px;
    	
    
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
    
    ul{list-style:none;
    	
    }
        
    #main_header > #title{
    	position:absolute;
    	left:10px;
    	top:0px;
    	font-weight:bold;
    	height:35px;
    	font-size:23px;
    }
    
    #main_nav > a{
    	color:#003399;
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
    border:1px solid #003399;
    border-radius:0;
    outline-style:none;
    background-color:#003399;
    color:white;
  
	}
    
   #emaildiv{
   		position:absolute;
   		right:300px; top:7px;
   		font-size:14px;
   		color:#4C4C4C;
   		
   } 
  #main_nav{
    	position:absolute;
    	right:10px; top:3px;
    	
   }
   
   #main_nav > ul > li> a:hover{
   		background:#00d8ff;
   		color:white;
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
    
    #main_footer{
    	width:100%;
    	height:20px;
    	margin:0 auto;
    	margin-bottom:10px;
    	background-color:white;
    	color:#003399;
    	font-size:13px;
    	text-align:center;
		border-top:1px solid #dcdcdc;
  
    	
    }
    

	
	 .gallery-cell{
    	
    	width:100%;
    	height:390px;
    	margin-right:10px;
    }
	
	.flickity-page-dots {
  	bottom: 0px;
}

	.flickity-page-dots .dot {
  width: 12px;
  height: 12px;
  opacity: 1;
  background: transparent;
  border: 2px solid white;
}
	
	.flickity-page-dots .dot.is-selected {
  background: white;
}

	#gallery-cell-content{
		color:white;
		font-size:20px;
		padding:140px 0px;
	}
	
	#projecttitle{
	text-align:center;
	}
	
	#hotlistmaintitle{
	 font-size:25px;
	 color:white;
	 font-weight:bold;
	}
	
	#hotlistsubtitle{
	color:white;
	font-weight:bold;
	}
	
	#projectcontent{
	bottom:0px;
	right:10px;
	position:absolute;
	font-size:15px;
	}
</style>


	


	
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="../flickity/dist/flickity.pkgd.min.js"></script>  	
<script src="https://npmcdn.com/flickity@1.1/dist/flickity.pkgd.min.js"></script>

  

  <script type="text/javascript">
    $(document).ready(function(){
 

    	$('.main-gallery').flickity({
    		  // options
    		  cellAlign: 'left',
    		  contain: true
    		});

    });
    
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
   
     </script>

</head>

<body bgcolor="white">
	
	<header id="main_header">
	<hgroup id="title"><a href="/hooray/home/homepage.do"><font color="#003399">Hooray.</font></a></hgroup>
	
	<form name="searchprojectform" id="searchprojectform" method="post" enctype="multipart/form-data" action="/hooray/project/getprojectselect.do">
	<div id="searchdiv">
	<select id="search_select" name="search_select">
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
	<br/>
	<div id="content">
	<div id="first_content">
	
	
	<section id="main_section">
		
	<div class="main-gallery">
<c:forEach var="vo" items="${ homeHotList }">
  <div class="gallery-cell" style="background-image: url(../memberimages/${vo.email}/${vo.projectNum}/1.jpg); background-size:100% 100%;">
  
  <div id="gallery-cell-content">
  <div id="projecttitle">
  <a href="/hooray/project/getaproject.do?projectNum=${vo.projectNum}&flag=1">
  <span id="hotlistmaintitle">${vo.maintitle}</span><br/>
  <span id="hotlistsubtitle">${vo.subtitle }</span>
  </a>
  </div>
  <div id="projectcontent">
  ${vo.name }의 프로젝트   조회수:${vo.count }
  </div>
  
  </div>
  </div>
  </c:forEach>

</div>
	  

	</section>
	 </div>
	
	<div id="main_bottom">
	<h2>신간 프로젝트</h2>
	<br/>
	<c:forEach var="vo" items="${ homeNewList }">
	<div class="b-project-card"> 
	
  <figure class="b-project-card__head">
    <a class="b-project-card__head__link" href="/hooray/project/getaproject.do?projectNum=${vo.projectNum}&flag=1" onclick="plusCount(${vo.projectNum})">
      <div class="b-project-card__head__link__inner">
        <div class="b-project-card__head__filter"></div>
        <img src="../memberimages/${vo.email}/${vo.projectNum}/1.jpg" alt="" class="b-project-card__head__pic" />
      </div>
    </a>
  </figure>

<div class="b-project-card__body"> 
    <h3 class="b-project-card__title">
      <a href="/peace" class="[ yoke yoke--theme_light ]">${vo.maintitle }</a>
    </h3>
    <p class="b-project-card__creator">
     ${vo.name }의 프로젝트
    </p>
    <p class="b-project-card__blurb">
     ${vo.subtitle }
    </p>
  </div> 
  <div class="b-project-card__gauge [ b-gauge ]">
    <div class="b-gauge__liquid" style="width: 100%"></div>
  </div> 
  <div class="b-project-card__figures">

  <div class="[ b-project-card__figure b-project-card__figure_for_amount ]">
      <span class="b-project-card__figure-title"><b>참여 인원</b></span>
      <span class="b-project-card__figure-item">
        ${vo.currentpeople }/${vo.limitpeople}명
        <span class="b-project-card__percentage">
          
        </span>
      </span>
    </div>
    
  
    <div class="[ b-project-card__figure b-project-card__figure_for_day ]">
        <span class="b-project-card__figure-title"><b>남은시간</b></span>
        <span class="b-project-card__figure-item">
          ${vo.leavedate+1 }일
        </span>
    </div>
    
      <div class="[ b-project-card__figure b-project-card__figure_for_amount ]">
      <span class="b-project-card__figure-title"><b>지역</b></span>
      <span class="b-project-card__figure-item">
   		${vo.state }
      
        <span class="b-project-card__percentage">
          
        </span>
      </span>
    </div>
    <div class="[ b-project-card__figure b-project-card__figure_for_day ]">
        <span class="b-project-card__figure-title"><b>종류</b></span>
        <span class="b-project-card__figure-item">
      	<c:if test="${vo.categori == 1}">자원봉사</c:if>
      	<c:if test="${vo.categori == 2}">재능기부</c:if>
      	<c:if test="${vo.categori == 3}">공연,행사</c:if>
      	<c:if test="${vo.categori == 4}">상품판매</c:if>
        </span>
    </div>
    
    
  </div>
</div>
</c:forEach>
	
	<!-- keep -->
	</div>
	</div>
	<br/>
	<br/>

<footer id="main_footer">
<h3>Copy Right. Hooray.</h3>
</footer>	



    

	
</body>
</html>