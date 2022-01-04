<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String email=(String)session.getAttribute("email"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>실시간 알림창</title>
<style>

*{
		margin:0;
		padding:0;
	}
	
	a{
	    text-decoration:none;
	 	color:black;
	 }
	
	body{
	overflow-x:hidden; overflow-y:hidden;
	resize:none;
	}
	
    #main_header{
    width:100%;
    margin:0 auto;
    height:65px;
    color:white;
    border-bottom:1px solid #dcdcdc;
    position:relative;
    background: #00D8FF;
 
    
 	}
    
        
    #main_header > #title{
    text-align:center;
    font-weight:bold;
    height:35px;
    font-size:23px;
    font-family:'Pacifico', cursive;
    	
    }
    
    #content{
    
    width:280px;
    height:auto;
    margin:0 auto;
    overflow:hidden;
    text-align:center;
    }
    
   	#main_section{
   	display:inline-block;
   	width:280px;
   	height:430px;
   	position:relative;
  
   	}
   	
   	.chattingcontentdiv{
   	width:280px;
   	height:380px;
   	position:relative;
   	overflow:scroll; 
   	background-color:white;
  
   	
   	}
   	
   	#inputdiv{
   	height:80px;
   	position:relative;
    
   	}
   	
   	#inputdiv #inputtext{
   	margin:3px 0px;
    width:235px;
    height:15px;
    line-height:normal;
    padding:.8em .5em;
    font-family:inherit;
    border-radius:0;
    outline-style:none;
    -webkit-appearance:none;
    -moz-appearance:none;
    appearance:none;
    left:0px;
    position:absolute;
    top:0px;
   	}
   	
   	#inputdiv #sendbutton{
   	width:58px;
    height:38px;
	line-height:normal;
    cursor:pointer;
    font-family:inherit;
    border-radius:0;
    outline-style:none;
    background-color:#003399;
    border:1px solid #003399;
    color:white;
    float:right;
    position:relative;
    top:3px;
   	}
   	
   	#otherdiv{
   	width:auto;
   	height:auto;
   	left:0px;
   	background-color:#D5D5D5;
 	color:black;
   	display:block;
   	margin:5px 30px 0px 5px;
   	font-size:12px;
   	padding:5px;
   	position:relative;
	float:left;
   	text-align:left;
   	}
   	
   	#otherinfordiv{
	font-size:10px;
   }
   	
   	
  
   	#ownerrightdiv{
   	
   	width:auto;
   	height:auto;
   	position:relative;
	background-color:#FFE400;
   	display:block;
   	margin:5px 0px 0px 30px;
   	padding:5px;
 	font-size:12px;
   	position:relative;
   	right:0px;
	float:right;
	color:black;
   	text-align:right;
   	}
   	
   	#ownerrightinfordiv{
   	float:right;
    font-size:10px;
   	
   	}
   	
   	
   	#ownerleftdiv{
   	
   	
   	width:auto;
   	height:auto;
   	position:relative;
	background-color:#FFE400;
   	display:block;
   	margin:5px 20px 0px 5px;
   	padding:5px;
 	font-size:12px;
   	position:relative;
	float:left;   	
	color:black;
	text-align:left;

  
   	}
   	
   	
   	
   	#ownerleftinfordiv{
   	font-size:10px;
   	}
   	
   	#mydiv{
   	width:auto;
   	height:auto;
   	position:relative;
	background-color:#0054FF;
   	display:block;
   	margin:5px 0px 0px 30px;
   	padding:5px;
 	font-size:12px;
   	position:relative;
   	float:right;
	color:black;
   	text-align:right;
 
   	
  }
   	
   
   
   #myinfordiv{
   float:right;
   font-size:10px;

   
  }
  
  	
</style>

