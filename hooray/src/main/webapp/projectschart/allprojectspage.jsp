
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전체 프로젝트 보기</title>
<style>

html {
    position: relative;
    min-height: 100%;
}

* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: black;
}

#main_header {
	width: 100%;
	margin: 0 auto;
	height: 35px;
	color: white;
	border-bottom: 1px solid #dcdcdc;
	position: relative;
	background: white;
}

#main_header>#title {
	position: absolute;
	left: 10px;
	top: 0px;
	font-weight: bold;
	height: 35px;
	font-size: 23px;
}

#searchdiv {
	text-align: center;
}

#search_select {
	width: 100px;
	height: 27px;
	font-family: inherit;
	border-radius: 0px;
}

#search_project {
	margin: 3px 0px;
	width: 200px;
	height: 4px;
	line-height: normal;
	padding: .8em .5em;
	font-family: inherit;
	border-radius: 0;
	outline-style: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

#search_button {
	width: 50px;
	height: 27px;
	line-height: normal;
	cursor: pointer;
	font-family: inherit;
	border: 1px solid #003399;
	border-radius: 0;
	outline-style: none;
	background-color: #003399;
	color: white;
}

#main_nav {
	position: absolute;
	right: 10px;
	top: 3px;
}

#text {
	font-size: 12px;
}

#main_nav>ul {
	overflow: hidden;
}

#main_nav>ul>li {
	float: left;
	height: 25px;
	border-left: 1px solid white;
	border-right: 1px solid white;
}

#main_nav>ul>li>a {
	display: block;
}

#content {
	position: relative;
	width: 1200px;
	height: auto;
	margin: 0px auto;
	overflow: hidden;
}

#main_section {
	width: 900px;
	height: auto;
	float: left;
}

#contenttile {
	margin: 10px 78px;
}

#menuselectiondiv {
	width: 1180px;
	border-bottom: 1px solid #dcdcdc;
	font-size: 12px;
	text-align: center;
}

#menuselectiondiv>a {
	color: #5D5D5D;
	font-weight: bold;
	font-size: 13px;
}

#menuselectiondiv a:hover {
	text-decoration: underline;
	color: #00d8ff;
}

#main_aside {
	text-align: center;
	width: 190px;
	height: auto;
	float: right;
	margin: 45px 60px 0px 0px;
}

#aside_nv {
	font-size: 14px;
	font-weight: bold;
	line-height: 30px;
}

#aside_nv>#menu {
	font-size: 17px;
	font-weight: bold;
	color: white;
	background-color: #003399;
}

#aside_nv>ul {
	overflow: hidden;
}

#aside_nv>ul>li>a {
	display: block;
	padding: 2px 10px;
	color: #003399;
	border: 1px solid black;
	background-color: white;
}

#aside_nv>ul>li>a:hover {
	background: #00d8ff;
	color: white;
}

ul {
	list-style: none;
}

#allprojectsdiv {
	width: 900px;
	height: auto;
	margin: 0px 0px 0px 60px;
}

#allprojectsdiv>h2 {
	display: block;
	margin: 0px 0px 0px 16px;
	position: relative;
}

#main_footer {
	width: 100%;
	margin: 0 auto;
	background-color: white;
	color: #003399;
	font-size: 13px;
	text-align: center;
	border-top: 1px solid #dcdcdc;
	position: absolute;
    left: 0;
    bottom: 0;
}
</style>

<style>
.b-project-card {
	width: 210px;
	height: 380px;
	background-color: white;
	margin: 25px 25px;
	padding: 0px;
	float: left;
	border: 1px solid #dcdcdc;
}

.b-project-card__head {
	margin: 0px;
	padding: 0px;
}

.b-project-card__head__pic {
	width: 210px;
	height: 130px;
	margin: 0px;
	padding: 0px;
}

.b-project-card__body {
	padding: 0 10px;
	width: 190px;
	height: 140px;
	text-align: center;
}

