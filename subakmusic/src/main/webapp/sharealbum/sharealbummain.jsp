<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../color.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = (String) session.getAttribute("id");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>수박뮤직</title>
	<script type="text/javascript" src="../js/rollover.js"></script>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	function goWrite(sessionid) {
		if(sessionid=='null'){
			alert("로그인을 먼저해주세요.");
			return false;
		}
		window.location='/Main/uploadsharealbum/uploadsharealbum.jsp';
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
			
				<form name="sharealbumlistform">
					<table width="940" border="0" cellpadding="0" cellspacing="0" align="center">
						<tr><td class="subTitle" align="center">공 개 앨 범</td></tr>
						<tr><td height="10"></td></tr>
						
						<tr>
							<td>
								<table width="800" border="0" cellpadding="0" cellspacing="0" align="center">
									<tr><td class="subPoint">&nbsp;&nbsp;명예의 전당</td></tr>
									<tr><td height="3" bgcolor="${ spline_3px }"></td></tr>
									<tr><td height="10"></td></tr>
									<tr>
										<td>
											<table width="780" border="0" cellpadding="0" cellspacing="0" align="center">
												<tr>
													<c:forEach var="plist" items="${ poplist }">
														<td width="120"><a href="mysharealbum.do?pagenum=${ counter }&listnum=${ plist.listnum }"><img width="120" height="120" src="../uploadshareimage${ plist.imgpath }/${ plist.listnum }.jpg" border="0" /></a></td>
														<td width="10"></td>
														<td>
															<table border="0" cellpadding="0" cellspacing="0">
																<tr><td class="subPoint"><a href="mysharealbum.do?pagenum=${ counter }&listnum=${ plist.listnum }">${ plist.subject }</a></td></tr>
																<tr><td>&nbsp;&nbsp;&nbsp;프로듀서 : <b>${ plist.writer }</b></td></tr>
																<tr><td>&nbsp;&nbsp;&nbsp;수록곡수 : <b>${ plist.songcount }</b> 곡</td></tr>
																<tr><td>&nbsp;&nbsp;&nbsp;조&nbsp;회&nbsp;수&nbsp;&nbsp;: <b>${ plist.readcount }</b> 회</td></tr>
																<tr><td>&nbsp;&nbsp;&nbsp;추&nbsp;천&nbsp;수&nbsp;&nbsp;: <b>${ plist.recomcount }</b> 회</td></tr>
															</table>
														</td>
													</c:forEach>
												</tr>
											</table>
										</td>
									</tr>
									<tr><td height="10"></td></tr>
									<tr><td height="3" bgcolor="${ spline_3px }"></td></tr>
								</table>
							</td>
						</tr>
						
						<tr><td height="30"></td></tr>
						<tr>
							<td>
								<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">
									<tr><td colspan="11" class="subPoint">&nbsp;&nbsp;최신 공개앨범</td></tr>
									<tr><td colspan="11" height="3" bgcolor="${ spline_3px }"></td></tr>
									<tr bgcolor="${ th_bg }">
										<th width="50" height="30">번호</th>
										<th width="10"></th>
										<th width="*">제목</th>
										<th width="10"></th>
										<th width="50">곡수</th>
										<th width="10"></th>
										<th width="50">추천</th>
										<th width="10"></th>
										<th width="50">조회</th>
										<th width="10"></th>
										<th width="100">작성자</th>
									</tr>
									
									<!-- 내용 -->
									<c:forEach var="slist" items="${ sharelist }">
										<tr>
											<td align="center">${number}<c:set var="number" value="${number-1}" scope="page" /></td>
											<td></td>
											<td height="90">
												<table width="100%" border="0" cellpadding="0" cellspacing="0">
													<tr>
														<td width="70"><a href="mysharealbum.do?pagenum=${ counter }&listnum=${ slist.listnum }"><img src="../uploadshareimage${slist.imgpath}/${slist.listnum}.jpg" border="0" width="70" height="70" /></a></td>
														<td width="10"></td>
														<td width="*"><a href="mysharealbum.do?pagenum=${ counter }&listnum=${ slist.listnum }">${ slist.subject }</a></td>
													</tr>
												</table>
											</td>
											<td></td>
											<td align="center">${ slist.songcount }</td>
											<td></td>
											<td align="center"><font color="red">♥</font>${ slist.recomcount }</td>
											<td></td>
											<td align="center">${ slist.readcount }</td>
											<td></td>
											<td align="center">${ slist.writer }</td>
										</tr>
										<tr><td colspan="13" height="1" bgcolor="${ spline_1px }"></td></tr>
									</c:forEach>
									<tr><td colspan="11" height="2" bgcolor="${ spline_2px }"></td></tr>
									<tr><td colspan="11" height="5"></td></tr>
									
									<!-- 페이징 -->
									<tr>
										<td></td>
										<td colspan="9" align="center">
											<c:if test="${sp.isPre()}"><a href="list.do?pageNum=${sp.getPage_Start()-sp.p+size }">[이전]</a></c:if>
											<c:forEach var="counter" begin="${sp.getPage_Start() }" end="${sp.getPage_End() }">
												<c:if test="${search_text ne ''}">
													<font size="2"><a href="javascript:window.location='sharealbumlist.do?pagenum=${counter}'">&nbsp;${counter}&nbsp;</a></font>
												</c:if>
											</c:forEach>
											<c:if test="${sp.isNext() }"><a href="list.do?pageNum=${bp.getPage_start()+bp.p_size }">[다음]</a></c:if>
										</td>
										<td><input type="button" value="앨범만들기" onclick="goWrite('<%=id%>')"/></td>
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











<%-- <form name="sharealbumlistform">
<h2>명예의 전당</h2>
<table>
	<tr>
		<!-- 첫번째 두번째 명예의 전당 -->
		<c:forEach var="plist" items="${poplist}">
			<td rowspan="4"><img width="130" height="130" src="../uploadshareimage${plist.imgpath}/${plist.listnum}.jpg"/></td>
			<td>
				<table width="160">
					<tr>
						<td>
							<font size="3"><strong><a href="javascript:window.location='mysharealbum.do?pagenum=${counter}&listnum=${plist.listnum}'">${plist.subject}</a></strong></font>
						</td>
					</tr>
					<tr><td><font color="#1CBDD5" size="2">${plist.writer }</font></td></tr>
					<tr><td><font size="2">수록곡수:</font><font color="#0FC124" size="2">${plist.songcount}곡</font></td></tr>
					<tr><td><font size="2">조회수:${plist.readcount}</font></td></tr>
					<tr><td><font size="2">추천수:${plist.recomcount}</font></td></tr>
				</table>
			</td>
		</c:forEach>
	</tr>
</table>
<br/>

<h3>최신 공개앨범</h3>
<c:forEach var="slist" items="${sharelist}">
	<table width="600" frame="hsides" style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: black; border-top-style: dotted; border-top-width: 1px; border-top-color: black;" >
		<tr>
			<td rowspan="4"><img width="80" height="80" src="../uploadshareimage${slist.imgpath}/${slist.listnum}.jpg"/></td>
			<td align="left">
				<table width="400">
					<tr><td><font size="2"><strong><a href="javascript:window.location='mysharealbum.do?pagenum=${counter}&listnum=${slist.listnum}'">${slist.subject}</a></strong></font></td></tr>
					<tr><td align="left"><font color="#1CBDD5" size="2">${slist.writer }</font></td></tr>
					<tr><td align="left"><font size="2">수록곡수:</font><font color="#0FC124" size="2">${slist.songcount}곡</font></td></tr>
					<tr><td align="left"><font size="2">조회수:${slist.readcount}</font></td></tr>
				</table>
			</td>
		</tr>
	</table>
<br/>
</c:forEach>

<table width="600">
	<tr>
		<td align="center">
			<c:if test="${sp.isPre()}"><a href="list.do?pageNum=${sp.getPage_Start()-sp.p+size }">[이전]</a></c:if>
			<c:forEach var="counter" begin="${sp.getPage_Start() }" end="${sp.getPage_End() }">
				<c:if test="${search_text ne ''}">
					<font size="2"><a href="javascript:window.location='sharealbumlist.do?pagenum=${counter}'">[${counter}]</a></font>
				</c:if>
			</c:forEach>
			<c:if test="${sp.isNext() }"><a href="list.do?pageNum=${bp.getPage_start()+bp.p_size }">[다음]</a></c:if>
		</td>
	</tr>
</table>

</form> --%>
</body>
</html>