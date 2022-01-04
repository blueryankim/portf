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
<title>프로젝트 댓글달기</title>
<style>

	html {
    position: relative;
    min-height: 100%;
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
    	width:1050px;
    	height:auto;
    	margin: 20px auto;
		overflow: hidden;
    }
    
    #sub_section{
    	width:700px;
    	height:auto;
    	float:left;
    	margin:0px 20px 0px 0px;
    }
 
 	 #inputcommentdiv{
    	width:700px;
    	height:100px;
    	border:1px solid black;
    	position:relative;
    }
    
    #commentlistdiv{
    	width:700px;
    	height:auto;
    	position:relative;
    	margin:10px 0px;
    	
    }
    
    #commentlistdiv > div{
    	width:700px;
    	height:80px;
    	background-color:#F6F6F6;
    	margin:10px 0px;
    	
    	
    }
    
    #commentlistdiv > div > #imagearea{
    	width:80px;
    	height:80px;
    	float:left;
    }
    
    #imagearea img{
    	width:80px;
    	height:80px;
    }
    
	#commentlistdiv > div > #commentarea{

		width:610px;
		height:80px;
		float:right;
		
	}
	
	#main{
		width:610px;
		height:60px;
		position:relative;
	}
	
	#sub{
		width:610px;
		height:20px;
		font-size:13px;
	}
	
	#main #writer{
		font-size:14px;
		font-weight:bold;
		
	}
	
	#main #commentinfor{
		position:absolute;
		right:10px;
		font-size:11px;
		font-weight:bold;
		
	}
	
	#main p{
		font-size:12px;
		padding:6px;
	}
	
	
	
    #inputcommentdiv #comment{
    	width:580px;
    	height:77px;
    	display:inline;
    	line-height:normal;
    	padding:.8em .5em;
    	font-family:inherit;
    	border:1px solid #999;
    	outline-style:none;
    	-webkit-appearance:none;
    	-moz-appearance:none;
    	appearance:none;
 		
	}   
    
    #inputcommentdiv #inputbutton{
    	width:100px;
    	height:100px;
    	line-height:normal;
    	cursor:pointer;
    	font-family:inherit;
    	border:1px solid #A6A6A6;
    	border-radius:0;
    	outline-style:none;
    	background-color:#A6A6A6;
    	color:white;
    	position:absolute;
    	right:0px;
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
    	position: absolute;
    	left: 0;
    	bottom: 0;
    }
		
		
	#tempbuttonarea input[type=button]{
	text-align:center;
  	vertical-align:middle;
  	width:50px;
   	height:30px;
   	margin:12px 0px 0px 4px ;
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
   	
	}	
	
