var clickflag=0;
var imagepath;

$(document).ready(function(){
	$("input").placeholder();
	$("#click").click(on_click);	
	
	
	
});


function on_click(e){
	if(clickflag==0){
		
	var innerhtml='<div id="writtendiv"><textarea id="textzone" placeholder="당신의 생각을 표현하세요!" style="width:540px; height:70px;"/><div id="imagezone"></div><div id="function" style="width:545px; height:35px;"><div id="box_file_wrap"><div id="wrap"><span id="file_wrap"><input type="file" id="fileadd" onChange="on_change(this)" /></span></div></div><select id="openscope"><option>전체공개</option><option>친구만보기</option><option>나만보기</option></select><input id="writingupload" type="button" value="글쓰기" onclick="inputTimeline()"/></div></div>';
	$("#writediv").html(innerhtml);
	$("textarea").placeholder();	
	
		
	}
	clickflag=1;

}

function on_change(imagevalue){
	
	var checkimagevalue = imagevalue.value.substring(imagevalue.value.lastIndexOf(".") + 1);
	if (checkimagevalue != "jpg" || checkimagevalue !="JPG") {
		alert("이미지파일은 jpg파일만 가능합니다.");
		return false;
	}
	
	
	
	var $adddiv = $('<div id="adddiv"></div>');
	var $imagezone = $("#imagezone");
	$imagezone.append($adddiv);
	//alert(imagepath);
	
	var preview = document.getElementById("adddiv"); //div id   
    var ua = window.navigator.userAgent;
	
    if (checkimagevalue == "jpg"){
	
    if (ua.indexOf("MSIE") > -1) {//ie일때
    	
        imagevalue.select();
        
        try {
        	
        	var src = document.selection.createRange().text; // get file full path 
          
            var ie_preview_error = document
                    .getElementById("ie_preview_error_" + "adddiv");
            

            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error가 있으면 delete
            }
            
           
            var img = document.getElementById("adddiv"); //이미지가 뿌려질 곳
           //
         
          
            $("#imagezone").css({width:"542px" , height:"150px", "border-left":"1px inset #d9dde1", "border-top":"1px inset #d9dde1","border-right":"1px inset #d9dde1","border-top":0});
    		$("#textzone").css({"border-bottom-width":0});
    		$adddiv.css({'background-repeat':'no-repeat','background-size':'100% 100%'});
    		$adddiv.css({margin:"10px 10px", width:"130px" , height:"130px"});
    		
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
                    + src + "', sizingMethod='scale')";// 이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + "adddiv")) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + "adddiv";
                info.innerHTML = "a";
                preview.insertBefore(info, null);
            }
        }
    } 


    else { //ie가 아닐때
        var files = imagevalue.files;
        for ( var i = 0; i < files.length; i++) {

            var file = files[i];

            var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
            if (!file.type.match(imageType))
                continue;

            var prevImg = document.getElementById("prev_" + "adddiv"); //이전에 미리보기가 있다면 삭제
            if (prevImg) {
                preview.removeChild(prevImg);
            }

        	
        	$("#imagezone").css({margin:"-3px 0px",width:"544px" , height:"150px", "border-left":"1px inset #d9dde1", "border-top":"1px inset #d9dde1","border-right":"1px inset #d9dde1","border-top":0});
     		$("#textzone").css({"border-bottom-width":0});
     		$adddiv.css({'background-repeat':'no-repeat','background-size':'100% 100%'});
     		$adddiv.css({margin:"10px 10px", width:"130px" , height:"130px"});
     		
            
            var img = document.createElement("img"); //크롬은 div에 이미지가 뿌려지지 않는다. 그래서 자식Element를 만든다.
            img.id = "prev_" + "adddiv";
            img.classList.add("obj");
            img.file = file;
            img.style.width = '130px'; //기본설정된 div의 안에 뿌려지는 효과를 주기 위해서 div크기와 같은 크기를 지정해준다.
            img.style.height = '130px';
            
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
                        + "adddiv")) {
                    var info = document.createElement("p");
                    info.id = "sfr_preview_error_" + previewId;
                    info.innerHTML = "not supported FileReader";
                    preview.insertBefore(info, null);
                }
            }
        }
    }
	
}//if문 jpg 파일인 경우
	
	
	imagepath=chimagevalue;

}


function inputTimeline(){
	alert("hehe");
	var param;
	
	if($("#fileadd").val()!=null || $("#fileandd").val()!=""){
	param={content:$("#textzone").val(),imagepath:$("#fileadd").val(),openscope:$("#openscope")};
	}
	
	else{
	param={content:$("#textzone").val(),openscope:$("#openscope")};
		
		
	}
	$.post("/circle/inputtimeline/inputtimeline.do",param,inputTimelineResult,"json");
	
	
	
}

	function inputTimelineResult(xmlInfo){
		
		alert("hibaby");
	
	
}