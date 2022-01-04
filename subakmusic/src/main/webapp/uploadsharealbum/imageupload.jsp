<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../color.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>이미지업로더</title>
	<link href="../css/style_nobg.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	<script type="text/javascript">
	var imgobj;
	
	function previewImage(obj) {
		imgobj=obj;
	}
	
	function confirm() {
		var imagepath=document.getElementById("imagefile").value;
		if(imagepath==null||imagepath=="") {
			self.close();
		}
		else{
			opener.inputImage(imgobj,imagepath);
			self.close();
		}
	}
	
	function uploadImage() {
		var imagepath=document.getElementById("imagefile").value;
		if(imagepath==null||imagepath=="") {
			opener.inputImagePath("");
			self.close();
		}
		else {
			opener.inputImagePath(imagepath);
			self.close();	
		}
		/*
		var params="id="+encodeURIComponent(id)+"&imagepath="+encodeURIComponent(imagepath);
		new ajax.xhr.Request("/chart/chart/takemypoint.do",params, takePointResult, 'POST');
		*/	
	}
	</script>
</head>
<body>

	<form name="imageuploadform">
		<table width="100%" border="0" cellpadding="7" cellspacing="0" align="center">
			<tr>
				<td>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
						<tr><td class="subPoint">이미지 올리기</td></tr>
						<tr><td height="5"></td></tr>
						<tr><td height="3" bgcolor="${ spline_3px }"></td></tr>
						<tr><td height="25"></td></tr>
						<tr><td align="center"><input type="file" id="imagefile" onchange="previewImage(this)" /></td></tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td align="center">
								<a href="#" onclick="confirm()"><img src="../subak_images/sub/openalbum/ok.gif" border="0" /></a>
								<a href="#" onclick="self.close()"><img src="../subak_images/sub/openalbum/cancel.gif" border="0" /></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>