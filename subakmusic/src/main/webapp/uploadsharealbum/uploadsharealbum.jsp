<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../color.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<% String id = (String) session.getAttribute("id"); %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>수박뮤직</title>
	<script type="text/javascript" src="../js/rollover.js"></script>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	<script type="text/javascript">
	var addenSong = new Array();
	var addenSong2;
	var count = 0;
	var flag = 0;
	var deletecount=0;
	var allimagepath="";
	var removechildflag=0;

	function searchMusic() {
		var searchtext = document.getElementById("searchtext").value;
		if(searchtext==""||searchtext==null) {
			alert("검색어를 입력해주세요.");
			document.getElementById("searchtext").focus();
			return false;
		}
		var searchtype = document.getElementById("searchtype").value;
		var searchtext = document.getElementById("searchtext").value;
		var params = "searchtype=" + encodeURIComponent(searchtype)
				+ "&searchtext=" + encodeURIComponent(searchtext);
		new ajax.xhr.Request("/Main/uploadsharealbum/searchmusic.do", params, searchMusicResult, 'POST');
	}

	function searchMusicResult(req) {
		if (req.readyState == 4) {
			if (req.status == 200) {
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName('code').item(0).firstChild.nodeValue;
				if (code == 'success') {
					var searchList = eval("(" + xmlDoc.getElementsByTagName('data').item(0).firstChild.nodeValue + ")");
					/*var paginginfor = eval("("
					+ xmlDoc.getElementsByTagName('paging').item(0).firstChild.nodeValue
					+ ")");*/
					//var pagingdiv = document.getElementById("paging");
					var changelistdiv = document.getElementById("changelistdiv");
					changelistdiv.innerHTML = "";
					changelistdiv.innerHTML = makeList(searchList);
				}
			}
		}
	}

	function makeList(searchlist) {
		var html = '<table width="380" border="0" cellpadding="0" cellspacing="0">';
		var html2 = '';
		for ( var i = 0; i < searchlist.length; i++) {
			html2 += '<tr>'
						+ '<td width="30" height="30" align="center"><input type="checkbox" name="songchoice" id="songchoice" value="' + searchlist[i].songnum + '" style="border:none;" /></td><td width="10"></td>'
						+ '<td width="210" align="center">' + searchlist[i].songname + '</td><td width="10"></td>'
						+ '<td width="120" align="center">' + searchlist[i].singer
							+ '<input type="hidden" id="songname'+searchlist[i].songnum+'" value="'+searchlist[i].songname+'"/>'
							+ '<input type="hidden" id="singer'+searchlist[i].songnum+'" value="'+searchlist[i].singer+'"/></td>'
					+ '</tr><tr><td colspan="5" heignt="1" bgcolor="${spline_1px}"></td></tr>';
		}
		var html3 = '</table>';
		var innerhtml = html + html2 + html3;
		return innerhtml;
	}

	function choosedSong() {
		var checkedbox = document.sharealbumform.songchoice;
		var mysonglistdiv = document.getElementById("mysonglistdiv");
		var songnum;
		if (document.sharealbumform.songchoice.length == null) {
			if (count == 10) {
				alert("10개를 초과할 수 없습니다.");
				return false;
			}
			if (addSongCheck(document.sharealbumform.songchoice.value) == false) {
				return false;
			}
			if (flag == 0) {
				mysonglistdiv.innerHTML = "";
				flag++;
			}
			mysongdiv = addMySong(document.sharealbumform.songchoice.value);
			mysonglistdiv.appendChild(mysongdiv);
			return false;
		}
		for ( var i = 0; i < checkedbox.length; i++) {
			if (count == 10) {
				alert("10개를 초과할 수 없습니다.");
				return false;
			}
			if (checkedbox[i].checked) {
				songnum = checkedbox[i].value;
				if (addSongCheck(songnum) == false) {
					return false;
				}
				if (flag == 0) {
					mysonglistdiv.innerHTML = "";
					flag++;
				}
				mysongdiv = addMySong(songnum);
				mysonglistdiv.appendChild(mysongdiv);
			}
		}
	}

	function addMySong(songnum) {
		var songname = document.getElementById("songname" + songnum).value;
		var singer = document.getElementById("singer" + songnum).value;
		var mysongdiv = document.createElement('div');
		mysongdiv.setAttribute('id', 'c' + songnum);
		var html = '<table width="380" border="0" cellpadding="0" cellspacing="0">';
		var html2 = '<tr>'
			+ '<td width="30" height="30" align="center"><input type="checkbox" name="mysongchoice'+songnum+'" id="mysongchoice'+songnum+'" value="'+songnum+'" style="border:none; /></td><td width="10"></td>'
			+ '<td width="210" align="center">' + songname + '</td><td width="10"></td>'
			+ '<td width="120" align="center">' + singer + '</td>'
			+ '</tr><tr><td colspan="5" heignt="1" bgcolor="${spline_1px}"></td></tr>';
		var html3 = '</table>';
		mysongdiv.innerHTML = html + html2 + html3;
		return mysongdiv;
	}

	function addSongCheck(songnum) {
		for ( var i = 0; i < addenSong.length; i++) {
			if (addenSong[i] == songnum) {
				alert("이미 추가하신 곡입니다.");
				return false;
			}
		}
		addenSong[count] = songnum;
		count++;
	}

	function deleteSong() {
		addenSong2=addenSong;
		//계속 addenSong.length의 길이가 줄어들어서 문제.
		for(var y=0;y<addenSong2.length;y++){
			for ( var i = 0; i < addenSong2.length; i++) {
				var songnum1 = document.getElementById("mysongchoice"+addenSong2[i]);
				if(songnum1.checked){
					var songnum2=songnum1.value;
					var mysongdiv = document.getElementById("c" + songnum2);
					mysongdiv.parentNode.removeChild(mysongdiv);
					deleteSongCheck(songnum2);
				}
			}
		}						
	}

	function deleteSongCheck(songnum) {
		var newarray = new Array();
		var newarraycount=0;
		for ( var i = 0; i < addenSong.length; i++) {
			if (addenSong[i] == songnum) {
				count--;
				continue;
			}
			newarray[newarraycount] = addenSong[i];//새로운 array만들기
			newarraycount++;
		}
		addenSong = newarray;
	}
	
	function inputImage(obj){
		var changeimg = document.getElementById("preview");
		var basicimg=document.getElementById("changeimg");
		changeimg.style.cssText="width:200px; height:200px";
		if(removechildflag==0){
		basicimg.parentNode.removeChild(basicimg);
		removechildflag++;
		}
		changeimg.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+obj.value+"',sizingMethod=scale)";
		
		if(obj.value==null||obj.value==""){
			var myimagepath = document.getElementById("imagepath");
			myimagepath.setAttribute("value","");
		} else{
			var myimagepath = document.getElementById("imagepath");
			myimagepath.setAttribute("value",obj.value);
		}
	}

	function inputImagePath(imagepath) {
		allimagepath=imagepath;
		var changeimg = document.getElementById("changeimg");
		changeimg.setAttribute("src", imagepath);
		var myimagepath = document.getElementById("imagepath");
		myimagepath.setAttribute("value",imagepath);
	}

	function popup() {
		window.open('/Main/uploadsharealbum/imageupload.jsp', '', 'width=300, height=150');
	}

	function checkValidation() {
		if (document.sharealbumform.title.value == "" || document.sharealbumform.title.value == null){
			alert("제목을 입력해주세요.");
			document.sharealbumform.title.focus();
			return false;
		}
		if (document.sharealbumform.inturoduction.value == "" || document.sharealbumform.inturoduction.value == null) {
			alert("내용을 입력해주세요.");
			document.sharealbumform.inturoduction.focus();	
			return false;
		}
		if(count==0){
			alert("공개할 앨범을 추가해주세요.");
			document.sharealbumform.searchtext.focus();	
			return false;
		}
		makingvalue();
	}

	function makingvalue(){
		alert(addenSong.length);
		var songvalues2="";
		for(var i=0;i<addenSong.length;i++){
			if(i==(addenSong.length-1)){
				songvalues2+=addenSong[i];
				var songvalues=document.getElementById("songvalues");
				songvalues.setAttribute("value",songvalues2);
				return true;
			}
			songvalues2+=addenSong[i]+",";
		}
	}
	
	function toList() {
		window.location='/Main/sharealbum/sharealbumlist.do';
	}
	</script>
