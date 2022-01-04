<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../color.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% String id = (String) session.getAttribute("id"); %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>수박뮤직 - 앨범정보</title>
	<script type="text/javascript" src="../js/rollover.js"></script>
	<link href="../css/style_nobg.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	<script type="text/javascript">
	//앨범 커맨트를 불러온다 데이터베이스 기반으로 데이터를 불러오기때문에 글을 쓰든 지우든 데이터베이스에서 가져온 글로
	//업데이트되므로 지워진글을 알아서 지워지고 새로운글은 알아서 업데이트가 된다.
	var songnums; 
	var point;
	var flag;
	var allchoiceflag=0;
	
	window.onload = takePoint;
	var prevonload = window.onload;
	window.onload = function() {
		prevonload();
		loadCommentList(document.getElementById("albumnum").value);
	};
	
	function takePoint(){
		var id=document.getElementById("sessionid").value;
		if(id==null||id==""){
			return false;
		}
		var params="id="+encodeURIComponent(id);
		new ajax.xhr.Request("/Main/sharealbum/takemypoint.do",params, takePointResult, 'POST');
	}
		
	function takePointResult(req){
		if (req.readyState == 4) {
			if (req.status == 200) {
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName('code').item(0).firstChild.nodeValue;
				if (code == 'success') {		
					temppoint= eval("(" + xmlDoc.getElementsByTagName('data').item(0).firstChild.nodeValue + ")");
					point=temppoint.point;
				}
			}
		}
	}
		
			
	function forPlay(songnum1) {
		var id=document.getElementById("sessionid").value;
		if(id==null||id=="") {
			alert("로그인을 하셔야 들을 수 있습니다.");
			return false;
		}
		takePoint();
			
		if(point<300) {
			alert("포인트가 부족합니다.");
			return false;
		}
		
		if(point>=300) {
			if(confirm("구입하시겠습니까?")) {	
			songnums=songnum1;
			var id=document.getElementById("sessionid").value;
			var params = "songnum=" + encodeURIComponent(songnums)
					+ "&id=" + encodeURIComponent(id)+"&purchasetype="+encodeURIComponent("play");
			new ajax.xhr.Request("/Main/albuminformation/songpurchase.do",params, forPlayResult, 'POST');
			//songpurchasecheck 컨트롤러를 사용하도록.
			}
		}
	}
	
	function forPlayResult(req){
		if (req.readyState == 4) {
			if (req.status == 200) {
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName('code').item(0).firstChild.nodeValue;
							
				if (code == 'success') {
					var point = eval("(" + xmlDoc.getElementsByTagName('data').item(0).firstChild.nodeValue + ")");
					window.open('musicplay.do?songnums='+songnums+'','','width=300 height=370 scrollbars=no,menubar=no,location=no resizable=no');
				}
			}
		}
	}
	
	function checkMyDown(songnum1) {
		var id=document.getElementById("sessionid").value;
		var params="id="+encodeURIComponent(id)+"&songnum="+encodeURIComponent(songnum1);
		new ajax.xhr.Request("/Main/albuminformation/checkmydown.do",params, checkMyDownResult, 'POST');
	}
		
	function checkMyDownResult(req){
		if (req.readyState == 4) {
			if (req.status == 200) {
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName('code').item(0).firstChild.nodeValue;
				if (code == 'success') {		
					var tempflag= eval("(" + xmlDoc.getElementsByTagName('data').item(0).firstChild.nodeValue + ")");
					flag=tempflag.flag;
				}
			}
		}
	}
				
	function forDown(songnum1) {
		var id=document.getElementById("sessionid").value;
		
		if(id==null||id=="") {
			alert("로그인을 하셔야 다운로드를 할 수 있습니다.");
			return false;
		}
		
		songnums=songnum1;
	
		takePoint();
		checkMyDown(songnum1);
		
		if(flag=="0") {
			if(point<500) {
				alert("포인트가 부족합니다.");
				return false;
			}
		}
			
		if(flag=="0") {
			if(point>=500) {
				if(confirm("구입하시겠습니까?")) {
					var id=document.getElementById("sessionid").value;
					var params = "songnum=" + encodeURIComponent(songnums)
							+ "&id=" + encodeURIComponent(id)+"&purchasetype="+encodeURIComponent("download");
					new ajax.xhr.Request("/Main/albuminformation/songpurchase.do",params, forDownloadResult, 'POST');
				}
			}
		}
		
		if(flag=="1"){
			window.location='/Main/download/file/?songnum='+songnums+'';
		}
	}
				
	function forDownloadResult(req) {
		if (req.readyState == 4) {
			if (req.status == 200) {
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName('code').item(0).firstChild.nodeValue;
				if (code == 'success') {		
					var tempflag= eval("(" + xmlDoc.getElementsByTagName('data').item(0).firstChild.nodeValue + ")");
				
					if(tempflag.flag=="1") {
						window.location='/Main/download/file/?songnum='+songnums+'';
					}
				}
			}
		}
	}
	
	function loadCommentList(albumnum) {
		//alert(albumnum);
		var params = "albumnum=" + encodeURIComponent(albumnum) + "&pageNum=";
		new ajax.xhr.Request("/Main/albuminformationcomment/albumcomment.do", params, loadCommentResult, 'GET');
	}
	
	function movePage(pagenum) {
		var albumnum = document.getElementById("albumnum").value;
		var params = "albumnum=" + encodeURIComponent(albumnum)
				+ "&pageNum=" + encodeURIComponent(pagenum);
		new ajax.xhr.Request("/Main/albuminformationcomment/albumcomment.do", params, movePageResult, 'GET');
	}
	
	function movePageResult(req) {
		if (req.readyState == 4) {
			if (req.status == 200) {
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName('code').item(0).firstChild.nodeValue;
	
				if (code == 'success') {
					var commentList = eval("(" + xmlDoc.getElementsByTagName('data').item(0).firstChild.nodeValue + ")");
					var paginginfor = eval("(" + xmlDoc.getElementsByTagName('paging').item(0).firstChild.nodeValue + ")");
					var pagingdiv = document.getElementById("paging");
					var madepagingdiv = makePaging(paginginfor);
					pagingdiv.innerHTML = "";
					pagingdiv.appendChild(madepagingdiv);
					var listdiv = document.getElementById("commentList");
					listdiv.innerHTML = "";
					for ( var i = 0; i < commentList.length; i++) {
						var commentDiv = makeCommentView(commentList[i]);
						listdiv.appendChild(commentDiv);
					}
				}
			}
		}
	}
	
	function loadCommentResult(req) {
		if (req.readyState == 4) {
			if (req.status == 200) {
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName('code').item(0).firstChild.nodeValue;
	
				if (code == 'success') {
					var commentList = eval("(" + xmlDoc.getElementsByTagName('data').item(0).firstChild.nodeValue + ")");
					var paginginfor = eval("(" + xmlDoc.getElementsByTagName('paging').item(0).firstChild.nodeValue + ")");
					var pagingdiv = document.getElementById("paging");
					var madepagingdiv = makePaging(paginginfor);
					var listdiv = document.getElementById("commentList");
					listdiv.innerHTML = "";
					pagingdiv.innerHTML = "";
					for ( var i = 0; i < commentList.length; i++) {
						var commentDiv = makeCommentView(commentList[i]);
						listdiv.appendChild(commentDiv);
						pagingdiv.appendChild(madepagingdiv);
					}
					document.commentwritingform.commentcontent.value = "";
				}
			}
		}
	}
	
	function makePaging(paging) {
		var pagingdiv = document.createElement('div');
		
		var html = '<center><font color="#000000" style="font-size:8pt;">';
		
		var html2 = "";
		if (paging.ispre == true) {
			html2 = '<a href="#" onclick="movePage(' + (paging.pagestart - paging.p_size) + ')">[이전]</a>';
		}
		
		var html3 = "";
		for( var i = paging.pagestart; i <= paging.pageend; i++) {
			html3 += '<a href="#" onclick="movePage(' + i + ')">&nbsp;' + i + '&nbsp;</a>';
		}
		
		var html4 = "";
		if (paging.isnext == true) {
			html4 = '<a href="#" onclick="movePage(' + (paging.pagestart + paging.p_size) + ')">[다음]</a></font></center>';
		}
	
		pagingdiv.innerHTML = html + html2 + html3 + html4;
	
		return pagingdiv;
	}
	
	function writeComment(myid) {
		var albumnum = document.getElementById("albumnum").value;
		var id = myid;
		var content = document.commentwritingform.commentcontent.value;
	
		var params = "albumnum=" + encodeURIComponent(albumnum)
				+ "&id=" + encodeURIComponent(id)
				+ "&content=" + encodeURIComponent(content);
		
		new ajax.xhr.Request("/Main/albuminformationcomment/albumcomment.do", params, writeCommentResult, 'POST');
	
		//아직 컨트롤러 등록이 되어 있지 않음.
	}
	
	function writeCommentResult(req) {
		if (req.readyState == 4) {
			if (req.status == 200) {
	
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName('code').item(0).firstChild.nodeValue;
	
				if (code == 'success') {
					var commentList = eval("(" + xmlDoc.getElementsByTagName('data').item(0).firstChild.nodeValue + ")");
					var paginginfor = eval("(" + xmlDoc.getElementsByTagName('paging').item(0).firstChild.nodeValue + ")");
					var pagingdiv = document.getElementById("paging");
					var madepagingdiv = makePaging(paginginfor);
					var listdiv = document.getElementById("commentList");
	
					listdiv.innerHTML = "";
					pagingdiv.innerHTML = "";
					
					for ( var i = 0; i < commentList.length; i++) {
						var commentDiv = makeCommentView(commentList[i]);
						listdiv.appendChild(commentDiv);
						pagingdiv.appendChild(madepagingdiv);
					}
					
					document.commentwritingform.commentcontent.value = "";
					alert("성공적으로 등록되었습니다.");
				}
			}
		}
	}
	
	function makeCommentView(comment) {
		var commentDiv = document.createElement('div');
		commentDiv.setAttribute('id', 'c' + comment.commentid);
		var html = '<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" bgcolor="DDDDDD">'
				+ '<tr><td colspan="3" height="5"></td></tr>'
				+ '<tr><td width="5"></td><td width="*">'
					+ '<font color="#222222" style="font-size:8pt;">ID: ' + comment.id + '</font>'
					+ '&nbsp;&nbsp;&nbsp;<font color="#777777" style="font-size:8pt;">' + comment.regdate + '</font>'
					+ '&nbsp;<a href="#" onclick="confirmDelection(' + comment.commentid + ')"/>' + '<img src="../subak_images/sub/chart/x.gif" border="0"></a>'
					+ '</td><td width="5"></td></tr>'
				+ '<tr><td colspan="3" height="3"></td></tr>'
				+ '<tr><td></td><td><font style="font-size:8pt;">' + comment.comment.replace(/\n/g, '\n<br/>') + '</font></td><td></td></tr>'
				+ '<tr><td colspan="3" height="5"></td></tr><tr><td colspan="3" height="1" bgcolor="#FFFFFF"></td></tr></table>';
		commentDiv.innerHTML = html;
		commentDiv.comment = comment;//이부분이 수정버튼을 누를때 필요하다!!!
		commentDiv.className = "comment"; //이부분들이 가장가장가장 중요하다!!!!!
		return commentDiv;
		//commentDiv!!!!
	}
	
	function confirmDelection(commentid1) {
	
		var commentdiv = document.getElementById("c" + commentid1);
		var comment = commentdiv.comment;
		var commentid = comment.id;
		var sessionid = document.getElementById("sessionid").value;
	
		if (commentid != sessionid) {
			alert("지울 수 있는 권한이 없습니다.");
			return false;
		}
		if (commentid == sessionid) {
			if (confirm("삭제하시겠습니까?")) {
				var albumnum = document.getElementById("albumnum").value;
				var commentid = commentid1;
				var params = "albumnum=" + albumnum + "&commentid=" + commentid;
				new ajax.xhr.Request( '/Main/albuminformationcomment/albumcommentdelete.do', params, loadCommentResult, 'POST');
			}
		}
	}
	
	function allChoice() {
		var formname=document.albumlist;
		var checkbox=formname.songcheck;	
		
		if(allchoiceflag==0){
			if(checkbox.length==""||checkbox.length==null){
				checkbox=document.getElementById("songcheck");
				checkbox.checked=true;
				allchoiceflag=1;
				return true;
			}	
			
			for(var i=0;i<checkbox.length;i++){
				checkbox[i].checked=true;
			}
			
			allchoiceflag=1;
			return true;
		}	
		
		if(allchoiceflag==1){
			if(checkbox.length==""||checkbox.length==null){
				checkbox=document.getElementById("songcheck");
				checkbox.checked=false;
				allchoiceflag=0;
				return true;
			}	
			
			for(var i=0;i<checkbox.length;i++){
				checkbox[i].checked=false;
			}		
			allchoiceflag=0;
			return true;
		}
	}
		
	function checkedBoxPlay(){
		var id=document.getElementById("sessionid").value;
		
		if(id==null||id==""){
			alert("로그인을 하셔야 들을 수 있습니다.");
			return false;
		}
		var formname=document.albumlist;
		var checkbox=formname.songcheck;
		var tempsongvalue="";
		var count=0;
		takePoint();
		
		if(checkbox.length==""||checkbox.length==null){
			checkbox=document.getElementById("songcheck");
			
			if(checkbox.checked){	
				tempsongvalue+=checkbox.value;	
				count++;
				songnums=tempsongvalue;
			}
			
			if(count==0){
				alert("음악을 선택해주세요!!!");
				return false;
			}
		
			if(point<300*count){
				alert("포인트가 부족합니다.");
				return false;
			}	
		
			if(point>=300*count){
				if(confirm("묶음듣기를 하시겠습니까?")) {
					var id=document.getElementById("sessionid").value;
					var params="songnums=" + encodeURIComponent(songnums)
							+ "&id=" + encodeURIComponent(id)
							+ "&purchasetype="+encodeURIComponent("play");
					new ajax.xhr.Request("/Main/albuminformation/songpurchase.do",params, checkedBoxPlayResult, 'POST');
				}
			}	
			return true;	
		}
		
		for(var i=0;i<checkbox.length;i++) {
			if(checkbox[i].checked) {
				tempsongvalue+=checkbox[i].value+",";
				count++;
			}	
		}	
		
		songnums=tempsongvalue.substring(0,tempsongvalue.length-1);
				
		if(count==0){
			alert("음악을 선택해주세요!!!");
			return false;
		}
		
		if(point<300*count){
			alert("포인트가 부족합니다.");
			return false;
		}	
		
		if(point>=300*count) {
			if(confirm("묶음듣기를 하시겠습니까?")) {
				var id=document.getElementById("sessionid").value;
				var params = "songnums=" + encodeURIComponent(songnums)
						+ "&id=" + encodeURIComponent(id)
						+ "&purchasetype=" + encodeURIComponent("play");
				new ajax.xhr.Request("/Main/albuminformation/songpurchase.do",params, checkedBoxPlayResult, 'POST');
			}
		}
		//var songvalues=tempsongvalue.substring(0,tempsongvalue.length-1);
	}
		
	function checkedBoxPlayResult(req){
		if (req.readyState == 4) {
			if (req.status == 200) {
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName('code').item(0).firstChild.nodeValue;
				if (code == 'success') {		
					var temppoint = eval("(" + xmlDoc.getElementsByTagName('data').item(0).firstChild.nodeValue + ")");
					window.open('musicplay.do?songnums='+songnums+'','','width=300, height=370 scrollbars=no,menubar=no,location=no resizable=no');
				}
			}
		}
	}
	</script>