.b-project-card__title {
	margin: 10px 0px 0px 0px;
	font-size: 14px;
	color: black;
	width: 190px;
	height: 40px;
	hidden: overflow;
}

.b-project-card__creator {
	font-size: 12px;
	font-weight: bold;
	margin: 5px 0px 0px 0px;
}

.b-project-card__blurb {
	font-size: 11px;
	margin: 5px 0px 0px 0px;
}

.b-project-card__figures {
	margin: 5px 10px;
}

.b-project-card__figure-title {
	font-size: 10px;
	margin: 5px 5px;
}

.b-project-card__figure-item {
	font-size: 10px;
	margin: 5px 5px;
}
</style>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
    
    var pageNum=1;
 
      function lastPostFunc()  
    {  
  
    	pageNum++;
    	var search_type=$("#search_type").val();
    	
    	var flag=$("#flag").val();
    	
    	if(flag==1){
    	
    	
    	$.ajax({
    		data:false,
    		type:"GET",
    		url:"/hooray/project/getprojectsajax.do?num="+pageNum+"&search_type="+search_type,
    		dataType:"json",
    		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
    		cache:false,
    		contentType:false,
    		processData:false,
    		success:function(data){

    		$("#search_type").val(data.search_type);	
    		
    		var pL=data.projectList;
    	
    		var categori;
 
 
    		for(var i=0; i<pL.length;i++){
    			
    			if(pL[i].categori==1)
    				categori="자원봉사";
    			else if(pL[i].categori==2)
    				categori="재능기부";
    			else if(pL[i].categori==3)
    				categori="공연,행사";
    			else
    				categori="상품판매";
    			
    	
			
    			var $addDiv=$('<div class="b-project-card"></div>');	
   				var innerHtml='<figure class="b-project-card__head"><a class="b-project-card__head__link" href="/hooray/project/getaproject.do?projectNum='+pL[i].projectNum+'&flag=1"><div class="b-project-card__head__link__inner"><div class="b-project-card__head__filter"></div><img src="../memberimages/'+pL[i].email+'/'+pL[i].projectNum+'/1.jpg" alt="" class="b-project-card__head__pic" /></div></a></figure>';
   				var innerHtml2='<div class="b-project-card__body"><h3 class="b-project-card__title"><a href="/peace" class="[ yoke yoke--theme_light ]">'+pL[i].maintitle+'</a></h3><p class="b-project-card__creator">'+pL[i].name+'의 프로젝트</p><p class="b-project-card__blurb">'+pL[i].subtitle+'</p></div><div class="b-project-card__gauge [ b-gauge ]"><div class="b-gauge__liquid" style="width: 100%"></div></div><div class="b-project-card__figures">';
 				var innerHtml3='	<div class="[ b-project-card__figure b-project-card__figure_for_amount ]"><span class="b-project-card__figure-title"><b>참여 인원</b></span> <span class="b-project-card__figure-item">'+pL[i].currentpeople+'/'+pL[i].limitpeople+'명<span class="b-project-card__percentage"> </span></span></div><div class="[ b-project-card__figure b-project-card__figure_for_day ]"><span class="b-project-card__figure-title"><b>남은시간</b></span> <span class="b-project-card__figure-item">'+(pL[i].leavedate+1)+'일 </span></div>';	
    			var innerHtml4='	<div class="[ b-project-card__figure b-project-card__figure_for_amount ]"><span class="b-project-card__figure-title"><b>지역</b></span> <span class="b-project-card__figure-item">'+pL[i].state+'<span class="b-project-card__percentage"> </span></span></div><div class="[ b-project-card__figure b-project-card__figure_for_day ]"><span class="b-project-card__figure-title"><b>종류</b></span> <span class="b-project-card__figure-item">'+categori+'</span></div></div>';
  
    			$addDiv.html($addDiv.html()+innerHtml+innerHtml2+innerHtml3+innerHtml4);
				
    	        $(".b-project-card:last").after($addDiv);   
    	        

    		}
    		
    		}
    	});
    
    	}
    	
    	
    	if(flag==2){
    		
    		var projectKind=$("#projectKind").val();
    		$.ajax({
        		data:false,
        		type:"GET",
        		url:"/hooray/project/getprojectskindajax.do?num="+pageNum+"&search_type="+search_type+"&projectKind="+projectKind,
        		dataType:"json",
        		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        		cache:false,
        		contentType:false,
        		processData:false,
        		success:function(data){

        		$("#search_type").val(data.search_type);	
        		
        		var pL=data.projectList;
        	
        		var categori;
     
     
        		for(var i=0; i<pL.length;i++){
        			
        			if(pL[i].categori==1)
        				categori="자원봉사";
        			else if(pL[i].categori==2)
        				categori="재능기부";
        			else if(pL[i].categori==3)
        				categori="공연,행사";
        			else
        				categori="상품판매";
        			
        	
    			
        			var $addDiv=$('<div class="b-project-card"></div>');	
       				var innerHtml='<figure class="b-project-card__head"><a class="b-project-card__head__link" href="/hooray/project/getaproject.do?projectNum='+pL[i].projectNum+'&flag=1"><div class="b-project-card__head__link__inner"><div class="b-project-card__head__filter"></div><img src="../memberimages/'+pL[i].email+'/'+pL[i].projectNum+'/1.jpg" alt="" class="b-project-card__head__pic" /></div></a></figure>';
       				var innerHtml2='<div class="b-project-card__body"><h3 class="b-project-card__title"><a href="/peace" class="[ yoke yoke--theme_light ]">'+pL[i].maintitle+'</a></h3><p class="b-project-card__creator">'+pL[i].name+'의 프로젝트</p><p class="b-project-card__blurb">'+pL[i].subtitle+'</p></div><div class="b-project-card__gauge [ b-gauge ]"><div class="b-gauge__liquid" style="width: 100%"></div></div><div class="b-project-card__figures">';
     				var innerHtml3='	<div class="[ b-project-card__figure b-project-card__figure_for_amount ]"><span class="b-project-card__figure-title"><b>참여 인원</b></span> <span class="b-project-card__figure-item">'+pL[i].currentpeople+'/'+pL[i].limitpeople+'명<span class="b-project-card__percentage"> </span></span></div><div class="[ b-project-card__figure b-project-card__figure_for_day ]"><span class="b-project-card__figure-title"><b>남은시간</b></span> <span class="b-project-card__figure-item">'+(pL[i].leavedate+1)+'일 </span></div>';	
        			var innerHtml4='	<div class="[ b-project-card__figure b-project-card__figure_for_amount ]"><span class="b-project-card__figure-title"><b>지역</b></span> <span class="b-project-card__figure-item">'+pL[i].state+'<span class="b-project-card__percentage"> </span></span></div><div class="[ b-project-card__figure b-project-card__figure_for_day ]"><span class="b-project-card__figure-title"><b>종류</b></span> <span class="b-project-card__figure-item">'+categori+'</span></div></div>';
      
        			$addDiv.html($addDiv.html()+innerHtml+innerHtml2+innerHtml3+innerHtml4);
    				
        	        $(".b-project-card:last").after($addDiv);   
        	        

        		}
        		
        		}
        	});
    		
    		}
    	
    	
    	if(flag==3){
    		var searchselect=$("#searchselect").val();
    		var searchproject=$("#searchproject").val();
    		
    		$.ajax({
        		data:false,
        		type:"GET",
        		url:"/hooray/project/getprojectsselectajax.do?num="+pageNum+"&searchselect="+searchselect+"&searchproject="+searchproject,
        		dataType:"json",
        		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
        		cache:false,
        		contentType:false,
        		processData:false,
        		success:function(data){

        		$("#search_type").val(data.search_type);	
        		
        		var pL=data.projectList;
        	
        		var categori;
     
     
        		for(var i=0; i<pL.length;i++){
        			
        			if(pL[i].categori==1)
        				categori="자원봉사";
        			else if(pL[i].categori==2)
        				categori="재능기부";
        			else if(pL[i].categori==3)
        				categori="공연,행사";
        			else
        				categori="상품판매";
        			
        	
    			
        			var $addDiv=$('<div class="b-project-card"></div>');	
       				var innerHtml='<figure class="b-project-card__head"><a class="b-project-card__head__link" href="/hooray/project/getaproject.do?projectNum='+pL[i].projectNum+'&flag=1"><div class="b-project-card__head__link__inner"><div class="b-project-card__head__filter"></div><img src="../memberimages/'+pL[i].email+'/'+pL[i].projectNum+'/1.jpg" alt="" class="b-project-card__head__pic" /></div></a></figure>';
       				var innerHtml2='<div class="b-project-card__body"><h3 class="b-project-card__title"><a href="/peace" class="[ yoke yoke--theme_light ]">'+pL[i].maintitle+'</a></h3><p class="b-project-card__creator">'+pL[i].name+'의 프로젝트</p><p class="b-project-card__blurb">'+pL[i].subtitle+'</p></div><div class="b-project-card__gauge [ b-gauge ]"><div class="b-gauge__liquid" style="width: 100%"></div></div><div class="b-project-card__figures">';
     				var innerHtml3='	<div class="[ b-project-card__figure b-project-card__figure_for_amount ]"><span class="b-project-card__figure-title"><b>참여 인원</b></span> <span class="b-project-card__figure-item">'+pL[i].currentpeople+'/'+pL[i].limitpeople+'명<span class="b-project-card__percentage"> </span></span></div><div class="[ b-project-card__figure b-project-card__figure_for_day ]"><span class="b-project-card__figure-title"><b>남은시간</b></span> <span class="b-project-card__figure-item">'+(pL[i].leavedate+1)+'일 </span></div>';	
        			var innerHtml4='	<div class="[ b-project-card__figure b-project-card__figure_for_amount ]"><span class="b-project-card__figure-title"><b>지역</b></span> <span class="b-project-card__figure-item">'+pL[i].state+'<span class="b-project-card__percentage"> </span></span></div><div class="[ b-project-card__figure b-project-card__figure_for_day ]"><span class="b-project-card__figure-title"><b>종류</b></span> <span class="b-project-card__figure-item">'+categori+'</span></div></div>';
      
        			$addDiv.html($addDiv.html()+innerHtml+innerHtml2+innerHtml3+innerHtml4);
    				
        	        $(".b-project-card:last").after($addDiv);   
        	        

        		}
        		
        		}
        	});
    		
    	}
    
    }
       

    $(window).scroll(function(){  
   
            if  ($(window).scrollTop() == $(document).height() - $(window).height()){  
               lastPostFunc();  
            
            }  
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
<body bgcolor="#F6F6F6">


	<header id="main_header"> <hgroup id="title">
	<a href="/hooray/home/homepage.do"><font color="#003399">Hooray.</font></a></hgroup>

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
	</nav></header>

	<br />
	<div id="content">




		<div id="menuselectiondiv">

			<c:if test="${search_type == 'latest'}">
				<a href="/hooray/project/getprojectsfirst.do?search_type=latest"><font
					color="#00d8ff">최신순</font></a>&nbsp;&nbsp;
		<c:if test="${ email !=null }">
		<a href="/hooray/project/getprojectsfirst.do?search_type=popular">인기순</a>&nbsp;&nbsp;
		</c:if>
		</c:if>

			<c:if test="${search_type == 'popular'}">
				<a href="/hooray/project/getprojectsfirst.do?search_type=latest">최신순</a>&nbsp;&nbsp;
			<c:if test="${ email !=null }">
		<a href="/hooray/project/getprojectsfirst.do?search_type=popular"><font
					color="#00d8ff">인기순</font></a>&nbsp;&nbsp;
						</c:if>
		</c:if>
		</div>

		<br />
		<div id="contenttile">
			<h2>프로젝트 보기</h2>
		</div>

		<section id="main_section"> <br />
		<div id="allprojectsdiv">

			<!-- projets 시작 -->
			<c:forEach var="vo" items="${ projectList }">
				<div class="b-project-card">

					<figure class="b-project-card__head"> <a
						class="b-project-card__head__link"
						href="/hooray/project/getaproject.do?projectNum=${vo.projectNum}&flag=1">
						<div class="b-project-card__head__link__inner">
							<div class="b-project-card__head__filter"></div>
							<img src="../memberimages/${vo.email }/${vo.projectNum}/1.jpg"
								alt="" class="b-project-card__head__pic" />
						</div>
					</a> </figure>

					<div class="b-project-card__body">
						<h3 class="b-project-card__title">
							<a href="/peace" class="[ yoke yoke--theme_light ]">${vo.maintitle}</a>
						</h3>
						<p class="b-project-card__creator">${vo.name}의 프로젝트</p>
						<p class="b-project-card__blurb">${vo.subtitle}</p>
					</div>
					<div class="b-project-card__gauge [ b-gauge ]">
						<div class="b-gauge__liquid" style="width: 100%"></div>
					</div>
					<div class="b-project-card__figures">

						<div
							class="[ b-project-card__figure b-project-card__figure_for_amount ]">
							<span class="b-project-card__figure-title"><b>참여 인원</b></span> <span
								class="b-project-card__figure-item"> ${vo.currentpeople }/${vo.limitpeople}명
								<span class="b-project-card__percentage"> </span>
							</span>
						</div>
						<div
							class="[ b-project-card__figure b-project-card__figure_for_day ]">
							<span class="b-project-card__figure-title"><b>남은시간</b></span> <span
								class="b-project-card__figure-item"> ${vo.leavedate+1}일 </span>
						</div>

						<div
							class="[ b-project-card__figure b-project-card__figure_for_amount ]">
							<span class="b-project-card__figure-title"><b>지역</b></span> <span
								class="b-project-card__figure-item"> ${vo.state } <span
								class="b-project-card__percentage"> </span>
							</span>
						</div>
						<div
							class="[ b-project-card__figure b-project-card__figure_for_day ]">
							<span class="b-project-card__figure-title"><b>종류</b></span> <span
								class="b-project-card__figure-item"> <c:if
									test="${vo.categori == 1}">자원봉사</c:if> <c:if
									test="${vo.categori == 2}">재능기부</c:if> <c:if
									test="${vo.categori == 3}">공연,행사</c:if> <c:if
									test="${vo.categori == 4}">상품판매</c:if>
							</span>
						</div>




					</div>
				</div>
			
			</c:forEach>
			<!-- projets 끝 -->

			<div id="lastPostsLoader">
			<input type="text" id="search_type" value="${search_type}" style="display:none;"/>
			<input type="text" id="flag" value="${flag }" style="display:none;"/>
			<input type="text" id="searchselect" value="${searchselect}" style="display:none;"/>
			<input type="text" id="searchproject" value="${searchproject }" style="display:none;"/>
			<input type="text" id="projectKind" value="${projectKind}" style="display:none;"/>
 			</div>


		</div>
		</section>
		<aside id="main_aside"> <nav id="aside_nv">
		<p id="menu">프로젝트 대분류</p>
		<ul>
			<li><a href="/hooray/project/getprojectkind.do?search_type=${search_type}&projectkind=1">자원봉사</a></li>
			<li><a href="/hooray/project/getprojectkind.do?search_type=${search_type}&projectkind=2">재능기부</a></li>
			<li><a href="/hooray/project/getprojectkind.do?search_type=${search_type}&projectkind=3">공연·행사</a></li>
			<li><a href="/hooray/project/getprojectkind.do?search_type=${search_type}&projectkind=4">상품 판매</a></li>
		</ul>
		</nav> </aside>
	</div>
	<br/><br/><br/>

	<footer id="main_footer">
	<h3>Copy Right. Hooray.</h3>
	</footer>

</body>
</html>