</head>
<body>

	<table width="1000" align="center" border="0" cellpadding="0" cellspacing="0">
	
		<!-- 헤더 -->
		<tr><td><jsp:include page="../home/home_top.jsp" /></td></tr>
		
		<!-- 메인 네비게이션 -->
		<tr><td><jsp:include page="../include/navigation.jsp" /></td></tr>
		
		
		<tr><td height="20"></td></tr>
		
		<tr>
			<td>
			
				<table width="940" border="0" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td>
							<form name="sharealbumform" action="uploadsharealbum.do" onsubmit="return checkValidation()">
								<table width="940" border="0" cellpadding="0" cellspacing="0" align="center">
									<tr><td class="subTitle" align="center">공 개 앨 범</td></tr>
									<tr><td height="10"></td></tr>
									<tr>
										<td>
										
											<table width="800" border="0" cellpadding="0" cellspacing="0" align="center">
												<tr>
													<td width="200"><img id="changeimg" width="200" height="200" src="../subak_images/sub/openalbum/basicimg.jpg" /><div id="preview"></div></td>
													<td width="15" rowspan="3"></td>
													<td width="*" rowspan="3" valign="top">
														<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
															<tr><td><b>제목 : </b><input type="text" name="title" style="width:500px;" /></td></tr>
															<tr><td height="10"></td></tr>
															<tr><td><b>소개글 :</b></td></tr>
															<tr><td height="5"></td></tr>
															<tr><td><textarea name="inturoduction" style="width:540px; height:140px;"></textarea></td></tr>
														</table>
													</td>
												</tr>
												<tr><td colspan="3" height="5"></td></tr>
												<tr>
													<td align="center"><input type="button" value="이미지수정" onclick="popup()" /></td>
												</tr>
												<tr><td colspan="3" height="15"></td></tr>
												<tr><td colspan="3" class="subPoint">곡 추가</td></tr>
												<tr><td colspan="3" height="10"></td></tr>
												<tr>
													<td colspan="3">
														<select id="searchtype">
															<option value="songname">노래제목</option>
															<option value="singer">아티스트명</option>
														</select>
														<input type="text" id="searchtext" name="searchtext" value="${ search_text }" style="width:250px;" />
														<input type="button" value="검색" onclick="searchMusic()" />
													</td>
												</tr>
												<tr><td colspan="3" height="5"></td></tr>
												<tr>
													<td colspan="3">
														
														<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
															<tr>
																<td><b>곡 검색결과</b></td>
																<td colspan="3"></td>
																<td><b>추가곡</b></td>
															</tr>
															<tr><td colspan="5" height="5"></td></tr>
															<tr>
																<td width="380" valign="top">
																	
																	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
																		<tr><td colspan="5" height="3" bgcolor="${ spline_3px }"></td></tr>
																		<tr bgcolor="${ th_bg }">
																			<th width="30" height="30"></th>
																			<th width="10"></th>
																			<th width="210">곡 제목</th>
																			<th width="10"></th>
																			<th width="120">아티스트</th>
																		</tr>
																		<tr>
																			<td colspan="5" height="310" align="center" valign="top">
																				<div id="changelistdiv">
																					<table width="100%"><tr><td height="100" align="center">곡, 아티스트를 검색하시면<br/>리스트가 표시됩니다.</td></tr></table>
																				</div>
																			</td>
																		</tr>
																		<tr><td colspan="5" height="2" bgcolor="${ spline_3px }"></td></tr>
																	</table>
																	
																</td>
																<td width="5"></td>
																<td width="30">
																	<table width="100%" border="0" cellpadding="0" cellspacing="0">
																		<tr><td align="center"><a href="#" onclick="choosedSong()"><img src="../subak_images/sub/openalbum/add.gif" border="0" /></a></td></tr>
																		<tr><td height="10"></td></tr>
																		<tr><td align="center"><a href="#" onclick="deleteSong()"><img src="../subak_images/sub/openalbum/delete.gif" border="0" /></a></td></tr>
																	</table>
																</td>
																<td width="5"></td>
																<td width="380" valign="top">
																
																	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
																		<tr><td colspan="5" height="3" bgcolor="${ spline_3px }"></td></tr>
																		<tr bgcolor="${ th_bg }">
																			<th width="30" height="30"></th>
																			<th width="10"></th>
																			<th width="210">곡 제목</th>
																			<th width="10"></th>
																			<th width="120">아티스트</th>
																		</tr>
																		<tr>
																			<td colspan="5" height="310" align="center" valign="top">
																				<div id="mysonglistdiv">
																					<table width="100%"><tr><td height="100" align="center">곡을 추가해주세요.</td></tr></table>
																				</div>
																			</td>
																		</tr>
																		<tr><td colspan="5" height="2" bgcolor="${ spline_3px }"></td></tr>
																	</table>
																
																</td>
															</tr>
														</table>
														
													</td>
												</tr>
											</table>
											
										</td>
									</tr>
									<tr>
										<td height="10">
											<input type="hidden" name="id" value="${ id }" />
											<input type="hidden" id="imagepath" name="imagepath" value="C:\myProgram\myStruts\.metadata\.plugins\org.eclipse.wst.server.core\tmp2\wtpwebapps\Main\subak_images\sub\openalbum\basicimg.jpg"/>
											<input type="hidden" name="songvalues" id="songvalues"/>
										</td>
									</tr>
									<tr>
										<td align="center">
											<input type="image" src="../subak_images/sub/openalbum/submit.gif" style="border:none;width:44px;height:18px;" />
											<a href="#" onclick="toList()"><img src="../subak_images/sub/openalbum/cancel.gif" border="0" /></a>
										</td>
									</tr>
								</table>
							</form>
								
						</td>
					</tr>
				</table>
				
			</td>
		</tr>
		
		<!-- 푸터 / 카피라이트 -->
		<tr><td height="50"></td></tr>
		<tr><td align="center"><jsp:include page="../include/footer.jsp" /></td></tr>
		
	</table>