<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
 <script type="text/javascript">
 
 
 /*$("#chattingcontentdiv").animate({ scrollTop: 0 }, "fast");*/
 /*$('body, html, #containerDiv').scrollTop(0);*/
 
 	
 
 	$(document).ready(function(){
 		
	$(".chattingcontentdiv").scrollTop($(".chattingcontentdiv")[0].scrollHeight);
	
	
	
	 $(window).bind('beforeunload', function(){
		 updateLogDate();
		 return "";
	 });


	$(".chattingcontentdiv").scroll(function () {
	
		var elem=$(".chattingcontentdiv");
		
		if(elem[0].scrollTop==0){
			firstMessageFunc();
		}
		
	});

	
	setInterval('autoGetChattingMessage()',1000);
	
 	
	$(document).keydown(function (e) {
	     
        if (e.which === 116) {
            if (typeof event == "object") {
                event.keyCode = 0;
            }
            return false;
        } else if (e.which === 82 && e.ctrlKey) {
            return false;
        }
}); 



 	
 	});
 

 
 	function updateLogDate(){
 		
 		var projectNum=$("#projectNum").val();
 		
 		 $.ajax({
 	 		data:false,
 	 		type:"GET",
 	 		url:"/hooray/chatting/updatelogdate.do?projectNum="+projectNum,
 	 		dataType:"json",
 	 		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
 	 		cache:false,
 	 		contentType:false,
 	 		processData:false,
 	 		success:function(data){
 	 			
 	 			$("#unreadcount",opener.document).text("0"); 
 	 		 }
 	 	});
 
 		
 	 }

	
 
 
 function firstMessageFunc(){
	 
	    var sessionemail=$("#sessionEmail").val();
	    var projectowner=$("#projectOwner").val();
	    var projectNum=$("#projectNum").val();
	 
	 $.ajax({
 		data:false,
 		type:"GET",
 		url:"/hooray/chatting/getchaoldmessage.do?projectNum="+projectNum,
 		dataType:"json",
 		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
 		cache:false,
 		contentType:false,
 		processData:false,
 		success:function(data){
 
		
 	
 	
 		for(var i=0; i<cL.length;i++){
 			
 			if(sessionemail ==cL[i].email && projectowner==cL[i].email){
 			var $addDiv=$('<div id="ownerrightdiv"></div>');	
 			var innerHtml='<div>'+cL[i].content+'</div><div id="ownerrightinfordiv">'+cL[i].date+'<b>'+cL[i].name+'</b></div>';
 			}
 			
 			if(sessionemail !=cL[i].email && projectowner==cL[i].email){
	    	var $addDiv=$('<div id="ownerleftdiv"></div>');	
 			var innerHtml='<div>'+cL[i].content+'</div><div id="ownerleftinfordiv">'+cL[i].date+'<b>'+cL[i].name+'</b></div>';

 			}
 			
 			if(sessionemail==cL[i].email && projectowner!=cL[i].email){
	    	var $addDiv=$('<div id="mydiv"></div>');	
 			var innerHtml='<div>'+cL[i].content+'</div><div id="myinfordiv">'+cL[i].date+'<b>'+cL[i].name+'</b></div>';

 			}
 			
 			if(sessionemail!=cL[i].email && projectowner!=cL[i].email){
		    var $addDiv=$('<div id="otherdiv"></div>');	
 			var innerHtml='<div>'+cL[i].content+'</div><div id="otherinfordiv">'+cL[i].date+'<b>'+cL[i].name+'</b></div>';

	    	}
 			
	
			$addDiv.html($addDiv.html()+innerHtml);
 	        $(".chattingcontentdiv").children("div:first").before($addDiv);  

 			
 		}
 		
 		
 	
 	    }
 	});
	 
 }

 function uploadMessage(){
	 
	
	 
	var data=new FormData;
	var projectNum=$("#projectNum").val();
	var content=$("#inputtext").val();
	
	data.append("projectNum",projectNum);
	data.append("content",content);
    	
    	$.ajax({
    		data:data,
    		type:"POST",
    		url:"/hooray/chatting/uploadchattingmessage.do",
    		dataType:"json",
    		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
    		cache:false,
    		contentType:false,
    		processData:false,
    		success:function(data){

    			$("#inputtext").val(""); 
    	    }
    	});
    }
 
