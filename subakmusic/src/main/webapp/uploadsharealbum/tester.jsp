<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="sharealbumform" action="uploadsharealbum.do"
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
	
</body>
</html>