</style>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript">

    var flag=0;
    
    

    $.fn.selectRange = function(start, end) {
    	return this.each(function() {
    		if(this.setSelectionRange) {
    			this.focus();
    			this.setSelectionRange(start, end);
    		}
    		else if(this.createTextRange) {
    			var range = this.createTextRange();
    			range.collapse(true);
    			range.moveEnd('character', end);
    			range.moveStart('character', start);
    			range.select();
    		}
    	});
    };
    
    
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
	
	if(memberemail==""||memberemail==null){
		alert("프로젝트에 참여하기 위해서 로그인을 해주세요.");
		return false;
	}
	

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
    		$(location).attr("href","/hooray/project/getcommentfirst.do?projectNum="+pnum+"&flag=2");
			return false;
			}

			else{
			alert("참여에 실패하였습니다.(정원초과, 서버에러, 프로젝트 기한 초과)");	
			return false;
			}
			
			}
		});
		
	}


	function clickTextarea(){
		var sessionemail=$("#memberemail").val();
		if(sessionemail==null||sessionemail=="")
			{
			alert("댓글을 남기기 위해서 로그인을 해주세요.");
			 $("#comment").attr("disabled",true);
			}
		
		else{
			
			var projectNum=$("#projectNum").val();
			
			
			
		}
		
		
	}
	

	
	
	function regComment(){
		
		var sessionemail=$("#memberemail").val();
		
		if(sessionemail==null||sessionemail==""){
			alert("댓글을 남기기 위해서 로그인을 해주세요.");
			return false;
			}
		
			
		if($("#comment").val()==null || $("#comment").val()==""){
			alert("댓글 내용을 입력해주세요.");
			$("#comment").focus();
			return false;
			}
			
		if($("#comment").val().length >100){
			alert("댓글은 100자 이상 작성할 수 없습니다.");
			$("#comment").focus();
				
				
			var comment=$("#comment").val();
			var commentLength;
			commentLength=$("#comment").val().length;
			commentLength=commentLength-100;
			comment.splice(100,commentLength);
			$("#comment").val(comment);
			return false;
			}
		
		
			flag++;
			var projectNum=$("#projectNum").val();
			var comment=$("#comment").val();
			var data=new FormData();
			
			data.append("projectNum",projectNum);
			data.append("comment",comment);
			data.append("flag",flag);
			
			$.ajax({
				data:data,
				type:"POST",
				url:"/hooray/project/getcomment.do",
				dataType:"json",
				contentType:"application/json; charset=utf-8",
				cache:false,
				contentType:false,
				processData:false,
				success:function(data){
					//console.log(new Date().format("yyyy년 MM월 dd일 a/p hh시 mm분 ss초"));

				
				
				var cL=data.cList;
				var date;
				
				for(var i=0; i<cL.length;i++){
				
					$addDiv=$('<div id="commentdiv'+cL[i].commentNum+'"></div>');
					var innerHtml='<div id="imagearea"><img src="../memberprofileimg/'+cL[i].email+'.jpg"/></div><div id="commentarea"><div id="main"><span id="writer">';
					var innerHtml2=cL[i].name+'</span><span id="commentinfor"><a href="javascript:;" onclick="rewrite('+cL[i].commentNum+')" id="sujung'+cL[i].commentNum+'"><font color="#003399">수정하기</font></a>&nbsp;';
					var innerHtml3='<a href="javascript:;" onclick="deleteComment('+cL[i].commentNum+')"><font color="#003399">삭제하기</font></a>&nbsp;<a href="#">&nbsp;';
					var innerHtml4='<font color="#003399">'+cL[i].date+'</font></span><div id="rewritecomment'+cL[i].commentNum+'"><p id="commentcontent'+cL[i].commentNum+'">'+cL[i].comment+'</p></div></div></div></div><br/>';
				
					
	    			$addDiv.html($addDiv.html()+innerHtml+innerHtml2+innerHtml3+innerHtml4);

					
	    	        $("#commentlistdiv").children("div:first").before($addDiv);  

				
				}
					$("#comment").val("");
					$("#commentCount").text(data.commentCount);

				
				}
			});
			
			
			
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
			
			$("#applybuttondiv").html($(innerHtml));
		
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

	var comment;
	
	function rewrite(commentnum){
		
	//commentcontent 구별
	
	$("#sujung"+commentnum).css("display","none");
	$("#singo"+commentnum).css("display","none");
	


	comment=$("#commentcontent"+commentnum).text().trim();

		/*<div id="commentarea">
	<p id="commentcontent">${vo.comment }*/
	$addDiv=$('<div id="tempcommentdiv"></div>');
	var innerHtml='<div style="float:left; width:500px; height:55px;"><textarea id="newcomment'+commentnum+'" style="width:500px; height:55px;"></textarea></div>';	
	var innerHtml2='<div id="tempbuttonarea" style="float:right width:100px; height:55px;"><input type="button" value="확인" onclick="updateComment('+commentnum+')"><input type="button" value="취소" onclick="cancelRewrite('+commentnum+')">';
	
	$addDiv.html($addDiv.html()+innerHtml+innerHtml2);
	$("#rewritecomment"+commentnum).html($addDiv.html());
	$("#newcomment"+commentnum).text(comment);
	
	$("#newcomment"+commentnum).selectRange(comment.length,comment.length);
	
	
	}
	
	function cancelRewrite(commentnum){
		
		var innerHtml='<p id="commentcontent'+commentnum+'">'+comment+'</p>';
		$("#rewritecomment"+commentnum).html(innerHtml);	
		$('#sujung'+commentnum).css("display","inline");
		$("#singo"+commentnum).css("display","inline");
	}
	

	
	function updateComment(commentnum){
		
		
		var comment=$("#newcomment"+commentnum).val();
		
		if($("#newcomment"+commentnum).val()==null ||$("#newcomment"+commentnum).val()==""){
			alert("내용을 입력해주세요.");
			$("#newcomment"+commentnum).focus();
			return false;
			
		}

		var commentNum=commentnum;
		
		var data=new FormData();
		data.append("comment",comment);
		data.append("commentNum",commentNum);
		
		$.ajax({
			data:data,
			type:"POST",
			url:"/hooray/comment/updatecomment.do",
			dataType:"json",
			contentType:"application/json; charset=utf-8",
			cache:false,
			contentType:false,
			processData:false,
			success:function(data){
		
			if(data=="1"){
				
				var innerHtml='<p id="commentcontent'+commentnum+'">'+comment+'</p>'
				$("#rewritecomment"+commentnum).html(innerHtml);	
				$('#sujung'+commentnum).css("display","inline");
				$("#singo"+commentnum).css("display","inline");
				alert("성공적으로 수정이 되었습니다.");
				
			}	
			
			}
		});
		
	}
	
	function deleteComment(commentnum){
		
		//확인창 띄우기
		var con_test = confirm("정말로 삭제하시겠습니까?");
		if(con_test == true){ 
		  
		}
		else if(con_test == false){
		  return false;
		}
		
		var commentCount=$("#commentCount").text();
		
		commentCount=Number(commentCount)-1;
		$("#commentCount").text(commentCount);
	
		
		$.ajax({
			data:false,
			type:"GET",
			url:"/hooray/comment/deletecomment.do?commentNum="+commentnum,
			dataType:"json",
			contentType:"application/json; charset=utf-8",
			cache:false,
			contentType:false,
			processData:false,
			success:function(data){
		
			if(data=="1"){
				
				$("#commentdiv"+commentnum).remove();
				alert("성공적으로 삭제하였습니다.");
			}	
			
			}
		});
		
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

<body >

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
		
	<section id="main_section">
	<div id="topdiv">
	<h2>${aProject.maintitle }</h2>
	<h3>${aProject.subtitle }</h3>	
	</div>
	<div id="bottomdiv">
	
	<c:if test="${chooseFlag==2 }">
	<a href="/hooray/project/getaproject.do?projectNum=${aProject.projectNum}&flag=1">프로젝트 소개</a>&nbsp;&nbsp;
	<a href="/hooray/project/getcommentfirst.do?projectNum=${aProject.projectNum}&flag=2"><font
					color="#00d8ff">댓글달기(<span id="commentCount">${commentCount}</span>)</font></a>&nbsp;&nbsp;
	<a href="/hooray/project/getapplicant.do?projectNum=${aProject.projectNum}&flag=3">지원자(${ aProject.currentpeople })</a> 
	</c:if>

	
	</div>
	</section>
	
	<!-- 여기를 꾸며보자 -->	
	<div id="subcontentdiv">
	<section id="sub_section">
	<div id="inputcommentdiv">
	<textarea id="comment" onclick="clickTextarea()"></textarea>
	<input type="button" value="등록" id="inputbutton" onclick="regComment()"/>
	</div>
	
	<div id="commentlistdiv">
	<!-- 수정하기 할때 아이디를 다 똑같이 쓰기 때문에 에러가 발생할 수 있다. 그러므로 각각의 div를 구별을 해줘야 한다. 각각 커먼트 넘버로 구별!! -->
	<div id="commentdiv" style="display:none;"></div>
	<c:forEach var="vo" items="${commentList }">
	
	<div id="commentdiv${vo.commentNum}">
	<div id="imagearea">
	<img src="../memberprofileimg/${vo.email}.jpg"/>
	</div>
	<div id="commentarea">
	<div id="main">
	<span id="writer"><a href="#">${vo.name}</a></span>
	<span id="commentinfor">
	<c:if test="${vo.email!=email }">
	<span><a href="#"  id="singo${vo.commentNum}"><font color="#003399">신고하기</font></a></span>&nbsp;<font color="#003399"><fmt:formatDate value="${vo.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm" /></font>
	</c:if>
	<c:if test="${vo.email==email }">
	<span ><a href="javascript:;" onclick="rewrite(${vo.commentNum})" id="sujung${vo.commentNum}"><font color="#003399">수정하기</font></a></span>&nbsp;<span><a href="javascript:;" onclick="deleteComment(${vo.commentNum})"  id="sakje${vo.commentNum}"><font color="#003399">삭제하기</font></a></span>&nbsp;<font color="#003399"><fmt:formatDate value="${vo.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm" /></font>
	</c:if>
	</span>
	<div id="rewritecomment${vo.commentNum}">
	<p id="commentcontent${vo.commentNum}">${vo.comment}</p>
	</div>
	</div>
	
	
	
	</div>

	</div>
	
	</c:forEach>
	
	</div>
	<div id="pagingArea">
	<c:if test="${cP.isPre() }">
	<a href="getcommentfirst.do?projectNum=${aProject.projectNum}&pageNum=${cP.getPage_Start()-cP.p_size }">[이전]</a>
	</c:if>
	<c:forEach var="counter" begin="${cP.getPage_Start() }" end="${cP.getPage_End() }">
	<a href="javascript:window.location='getcommentfirst.do?projectNum=${aProject.projectNum}&pageNum=${counter}&flag=2'">[${counter }]</a>
	
	</c:forEach>
	<c:if test="${cP.isNext() }">
	<a href="getcommentfirst.do?projectNum=${aProject.projectNum}&pageNum=${cP.getPage_Start()+cP.p_size }">[다음]</a>
	</c:if>
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
	
	<p style="font-size:20px"><fmt:formatDate value="${aProject.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm" /></p>
	<br/>

	<c:if test="${applyflag != 1 && email!=aProject.email}">
	<div id="applybuttondiv" onclick="applyProject()">
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