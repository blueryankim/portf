<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>프로파일 이미지 변경하기</title>
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>
 #profile{
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
    
    
    #main_section{
    text-align:center;
    }
  
    
	label{
   
   	margin:0 1px;
    display:inline-block;
    padding:.5em .75em;
    color:white;
    font-size:inherit;
    line-height:normal;
    vertical-align:middle;
    background-color:#003399;
    cursor:pointer;
    border:1px solid #ebebeb;
    border-bottom-color:#e2e2e2;
  
    }
    
	#upload-name{
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

	#changebutton{
		text-align:center;
	}

	#contentdiv{
	
	padding:10px 10px;
	}
</style>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
	

	
	$(document).ready(function() {
	
	var fileTarget=$("#profile");
	
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

	
	function profileImgVal(){
		
		if($("#upload-name").val()==""||$("#upload-name").val()==null){
			
			alert("파일을 선택해주세요.");
			return false;
		}
		
		var checkimage=$("#profile").val().substring($("#profile").val().lastIndexOf(".")+1);
	
		
		if(checkimage !="jpg" && checkimage !="jpeg" && checkimage !="png" && checkimage !="bmp" && checkimage !="JPG" && checkimage !="JPEG" && checkimage !="PNG"){
	
			alert("이미지 파일이 아닙니다");
			$("#profile").focus();
			return false;
			}
		
		var data = new FormData();
		 
		data.append("profile",$("#profile")[0].files[0]);
		
		
		$.ajax({
    		data:data,
    		type:"POST",
    		url:"/hooray/member/updateprofileimage.do",
    		contentType:false,
    		cache:false,
    		processData:false,
    		enctype:'multipart/form-data',
    		success:function(data){

    	
    		//	$( 'img' ).removeAttr( 'style' );
    		
    	//	$(opener.document).find("#imagearea").css("background-image",'url("../memberprofileimg/'+data+'.jpg")');
    	//$(opener.document).find("#imagearea").removeAttr('style');
    	//$(opener.document).find("#imagearea").css("width","110px");
		//$(opener.document).find("#imagearea").css("height","110px");
		//$(opener.document).find("#imagearea").css("background-image",'url("../memberprofileimg/'+data+'.jpg")');
    	//$(opener.document).find("#imagearea").css("background-size","110px 110px");
    		

    	//$(opener.document).find("#imagearea").css({"width":"110px","height":"110px","background":"url(../memberprofileimg/"+data+".jpg)", 'background-repeat' : 'no-repeat', "background-size" : "110px 110px"}); 
    			    	    //		opener.$(location).attr("href","/hooray/member/myinformation.do?flag=1");
			opener.location.reload(true);     	
			window.close();
    		//if($image.width()>600)
    			//$image.css('width', 600);
    	
 
    	
    			
    		}
    	});
		
		
		
	}
	
	function cancel(){
		
		window.close();
	}

</script>
</head>
<body>
<header id="main_header">
	<hgroup id="title"><h2 style="border-bottom:1px solid black; font-size:15px;">&nbsp;사진 변경하기</h2></hgroup>
</header>
<div id="contentdiv">
<section id="main_section">
<input type="text" id="upload-name" value="파일선택" disabled="disabled">
<label for="profile">파일 찾기</label><br/><br/>
<input type="file"  id="profile"><input id="changebutton" class="btn btn-default btn-sm" type="button" value="변경" onclick="profileImgVal()"/>
<input id="changebutton" class="btn btn-default btn-sm" type="button" value="취소" onclick="cancel()"/>
</section>
</div>


</body>
</html>