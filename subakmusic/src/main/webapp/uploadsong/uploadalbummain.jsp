<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>수박뮤직</title>
	<link href="../css/style_nobg.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	function addfile(formname) {
		var count = parseInt(formname.mp3count.value);
	
		var getTable = document.getElementById("setTable");
		var html1 = '<table width="380" height="100" border="1" frame="hsides">';
		var html = "";
		var html2 = '<tr><th bgcolor="grey"><font size="2" face="돋움">앨범이미지:</font></th><td align="left"><input name="albumimage" type="file" size="22"></input></center></td></tr></table>';
	
		for ( var i = 0; i < count; i++) {
			html += '<tr><th bgcolor="grey"><font size="2" face="돋움">노래제목'
					+ (i + 1)
					+ ':</font></th><td align="left"><input type="text" id="songname'+i+'" name="songname'+i+'" size="22" /></td></tr><tr><th bgcolor="grey"><font size="2" face="돋움">mp3파일'
					
					+ (i + 1)
					+ ':</font></th><td align="left"><input type="file" id="mp3file'+i+'" name="mp3file'+i+'" size="22"  /></td></tr>';
	
		}
		getTable.innerHTML = html1 + html + html2;
		getTable.appendChild(makeTable);
	}
	
	function checkValidation() {
		var formname = document.registeralbumform;
	
		if (formname.album.value == "" || formname.album.value == null) {
			alert("앨범이름을 입력해주세요.");
			formname.album.focus();
			return false;
		}
		if (formname.singer.value == "" || formname.singer.value == null) {
			alert("가수이름을 입력해주세요.");
			formname.singer.focus();
			return false;
		}
	
		if (formname.content.value == "" || formname.content.value == null) {
			alert("앨범(노래) 내용을 입력해주세요");
			formname.content.focus();
			return false;
		}
		if (genreCheckBoxValidation2() == false) {
			return false;
		}
	
		if (formname.mp3count.value == "" || formname.mp3count.value == null) {
			alert("mp3파일 개수를 입력해주세요");
			formname.mp3count.focus();
			return false;
		}
	
		if (formname.mp3count.value == 0) {
			alert("mp3파일 개수 1개 이상 입력해주세요");
			formname.mp3count.focus();
			return false;
		}
		if ((document.getElementById("songname0")== null)) {
			alert("mp3파일 개수 확인버튼을 눌러주세요.");
			formname.mp3add.focus();
			return false;
		}
	
		for ( var i = 0; i < formname.mp3count.value; i++) {
			var songname = document.getElementById("songname" + i);
			var mp3file = document.getElementById("mp3file" + i);
	
			if (songname.value == "" || songname.value == null) {
				alert((i + 1) + "번째 노래 제목을 써주세요");
				songname.focus();
				return false;
				
				
			}
			if (mp3file.value == "" || mp3file.value == null) {
				alert((i + 1) + "번째 mp3파일을 추가해주세요");
				mp3file.focus();
				return false;
				
				
			}
	
			var checkmp3value = mp3file.value.substring(mp3file.value
					.lastIndexOf(".") + 1);
			if (checkmp3value != "mp3") {
				alert("음악파일은 mp3파일만 가능합니다.");
				mp3file.focus();
				return false;
			}
		}
	
		/*if (songNameAndMp3FileValidation() == false) {
				return false;
			}
		
		 */
		if (formname.albumimage.value == "" || formname.albumimage.value == null) {
			alert("앨범이미지를 추가해주세요.");
			formname.albumimage.focus();
			return false;
		}
		
		 var tempcheckalbumvalue=formname.albumimage.value;
		 var checkalbumvalue=tempcheckalbumvalue.substring(tempcheckalbumvalue.lastIndexOf(".")+1);
		 if (checkalbumvalue!="jpg"){
			 alert("앨범이미지는 jpg 이미지만 업로드 가능합니다.");
			 formname.albumimage.focus();
			 return false;
		 }
	}
	/*
	function songNameAndMp3FileValidation() {
		var formname = document.registeralbumform;
			
		for ( var i = 0; i < formname.mp3count.value ; i++) {
			var songname = document.getElementById("songname"+i);
			var mp3file = document.getElementById("mp3file"+i);
			
			if (songname.value == "" || songname.value == null) {
				alert((i + 1) + "번째 노래 제목을 써주세요");
				
				formname.songname[i].focus();
				return false;
			}
			if (mp3file.value == "" || mp3file.value == null) {
				alert((i + 1) + "번째 mp3파일을 추가해주세요");
				formname.mp3file[i].focus();
				return false;
			}
	
			var checkmp3value = mp3file[i].value.substring(mp3file[i].value
					.lastIndexOf(".") + 1);
			if (checkmp3value != "mp3") {
				alert("확장자가 .mp3가 아닙니다.");
				return false;
			}
		}
	}
	 */
	function genreCheckBoxValidation2() {
		var genrecheckbox = document.registeralbumform.genre;
		var count = 0;
		for ( var i = 0; i < genrecheckbox.length; i++) {
	
			if (genrecheckbox[i].checked) {
				count++;
			}
		}
		if (count == 0) {
			alert("장르를 선택해주세요!!!");
			return false;
		}
	}
	
	var count = 0;
	function genreCheckBoxValidation(checkboxnum) {
		var genrecheckbox = document.registeralbumform.genre;
	
		if (genrecheckbox[checkboxnum].checked == true) {
			count++;
		}
		if (genrecheckbox[checkboxnum].checked == false) {
			count--;
		}
		if (count == 3) {
			alert("장르는 2개만 선택해주세요");
			genrecheckbox[checkboxnum].checked = false;
			count--;
			return false;
		}
	}
	</script>
