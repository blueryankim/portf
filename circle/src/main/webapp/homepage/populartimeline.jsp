<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session ="true" %>	    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Circle - Circle에 오신 것을 환영합니다.</title>
<style>
*{
	margin:0 0;
}

a{
text-decoration:none; color:black;
}

#content{
	width:1260px; margin:0 auto;
	overflow:hidden;
}

#content > #myspace{
	width:250px;
	height:800px;
	background-color:white;
	float:left;
	position:relative;
	border-right:1px inset grey;
}

#content > #timelinespace{
	width:1008px;
	height:810px;
	float:right;
	background-color:white;
	overflow-y:scroll;
}



#file_wrap {
	display:inline-block;
	widht:35px; 
	height:35px; 
	background:url(image/camera.png) 0 0 no-repeat; 
	position:absolute; 
	top:0; 
	left:5px;
}



#myprofileimg{
	width:70px;
	height:70px;
	
	
}

#profilezonewrap{
position:absolute;
top:20px;
left:30px;
width:200px;
height:100px;

}

#profileimgzone{

float:left;}
#profiletextwrap{

float:left;
margin-left:10px;
margin-top:5px;
}


#timelines {
width:1260px;
height:auto;
position:relative;


}

#profileimgedit{
	display:none;
}

#profileimgwrap{

position:relative; 
margin-top:3px;
}

#clickchimg{
	text-decoration:none;
	color:black;

}
 



</style>

<link rel="stylesheet" href="../css/homeheader.css" type="text/css"/>
<link rel="stylesheet" href="../css/writingtimeline.css" type="text/css"/>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="http://rawgithub.com/mathiasbynens/jquery-placeholder/master/jquery.placeholder.js"></script>

<link rel="stylesheet" href="/resources/demos/style.css" />
<script type="text/javascript">
	
	
	var pagenum=1;
	var addedtimelinecount=0;
	
	//autocompletion javascript
	$(document).ready(
			function() {

						$("#findfriend").autocomplete(
						{	
						 minLength : 1,
					     delay : 100,
						 contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						 source : function(request, response) {

						 $.getJSON("/circle/autocomplete/autocomplete.do",request,function(result) {
							//$.map 잘외워두기
						 response($.map(result.autocompletelist,function(item) {

						return {
							 id:item.id,
							 name:item.name,
							 university:item.university,
							 profileimg:item.profileimg
							};

						    }));
							});
						    },

							}).data("ui-autocomplete")._renderItem = function(ul, item) {
							
							var inner_html = '<a><div id="list_item_container"><div id="image"><img id="profileimg" src="../memberimage/' + item.id + '/'+item.profileimg+'.jpg"></div><div id="labelwrap"><div id="label">'
									+ item.name
									+ '</div><div id="description">'
									+ item.university + '</div></div></div></a>';
							return $("<li></li>").data("item.autocomplete",item).append(inner_html).appendTo(ul);
						};            
					});

	
	//timelene글쓰기 div
	

var imagepath;

$(document).ready(function(){
	$("input").placeholder();
		
	$("#myprofileimg").bind("mouseover",function(e){
		$("#profileimgedit").css({"display":"block"});
	});
	$("#myprofileimg").bind("mouseout",function(e){
		$("#profileimgedit").css({"display":"none"});
	});	
	
	$("#profileimgedit").bind("mouseover",function(e){
		$("#profileimgedit").css({"display":"block"});
	});
	
	$("#profileimgedit").bind("mouseout",function(e){
		$("#profileimgedit").css({"display":"none"});
	});
	
});

$(document).ready(function(){
	
	setInterval('autoGetAllComment()',5000);



});




function on_click(){
	
		
		
	var innerhtml='<div id="writtendiv"><img src="image/update.png"><span id="writingandphoto">글쓰기/사진올리기/동영상올리기</span><br/><textarea id="textzone" placeholder="당신의 생각을 표현하세요!" style="width:540px; height:70px;"/><div id="imagezone"></div><div id="function" style="width:545px; height:35px;"><div id="box_file_wrap"><div id="wrap"><span id="file_wrap"><input type="file" id="fileadd" onChange="on_change(this)" /></span></div></div><select id="openscope"><option>전체공개</option><option>친구만보기</option><option>나만보기</option></select><input id="writingupload" type="button" value="글쓰기" onclick="inputTimeline()"/></div></div>';
	$("#writediv").html(innerhtml);
	$("textarea").placeholder();	
	


}

