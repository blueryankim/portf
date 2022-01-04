<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% String id=(String)session.getAttribute("id"); %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>수박뮤직</title>
	<script type="text/javascript" src="../js/rollover.js"></script>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	<script type="text/javascript">
	window.onload = takePoint;
	var prevonload = window.onload;
	window.onload = function() {
		prevonload();
		changeRowmenu();
	};
	//point를 db에서 가져오는 것과 Row메뉴부분을 onload를 설정
	
	var songnums; //노래 체크및 엠프쓰리에 사용될 songnums.
	var point;
	var flag;
	var allchoiceflag=0;
		
	function takePoint() {
		var id=document.getElementById("id").value;
		if(id==null || id=="") {
			return false;
		}
		var params="id="+encodeURIComponent(id);
		new ajax.xhr.Request("/Main/chart/takemypoint.do",params, takePointResult, 'POST');
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
		
	function checkedBoxPlay(){
		var id=document.getElementById("id").value;
		if(id==null||id=="") {
			alert("로그인을 하셔야 들을 수 있습니다.");
			return false;
		}
		
		var formname=document.chartform;
		var checkbox=formname.songchoice;
		var tempsongvalue="";
		var count=0;
		
		takePoint();
		
		for(var i=0;i<checkbox.length;i++) {
			if(checkbox[i].checked){
				tempsongvalue+=checkbox[i].value+",";
				count++;
			}	
		}	
		
		songnums=tempsongvalue.substring(0,tempsongvalue.length-1);
				
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
				var id = document.getElementById("id").value;
				var params = "songnums=" + encodeURIComponent(songnums) + "&id="
						+ encodeURIComponent(id)+"&purchasetype="+encodeURIComponent("play");
				new ajax.xhr.Request("/Main/chart/songpurchase.do",params, checkedBoxPlayResult, 'POST');
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
					window.open('musicplay.do?songnums='+songnums+'','','width=300, height=370, scrollbars=no, menubar=no, location=no, resizable=no');	
				}
			}
		}
	}
		
	function forPlay(songnum1){
		var id=document.getElementById("id").value;
		if(id==null||id==""){
			alert("로그인을 하셔야 들을 수 있습니다.");
			return false;
		}
		takePoint();
			
		if(point<300) {
			alert("포인트가 부족합니다.");
			return false;
		}
		
		if(point>=300) {
			if(confirm("300point가 차감됩니다.\n재생하시겠습니까?")) {	
				songnums=songnum1;
				var id=document.getElementById("id").value;
				var params="songnum=" + encodeURIComponent(songnums) + "&id="
				+ encodeURIComponent(id)+"&purchasetype="+encodeURIComponent("play");
				
				new ajax.xhr.Request("/Main/chart/songpurchase.do",params, forPlayResult, 'POST');
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
					window.open('musicplay.do?songnums='+songnums+'','','width=300, height=370, scrollbars=no, menubar=no, location=no, resizable=no');	
				}
			}
		}
	}
	
	function checkMyDown(songnum1) {	
		var id=document.getElementById("id").value;
		var params="id="+encodeURIComponent(id)+"&songnum="+encodeURIComponent(songnum1);
		new ajax.xhr.Request("/Main/chart/checkmydown.do",params, checkMyDownResult, 'POST');
	}
		
	function checkMyDownResult(req) {
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
			
		if(flag=="0"){
			if(point>=500){
				if(confirm("500point가 차감됩니다.\n구입하시겠습니까?")) {
					var id=document.getElementById("id").value;
					var params = "songnum=" + encodeURIComponent(songnums) + "&id="
							+ encodeURIComponent(id)+"&purchasetype="+encodeURIComponent("download");
					new ajax.xhr.Request("/Main/chart/songpurchase.do",params, forDownloadResult, 'POST');
				}
			}
		}
		
		if(flag=="1"){
			window.location='/Main/download/file/?songnum='+songnums+'';
		}
	}
		
	function forDownloadResult(req){
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
		
		
	function openAlbumInfor(songnum){
		window.open('albuminfor.do?songnum='+songnum+'','','width=520, height=500, scrollbars=yes, menubar=no, location=no, resizable=no');	
	}
	
	function changeRowmenu(rowmenutitle){
		/*var charttitle=document.getElementById("charttitle");
		var ppcolor=document.getElementById("ppcolor");
		var dpcolor=document.getElementById("dpcolor");
		var lcolor=document.getElementById("lcolor");
		var gayocolor=document.getElementById("gayocolor");
		var popcolor=document.getElementById("popcolor");*/
		
		if(rowmenutitle=='ppopular'){
			window.location='list.do?pageNum=1&search_type=ppopular';
			/*charttitle.innerHTML="재생인기 차트";	
			ppcolor.setAttribute("bgcolor","grey");
			dpcolor.setAttribute("bgcolor","white");
			lcolor.setAttribute("bgcolor","white");
			gayocolor.setAttribute("bgcolor","white");
			popcolor.setAttribute("bgcolor","white");*/
		}
		if(rowmenutitle=='dpopular'){
			window.location='list.do?pageNum=1&search_type=dpopular';
			/*charttitle.innerHTML="다운인기 차트";
			dpcolor.setAttribute("bgcolor","grey");
			ppcolor.setAttribute("bgcolor","white");
			lcolor.setAttribute("bgcolor","white");
			gayocolor.setAttribute("bgcolor","white");
			popcolor.setAttribute("bgcolor","white");*/
		}
		
		if(rowmenutitle=='latest'){
			window.location='list.do?pageNum=1&search_type=latest';
			/*charttitle.innerHTML="최신곡 리스트";
			lcolor.setAttribute("bgcolor","grey");
			dpcolor.setAttribute("bgcolor","white");
			ppcolor.setAttribute("bgcolor","white");
			gayocolor.setAttribute("bgcolor","white");
			popcolor.setAttribute("bgcolor","white");*;
		}
		
		if(rowmenutitle=='gayochart'){
			window.location='list.do?pageNum=1&search_type=gayochart';
			/*charttitle.innerHTML="가요 차트";
			gayocolor.setAttribute("bgcolor","grey");
			lcolor.setAttribute("bgcolor","white");
			dpcolor.setAttribute("bgcolor","white");
			ppcolor.setAttribute("bgcolor","white");
			popcolor.setAttribute("bgcolor","white");*/
		}
		
		if(rowmenutitle=='popsongchart'){
			window.location='list.do?pageNum=1&search_type=popsongchart';
			/*charttitle.innerHTML="팝송 차트";
			popcolor.setAttribute("bgcolor","grey");
			lcolor.setAttribute("bgcolor","white");
			dpcolor.setAttribute("bgcolor","white");
			ppcolor.setAttribute("bgcolor","white");
			gayocolor.setAttribute("bgcolor","white");*/
		}
		
	}
	
		
	function allChoice() {
		var formname=document.chartform;
		var checkbox=formname.songchoice;	
		
		if(allchoiceflag==0){
			if(checkbox.length==""||checkbox.length==null){
				checkbox=document.getElementById("songchoice");
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
			if(checkbox.length==""||checkbox.length==null) {
				checkbox=document.getElementById("songchoice");
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
	</script>
</head>
<body>

	<table width="1000" align="center" border="0" cellpadding="0" cellspacing="0">
	
		
		
		<tr><td height="10"></td></tr>
		<tr>
			<td>
			
				<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">
					<!-- subTitle -->
					<tr>
						<td>
							<form name="rowmenuform" class="subTitle">
								<c:if test="${search_type == 'ppopular'}"><font color="${ subTitle }">재생 인기 차트</font></c:if>
								<c:if test="${search_type == 'dpopular'}"><font color="${ subTitle }">다운 인기 차트</font></c:if>
								<c:if test="${search_type == 'latest'}"><font color="${ subTitle }">최신곡</font></c:if>
								<c:if test="${search_type == 'gayochart'}"><font color="${ subTitle }">가요 차트</font></c:if>
								<c:if test="${search_type == 'popsongchart'}"><font color="${ subTitle }">팝송 차트</font></c:if>
							</form>
						</td>
					</tr>
					<tr><td height="10"></td></tr>
					
					<tr>
						<td>
							
							<form name="chartform" action="#" method="post">
								<table width="850" border="0" cellpadding="0" cellspacing="0" align="center">
									<tr><td colspan="11" height="3" bgcolor="${ spline_3px }"></td></tr>
									<tr bgcolor="${ th_bg }">
										<th width="50" height="30">선택</th>
										<th width="10"></th>
										<th width="50">순위</th>
										<th width="10"></th>
										<th width="100">앨범정보</th>
										<th width="10"></th>
										<th width="*">곡명</th>
										<th width="10"></th>
										<th width="50">재생</th>
										<th width="10"></th>
										<th width="50">다운</th>
									</tr>
									
									<!-- 차트 내용이 없을 때 -->
									<c:if test="${ count == 0 }">
										<tr><td colspan="11" height="100" align="center">- 현재 차트내용이 없습니다. -</td></tr>
										<tr><td colspan="11" height="3" bgcolor="${ spline_2px }"></td></tr>
									</c:if>
									
									<!-- 차트 내용이 있을 때 -->
									<c:if test="${ count != 0 }">
										<c:forEach var="vo" items="${ chartList }">
											<tr onmouseover="this.style.backgroundColor='${ tr_onmouseover }'" onmouseout="this.style.backgroundColor=''">
												<td width="50" height="100" align="center"><input type="checkbox" name="songchoice" id="songchoice" value="${ vo.num }" style="border:none;" /></td>
												<td width="10"></td>
												<td width="50" align="center"><img src="../subak_images/sub/chart/num/${ number }.gif" /><c:set var="number" value="${ number + 1 }" scope="page" /></td>
												<td width="10"></td>
												<td width="100" align="center"><a href="#" onclick="openAlbumInfor(${ vo.num })"><img src="../subak_images/sub/chart/albuminfo.gif" border="0" /></a></td>
												<td width="10"></td>
												<td width="*">
													<table width="100%" border="0" cellpadding="0" cellspacing="0" align="left">
														<tr>
															<td width="80"><img src="../albumimage${ vo.path }/${ vo.num }.jpg" width="80" height="80" /></td>
															<td width="10"></td>
															<td width="*"><font color="#808080" style="font-weight:bold;">${ vo.title }</font> - ${ vo.singer }<br/>
															<font color="#29AD0F" style="font-weight:bold;">${ vo.album }</font></td>
														</tr>
													</table>
												</td>
												<td width="10"></td>
												<td width="50" align="center">
													<c:url value="../uploadsong/mediaplayer.jsp" var="mediaurl">
														<c:param name="mp3path" value="${ vo.path }" />
														<c:param name="songname" value="${ vo.num }" />
													</c:url>
													<a href="#" onclick="forPlay(${ vo.num })"><img src="../subak_images/sub/chart/play.gif" border="0" /></a>
												</td>
												<td width="10"></td>
												<td width="50" align="center"><a href="#" onclick="forDown(${vo.num})"><img src="../subak_images/sub/chart/down.gif" border="0" /></a></td>
											</tr>
											<tr><td colspan="11" height="1" bgcolor="${ spline_1px }"></td></tr>
										</c:forEach>
										<tr><td colspan="11" height="2" bgcolor="${ spline_2px }"></td></tr>
										
										<tr><td colspan="11" height="10"></td></tr>
										<tr>
											<td colspan="11">
												<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
													<tr>
														<td width="200">
															<input type="hidden" id="id" value="${ id }" />
															<a href="#" onclick="allChoice()"><img src="../subak_images/sub/chart/allcheck.gif" border="0" /></a>
															<a href="#" onclick="checkedBoxPlay()"><img src="../subak_images/sub/chart/checklisten.gif" border="0" /></a>
														</td>
														<td width="*" align="center">
															<a href="javascript:window.location='list.do?pageNum=1&search_type=${search_type}'">1~10위</a>
															<c:if test="${ cp.getPage_End() == 2 }">
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:window.location='list.do?pageNum=2&search_type=${search_type}'">11~20위</a>
															</c:if>
														</td>
														<td width="200"></td>
													</tr>
												</table>
											</td>
										</tr>
									</c:if>
									
								</table>
							</form>
							
						</td>
					</tr>
					
				</table>
			
			</td>
		</tr>
		
		<!-- 푸터 / 카피라이트 -->
		
	
	</table>

















<%-- 

	<form name="rowmenuform">
		<c:if test="${search_type == 'ppopular'}">
			<table width="400" height="30" frame="hsides">
				<tr>
					<td id="ppcolor" bgcolor="grey" align="center"><font face="돋움"
						size="2"><a href="#" onclick="changeRowmenu('ppopular')">재생인기차트</a></font></td>
					<td bgcolor="white" id="dpcolor" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('dpopular')">다운인기차트</a></font></td>
					<td bgcolor="white" id="lcolor" align="center"><font face="돋움"
						size="2"><a href="#" onclick="changeRowmenu('latest')">최신곡</a></font></td>
					<td bgcolor="white" id="gayocolor" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('gayochart')">가요차트</a></font></td>
					<td bgcolor="white" id="popcolor" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('popsongchart')">팝송차트</a></font></td>
				</tr>
			</table>
			<h2 id="charttitle">재생인기 차트</h2>
		</c:if>

		<c:if test="${search_type == 'dpopular'}">
			<table width="400" height="30" frame="hsides">
				<tr>
					<td id="ppcolor" bgcolor="white" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('ppopular')">재생인기차트</a></font></td>
					<td bgcolor="grey" id="dpcolor" align="center"><font face="돋움"
						size="2"><a href="#" onclick="changeRowmenu('dpopular')">다운인기차트</a></font></td>
					<td bgcolor="white" id="lcolor" align="center"><font face="돋움"
						size="2"><a href="#" onclick="changeRowmenu('latest')">최신곡</a></font></td>
					<td bgcolor="white" id="gayocolor" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('gayochart')">가요차트</a></font></td>
					<td bgcolor="white" id="popcolor" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('popsongchart')">팝송차트</a></font></td>
				</tr>
			</table>
			<h2 id="charttitle">다운인기 차트</h2>
		</c:if>

		<c:if test="${search_type == 'latest'}">
			<table width="400" height="30" frame="hsides">
				<tr>
					<td id="ppcolor" bgcolor="white" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('ppopular')">재생인기차트</a></font></td>
					<td bgcolor="white" id="dpcolor" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('dpopular')">다운인기차트</a></font></td>
					<td bgcolor="grey" id="lcolor" align="center"><font face="돋움"
						size="2"><a href="#" onclick="changeRowmenu('latest')">최신곡</a></font></td>
					<td bgcolor="white" id="gayocolor" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('gayochart')">가요차트</a></font></td>
					<td bgcolor="white" id="popcolor" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('popsongchart')">팝송차트</a></font></td>
				</tr>
			</table>
			<h2 id="charttitle">최신곡 리스트</h2>
		</c:if>

		<c:if test="${search_type == 'gayochart'}">
			<table width="400" height="30" frame="hsides">
				<tr>
					<td id="ppcolor" bgcolor="white" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('ppopular')">재생인기차트</a></font></td>
					<td bgcolor="white" id="dpcolor" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('dpopular')">다운인기차트</a></font></td>
					<td bgcolor="white" id="lcolor" align="center"><font face="돋움"
						size="2"><a href="#" onclick="changeRowmenu('latest')">최신곡</a></font></td>
					<td bgcolor="grey" id="gayocolor" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('gayochart')">가요차트</a></font></td>
					<td bgcolor="white" id="popcolor" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('popsongchart')">팝송차트</a></font></td>
				</tr>
			</table>
			<h2 id="charttitle">가요 차트</h2>
		</c:if>

		<c:if test="${search_type == 'popsongchart'}">
			<table width="400" height="30" frame="hsides">
				<tr>
					<td id="ppcolor" bgcolor="white" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('ppopular')">재생인기차트</a></font></td>
					<td bgcolor="white" id="dpcolor" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('dpopular')">다운인기차트</a></font></td>
					<td bgcolor="white" id="lcolor" align="center"><font face="돋움"
						size="2"><a href="#" onclick="changeRowmenu('latest')">최신곡</a></font></td>
					<td bgcolor="white" id="gayocolor" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('gayochart')">가요차트</a></font></td>
					<td bgcolor="grey" id="popcolor" align="center"><font
						face="돋움" size="2"><a href="#"
							onclick="changeRowmenu('popsongchart')">팝송차트</a></font></td>
				</tr>
			</table>
			<h2 id="charttitle">팝송 차트</h2>
		</c:if>

	</form>

	<form name="chartform" action="#" method="post">
		<table frame="void" rules="none" width="600" height="20"
			summary="순위,앨범정보,곡명,재생미디어,다운로드의 정보를 담고 있는 테이블입니다.">
			<thead>
				<tr bgcolor="silver">
					<td colspan="2" scope="col" width="70" height="30" align="center"><font
						size="2" face="돋움">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;순위</font></td>
					<td scope="col" width="100" align="left"><font size="2"
						face="돋움">앨범정보</font></td>
					<td width="20"></td>
					<td scope="col" width="180" align="left"><font size="2"
						face="돋움">곡명</font></td>
					<td scope="col" align="right"><font size="2" face="돋움">재생</font></td>
					<td scope="col" width="90" align="center"><font size="2"
						face="돋움">다운로드</font></td>
				</tr>
			</thead>

			<!-- 글이 없을 경우 -->
			<c:if test="${count==0}">
				<tr>
					<td colspan="7" align="center"><font size="2" color="red">
							현재 차트내용이 없습니다.</font></td>
				</tr>
			</c:if>
			<c:if test="${count!=0}">
				<c:forEach var="vo" items="${chartList }">
					<tr>
						<!-- checkbox name is a songchoice. -->
						<td width="5"><input type="checkbox" name="songchoice"
							id="songchoice" value="${vo.num}"></input></td>
						<td width="70" align="left">&nbsp;&nbsp;&nbsp;<img
							src="../image/chart/num${number }.png"></img> <c:set var="number"
								value="${number +1 }" scope="page" /></td>
						<td width="100" align="left">&nbsp;&nbsp;&nbsp; <a href="#"
							onclick="openAlbumInfor(${vo.num})"><img
								src="../image/chart/information.png" border="0"></img></a></td>
						<td width="120" align="right"><img
							src="../albumimage${vo.path}/${vo.num}.jpg" width="80"
							height="80"></img></td>
						<td width="180" align="left"><table>
								<tr>
									<td><b><font size="2" color="grey" face="돋움">${vo.title}</font></b><font
										size="2" face="돋움"> | ${vo.singer }</font></td>
								</tr>
								<tr>
									<td><b><font size="2" color="#29AD0F">${vo.album}</font></b></td>
								</tr>
							</table></td>
						<td align="right"><c:url
								value="../uploadsong/mediaplayer.jsp" var="mediaurl">
								<c:param name="mp3path" value="${vo.path}" />
								<c:param name="songname" value="${vo.num}" />

							</c:url> <a href="#" onclick="forPlay(${vo.num})"><img
								src="../image/chart/greenplay.png" border="0"></img></a></td>
						<td width="90" align="center"><a href="#"
							onclick="forDown(${vo.num})"><img
								src="../image/chart/greendown.png" border="0"></img></a></td>

					</tr>
				</c:forEach>
				<td colspan="7" align="center"><br></br> <a
					href="javascript:window.location='list.do?pageNum=1&search_type=${search_type}'">1~10위</a>

					<c:if test="${cp.getPage_End()==2}">
						<a
							href="javascript:window.location='list.do?pageNum=2&search_type=${search_type}'">11~20위</a>
					</c:if></td>
				<tr>
					<td colspan="7" align="left"><input type="hidden" id="id" value="${id}" />
						<a href="#" onclick="allChoice()"><img
							src="../image/chart/alllisten.gif" border="0" /></a> <a href="#"
						onclick="checkedBoxPlay()"><img
							src="../image/chart/songlisten.gif" border="0"></img></a></td>
				</tr>

			</c:if>
		</table>


	</form> --%>

</body>
</html>