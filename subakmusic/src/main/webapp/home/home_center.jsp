<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript">
function goChart(searchtype){
	window.location('/Main/chart/list.do?search_type='+searchtype);
	//window.open('/Main/chart/musicplay.do?songnums='+song+'','','width=300, height=370, scrollbars=no, menubar=no, location=no, resizable=no');
}
function openAlbumInfor(songnum){
	window.open('/Main/chart/albuminfor.do?songnum='+songnum+'','','width=520, height=500, scrollbars=yes, menubar=no, location=no, resizable=no');
}
</script>

<table width="1000" align="center" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="685" class="mainChart" align="center" style="background:url('../subak_images/main/recent_boxbg.gif');"><!-- NEW<br/>(600 x 355) -->
			<c:if test="${ musicCount eq 0 }">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
					<tr><td height="300" align="center">곡이 없습니다.</td></tr>
				</table>
			</c:if>
			<c:if test="${ musicCount ne 0 }">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr><td colspan="5" height="41"><font class="mainChart" color="#DDDDDD">최 신 음 악</font></td></tr>
					<tr>
						<c:forEach var="ro" items="${recent1stRow}">
							<td>
								<table border="0" cellpadding="5" cellspacing="0">
									<tr>
										<td>
											<table border="0" cellpadding="0" cellspacing="0">
												<tr><td align="center" width="125"><a href="#" onclick="openAlbumInfor(${ ro.num })"><img src="../albumimage${ ro.path }/${ ro.num }.jpg" width="106" height="106" style="border: 2px #FFFFFF solid;" /></a></td></tr>
												<tr><td height="5"></td></tr>
												<tr><td align="center"><font style="font-size:8pt;line-height:140%;"><b>${ ro.title }</b><br/>${ ro.singer }</font></td></tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</c:forEach>
					</tr>
					<tr>
						<c:if test="${not empty recent2ndRow }">
							<c:forEach var="ro" items="${ recent2ndRow }">
								<td>
									<table border="0" cellpadding="5" cellspacing="0">
										<tr>
											<td>
												<table border="0" cellpadding="0" cellspacing="0">
													<tr><td align="center" width="125"><a href="#" onclick="openAlbumInfor(${ ro.num })"><img src="../albumimage${ ro.path }/${ ro.num }.jpg" width="106" height="106" style="border: 2px #FFFFFF solid;" /></a></td></tr>
													<tr><td height="5"></td></tr>
													<tr><td align="center"><font style="font-size:8pt;line-height:140%;"><b>${ ro.title }</b><br/>${ ro.singer }</font></td></tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</c:forEach>
						</c:if>
					</tr>
					<tr><td height="5" colspan="5"></td></tr>
				</table>
			</c:if>
		</td>
		
		
		<td width="15"></td>
		
		
		<!-- CHART -->
		<td width="300" align="center">
		
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<c:if test="${ search_type eq 'ppopular'}">
					<tr>
						<c:set var="searchtype" value="ppopular" scope="page"/>
						<td height="50" style="background:url('../subak_images/main/chart_tab1.gif');">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr onmouseover="">
									<td width="5"></td>
									<td height="40" width="142" align="center"><a href="home.do?search_type=ppopular"><font class="mainChart" color="#045205">재생인기차트</font></a></td>
									<td width="5"></td>
									<td align="center" width="*"><a href="home.do?search_type=dpopular"><font class="mainChart" color="#DDDDDD">다운인기차트</font></a></td>
									<td width="5"></td>
								</tr>
								<tr><td colspan="5" height="10"></td></tr>
							</table>
						</td>
					</tr>
				</c:if>
				<c:if test="${ search_type eq 'dpopular' }">
					<tr>
						<c:set var="searchtype" value="dpopular" scope="page"/>
						<td height="50" style="background:url('../subak_images/main/chart_tab2.gif');">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td width="5"></td>
									<td height="40" width="142" align="center"><a href="home.do?search_type=ppopular"><font class="mainChart" color="#DDDDDD">재생인기차트</font></a></td>
									<td width="5"></td>
									<td align="center" width="*"><a href="home.do?search_type=dpopular"><font class="mainChart" color="#045205">다운인기차트</font></a></td>
									<td width="5"></td>
								</tr>
								<tr><td colspan="5" height="10"></td></tr>
							</table>
						</td>
					</tr>
				</c:if>
				<tr>
					<td style="background:url('../subak_images/main/chart_middle_bg.gif');">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr><td colspan="3" height="10"></td></tr>
							<tr>
								<td width="10"></td>
								<td width="*">
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr>
											<th align="center" width="30" height="25">순위</th>
											<th align="center" width="*">곡명</th>
											<th align="center" width="80">가수</th>
										</tr>
										<c:forEach var="vo" items="${chartList}" varStatus="num">
										 	<tr onmouseover="this.style.backgroundColor='#aaaaaa'" onmouseout="this.style.backgroundColor=''">
											 	<td align="center" height="25">${num.count}</td>
											 	<td align="center"><a href="#" onclick="goChart('${searchtype}')">${vo.title}</a></td>
											 	<td align="center">${vo.singer}</td>
										 	</tr>
										</c:forEach>
									</table>
								</td>
								<td width="10"></td>
							</tr>
							<tr><td colspan="3" height="10"></td></tr>
						</table>
					</td>
				</tr>
				<tr><td style="background:url('../subak_images/main/chart_bottom_bg.gif');" height="10"></td></tr>
			</table>
			
		</td>
	</tr>
	<tr><td colspan="3" height="15"></td></tr>
	<tr>
		<td colspan="3" align="center" class="mainChart"><!-- ALBUM -->
		
			<c:if test="${ musicCount eq 0 }">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
					<tr><td height="100" align="center">- 공개앨범이 없습니다. -</td></tr>
				</table>
			</c:if>
			
			<c:if test="${ musicCount ne 0 }">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center"><!-- style="background:url('../subak_images/main/topalbum_boxbg.gif');" -->
					<tr style="background:url('../subak_images/main/topalbum_bg_top.gif');">
						<td colspan="7">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr><td height="40"><font class="mainChart" color="#DDDDDD">인기 공개 앨범</font></td></tr>
								<tr><td height="10"></td></tr>
							</table>
						</td>
					</tr>
					<tr style="background:url('../subak_images/main/topalbum_bg_middle.gif');">
						<c:forEach var="sa" items="${ sharealbumlist }">
							<td valign="top">
								<table width="100%" border="0" cellpadding="5" cellspacing="0" align="center">
									<tr>
										<td>
											<table border="0" cellpadding="0" cellspacing="0" align="center">
												<tr><td align="center" width="130"><a href="/Main/sharealbum/mysharealbum.do?listnum=${ sa.listnum }"><img src="../uploadshareimage${ sa.imgpath }/${ sa.listnum }.jpg" width="106" height="106" style="border: 2px #FFFFFF solid;" /></a></td></tr>
												<tr><td height="5"></td></tr>
												<tr><td align="center"><font style="font-size:8pt;line-height:140%;"><b><a href="/Main/sharealbum/mysharealbum.do?listnum=${ sa.listnum }">${ sa.subject }</a></b><%-- <br/>${ sa.writer } --%></font></td></tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</c:forEach>
					</tr>
					<tr><td colspan="7" height="10" style="background:url('../subak_images/main/topalbum_bg_bottom.gif');"></td></tr>
				</table>
			</c:if>
			
		</td>
	</tr>