</head>
<body>

	<table width="1000" align="center" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="3"><hr /></td>
		</tr>
		<tr>
			<td width="150" align="left" valign="top"><jsp:include page="../admin/admin_Leftmenu.jsp" flush="false" /></td>
			<td width="10"></td>
			<td align="left" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<table width="750" align="center" border="0" cellpadding="10" cellspacing="15" style="border-color: #DDDDDD; border-style: none;">
								<tr>
									<td align="center">
									
										<form name="registeralbumform" method="post" enctype="multipart/form-data" action="/Main/uploadsong/upload.do" onsubmit="return checkValidation()">
											<table width="380" height="300" border="1" frame="hsides" summary="앨범을 올릴 수 있는 테이블로써 앨범이름, 가수이름, 내용, 장르,mp3업로드,이미지 업로드를 할 수 있다.">
												<thead>
													<tr bgcolor="black">
														<td colspan="3" rowspan="2" height="30"><center>
																<font color="white" size="3" face="돋움">앨범 올리기 (관리자모드)</font>
															</center></td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th scope="row"><font size="2" face="돋움" color="#2E0EB9"><label for="albumname">앨범이름:</label></font></th>
														<td align="left"><input id="albumname" name="album" type="text" size="20"
															value="${album}"></input></td>
													</tr>
													<tr>
														<th scope="row"><font size="2" face="돋움" color="#2E0EB9"><label for="singername">가수이름:</label></font></th>
														<td align="left"><input id="singername" name="singer" type="text" size="20"></input></td>
													</tr>
													<tr>
														<th scope="row"><font size="2" face="돋움" color="#2E0EB9"><label for="content">내용:</label></font></th>
														<td align="left"><textarea id="content" name="content" cols="30" rows="10"></textarea></td>
													</tr>
													<tr>
														<th scope="row"><font size="1" face="돋움" color="#2E0EB9">장르(2개만
																선택)</font></th>
														<td><font size="2" face="돋움"> <input id="pop"
																type="checkbox" name="genre" value="팝(pop)"
																onclick="genreCheckBoxValidation(0)" /><label for="pop">팝(pop)</label>
																<input id="dance" type="checkbox" name="genre" value="댄스"
																onclick="genreCheckBoxValidation(1)" /><label for="dance">댄스</label>
																<input id="hiphop" type="checkbox" name="genre" value="힙합"
																onclick="genreCheckBoxValidation(2)" /><label for="hiphop">힙합</label>
																<input id="balad" type="checkbox" name="genre" value="발라드"
																onclick="genreCheckBoxValidation(3)" /><label for="balad">발라드</label><br />
																<input id="trot" type="checkbox" name="genre" value="트로트"
																onclick="genreCheckBoxValidation(4)" /><label for="trot">트로트</label>
																<input id="ost" type="checkbox" name="genre" value="ost"
																onclick="genreCheckBoxValidation(5)" /><label for="ost">OST</label>
																<input id="jpop" type="checkbox" name="genre" value="j-pop"
																onclick="genreCheckBoxValidation(6)" /><label for="jpop">J-POP</label>
																<input id="ccm" type="checkbox" name="genre" value="ccm"
																onclick="genreCheckBoxValidation(7)" /><label for="ccm">CCM</label>
														</font></td>
													</tr>
													<tr>
														<th scope="row"><font size="1" face="돋움" color="#2E0EB9"><label for="uploadfilecount">업로드할
																mp3파일 개수:</label></font></th>
														<td align="left"><input id="uploadfilecount" name="mp3count" type="text" size="3"
															value="${mp3count}"></input> <input type="button" name="mp3add"
															onclick="addfile(this.form)" value="확인"></input></td>
								
													</tr>
												</tbody>
											</table>
											<div id="setTable">
												<table width="380" border="1" frame="hsides">
													<tr>
														<th bgcolor="grey"><font size="2" face="돋움">앨범이미지:</font></th>
														<td align="left"><input name="albumimage" type="file"
															size="22"></input></td>
													</tr>
								
												</table>
											</div>
											<table width="380" border="1" frame="hsides">
												<tr>
													<td bgcolor="grey" colspan="2"><center>
															<input type="submit" value="upload" /> <input type="button" value="cancel" onclick="" />
														</center></td>
												</tr>
								
											</table>
								
										</form>
									
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
</body>
</html>