var clickflag=0;
var imagepath;

$(document).ready(function(){
	$("input").placeholder();
	$("#click").click(on_click);	
	
	
	
});


function on_click(e){
	if(clickflag==0){
		
	var innerhtml='<div id="writtendiv"><textarea id="textzone" placeholder="����� ������ ǥ���ϼ���!" style="width:540px; height:70px;"/><div id="imagezone"></div><div id="function" style="width:545px; height:35px;"><div id="box_file_wrap"><div id="wrap"><span id="file_wrap"><input type="file" id="fileadd" onChange="on_change(this)" /></span></div></div><select id="openscope"><option>��ü����</option><option>ģ��������</option><option>��������</option></select><input id="writingupload" type="button" value="�۾���" onclick="inputTimeline()"/></div></div>';
	$("#writediv").html(innerhtml);
	$("textarea").placeholder();	
	
		
	}
	clickflag=1;

}

function on_change(imagevalue){
	
	var checkimagevalue = imagevalue.value.substring(imagevalue.value.lastIndexOf(".") + 1);
	if (checkimagevalue != "jpg" || checkimagevalue !="JPG") {
		alert("�̹��������� jpg���ϸ� �����մϴ�.");
		return false;
	}
	
	
	
	var $adddiv = $('<div id="adddiv"></div>');
	var $imagezone = $("#imagezone");
	$imagezone.append($adddiv);
	//alert(imagepath);
	
	var preview = document.getElementById("adddiv"); //div id   
    var ua = window.navigator.userAgent;
	
    if (checkimagevalue == "jpg"){
	
    if (ua.indexOf("MSIE") > -1) {//ie�϶�
    	
        imagevalue.select();
        
        try {
        	
        	var src = document.selection.createRange().text; // get file full path 
          
            var ie_preview_error = document
                    .getElementById("ie_preview_error_" + "adddiv");
            

            if (ie_preview_error) {
                preview.removeChild(ie_preview_error); //error�� ������ delete
            }
            
           
            var img = document.getElementById("adddiv"); //�̹����� �ѷ��� ��
           //
         
          
            $("#imagezone").css({width:"542px" , height:"150px", "border-left":"1px inset #d9dde1", "border-top":"1px inset #d9dde1","border-right":"1px inset #d9dde1","border-top":0});
    		$("#textzone").css({"border-bottom-width":0});
    		$adddiv.css({'background-repeat':'no-repeat','background-size':'100% 100%'});
    		$adddiv.css({margin:"10px 10px", width:"130px" , height:"130px"});
    		
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"
                    + src + "', sizingMethod='scale')";// �̹��� �ε�, sizingMethod�� div�� ���缭 ����� �ڵ����� �ϴ� ����
        } catch (e) {
            if (!document.getElementById("ie_preview_error_" + "adddiv")) {
                var info = document.createElement("<p>");
                info.id = "ie_preview_error_" + "adddiv";
                info.innerHTML = "a";
                preview.insertBefore(info, null);
            }
        }
    } 


    else { //ie�� �ƴҶ�
        var files = imagevalue.files;
        for ( var i = 0; i < files.length; i++) {

            var file = files[i];

            var imageType = /image.*/; //�̹��� �����ϰ�츸.. �ѷ��ش�.
            if (!file.type.match(imageType))
                continue;

            var prevImg = document.getElementById("prev_" + "adddiv"); //������ �̸����Ⱑ �ִٸ� ����
            if (prevImg) {
                preview.removeChild(prevImg);
            }

        	
        	$("#imagezone").css({margin:"-3px 0px",width:"544px" , height:"150px", "border-left":"1px inset #d9dde1", "border-top":"1px inset #d9dde1","border-right":"1px inset #d9dde1","border-top":0});
     		$("#textzone").css({"border-bottom-width":0});
     		$adddiv.css({'background-repeat':'no-repeat','background-size':'100% 100%'});
     		$adddiv.css({margin:"10px 10px", width:"130px" , height:"130px"});
     		
            
            var img = document.createElement("img"); //ũ���� div�� �̹����� �ѷ����� �ʴ´�. �׷��� �ڽ�Element�� �����.
            img.id = "prev_" + "adddiv";
            img.classList.add("obj");
            img.file = file;
            img.style.width = '130px'; //�⺻������ div�� �ȿ� �ѷ����� ȿ���� �ֱ� ���ؼ� divũ��� ���� ũ�⸦ �������ش�.
            img.style.height = '130px';
            
            preview.appendChild(img);

            if (window.FileReader) { // FireFox, Chrome, Opera Ȯ��.
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
	
}//if�� jpg ������ ���
	
	
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