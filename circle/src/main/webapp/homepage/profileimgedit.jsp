<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>프로필 이미지 수정</title>
<style>


*{
margin:0;
padding:0;
}

body{
background-color:#f1f1f2;
}

#header{
width:350px;
height:10px;
background:#4086cd;
}

#content{
position:relative;
width:350px;
height:300px;

}

#footer{
width:350px;
height:10px;
background:#4086cd;

}

.wrap{width:260px; position:relative;}

#file_route{
	float:right; 
	width:240px; 
	height:16px; 
	background-color:white; 
	position:absolute;
	top:8px;
	left:40px;
	border:1px #eee; 
	color:#777;}


#file_wrap {
	display:inline-block; 
	widht:64px; height:40px; 
	background:url(image/camera2.png) 0 0 no-repeat; 
	position:absolute; 
	top:0px; 
	left:290px;
	}


#file_add { 
	filter:alpha(opacity:0); 
	opacity:0; 
	width:64px; height:22px;
	}

input[type=button]{
	background:#f1f1f2;

}

#okandcancel{
	
	position:absolute;
	bottom:20px;
	left:130px;
}
#newprofileimgzone{
	position:relative;
	border:3px dashed black; 
	width:200px;
	height:200px;
	top:0px;
	left:70px;
}
#newprofileimgdiv{

	position:absolute;
	width:200px;
	height:200px;

}

</style>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>

function setProfileimg(imagepath){

	var checkimagevalue = imagepath.value.substring(imagepath.value.lastIndexOf(".") + 1);
	if (checkimagevalue != "jpg" && checkimagevalue != "JPG") {
		alert("이미지파일은 jpg파일만 가능합니다.");
		return false;
	}
	
	$("#file_route").val(imagepath.value);
	chprofileImg(imagepath);
	
}

//newimgpath
function chprofileImg(newimgpath){
	
	var $newprofileimgdiv = $('<div id="newprofileimgdiv"></div>');
	var $newprofileimgzone = $("#newprofileimgzone");
	$newprofileimgzone.append($newprofileimgdiv);
	//alert(imagepath);

	var preview = document.getElementById("newprofileimgdiv"); //div id   
    var ua = window.navigator.userAgent;
	
    
	
    if (ua.indexOf("MSIE") > -1) {//ie일때
  
    	newimgpath.select();
        
        try {
        	
        	var src = document.selection.createRange().text; // get file full path 
          
            var ie_preview_error = document
                    .getElementById("ie_preview_error_" + "newprofileimgdiv");
            

            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error가 있으면 delete
            }
            
           
            var img = document.getElementById("newprofileimgdiv"); //이미지가 뿌려질 곳
           //
         
          
           // $("#imagezone").css({width:"542px" , height:"150px", "border-left":"1px inset #d9dde1", "border-top":"1px inset #d9dde1","border-right":"1px inset #d9dde1","border-top":0});
    		//$("#textzone").css({"border-bottom-width":0});
    		$newprofileimgdiv.css({'background-repeat':'no-repeat','background-size':'100% 100%'});
    		$newprofileimgdiv.css({width:"200px" , height:"200px"});
    		$("#content").css({height:"300px"});
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
                    + src + "', sizingMethod='scale')";// 이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
                    
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + "newprofileimgdiv")) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + "newprofileimgdiv";
                info.innerHTML = "a";
                preview.insertBefore(info, null);
            }
        }
    } 


    else { //ie가 아닐때
        var files = newimgpath.files;
        for ( var i = 0; i < files.length; i++) {

            var file = files[i];

            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
            if (!file.type.match(imageType))
                continue;

            var prevImg = document.getElementById("prev_" + "newprofileimgdiv"); //이전에 미리보기가 있다면 삭제
            if (prevImg) {
                preview.removeChild(prevImg);
            }

        	
        	//$("#imagezone").css({margin:"-3px 0px",width:"544px" , height:"150px", "border-left":"1px inset #d9dde1", "border-top":"1px inset #d9dde1","border-right":"1px inset #d9dde1","border-top":0});
     	
     		$newprofileimgdiv.css({'background-repeat':'no-repeat','background-size':'100% 100%'});
    		$newprofileimgdiv.css({width:"200px" , height:"200px"});
    		$("#content").css({height:"300px"});
            
            
            var img = document.createElement("img"); //크롬은 div에 이미지가 뿌려지지 않는다. 그래서 자식Element를 만든다.
            img.id = "prev_" + "newprofileimgdiv";
            img.classList.add("obj");
            img.file = file;
            img.style.width = '200px'; //기본설정된 div의 안에 뿌려지는 효과를 주기 위해서 div크기와 같은 크기를 지정해준다.
            img.style.height = '200px';
            
            preview.appendChild(img);

            if (window.FileReader) { // FireFox, Chrome, Opera 확인.
                var reader = new FileReader();
                reader.onloadend = (function(aImg) {
                    return function(e) {
                        aImg.src = e.target.result;
                    };
                })(img);
                reader.readAsDataURL(file);
            } else { // safari is not supported FileReader
                //alert('not supported FileReader');
                if (!document.getElementById("sfr_preview_error_"
                        + "newprofileimgdiv")) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + previewId;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }
	
//if문 jpg 파일인 경우
	
	}
	
	function updateProfileimg(loginid){
		
		//var param={id:loginid,profileimg:$("#file_add").val(),imagekind:"profile"};
		
		var id=loginid;
		var profileimg=$("#file_add").val();
		var imagekind="profile";
		//$.post("/circle/updateprofileimg/updateprofileimg.do",param,updateProfileimgResult,"xml");
		opener.location.href="/circle/updateprofileimg/updateprofileimg.do?id="+id+"&profileimg="+profileimg+"&imagekind="+imagekind;
		self.close();
	}
	
	
	function cancel(){
		
		self.close();
	}

</script>

</head>
<body>
<div id="header"></div>
<div id="content">
<br/>
<div id="newprofileimgzone"></div>
<div class="wrap">

   <span id="file_wrap" title="첨부파일 찾아보기">
	<input type="file" id="file_add" onchange="setProfileimg(this)" />
	</span>
   <input type="text" id="file_route"  readonly="readonly" title="첨부된 파일경로" value="사진을 변경해 주세요." />

  </div>
  
<div id="okandcancel"><input type="button" value="확인" onclick="updateProfileimg('${sessionScope.id}')">&nbsp;<input type="button" value="취소" onclick="cancel()"></div>
</div>
<div id="footer"></div>
</body>
</html>