function autoGetChattingMessage(){
		
		    var sessionemail=$("#sessionEmail").val();
		    var projectowner=$("#projectOwner").val();
		    var projectNum=$("#projectNum").val();
		  
			
		    	$.ajax({
		    		data:false,
		    		type:"GET",
		    		url:"/hooray/chatting/getchamessage.do?projectNum="+projectNum,
		    		dataType:"json",
		    		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		    		cache:false,
		    		contentType:false,
		    		processData:false,
		    		success:function(data){
		    		
			
		    		var cL=data.chattingList;
		    	
		    		for(var i=0; i<cL.length;i++){
		    			
		    			if(sessionemail ==cL[i].email && projectowner==cL[i].email){
		    			var $addDiv=$('<div id="ownerrightdiv"></div>');	
		    			var innerHtml='<div>'+cL[i].content+'</div><div id="ownerrightinfordiv">'+cL[i].date+'<b>'+cL[i].name+'</b></div>';
		    			}
		    			
		    			if(sessionemail !=cL[i].email && projectowner==cL[i].email){
			    		var $addDiv=$('<div id="ownerleftdiv"></div>');	
		    			var innerHtml='<div>'+cL[i].content+'</div><div id="ownerleftinfordiv">'+cL[i].date+'<b>'+cL[i].name+'</b></div>';

		    			}
		    			
		    			if(sessionemail==cL[i].email && projectowner!=cL[i].email){
			    		var $addDiv=$('<div id="mydiv"></div>');	
		    			var innerHtml='<div>'+cL[i].content+'</div><div id="myinfordiv">'+cL[i].date+'<b>'+cL[i].name+'</b></div>';

		    			}
		    			
		    			if(sessionemail!=cL[i].email && projectowner!=cL[i].email){
				    	var $addDiv=$('<div id="otherdiv"></div>');	
		    			var innerHtml='<div>'+cL[i].content+'</div><div id="otherinfordiv">'+cL[i].date+'<b>'+cL[i].name+'</b></div>';

			    		}
		    			
	 		
		   				$addDiv.html($addDiv.html()+innerHtml);
						
		    	        $(".chattingcontentdiv").children(":last").after($addDiv);  
		    	   		 $(".chattingcontentdiv").scrollTop($(".chattingcontentdiv")[0].scrollHeight);

		    			
		    		}
		    		
		    		
		    	
		    	    }
		    	});
		    }
		 
	


		
		
 </script>
</head>
<body>

<header id="main_header">
	<hgroup id="title"><a href="/hooray/home/homepage.do"><font color="white">Hooray. Talk</font></a></hgroup>
	<div><div id="imagezone" style="margin:0px 0px 0px 4px;"><img src="../memberprofileimg/${email }.jpg" style="width:25px; height:25px; float:left;"></div><div style="font-size:12px;">${email }&nbsp;</div></div>
	</header>
	<div id="content">
		<section id="main_section">
		
		<div class="chattingcontentdiv">
		
		<!-- 기준 div 혹시나 아무런 채팅 내용이 없는 경우 Ajax를 통해서 기준으로 삼는 div를 만들어서 추가 노드를 삽입한다. -->
		<div id="standarddiv" style="display:none;"></div> 
		<!--  -->
		
		<c:forEach var="vo" items="${chattingList }">
		<c:if test="${vo.email == projectOwner && email==projectOwner }">
		<div id="ownerrightdiv">
		<div id="ownerrightcontentdiv">${vo.content}</div>
		<div id="ownerrightinfordiv"><fmt:formatDate value="${vo.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm" />&nbsp;<b>${vo.name }</b></div>
		</div>
		<br/>
		</c:if>
		
		<c:if test="${email != projectOwner && vo.email == projectOwner }">
		<div id="ownerleftdiv">
		<div>${vo.content}</div>
		<div id="ownerleftinfordiv"><fmt:formatDate value="${vo.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm" />&nbsp;<b>${vo.name }</b></div>
		</div>
		<br/>
		</c:if>
		
		<c:if test="${email == vo.email && vo.email !=projectOwner}">
		<div id="mydiv">
		<div>${vo.content}</div>
		<div id="myinfordiv"><fmt:formatDate value="${vo.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm" />&nbsp;<b>${vo.name }</b></div>
		</div>
		<br/>
		</c:if>
		
		<c:if test="${email != vo.email && vo.email !=projectOwner  }">
		<div id="otherdiv">
		<div>${vo.content}</div>
		<div id="otherinfordiv"><fmt:formatDate value="${vo.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm" />&nbsp;<b>${vo.name }</b></div>
		</div>
		<br/>
		</c:if>
		
		</c:forEach>
		
		
		
		<!--  -->
		</div>
	
		<div id="inputdiv">
		<textarea size="20" id="inputtext"></textarea><input id="sendbutton" type="button" value="전송" onclick="uploadMessage()">
		</div>
		</section>
		<input type="text" id="projectOwner" value="${projectOwner }" style="display:none;"/>
		<input type="text" id="sessionEmail" value="${email }" style="display:none;"/>
		<input type="text" id="projectNum" value="${projectNum}" style="display:none;"/>
	</div>
</body>
</html>