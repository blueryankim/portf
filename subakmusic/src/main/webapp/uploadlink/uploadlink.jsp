<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>업로드 미디어링크</title>
	<script type="text/javascript">
	function validationCheck(){
		var formname=document.uploadlinkform;
		var genrecheckbox=formname.genre;
		
		if(formname.songname.value==""||formname.songname.value==null){
			alert("노래제목을 입력해주세요.");
			formname.songname.focus();
			return false;
		}
		
		if(formname.linkaddress.value==""||formname.linkaddress.value==null){
			alert("링크주소를 입력해주세요");
			formname.linkaddress.focus();
			return false;
		}
		
		if(formname.content.value==""||formname.content.value==null){
			alert("내용을 입력해주세요");
			formname.content.focus();
			return false;
		}
		
		var formname=document.uploadlinkform;
		var count=0;
		for(var i=0;i<genrecheckbox.length;i++){
			if(genrecheckbox[i].checked){
				count++;
			}
		}
	
		if(count==0){
			alert("장르를 체크해주세요");
			return false;
		}
		
		if(formname.mediaimg.value==""||formname.mediaimg.value==null){
			alert("이미지를 업로드해주세요.");
			return false;
		}
	
		var mediaimgcheck=formname.mediaimg.value.substring(formname.mediaimg.value.lastIndexOf(".")+1);
		
		if(mediaimgcheck!="jpg") {
			alert("이미지는 jpg파일만 업로드해주세요.");
			return false;
		}
		
	}
	
	var gernecount=0;
	
	function checkGenre(index) {
		var formname=document.uploadlinkform;
		var genrecheckbox=formname.genre;
		
		if(genrecheckbox[index].checked==true) {
			genrecount++;
		}
		
		if(genrecheckbox[index].checked==false) {
			genrecount--;
		}
		
		if(genrecount==2) {
			alert("장르는 하나만 체크해주세요");
			genrecheckbox[index].checked=false;
			genrecount--;
			return false;
		}
	}
	</script>
</head>
<body>
	<center>
		<form name="uploadlinkform" method="post" enctype="multipart/form-data" action="/Main/uploadlink/uploadlink.do" onsubmit="return validationCheck()">
			<table width="350" frame="hsides" border="1" summary="미디어를 업로드하기 위한 테이블로써 노래제목,링크주소,내용,장르,이미지를 업로드할 수 있다.">
				
				<tr>
					<th scope="row" colspan="2" bgcolor="grey"><font size="2" face="돋움">업로드 미디어 링크</font></th>
				</tr>
				<tr>
					<th scope="row"><font size="2" face="돋움"><label for="songtitle">노래 제목:</label></font></th>
					<td align="left"><input id="songtitle" type="text" name="songname" size="25"></input></td>
				</tr>
				<tr>
					<th scope="row"><font size="2" face="돋움"><label for="linkaddress">링크 주소:</label></font></th>
					<td align="left"><input id="linkaddress" type="text" name="linkaddress" size="25"></input></td>
				</tr>
				<tr>
					<th scope="row"><font size="2" face="돋움"><label for="content">내용:</label></font></th>
					<td align="left"><textarea id="content" name="content" cols="20" rows="10"></textarea></td>
				</tr>
				<tr>
					<th scope="row"><font size="2" face="돋움">장르:</font></th>
					<td align="left"><input id="gayo" type="checkbox" name="genre" onclick="checkGenre(0)" value="가요"/><label for="gayo"><font size="2" face="돋움">가요</font></label>
					<input id="pop" type="checkbox" name="genre" onclick="checkGenre(1)" value="팝송"/><label for="pop"><font size="2" face="돋움">팝송</font></label>
					</td>
				</tr>																
				<tr>
					<th scope="row"><font size="2" face="돋움"><label for="image">이미지:</label></font></th>
					<td align="left"><input type="file" name="mediaimg"></input></td>
				</tr>
				<tr>
					<td colspan="2"><input id="image" type="submit" value="upload"></input><input
						type="button" value="cancel" onclick="#"></input></td>
				</tr>
				
			</table>
		</form>
	</center>
</body>
</html>