function on_change(imagevalue){

	var checkimagevalue = imagevalue.value.substring(imagevalue.value.lastIndexOf(".") + 1);
	if (checkimagevalue != "jpg" && checkimagevalue !="JPG") {
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
	
	
	
function openEditImage(){
	
	window.open('/circle/homepage/profileimgedit.jsp','이미지수정', 'width=345, height=350, scrollbars=yes, menubar=no, location=no, resizable=no' );
	
	
}	

function chProfileImg(id,filename){
	
//	$("#myprofileimg").attr("src",'../memberimage/'+id+'/'+filename+".jpg");
	location.reload(true);
}


function inputTimeline(){
	
	var param;
	
	if($("#textzone").val()==null || $("#textzone").val()==""){
		
		alert("타임라인의 내용을 입력해주세요.");
		return false;
	}
	
	if($("#fileadd").val()!=null || $("#fileandd").val()!=""){
	param={content:$("#textzone").val(),imagepath:$("#fileadd").val(),openscope:$("#openscope").val()};
	}
	
	else{
	param={content:$("#textzone").val(),openscope:$("#openscope").val()};
		
	}
	
	
	$.post("/circle/inputtimeline/inputtimeline.do",param,inputTimelineResult,"json");
	

	
}

	function inputTimelineResult(jsonInfo){
		
		var updatedtimelinelist=jsonInfo.updatedtimelinelist;
		
	
		for(var i=0; i< updatedtimelinelist.length; i++){
			var $adddiv = $('<div></div>');
			var $timelinesfirstnode = $("#timelines > div:first");
			
			
			var innerhtml='<div style="width:600px; height:auto; margin-top:20px; margin-left:10px; overflow:hidden;" id="'+updatedtimelinelist[i].num+'timeline"><div style="width:50px; height:50px; float:left;"><img style="width:50px; height:50px;" src="../memberimage/'+updatedtimelinelist[i].id+'/'+updatedtimelinelist[i].profileimg+'.jpg"></div>';
			var innerhtml2='<div id="wordwrap" style="float:left;"><div style="width:500px; height:auto; margin-left:20px; font-size:13px;">'+updatedtimelinelist[i].writer+'</font></div><div style="width:500px; height:auto;  margin-left:20px; font-size:15px;">'+updatedtimelinelist[i].content+'</div>';
			
		
			var innerhtml3="";
			if(updatedtimelinelist[i].imagepath !=null && updatedtimelinelist[i].imagepath != ""){
				
			innerhtml3='<div style="width:400px; height:250px; margin-left:20px; margin-top:10px;"><img style="width:400px; height:250px;" src="../memberimage/'+updatedtimelinelist[i].id+'/'+updatedtimelinelist[i].imagepath+'.jpg"></div>';	
			}			
			
						//yyyy-MM-dd HH:mm
			var innerhtml4='<div style="width:400px; height:20px; margin-left:20px; margin-top:10px; background:#d7e8f5;"><span id="'+updatedtimelinelist[i].num+'ilike" style="font-size:12px; margin-left:5px;">좋아요</span>&nbsp; <span id="writingcomment" style="font-size:12px;">댓글달기</span>';
			var innerhtml5='<span style="font-size:12px; margin-left:10px;">'+updatedtimelinelist[i].regdate+'</span></div>';
			var innerhtml6='<div id="commentzone"></div><div style="width:400px; height:50px; margin-left:20px; margin-top:2px; background:#d7e8f5;"><div style="float:left"><img style="width:40px; height:40px; margin-left:3px; margin-top:5px;" src="../memberimage/'+updatedtimelinelist[i].id+'/'+updatedtimelinelist[i].profileimg+'.jpg"></div>';
			var innerhtml7='<div style="float:left; margin-left:5px; margin-top:10px;"><input id="'+updatedtimelinelist[i].num+'writingcomment" style="background:white; border:1px inset #c2daf2; width:280px; height:20px;" type="text" size="50" placeholder="댓글입력..."/><input type="button" value="입력" onclick="inputComment('+updatedtimelinelist[i].num+')"/></div></div></div></div><br/><hr> ';
			
			var finalinnerhtml;
			
		
			
			finalinnerhtml=innerhtml+innerhtml2+innerhtml3+innerhtml4+innerhtml5+innerhtml6+innerhtml7;
			$adddiv.html($adddiv.html()+finalinnerhtml);
			$timelinesfirstnode.before($adddiv);
	
			
			++addedtimelinecount;
			}
			
			var innerhtml='<img src="image/update.png"><span id="writingandphoto">글쓰기/사진올리기/동영상올리기</span><br/>	<input type="text" size="40" id="click" onclick="on_click()" placeholder="당신의 생각을 표현하세요!"/>';
			$("#writediv").html(innerhtml);                                                     
			$("input").placeholder();	
		
		
		
	
		}
		
			

	function inputComment(timelinenum){
		
		var param={gulnum:timelinenum,comment:$("#"+timelinenum+"writingcomment").val()};
		$.post("/circle/inputcomment/inputcomment.do",param,inputCommentResult,"xml");
		
	}
	
	function inputCommentResult(xmlInfor){
		autoGetAllComment();
		var gulnum=$(xmlInfor).find("gulnum").text();
		$("#"+gulnum+"writingcomment").val("");
		
		

		
	}
	
	function autoGetAllComment(){
		
		var param={};
	   $.post("/circle/autogetallcomment/autogetallcomment.do",param,autoGetAllCommentResult,"json");
	}
	
	
	function autoGetAllCommentResult(jsonInfor){
		
		var acl=jsonInfor.allcommentlist;
	
		
		
		for(var i=0; i< acl.length; i++){
				
			var $adddiv = $('<div></div>');
			var innerhtml='<div style="width:400px; height:auto; overflow:hidden; margin-left:20px; margin-top:2px; background:#d7e8f5;">';
			var innerhtml1='<div style="width:40px; float:left; height:auto;">';
			var innerhtml2='<img style="width:40px; height:40px; margin-left:3px; margin-top:5px;" src="../memberimage/'+acl[i].id+'/'+acl[i].profileimg+'.jpg"></div>';
			var innerhtml3='<div style="float:left; height:auto; margin-left:10px; margin-top:5px;"><div style="width:350px; height:auto; float:left; margin-bottom:3px;"><span style="font-size:13px;">'+acl[i].writer+'</span><span style="font-size:13px; margin-left:7px;">'+acl[i].comment+'</span></div>';
			var innerhtml4='<div style="width:300px; font-size:12px;">'+acl[i].regdate+'</div></div>';
			var finalinnerhtml=innerhtml+innerhtml1+innerhtml2+innerhtml3+innerhtml4;
			
			$adddiv.html($adddiv.html()+finalinnerhtml);
			
			$("#"+acl[i].gulnum+"timeline #commentzone").append($adddiv); 
	
		
		}		
		
		
	
	}
	
	function iLikeIt(timelinenum1){
		
		var param={timelinenum:timelinenum1};
		$.post("/circle/ilikeit/ilikeit.do",param,iLikeItResult,"xml");

		
		
	}

	function iLikeItResult(xmlInfor){
		
		var timelinenum=$(xmlInfor).find("timelinenum").text();
		var nameandidlist=$(xmlInfor).find("nameandidlist").text();
		alert("hehe");
		
		
	}
</script>

</head>
<body>

<div id="headerdiv">
	<h1 id="logo">Circle</h1>
	<img id="requestfriend" src="image/friend.png">
	<img id="notification" src="image/notification.png">
	<input id="findfriend" size="20" placeholder="친구의 이름을 입력해주세요.">
	<input type="button" value="search" id="friendsearch"> 
</div>

<div id="content">
<div id="myspace">
<div id="profilezonewrap">
<div id="profileimgzone">
<img id="myprofileimg" src="../memberimage/${loginerinfor.id }/${loginerinfor.profileimg }.jpg"></div>
<div id="profileimgedit" style="font-size:13px; background:white; text-align:center; width:120px;height:30px;position:absolute; border:1px inset black; top:65px; left:0;">
<div id="profileimgwrap"><img style="left:5px; top:3px; position:absolute;" src="image/ministar.png"><span style="position:absolute; left:25px; top:5px;"><a id="clickchimg" href="javascript:openEditImage();">사진 수정하기</a></span></div></div>
<div id="profiletextwrap">
<div id="profilename" style="font-size:15px; ">${loginerinfor.name }</div>
<div id="profileedit" style="font-size:13px; margin-top:5px;">프로필 수정</div>
</div>
</div>
</div>


<div id="timelinespace">
<div id="writediv">
<img src="image/update.png"><span id="writingandphoto">글쓰기/사진올리기/동영상올리기</span>
<br/>
<input type="text" size="40" id="click" onclick="on_click()" placeholder="당신의 생각을 표현하세요!"/>
</div>
<br/>
<hr>
<div id="timelines">

<c:if test="${  not empty poptimelist }">
<c:forEach var="poptimeline" items="${ poptimelist }">
<div style='width:600px; height:auto; margin-top:20px; margin-left:10px; overflow:hidden;' id="${poptimeline.num}timeline">
<div style='width:50px; height:50px; float:left; '>
<img style='width:50px; height:50px;' src="../memberimage/${poptimeline.id}/${poptimeline.profileimg }.jpg">
</div>
<div id="wordwrap" style='float:left'>
<div style='width:500px; height:auto; margin-left:20px; font-size:13px;'>${poptimeline.writer }</div>
<div style='width:500px; height:auto;  margin-left:20px; margin-top:10px; font-size:15px;'>${poptimeline.content }</div>

<c:if test="${  poptimeline.imagepath != null }">
<div style="width:400px; height:250px; margin-left:20px; margin-top:10px;">
<img style="width:400px; height:250px;" src="../memberimage/${ poptimeline.id }/${ poptimeline.imagepath}.jpg">
</div>
</c:if>


<div style="width:400px; height:20px; margin-left:20px; margin-top:10px; background:#d7e8f5;">
<span id="${lattimeline.num}ilike" style="font-size:12px; margin-left:5px;"><a href="javascript:void(0);" onclick="iLikeIt(${lattimeline.num})">좋아요</a></span>&nbsp; <span id="writingcomment" style="font-size:12px;">댓글달기</span>
<span style="font-size:12px; margin-left:10px;"><fmt:formatDate value="${poptimeline.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm" /> </span>
</div>
<div id="commentzone">
<c:if test="${ not empty popcommentlist }">
<c:forEach var="popcommentlist" items="${popcommentlist}">
<c:if test="${ poptimeline.num == popcommentlist.gulnum }">


<div style="width:400px; height:auto; overflow:hidden; margin-left:20px; margin-top:2px; background:#d7e8f5;">
<div style="width:40px; float:left; height:auto;">
<img style='width:40px; height:40px; margin-left:3px; margin-top:5px;' src="../memberimage/${popcommentlist.id}/${popcommentlist.profileimg }.jpg">
</div>
<div style="float:left; height:auto; margin-left:10px; margin-top:5px;">
<div style="width:350px; height:auto; float:left; margin-bottom:3px;"><span style="font-size:13px;">${popcommentlist.writer}</span><span style="font-size:13px; margin-left:7px;">${ popcommentlist.comment}</span></div>
<div style="width:300px; font-size:12px;"><fmt:formatDate value="${popcommentlist.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm" /></div>
</div>
</div>

	

</c:if>
</c:forEach>
</c:if>
</div>

<div style="width:400px; height:50px; margin-left:20px; margin-top:2px; background:#d7e8f5;">
<div style="float:left">
<img style='width:40px; height:40px; margin-left:3px; margin-top:5px;' src="../memberimage/${loginerinfor.id}/${loginerinfor.profileimg }.jpg">
</div>
<div style="float:left; margin-left:5px; margin-top:10px;">
<input id="${poptimeline.num}writingcomment" style="background:white; border:1px inset #c2daf2; width:280px; height:20px;" type="text" size="50" placeholder="댓글입력..."/> 
<input type="button" value="입력" onclick="inputComment(${poptimeline.num})"/>
</div>
</div>


</div>
</div>
<br/>
<hr>
</c:forEach>

</c:if>		

<c:if test="${ not empty lattimelist }">
<c:forEach var="lattimeline" items="${lattimelist}">
							
<div style='width:600px; height:auto; margin-top:20px; margin-left:10px; overflow:hidden;' id="${lattimeline.num}timeline">
<div style='width:50px; height:auto; float:left; '>
<img style='width:50px; height:50px;' src="../memberimage/${lattimeline.id}/${lattimeline.profileimg }.jpg">
</div>
<div id="wordwrap" style='float:left;'>
<div style='width:500px; height:auto; margin-left:20px; font-size:13px;'>${lattimeline.writer }</div>
<div style='width:500px; height:auto;  margin-left:20px; margin-top:10px; font-size:15px;'>${lattimeline.content }</div>

<c:if test="${ lattimeline.imagepath != null }">
<div style="width:400px; height:250px; margin-left:20px; margin-top:10px;">
<img style="width:400px; height:250px;" src="../memberimage/${lattimeline.id }/${lattimeline.imagepath}.jpg">
</div>
</c:if>
<!-- 댓글존 -->

<div style="width:400px; height:20px; margin-left:20px; margin-top:10px; background:#d7e8f5;">
<span id="${lattimeline.num}ilike" style="font-size:12px; margin-left:5px;"><a href="javascript:void(0);" onclick="iLikeIt(${lattimeline.num})">좋아요</a></span>&nbsp; <span id="writingcomment" style="font-size:12px;">댓글달기</span>
<span style="font-size:12px; margin-left:10px;"><fmt:formatDate value="${lattimeline.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm" /> </span>
</div>
<div id="commentzone">
<c:if test="${ not empty latcommentlist }">
<c:forEach var="latcommentlist" items="${latcommentlist}">
<c:if test="${ lattimeline.num == latcommentlist.gulnum }">


<div style="width:400px; height:auto; overflow:hidden; margin-left:20px; margin-top:2px; background:#d7e8f5;">
<div style="width:40px; float:left; height:auto;">
<img style='width:40px; height:40px; margin-left:3px; margin-top:5px;' src="../memberimage/${latcommentlist.id}/${latcommentlist.profileimg }.jpg">
</div>
<div style="float:left; height:auto; margin-left:10px; margin-top:5px;">
<div style="width:350px; height:auto; float:left; margin-bottom:3px;"><span style="font-size:13px;">${latcommentlist.writer}</span><span style="font-size:13px; margin-left:7px;">${ latcommentlist.comment}</span></div>
<div style="width:300px; font-size:12px;"><fmt:formatDate value="${latcommentlist.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm" /></div>
</div>
</div>

	

</c:if>
</c:forEach>
</c:if>
</div>

<div style="width:400px; height:50px; margin-left:20px; margin-top:2px; background:#d7e8f5;">
<div style="float:left">
<img style='width:40px; height:40px; margin-left:3px; margin-top:5px;' src="../memberimage/${loginerinfor.id}/${loginerinfor.profileimg }.jpg">
</div>
<div style="float:left; margin-left:5px; margin-top:10px;">
<input id="${lattimeline.num}writingcomment" style="background:white; border:1px inset #c2daf2; width:280px; height:20px;" type="text" size="50" placeholder="댓글입력..."/> 
<input type="button" value="입력" onclick="inputComment(${lattimeline.num})"/>
</div>
</div>


</div>

</div>
<br/>
<hr>

</c:forEach>

</c:if>		
<div style="font-size:13px; margin-left:300px;"><c:if test="${tp.isPre()}">
<a href="gethomecontent.do?pagenum=${tp.getPage_Start()-tp.p_size }">[before]</a>
</c:if>
<c:forEach var="counter" begin="${tp.getPage_Start()}" end="${tp.getPage_End() }">
<c:if test="${counter == pageNum }"><font color="#4086cd">${counter}</font></c:if>
<c:if test="${counter != pageNum }"><a href="javascript:window.location='gethomecontent.do?pagenum=${counter}'">${counter}</a>
</c:if>

&nbsp;
</c:forEach>
<c:if test="${tp.isNext()}">
<a href="gethomecontent.do?pagenum=${tp.getPage_Start()+tp.p_size }">[next]</a>
</c:if>

</div>
</div>
</div>



</div>

</body>
</html>