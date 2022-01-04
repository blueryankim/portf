<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>학교검색</title>
<style>

a{text-decoration:none;color:black} 

a:hover{
	background:black;
	color:white;
}

#searchuniversityform input[type=button] {
	background:gray;
	height: 45px;
	width: 60px;
	color:white;
}


#buttondiv input[type=button] {
	background:gray;
	height: 30px;
	width: 80px;
	color:white;
}

#uniname {
	
	height: 45px;
	width: 240px;
}


#content{
	margin: 0;
	padding: 0;
	color:red;
	font-size:13px;
}

#bottomdiv{


	background:#4086cd;
	height:30px;
	width:100%;
	position:absolute;
	left:0px;
	bottom: 0px;
	
}

#buttondiv{

	text-align:center;
}

#searchresultdiv{

	margin:0 auto;
	padding:0;
	border:1px dashed gray;
	text-align:center;
	font-size:13px;
	width:100%;  
	height:100px; 
	line-height:20px; 
}

</style>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">

function searchUni(){
	
	if($("#uniname").val() == null || $("#uniname").val() ==""){
		alert("학교 이름을 입력해주세요.");
		$("#uniname").focus();
		return false;
	}
	
	if ($("#uniname").val().replace(/^[0-9]*$/, "") == ""){
		alert("학교 이름에 특수문자가 있습니다.");
		$("#uniname").focus();
		return false;
		
	}
	
	var param={uniname:$("#uniname").val()};
	
	$.post("/circle/member/searchuniversity.do",param,searchUniversityResult,"json");
	
	
}




function searchUniversityResult(jsonInfo){
		
	var unilists=jsonInfo.unilist;

	if(unilists.length==0){
	
		//$("#searchresultdiv").css({border:"1px dashed gray", "text-align":"center", "font-size":"14px", width:"100%" , height:"100%", "line-height":"80px" });

		$("#searchresultdiv").text("학교가 존재하지 않습니다.");
		//$("#searchresultdiv").css("border","4px solid #ff0000");		
	}
	
	else{
		$("#searchresultdiv").html("");
		//$("#searchresultdiv").css({margin:"0 auto",border:"1px dashed gray", "text-align":"center", "font-size":"13px", width:"100%" , height:100, "line-height":"20px" });
		
		for(var i=0;i<unilists.length;i++){
			
			var $auni=$('<a href="#" onClick=inputUni("'+unilists[i].uniname+'")>'+(i+1)+"."+unilists[i].uniname+' <br/></a>');
			$("#searchresultdiv").append($auni);
		}
	}
	
	
	
}

function inputUni(uni){
	
	opener.inputUniversity(uni);
	
	



}




</script>
</head>
<body>
<div id="searchuniversitydiv">
<form id="searchuniversityform">
<input type="text" id="uniname" placeholder="대학교 이름" size="20">
<input type="button" id="search" value="검색" onclick="searchUni()">
<p id="content">*대학교 이름만 입력해주세요.</p>
</form>
</div>
<br/>
<div id="searchresultdiv" style="overflow-y:scroll;">

</div>
<br/>
<div id="buttondiv">
<input type="button" value="닫기" onclick="self.close()">
</div>
<div id="bottomdiv">
</div>
</body>
</html>