</head>
<body>

	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
		<tr><td height="5"></td></tr>
		<tr><td class="subTitle">&nbsp;&nbsp;앨범정보</td></tr>
		<tr><td height="5"></td></tr>
		<tr><td height="3" bgcolor="${ Info_spline_3px }"></td></tr>
		<tr><td height="10"></td></tr>
		<tr>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td width="10"></td>
						<td width="*">
							<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
								<tr>
									<td>
									
										<!-- 앨범정보 -->
										<form name="albuminformation">
											<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
												<tr bgcolor="#000000">
													<td width="10" height="190"><input type="hidden" id="albumnum" value="${albuminfor.songnum}" /></td>
													<td width="170"><img width="170" height="170" src="../albumimage/${albuminfor.path}/${albuminfor.songnum}.jpg" /></td>
													<td width="15"></td>
													<td width="*">
														<font class="subPoint" color="#FFFFFF">${ albuminfor.album }</font><p/>
														<font color="#FFFFFF">&nbsp;&nbsp;&nbsp;-&nbsp;Artist : ${albuminfor.singer }<p/>
														&nbsp;&nbsp;&nbsp;-&nbsp;Genre : ${albuminfor.genre }<p/>
														&nbsp;&nbsp;&nbsp;-&nbsp;Content : ${albuminfor.content}</font>
													</td>
												</tr>
											</table>
										</form>
									
									</td>
								</tr>
							</table>
						</td>
						<td width="10"></td>
					</tr>
					<tr><td colspan="3" height="15"></td></tr>
					<tr>
						<td></td>
						<td>
							
							<!-- 수록곡 정보 -->
							<form name="albumlist">
								<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
									<tr><td colspan="14" class="subPoint2">수록곡</td></tr>
									<tr><td colspan="14" height="3" bgcolor="${ spline_3px }"></td></tr>
									<tr bgcolor="${ th_bg }">
										<th width="30" height="30"></th>
										<th width="5"></th>
										<th width="30">No.</th>
										<th width="5"></th>
										<th>곡명</th>
										<th width="5"></th>
										<th width="100">아티스트명</th>
										<th width="5"></th>
										<th width="30"></th>
										<th width="5"></th>
										<th width="30">듣기</th>
										<th width="5"></th>
										<th width="30">다운</th>
										<th width="5"></th>
									</tr>
									
									<!--  -->
									<c:forEach var="albumlist" items="${albuminforlist }" varStatus="num">
										<tr onmouseover="this.style.backgroundColor='${ tr_onmouseover }'" onmouseout="this.style.backgroundColor=''">
											<td height="30" align="center"><input type="checkbox" name="songcheck" id="songcheck" value="${ albumlist.songnum }" style="border:none;" /></td>
											<td></td>
											<td align="center">${num.count}.</td>
											<td></td>
											<td align="center">${albumlist.songname}</td>
											<td></td>
											<td align="center">${albumlist.singer}</td>
											<td></td>
											<td align="center">♥${albumlist.pcount}</td>
											<td></td>
											<td align="center"><a href="#" onclick="forPlay(${albumlist.songnum})"><img src="../subak_images/sub/chart/play.gif" border="0" /></a></td>
											<td></td>
											<td align="center"><a href="#" onclick="forDown(${albumlist.songnum})"><img src="../subak_images/sub/chart/down.gif" border="0" /></a></td>
											<td></td>
										</tr>
										<tr><td colspan="14" height="1" bgcolor="${ spline_1px }"></td></tr>
									</c:forEach>
									<tr><td colspan="14" height="2" bgcolor="${ spline_2px }"></td></tr>
									<tr><td colspan="14" height="5"></td></tr>
									<tr>
										<td colspan="14">
											<a href="#" onclick="allChoice()"><img src="../subak_images/sub/chart/allcheck.gif" border="0" /></a>
											<a href="#" onclick="checkedBoxPlay()"><img src="../subak_images/sub/chart/checklisten.gif" border="0" /></a>
										</td>
									</tr>
									
								</table>
							</form>
							
						</td>
						<td></td>
					</tr>
					<tr><td colspan="3" height="10"></td></tr>
					<tr>
						<td></td>
						<td>
							<form name="commentwritingform">
								<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
									<tr><td class="subPoint2">댓글쓰기</td></tr>
									<tr>
										<td>
											<textarea name="commentcontent" style="width:427px;height:40px;"></textarea>
											<input type="button" value="등록" onclick="writeComment('${ id }')" style="width:50px;height:40px;" />
											<input type="hidden" id="sessionid" value="${id}" />
										</td>
									</tr>
									<tr><td height="5"></td></tr>
									<tr><td><div id="commentList"></div></td></tr>
									<tr><td><div id="paging"></div></td></tr>
								</table>
							</form>
						</td>
						<td></td>
					</tr>
					<tr><td colspan="3" height="10"></td></tr>
				</table>
			</td>
		</tr>
	</table>
	
	
	
	






	<%-- <img src="../image/albuminfor/albuminfortitle.jpg" />
	<hr color="#32C416" size="3">
	<form name="albuminformation">
		<table width="500" height="100" frame="box" bgcolor="black">
			<tr>
				<td colspan="2" align="left"></td>
			</tr>
			<tr>
				<td rowspan="6" width="230">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
					width="170" height="170"
					src="../albumimage/${albuminfor.path}/${albuminfor.songnum}.jpg" /></td>
				<td><input type="hidden" id="albumnum" value="${albuminfor.songnum}"></input></td>
			</tr>

			<tr>
				<td align="left"><b><font color="white" size="3" face="굴림"><img
							src="../image/albuminfor/albumnameimg1.png"></img>${albuminfor.album}</font></b></td>
			</tr>
			<tr>
				<td align="left"><b><font color="white">Artist:</font></b><font
					size="1" color="white" face="굴림"> ${albuminfor.singer }</font></td>
			</tr>
			<tr>
				<td align="left"><font color="white"><b>Genre:</b></font><font
					size="1" color="white" face="굴림">${albuminfor.genre }</font></td>
			</tr>
			<tr>
				<td align="left"><font color="white"><b>Content:</b></font><font
					color="white" size="1" face="굴림">${albuminfor.content}</font></td>
			</tr>

			<tr>
				<td></td>
			</tr>
		</table>
	</form>
	<br />
	<img src="../image/albuminfor/surok.gif"></img>

	<form name="albumlist">
		<table width="490" bordercolor="grey" frame="hsides">
			<tr>
				<td width="20"></td>
				<td colspan="5" width="10"><font color="grey" size="2"
					face="돋움"><b>no.</b></font></td>

				<td align="center" width="350"><font color="grey" size="2"
					face="돋움"><b>곡명</b></font></td>
				<td align="center" width="250"><font color="grey" size="2"
					face="돋움"><b>아티스트</b></font></td>
				<td width="40"></td>
				<td width="60"><font color="grey" size="2" face="돋움"><b>듣기</b></font></td>
				<td width="60"><font color="grey" size="2" face="돋움"><b>다운</b></font></td>
			</tr>
			<c:forEach var="albumlist" items="${albuminforlist }" varStatus="num">
				<tr>
					<td width="20"><input type="checkbox" name="songcheck"
						id="songcheck" value="${albumlist.songnum}" /></td>


					<td colspan="5" width="10"><b><font size="2" face="굴림">${num.count}.</font></b></td>
					<td align="center" width="300"><b><font size="2" face="굴림">${albumlist.songname}</font></b></td>
					<td align="center" width="300"><b><font size="2" face="굴림">${albumlist.singer}</font></b></td>
					<td width="40"><b><font size="2" face="굴림">♥${albumlist.pcount}</font></b></td>
					<td width="60"><a href="#"
						onclick="forPlay(${albumlist.songnum})"><img
							src="../image/albuminfor/greenplay.png" border="0" /></a></td>
					<td width="60"><a href="#"
						onclick="forDown(${albumlist.songnum})"><img
							src="../image/albuminfor/greendown.png" border="0" /></a></td>
				</tr>

			</c:forEach>
		</table>
		<table width="490">
			<tr>
				<td><a href="#" onclick="allChoice()"><img
						src="../image/albuminfor/alllisten.gif" border="0"></a>
					<a href="#" onclick="checkedBoxPlay()"><img src="../image/albuminfor/songlisten.gif" border="0"/></a>	
						</td>
			</tr>
		</table>
	</form>

	<br />
	<form name="commentwritingform">
		<table width="500">
			<tr>
				<td colspan="2">댓글쓰기</td>
			</tr>
			<tr>
				<td rowspan="2"><textarea name="commentcontent" rows="3"
						cols="52"></textarea></td>
				<td rowspan="2" align="left"><input type="button" value="등록"
					onclick="writeComment('${id}')" /> <input type="hidden"
					id="sessionid" value="${id}" /></td>
			</tr>

		</table>
	</form>

	<div id="commentList">
		<br />
		<!-- commentList가 등록되어질 곳. -->
	</div>
	<div id="paging"></div>
 --%>
 
 </body>
</html>