<%-- 	<form name="sharealbumform" action="uploadsharealbum.do"
		onsubmit="return checkValidation()">
		<h2>공개앨범</h2>
		<table width="400">
			<tr>
				<td rowspan="5">
				<img id="changeimg" width="220" height="200"
					src="../image/uploadforsharealbum/basicimg.jpg" />	
				<div id="preview"></div>
				</td>
			
				<td>&nbsp;<font size="2">공개앨범 제목</font></td>
			</tr>
			<tr>
				<td>&nbsp;<input type="text" name="title" size="35" /></td>
			</tr>
			<tr>
				<td>&nbsp;<font size="2">프로듀서:${id}</font></td>
			</tr>
			<tr>
				<td>&nbsp;<font size="2">소개글</font></td>
			</tr>
			<tr>
				<td>&nbsp;<textarea name="inturoduction" rows="5" cols="35"></textarea></td>
			</tr>
			<tr>
				<td align="left"><a href="#" onclick="popup()"><font
						size="2">+이미지수정</font></a></td>
			</tr>
		</table>
		<br />
		<h3>곡 추가</h3>
		<select id="searchtype">
			<option value="songname">노래제목</option>
			<option value="singer">아티스트명</option>
		</select> <input type="text"  placeholder="가수/노래명을 입력" id="searchtext" name="searchtext" value="${search_text}" /> <input
			type="button" value="검색" onclick="searchMusic()" /> <br />

		<table width="400">
			<tr>
				<td>
					<!-- 새로운 테이블 1 -->
					<table width="250">
						<tr>
							<td>곡 검색결과</td>
						</tr>
					</table>

					<table width="250" height="300" frame="box" bordercolor="silver">
						<tr bgcolor="silver" height="20">
							<th align="left" width="15"></th>
							<th width="110"><font size="2">곡 제목</font></th>
							<th width="50" align="center"><font size="2">아티스트</font></th>
						</tr>
						<tr>
							<td colspan="3" valign="top">

								<div id="changelistdiv">
									<font size="2">곡, 아티스트를 검색하시면 리스트가 표시됩니다.</font>
									<table>
										<tr>
											<td></td>
										</tr>
									</table>

								</div>
							</td>

						</tr>

					</table>

				</td>

				<td><a href="#" onclick="choosedSong()"><img
						src="../image/uploadforsharealbum/choice.png" border="0" /></a> <a
					href="#" onclick="deleteSong()"><img
						src="../image/uploadforsharealbum/delete.png" border="0" /></a></td>

				<td>
					<!-- 새로운 테이블 2 -->
					<table width="250">
						<tr>
							<td>추가곡</td>
						</tr>
					</table>

					<table width="250" height="300" frame="box" bordercolor="silver">
						<tr bgcolor="silver" height="20">
							<th align="left" width="15"></th>
							<th width="110"><font size="2">곡 제목</font></th>
							<th width="50" align="center"><font size="2">아티스트</font></th>
						</tr>
						<tr>
							<td colspan="3" valign="top" align="center">
								<div id="mysonglistdiv">
									<font size="2">곡을 추가해주세요.</font>
									<table>
										<tr>
											<td></td>
										</tr>
									</table>
								</div>
							</td>

						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="20"></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="image"
					src="../image/uploadforsharealbum/seal.png" /> &nbsp;<img
					src="../image/uploadforsharealbum/nonseal.png" /> <input
					type="hidden" name="id" value="${id}" />
					<input type="hidden" id="imagepath" name="imagepath" value="C:\myprogram\mystruts\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\chart\image\uploadforsharealbum\basicimg.jpg"/>
					<input type="hidden" name="songvalues" id="songvalues"/> 			 
					</td>
			</tr>
		</table>
	</form>
	 --%>
</body>
</html>