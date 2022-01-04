<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../color.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
	int point = (Integer) session.getAttribute("point");
	String id = (String) session.getAttribute("id");
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>수박뮤직</title>
	<script type="text/javascript" src="../js/rollover.js"></script>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	<script type="text/javascript">
	window.onload = takePoint;
	
	var songnums; //노래 체크및 엠프쓰리에 사용될 songnums.
	var point;
	var flag;
	var allchoiceflag=0;
	
	function takePoint() {
		var id=document.getElementById("id").value;
		if(id==null||id=="") {
			return false;
		}
		var params="id="+encodeURIComponent(id);
		new ajax.xhr.Request("/Main/sharealbum/takemypoint.do",params, takePointResult, 'POST');
	}
		
	function takePointResult(req) {
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
		
	function allChoice(){
		var formname=document.mysharealbumform;
		var checkbox=formname.songcheck;
		
		if(allchoiceflag==0) {
			if(checkbox.length==""||checkbox.length==null) {
				checkbox=document.getElementById("songcheck");
				checkbox.checked=true;
				allchoiceflag=1;
				return true;
			}
			
			for(var i=0;i<checkbox.length;i++) {
				checkbox[i].checked=true;
			}
			allchoiceflag=1;
			return true;
		}	
		
		if(allchoiceflag==1) {
			if(checkbox.length==""||checkbox.length==null) {
				checkbox=document.getElementById("songcheck");
				checkbox.checked=false;
				allchoiceflag=0;
				return true;
			}	
			
			for(var i=0;i<checkbox.length;i++) {
				checkbox[i].checked=false;
			}		
			allchoiceflag=0;
			return true;
		}
	}
	
	function checkedBoxPlay() {
		var id=document.getElementById("id").value;
		if(id==null||id=="") {
			alert("로그인을 하셔야 들을 수 있습니다.");
			return false;
		}
		var formname=document.mysharealbumform;
		var checkbox=formname.songcheck;
		var tempsongvalue="";
		var count=0;
		
		takePoint();
		
		if(checkbox.length==""||checkbox.length==null) {
			
			checkbox=document.getElementById("songcheck");
			
			if(checkbox.checked) {	
				tempsongvalue+=checkbox.value;	
				count++;
				songnums=tempsongvalue;
			}
	
			if(count==0) {
				alert("음악을 선택해주세요!!!");
				return false;
			}
		
			if(point<300*count) {
				alert("포인트가 부족합니다.");
				return false;
			}	
		
			if(point>=300*count) {
				if(confirm("묶음듣기를 하시겠습니까?")) {
					var id=document.getElementById("id").value;
					var params="songnums=" + encodeURIComponent(songnums)
							+ "&id=" + encodeURIComponent(id)
							+ "&purchasetype=" + encodeURIComponent("play");
					new ajax.xhr.Request("/Main/sharealbum/songpurchase.do",params, checkedBoxPlayResult, 'POST');
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
				var id = document.getElementById("id").value;
				var params = "songnums=" + encodeURIComponent(songnums)
				+ "&id=" + encodeURIComponent(id)
				+ "&purchasetype=" + encodeURIComponent("play");
				new ajax.xhr.Request("/Main/sharealbum/songpurchase.do",params, checkedBoxPlayResult, 'POST');
			}
			return true;
		}
		//var songvalues=tempsongvalue.substring(0,tempsongvalue.length-1);
		return true;
	}
			
	function checkedBoxPlayResult(req) {
		if (req.readyState == 4) {
			if (req.status == 200) {
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName('code').item(0).firstChild.nodeValue;
				if (code == 'success') {		
					var temppoint = eval("(" + xmlDoc.getElementsByTagName('data').item(0).firstChild.nodeValue + ")");
					window.open('musicplay.do?songnums='+songnums+'','','width=300, height=370, scrollbars=no, menubar=no, location=no, resizable=no');
				}
			}
		}
	}
		
	function forPlay(songnum1) {
		var id=document.getElementById("id").value;
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
				songnums = songnum1;
				var id = document.getElementById("id").value;
				var params="songnum=" + encodeURIComponent(songnums)
						+ "&id=" + encodeURIComponent(id)
						+ "&purchasetype=" + encodeURIComponent("play");
				new ajax.xhr.Request("/Main/sharealbum/songpurchase.do",params, forPlayResult, 'POST');
				//songpurchasecheck 컨트롤러를 사용하도록.
			}
		}
	}
	
	function forPlayResult(req) {
		if (req.readyState == 4) {
			if (req.status == 200) {
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName('code').item(0).firstChild.nodeValue;
				if (code == 'success') {
					var point = eval("(" + xmlDoc.getElementsByTagName('data').item(0).firstChild.nodeValue + ")");
					window.open('musicplay.do?songnums='+songnums+'','','width=300, height=370, scrollbars=no, menubar=no, location=no, resizable=no');
				}
			}
		}
	}
	
	function checkMyDown(songnum1) {
		var id=document.getElementById("id").value;
		var params="id="+encodeURIComponent(id)+"&songnum="+encodeURIComponent(songnum1);
		new ajax.xhr.Request("/Main/sharealbum/checkmydown.do",params, checkMyDownResult, 'POST');
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
		
	function forDown(songnum1){
		var id=document.getElementById("id").value;
		if(id==null||id==""){
			alert("로그인을 하셔야 다운로드를 할 수 있습니다.");
			return false;
		}
		
		songnums=songnum1;
	
		takePoint();
		checkMyDown(songnum1);
		
		if(flag=="0"){
			if(point<500){
				alert("포인트가 부족합니다.");
				return false;
			}
		}
		
		if(flag=="0") {
			if(point>=500) {
				if(confirm("구입하시겠습니까?")) {
					var id=document.getElementById("id").value;
					var params = "songnum=" + encodeURIComponent(songnums)
							+ "&id=" + encodeURIComponent(id)
							+ "&purchasetype=" + encodeURIComponent("download");
					new ajax.xhr.Request("/Main/sharealbum/songpurchase.do",params, forDownloadResult, 'POST');
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
					if(tempflag.flag=="1"){
						window.location='/Main/download/file/?songnum='+songnums+'';
					}
				}
			}
		}
	}
	
	function openAlbumInfor(songnum) {
		window.open('albuminfor.do?songnum=' + songnum + '', '', 'width=520, height=500, scrollbars=yes, menubar=no, location=no, resizable=no');
	}
	
	function toList() {
		window.location='sharealbumlist.do?pagenum=1';
	}
	
	function goWrite() {
		window.location='/Main/uploadsharealbum/uploadsharealbum.jsp';
	}
	
	function upRecommendation(listnum1) {
		var id=document.getElementById("id").value;
		var checkid=document.getElementById("checkid").value;
		if(id==checkid) {
			alert("작성자가 추천을 할 수 없습니다.");
			return false;
		}
		var listnum=listnum1;
		var params="listnum="+encodeURIComponent(listnum);
		new ajax.xhr.Request("/Main/sharealbum/uprecom.do",params, upRecomResult, 'POST');
	}
	
	function upRecomResult(req){
		var recomcountdiv=document.getElementById("recomcount");
		if (req.readyState == 4) {
			if (req.status == 200) {
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName('code').item(0).firstChild.nodeValue;
				if (code == 'success') {
					var recomcount= eval("(" + xmlDoc.getElementsByTagName('data').item(0).firstChild.nodeValue + ")");
					recomcountdiv.innerHTML=recomcount.recomcount;
				}
			}
		}
	}
	
	function deleteMyShareAlbum(listnum){
		if(confirm("나의공개앨범을 \n삭제하시겠습니까?")){
			window.location="deletemysharealbum.do?listnum="+listnum;
		}
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
			
				<form name="mysharealbumform">
					<table width="940" border="0" cellpadding="0" cellspacing="0" align="center">
						<tr>
							<td>
								<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">
									<tr>
										<td width="250"></td>
										<td width="*" class="subTitle" align="center">공 개 앨 범</td>
										<td width="250" align="right" valign="bottom">
											<input type="button" value="목록으로" onclick="toList()"/>
											<input type="button" value="앨범만들기" onclick="goWrite()"/>
											
											<c:set var="sessionid" value="<%=id %>" scope="page"/>
											<c:if test="${mysharealbum.writer eq sessionid }">
											<input type="button" value="삭제하기" onclick="deleteMyShareAlbum(${mysharealbum.listnum})"/>
											</c:if>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr><td height="20"></td></tr>
						
						<tr>
							<td>
								<table width="900" border="0" cellpadding="10" cellspacing="0" align="center" style="border-top: 1px dashed #C2C2C2; border-bottom: 1px dashed #C2C2C2; border-left: 1px dashed #C2C2C2; border-right: 1px dashed #C2C2C2;">
									<tr>
										<td>
											<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
												<tr>
													<td width="200" valign="top"><img width="200" height="200" src="../uploadshareimage${mysharealbum.imgpath}/${mysharealbum.listnum}.jpg"/></td>
													<td width="15"></td>
													<td width="*" valign="top">
														<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
															<tr>
																<td>
																	<table border="0" cellpadding="0" cellspacing="0">
																		<tr>
																			<td class="subPoint">${ mysharealbum.subject }</td>
																			<td width="30"></td>
																			<td><a href="#" onclick="upRecommendation(${ mysharealbum.listnum })"><img src="../subak_images/sub/openalbum/recommend.gif" border="0" /></a></td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr><td height="5"></td></tr>
															<tr><td>프로듀서 : ${ mysharealbum.writer }</td></tr>
															<tr><td height="5"></td></tr>
															<tr><td>등록일자 : <fmt:formatDate value="${mysharealbum.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm" /></td></tr>
															<tr><td height="5"></td></tr>
															<tr><td>수록곡수 : ${ mysharealbum.songcount } 곡</td></tr>
															<tr><td height="5"></td></tr>
															<tr><td>조회수 : ${ mysharealbum.readcount }</td></tr>
															<tr><td height="5"></td></tr>
															<tr><td>
																<table border="0" cellpadding="0" cellspacing="0">
																	<tr>
																		<td>추천수 :</td>
																		<td width="4"></td>
																		<td><div id="recomcount">${ mysharealbum.recomcount }</div></td>
																	</tr>
																</table>
															</td></tr>
															<tr><td height="5"></td></tr>
															<tr><td>내용 :<br/><pre>${ mysharealbum.content }</pre></td></tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						
						<tr><td height="15"></td></tr>
						<tr>
							<td>
								<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">
									<tr><td colspan="13" class="subPoint">&nbsp;&nbsp;수록곡</td></tr>
									<tr><td colspan="13" height="5"></td></tr>
									<tr><td colspan="13" height="3" bgcolor="${ spline_3px }"><input type="hidden" id="id" value="${id}"/></td></tr>
									<tr bgcolor="${ th_bg }">
										<th width="50" height="30">선택</th>
										<th width="10"><input type="hidden" id="checkid" value="${mysharealbum.writer}"/></th>
										<th width="50">No.</th>
										<th width="10"></th>
										<th width="70">앨범정보</th>
										<th width="10"></th>
										<th width="300">곡명</th>
										<th width="10"></th>
										<th width="270">가수</th>
										<th width="10"></th>
										<th width="50">재생</th>
										<th width="10"></th>
										<th width="50">다운</th>
									</tr>
									
									<c:forEach var="alist" items="${ albumlist }" varStatus="num">
										<tr onmouseover="this.style.backgroundColor='${ tr_onmouseover }'" onmouseout="this.style.backgroundColor=''">
											<td height="30" align="center"><input type="checkbox" name="songcheck" id="songcheck" value="${ alist.songnum }" style="border:none;" /></td>
											<td></td>
											<td align="center">${ num.count }.</td>
											<td></td>
											<td align="center"><a href="#" onclick="openAlbumInfor(${ alist.songnum })"><img src="../subak_images/sub/openalbum/albuminfo.gif" border="0" /></a></td>
											<td></td>
											<td align="center">${ alist.title }</td>
											<td></td>
											<td align="center">${ alist.singer }</td>
											<td></td>
											<td align="center"><a href="#" onclick="forPlay(${ alist.songnum })"><img src="../subak_images/sub/openalbum/play.gif" border="0" /></a></td>
											<td></td>
											<td align="center"><a href="#" onclick="forDown(${ alist.songnum })"><img src="../subak_images/sub/openalbum/down.gif" border="0"/></a></td>
										</tr>
										<tr><td colspan="13" height="1" bgcolor="${ spline_1px }"></td></tr>
									</c:forEach>
									
									<tr><td colspan="13" height="2" bgcolor="${ spline_2px }"></td></tr>
									<tr><td colspan="13" height="10"></td></tr>
									
									<tr>
										<td colspan="5"><a href="#" onclick="allChoice()"><img src="../subak_images/sub/openalbum/allcheck.gif" border="0"/></a>
											<a href="#" onclick="checkedBoxPlay()"><img src="../subak_images/sub/openalbum/checklisten.gif" border="0"/></a></td>
										<td colspan="3"></td>
										<td colspan="5" align="right"><input type="button" value="목록으로" onclick="toList()"/></td>
									</tr>
									
								</table>
							</td>
						</tr>
					</table>
				</form>
				
			</td>
		</tr>
		
		<!-- 푸터 / 카피라이트 -->
		<tr><td height="50"></td></tr>
		<tr><td align="center"><jsp:include page="../include/footer.jsp" /></td></tr>
		
	</table>
	
	
	
	
	
	

	<%-- <h2>나의 공개앨범</h2>
	<form name="mysharealbumform">
		<table width="500">
			<tr>
				<td><img width="200" height="200" src="../uploadshareimage${mysharealbum.imgpath}/${mysharealbum.listnum}.jpg"/></td>
				<td>
					<table width="380">
						<tr>
							<td valign="top"><font size="4"><strong>제목 : ${ mysharealbum.subject }</strong></font></td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td>프로듀서 : ${ mysharealbum.writer }<input type="hidden" id="checkid" value="${mysharealbum.writer}"/></td>
						</tr>
						<tr>
							<td>등록일자 : <fmt:formatDate value="${mysharealbum.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm" /></td>
						</tr>
						<tr>
							<td>수록곡수 : ${ mysharealbum.songcount } 곡</td>
						</tr>
						<tr>
							<td>조회수 : ${ mysharealbum.readcount }</td>
						</tr>
						<tr>
							<td>추천수 : <oi id="recomcount">${ mysharealbum.recomcount }</oi></td>
						</tr>
						<tr>
							<td colspan="3">내용 : ${ mysharealbum.content }</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<a href="#" onclick="upRecommendation(${ mysharealbum.listnum })"><img src="../image/mysharealbum/recommend.png" border="0" /></a>
				</td>
			</tr>
		</table>

		<br/><br/>
		<h3>수록곡</h3>

		<table width="600" frame="hsides">
			<tr>
				<td width="20"><input type="hidden" id="id" value="${id}"/></td>
				<td width="50" align="center">no.</td>
				<td width="50" align="left">곡정보</td>
				<td width="250" align="center">곡명</td>
				<td width="100">가수</td>
				<td width="50">재생</td>
				<td width="50">다운</td>
			</tr>
			<c:forEach var="alist" items="${albumlist}" varStatus="num">
				<tr>							
					<td width="20"><input type="checkbox" name="songcheck" id="songcheck" value="${ alist.songnum }" /></td>
					<td width="50" align="center">${ num.count }.</td>
					<td width="50" align="center"><a href="#" onclick="openAlbumInfor(${ alist.songnum })"><img src="../image/mysharealbum/information.png" border="0" /></a></td>
					<td width="250" align="center">${ alist.title }</td>
					<td width="100">${ alist.singer }</td>
					<td width="50"><a href="#" onclick="forPlay(${ alist.songnum })"><img src="../image/mysharealbum/greenplay.png" border="0" /></a></td>
					<td width="50"><a href="#" onclick="forDown(${ alist.songnum })"><img src="../image/mysharealbum/greendown.png" border="0"/></a></td>
				</tr>
			</c:forEach>
		
		</table>
		<br/>
		<table width="600">
			<tr>
				<td align="left">
					<a href="#" onclick="allChoice()"><img src="../image/mysharealbum/alllisten.gif" border="0"/></a>
					<a href="#" onclick="checkedBoxPlay()">&nbsp;<img src="../image/mysharealbum/songlisten.gif" border="0"/></a>
					<input type="button" value="목록으로" onclick="toList()"/>
				</td>
			</tr>
		</table>
	</form> --%>

</body>
</html>