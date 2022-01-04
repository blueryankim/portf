<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../color.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>수박뮤직</title>
	<script type="text/javascript" src="../js/rollover.js"></script>
	<link type="text/css" rel="stylesheet" href="../css/style.css" />
	<script type="text/javascript" src="../comment/js/ajax.js"></script>
	<script type="text/javascript" src="../comment/js/comment.js"></script>
	<script type="text/javascript">
	window.onload = function() {
		loadCommentList(document.writeForm.num.value);
	};
	function makeCommentView(comment) {
		var commentDiv = document.createElement('div');
		commentDiv.setAttribute('id', 'c' + comment.id);
		var html = '<table width="700" height="50"><tr><td><strong>'
			+ comment.name
			+ '</strong>&nbsp;&nbsp;&nbsp;'
			+ comment.content.replace(/\n/g, '\n<br/>')
			+'&nbsp;&nbsp;&nbsp;'
			+ '<FONT color="#FF0000">'
			+comment.regdate+'</FONT>'
			+'&nbsp;&nbsp;&nbsp;'
			+ '<input type="button" value="수정" onclick="viewUpdateForm('+ comment.id + ')"/>'
			+ '<input type="button" value="삭제" onclick="confirmDelection('	+ comment.id + ')"/></td></tr></table>';
		commentDiv.innerHTML = html;
		commentDiv.comment = comment;
		commentDiv.className = "comment";
		return commentDiv;
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
					<tr><td><jsp:include page="../include/board_submenu.jsp" /></td></tr>
					<tr><td height="20"></td></tr>
					<tr>
						<td>
						
							<form method="post" name="writeForm">
								<input type="hidden" name="num" value="${vo.num }" />
								<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">
									<tr>
										<td>
											<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
												<tr>
													<td width="250"></td>
													<td width="*" class="subTitle" align="center"><font color="${ subTitle }">공 지 사 항</font></td>
													<td width="250" align="right" valign="bottom">
														<input type="button" value="전체목록" onclick="window.location='list.do'" />
														<c:if test="${ sessionScope.id == 'admin' }">
															<input type="button" value="글쓰기" onclick="window.location='writeForm.do'" />
														</c:if>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr><td height="10"></td></tr>
									<tr>
										<td>
											<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
												<tr><td colspan="4" height="3" bgcolor="${ spline_3px }"></td></tr>
												<tr>
													<td width="10" height="30"></td>
													<td width="*" align="left">[${ vo.num }] <b>${ vo.subject }</b></td>
													<td width="350" align="right">작성일 : <fmt:formatDate value="${ vo.regdate }" type="DATE" pattern="yyyy-MM-dd HH:mm" /></td>
													<td width="10"></td>
												</tr>
												<tr><td colspan="4" height="1" bgcolor="${ spline_1px }"></td></tr>
												<tr>
													<td height="30"></td>
													<td align="left">작성자 : ${ vo.writer }&nbsp;<a href="mailto:${ vo.email }"><img src="../subak_images/sub/board/email.gif" border="0" height="10" /></a></td>
													<td align="right">조회수 : ${ vo.readcount }</td>
													<td></td>
												</tr>
												<tr><td colspan="4" height="1" bgcolor="${ spline_1px }"></td></tr>
												<tr><td colspan="4" height="10"></td></tr>
												<tr>
													<td></td>
													<td colspan="2" align="left" valign="top" height="100"><pre>${ vo.content }</pre></td>
													<td></td>
												</tr>
												<tr><td colspan="4" height="10"></td></tr>
												<tr><td colspan="4" height="3" bgcolor="${ spline_3px }"></td></tr>
												<tr><td colspan="4" height="10"></td></tr>
												<tr>
													<td></td>
													<td colspan="2" align="right">
														<c:if test="${not empty sessionScope and sessionScope.id != null and sessionScope.id == 'admin' }">
															<input type="button" value="글수정" onclick="window.location='updateForm.do?num=${vo.num }'" />
															<input type="button" value="글삭제" onclick="window.location='deleteForm.do?num=${vo.num }'" />
														</c:if>
													</td>
													<td></td>
												</tr>
											</table>
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



<%-- <form method="post" name="writeForm">
			<input type="hidden" name="num" value="${vo.num }" />
			<center>
				
				
				
				
				
				
				
				
				<h3>글보기</h3>
				<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td align="center" width="100" bgcolor="${value_c }">번호</td>
						<td align="left" width="200">${vo.num }</td>
						<td align="center" width="100" bgcolor="${value_c }">작성일</td>
						<td align="left" width="200">${vo.regdate }</td>
					</tr>
					<tr>
						<td align="center" bgcolor="${value_c }">작성자</td>
						<td align="left">${vo.writer }</td>
						<td align="center" bgcolor="${value_c }">조회수</td>
						<td align="left">${vo.readcount }</td>
					</tr>
					<tr>
						<td align="center" bgcolor="${value_c }">제목</td>
						<td colspan="7" align="left">${vo.subject }</td>
						
					</tr>
					<tr>
						<td align="center" bgcolor="${value_c }">내용</td>
						<td colspan="7" align="left" height="100"><pre>${vo.content }</pre></td>
					</tr>
				</table>
				<br /> </input>&nbsp;&nbsp;&nbsp; <input
					type="button" value="글수정"
					onclick="window.location='updateForm.do?num=${vo.num }'" /> <input
					type="button" value="글삭제"
					onclick="window.location='deleteForm.do?num=${vo.num }'" /> <input
					type="button" value="목록보기" onclick="window.location='list.do'" />
			</center>
		</form> --%>









<%-- 
	<table>
		<tr>
			<td>
				<h3></h3>
			</td>
			<td><img src="../image/1.jpg" /></td>
			<td><img src="../image/1.jpg" /></td>
			<td><img src="../image/2.jpg" /></td>
			<td><img src="../image/2.jpg" /></td>
			<td><img src="../image/1.jpg" /></td>
			<td><img src="../image/2.jpg" /></td>
	</table>
	</tr>
	<table border=0 cellSpacing=0 cellPadding=0 width=700 align=center>
		<tr bgcolor="">
			<td align="center" width="100"><a href="/Main/fboard/flist.do">자유
					게시판</a></td>
			<td align="center" width="100">&nbsp;&nbsp; 장르: <a href="">발라드</a>,
				<a href="">R&B</a>, <a href="">힙합</a></td>
			<td align="center" width="100"><a href="/Main/qboard/list.do">
					Q/A </a></td>
		</tr>
	</table>

	<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
		<TBODY>
			<TR bgColor=#eeeeee>
				<TD vAlign=center>
					<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%"
						bgColor=#004f98 align=center height=45>
						<TBODY>
							<TR bgColor=#eeeeee>
								<TD class=bg_grad_gray_5_1 height=45 align=middle>
									<TABLE border=0 cellSpacing=0 cellPadding=0 width=980 height=45>
										<TBODY>
											<TR>
												<TD width=15 align=middle>&nbsp;</TD>
												<TD width=30 align=middle>&nbsp;</TD>
												<TD width=415 align=left>
													<TABLE border=0 cellSpacing=0 cellPadding=0 height=45>
														<TBODY>
															<TR>
																<!--     위쪽 매뉴     -->
																<td><A href="/Main/fboard/flist.do"><FONT
																		style="FONT-SIZE: 8pt" color=#cccccc>&nbsp;자유
																			게시판&nbsp;</A></FONT>
																	<td><A href="/Main/qboard/list.do"><FONT
																			style="FONT-SIZE: 8pt" color=#cccccc>&nbsp;
																				Q&A 게시판&nbsp;</A></FONT></td>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE border=0 cellSpacing=1 cellPadding=0 width=982
						bgColor=#cccccc>
						<TBODY>
							<TR bgColor=#ffffff>
								<TD align=middle>
									<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
										<TBODY>
											<TR vAlign=top>
												<TD bgColor=#f9f9f9 width=200 align=middle>
													<TABLE border=0 cellSpacing=0 cellPadding=25 width="100%">
														<TBODY>
															<TR>
																<TD align=middle>
																	<DIV style="MARGIN: 10px 0px 0px" class=empty></DIV>
																	<TABLE border=0 cellSpacing=0 cellPadding=0
																		width="100%">
																		<TBODY>
																			<TR>
																				<TD style="BORDER-BOTTOM: #dddddd 1px solid"
																					height=48 vAlign=top align=middle><A
																					onfocus=blur(); href="/Main/fboard/boardList.do"><FONT
																						style="LINE-HEIGHT: 22pt" color=#aaaaaa size=5
																						face=georgia>Community</FONT></B></A></TD>
																			</TR>
																			<TR>
																				<TD
																					style="HEIGHT: 15px; BORDER-TOP: #ffffff 1px solid"></TD>
																			</TR>
																		</TBODY>
																	</TABLE> <!--  왼쪽 매뉴 -->
																	<TABLE border=0 cellSpacing=0 cellPadding=0
																		width="100%" align=center>
																		<!-------------------------------------------------------->
																		<TBODY>
																			<TR>
																				<TD height=25 colSpan=2></TD>
																			</TR>
																			<!-------------------------------------------------------->
																			<TR>
																				<TD style="HEIGHT: 15px"></TD>
																			</TR>
										
																			<!-------------------------------------------------------->
																			<TR
																				onmouseover="this.style.backgroundColor='#DEEBFB'"
																				onmouseout="this.style.backgroundColor=''" height=25>
																				<TD>&nbsp;&nbsp;&nbsp; <A
																					href="/Main/board/list.do"><FONT
																						style="FONT-SIZE: 10pt" color=#333333>공지 사항 </FONT></B></A></TD>
																			</TR>
																			<TR
																				onmouseover="this.style.backgroundColor='#DEEBFB'"
																				onmouseout="this.style.backgroundColor=''" height=25>
																				<TD>&nbsp;&nbsp;&nbsp; <A
																					href="/Main/fboard/flist.do"><FONT
																						style="FONT-SIZE: 10pt" color=#333333>자유
																							게시판 </FONT></B></A></TD>
																			</TR>
																			<!-------------------------------------------------------->
																			<TR
																				onmouseover="this.style.backgroundColor='#DEEBFB'"
																				onmouseout="this.style.backgroundColor=''" height=25>
																				<TD>&nbsp;&nbsp;&nbsp; <A
																					href="/Main/qboard/list.do"><FONT
																						style="FONT-SIZE: 10pt" color=#333333>Q&A </FONT></B></A></TD>
																			</TR>
																			<!-------------------------------------------------------->
																	
															<!----------------------------------------------------------------------------->
														</TBODY>
													</TABLE>
													<DIV style="MARGIN: 50px 0px 0px" class=empty></DIV>
												</TD>
												<TD bgColor=#cccccc width=1></TD>
												<TD class=bg_grad_h_gray_f5f5f5_ffffff width=10></TD>
												<TD>
													<TABLE border=0 cellSpacing=0 cellPadding=30 width="100%">
														<TBODY>
															<TR>
																<TD align=middle>
																	<TABLE border=0 cellSpacing=0 cellPadding=0
																		width="100%">
																		<TBODY>
																			<TR>
																				<TD style="HEIGHT: 5px"></TD>
																				<form method="post" action="fdeleteForm.do?num=${num }">
		<div align="center" class="body">
		
		
		
		
		<form method="post" name="writeForm">
			<input type="hidden" name="num" value="${vo.num }" />
			<center>
				
				
				
				
				
				
				
				
				<h3>글보기</h3>
				<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td align="center" width="100" bgcolor="${value_c }">번호</td>
						<td align="left" width="200">${vo.num }</td>
						<td align="center" width="100" bgcolor="${value_c }">작성일</td>
						<td align="left" width="200">${vo.regdate }</td>
					</tr>
					<tr>
						<td align="center" bgcolor="${value_c }">작성자</td>
						<td align="left">${vo.writer }</td>
						<td align="center" bgcolor="${value_c }">조회수</td>
						<td align="left">${vo.readcount }</td>
					</tr>
					<tr>
						<td align="center" bgcolor="${value_c }">제목</td>
						<td colspan="7" align="left">${vo.subject }</td>
						
					</tr>
					<tr>
						<td align="center" bgcolor="${value_c }">내용</td>
						<td colspan="7" align="left" height="100"><pre>${vo.content }</pre></td>
					</tr>
				</table>
				<br /> </input>&nbsp;&nbsp;&nbsp; <input
					type="button" value="글수정"
					onclick="window.location='updateForm.do?num=${vo.num }'" /> <input
					type="button" value="글삭제"
					onclick="window.location='deleteForm.do?num=${vo.num }'" /> <input
					type="button" value="목록보기" onclick="window.location='list.do'" />
			</center>
		</form>
	</div>
	<div id="commentList" align="center" class="body"></div>
	<div id="commentAdd" align="center">

		<!-- 댓글 입력 폼 -->
		<form action="" name="addForm" method="post">
			<input type="hidden" name="num" value="${vo.num }" /> 이름 : <input
				type="text" name="name" size="10"></input> 내용 :
			<textarea name="content" cols="20" rows="2"></textarea>
			<input type="button" value="등록" onclick="addComment()" />
		</form>
	</div>
	<div id="commentUpdate" style="display: none">
		<form action="" name="updateForm">
			<input type="hidden" name="id" value="" /> <input type="hidden"
				name="regdate" value="" /> 이름 : <input type="text" name="name"
				size="10"></input><br /> 내용 :
			<textarea name="content" cols="20" rows="2">
					</textarea>
			<br /> <input type="button" value="등록" onclick="updateComment()" />
			<input type="button" value="취소" onclick="cancleUpdate()" />
		</form>
	</div>
	
	
	
	
	
	
	
	
	
	
	
																			</TR>
																		</TBODY>
																	</TABLE>
																	<TABLE border=0 cellSpacing=0 cellPadding=0
																		width="100%">
																		<TBODY>
																			<TR>
																				<TD style="HEIGHT: 15px"></TD>
																			</TR>
																		</TBODY>
																	</TABLE> <!---------------------------------------------------------------------------->
																	

																	<DIV style="MARGIN: 25px 0px 0px" class=empty></DIV>
																</TD>
															</TR>
														</TBODY>
													</TABLE>
													<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
														<TBODY>
															<TR>
																<TD style="HEIGHT: 30px"></TD>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE> --%>
	
</body>
</html>