</table>


<%-- <html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>수박뮤직</title>
<script type="text/javascript">
function goChart(song){
	window.location('/Main/chart/list.do');
	window.open('/Main/chart/musicplay.do?songnums='+song+'','','width=300 height=370 scrollbars=no,menubar=no,location=no resizable=no');
}
</script>
<style type="text/css">
#NEW{
	margin: 10px;
	width : 628px;
	height: 678px;
	float: left;
	border: 1px solid red;
}
#RANK{
	margin: 10px;
	width : 328px;
	height : 678px;
	float: left;
	border: 1px solid blue;
	background-color: gray;
}
#ALBUM{
	
 	margin: 10px;
	clear: both;
	width : 978px;
	height: 238px;
	border: 1px solid black;
}
</style>
</head>
<body>
	<div id="NEW"></div>
	<div id="RANK">
		<a href="home.do?search_type=ppopular">재생인기차트</a>&nbsp;&nbsp;&nbsp;<a href="home.do?search_type=dpopular">다운인기차트</a>
		<c:if test="${not empty chartList}">
			<table>
				<tr>
					<td align="center">순위</td><td align="center">곡명</td><td align="center">가수</td>
				</tr>
				<c:forEach var="vo" items="${chartList}" varStatus="num">
				 	<tr>
				 	<td>${num.count}</td>
				 	<td><a href="#" onclick="goChart(${vo.num})">${vo.title}</a></td>
				 	<td>${vo.singer}</td>
				 	</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	 
	<div id="ALBUM"></div>

</body>
</html> --%>