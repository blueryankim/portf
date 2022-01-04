<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../color.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>수박뮤직</title>
	<script type="text/javascript" src="../js/rollover.js"></script>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../fcomment/js/ajax.js"></script>
	<script type="text/javascript" src="../fcomment/js/comment.js"></script>
</head>
<body>

	<table width="1000" align="center" border="0" cellpadding="0" cellspacing="0">
	
		<!-- 헤더 -->
		<tr><td><jsp:include page="../home/home_top.jsp" flush="true" /></td></tr>
		
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
							<table width="940" border="0" cellpadding="0" cellspacing="0" align="center">
								<tr>
									<td width="300" height="210" valign="top" style="background:url('../subak_images/sub/board/main_boxbg.gif');">
										<table width="100%" border="0" cellpadding="10" cellspacing="0" align="center">
											<tr><td valign="top">
												<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
													<tr>
														<td width="10"></td>
														<td width="*" align="center" class="subPoint"><font color="${ subPoint }">- <a href="/Main/board/list.do">공 지 사 항</a> -</font></td>
														<td width="10"></td>
													</tr>
													<tr><td colspan="3" height="5"></td></tr>
													<tr><td colspan="3" height="1" bgcolor="${ spline_1px }"></td></tr>
													<tr><td colspan="3" height="5"></td></tr>
													<c:forEach var="vo" items="${ boardList }">
														<tr>
															<td height="30"></td>
															<td>- <a href="/Main/board/content.do?num=${vo.num}&pageNum=${bp.cur_Page}">${vo.subject}</a></td>
															<td></td>
														</tr>
													</c:forEach>
												</table>
											</td></tr>
										</table>
									</td>
									<td width="20"></td>
									<td width="300" valign="top" style="background:url('../subak_images/sub/board/main_boxbg.gif');">
										<table width="100%" border="0" cellpadding="10" cellspacing="0" align="center">
											<tr><td valign="top">
												<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
													<tr>
														<td width="10"></td>
														<td width="*" align="center" class="subPoint"><font color="${ subPoint }">- <a href="/Main/fboard/flist.do">자 유 게 시 판</a> -</font></td>
														<td width="10"></td>
													</tr>
													<tr><td colspan="3" height="5"></td></tr>
													<tr><td colspan="3" height="1" bgcolor="${ spline_1px }"></td></tr>
													<tr><td colspan="3" height="5"></td></tr>
													<c:forEach var="fo" items="${ff}" varStatus="num">
														<tr>
															<td height="30"></td>
															<td>- <a href="/Main/fboard/fcontent.do?num=${fo.num}&pageNum=${bp.cur_Page}">${fo.subject}</a></td>
															<td></td>
														</tr>
													</c:forEach>
												</table>
											</td></tr>
										</table>
									</td>
									<td width="20"></td>
									<td width="300" valign="top" style="background:url('../subak_images/sub/board/main_boxbg.gif');">
										<table width="100%" border="0" cellpadding="10" cellspacing="0" align="center">
											<tr><td valign="top">
												<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
													<tr>
														<td width="10"></td>
														<td width="*" align="center" class="subPoint"><font color="${ subPoint }">- <a href="/Main/qboard/list.do">질 문 게 시 판</a> -</font></td>
														<td width="10"></td>
													</tr>
													<tr><td colspan="3" height="5"></td></tr>
													<tr><td colspan="3" height="1" bgcolor="${ spline_1px }"></td></tr>
													<tr><td colspan="3" height="5"></td></tr>
													<c:if test="${not empty qq}">
														<c:forEach var="qo" items="${qq}" varStatus="num">
															<tr>
																<td height="30"></td>
																<td>- <a href="/Main/qboard/content.do?num=${qo.num}&pageNum=${bp.cur_Page}">${qo.subject}</a></td>
																<td></td>
															</tr>
														</c:forEach>
													</c:if>
												</table>
											</td></tr>
										</table>
									</td>
								</tr>
							</table>
								
						</td>
					</tr>
					
				</table>
				
			</td>
		</tr>
		
		<!-- 푸터 / 카피라이트 -->
		<tr><td height="50"></td></tr>
		<tr><td align="center"><jsp:include page="../include/footer.jsp" /></td></tr>
		
	</table><%-- 










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
																		<TR onmouseover="this.style.backgroundColor='#DEEBFB'"
																			onmouseout="this.style.backgroundColor=''" height=25>
																			<TD>&nbsp;&nbsp;&nbsp; <A
																				href="/Main/board/list.do"><FONT
																					style="FONT-SIZE: 10pt" color=#333333>공지 사항
																				</FONT></B></A></TD>
																		</TR>
																		<!-------------------------------------------------------->
																		<TR onmouseover="this.style.backgroundColor='#DEEBFB'"
																			onmouseout="this.style.backgroundColor=''" height=25>
																			<TD>&nbsp;&nbsp;&nbsp; <A
																				href="/Main/fboard/flist.do"><FONT
																					style="FONT-SIZE: 10pt" color=#333333>자유 게시판
																				</FONT></B></A></TD>
																		</TR>
																		<!-------------------------------------------------------->
																		<TR onmouseover="this.style.backgroundColor='#DEEBFB'"
																			onmouseout="this.style.backgroundColor=''" height=25>
																			<TD>&nbsp;&nbsp;&nbsp; <A
																				href="/Main/qboard/list.do"><FONT
																					style="FONT-SIZE: 10pt" color=#333333>Q&A </FONT></B></A></TD>
																		</TR>

																		</TBODY>
																	</TABLE>
																</TD>
															</TR>
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
																	<TABLE border=0 cellSpacing=0 cellPadding=0
																		width="100%">
																		<TBODY>
																			<TR vAlign=top>
																				<TD width=465>
																					<TABLE
																						style="BORDER-BOTTOM: #6699cc 1px dotted; BORDER-LEFT: #6699cc 1px dotted; BORDER-TOP: #6699cc 1px dotted; BORDER-RIGHT: #6699cc 1px dotted"
																						border=0 cellSpacing=15 cellPadding=0 width="100%"
																						bgColor=#fafafa align=center>
																						<TBODY>
																							<TR vAlign=top>
																								<TD>
																									<TABLE border=0 cellSpacing=0 cellPadding=0
																										width="100%">
																										<TBODY>
																											<TR>
																												<TD style="HEIGHT: 5px"></TD>
																											</TR>
																										</TBODY>
																									</TABLE> <A><FONT style="FONT-SIZE: 10pt">공지사항(관리자)</FONT></A>
																									&nbsp; &nbsp; &nbsp;
																									<TABLE border=0 cellSpacing=0 cellPadding=0
																										width="100%">
																										<TBODY>
																											<TR>
																												<TD style="HEIGHT: 10px"></TD>
																											</TR>
																										</TBODY>
																									</TABLE> <!-- ---------------------             공지			--------------------------------	 -->
																									<TABLE border=0 cellSpacing=0 cellPadding=0
																										width="100%">
																										<TBODY>
																											<TR>
																												<table width="400">
																													<c:forEach var="vo" items="${boardList }">
																														<tr>
																															<td align="center"><a
																																href="/Main/board/content.do?num=${vo.num}&pageNum=${bp.cur_Page}">
																																	&nbsp;${vo.subject}</a></td>
																														</tr>
																													</c:forEach>
																												</table>
																												<br />
																											</TR>
																										</TBODY>
																									</TABLE> <!-- ---------------------------------------------------------------------------------------- -->
																								</TD>
																							</TR>
																						</TBODY>
																					</TABLE>
																				</TD>


																				<!--   상단 메인 여기까지 -->
																				<TD style="WIDTH: 30px">&nbsp;</TD>
																				<TD width=215>
																					<!---------------------------------------------------------------------------->
																					<A><B><FONT color=#aaaaaa>pohto</B>
																						&nbsp;<FONT style="FONT-SIZE: 8pt" color=#cccccc>사진</FONT></A>
																					<TABLE border=0 cellSpacing=0 cellPadding=0
																						width="100%">
																						<TBODY>
																							<TR>
																								<TD style="HEIGHT: 5px"></TD>
																							</TR>
																						</TBODY>
																					</TABLE>
																					
																					<TABLE border=0 cellSpacing=0 cellPadding=0
																						width="100%">
																						<TBODY>
																							<TR>
																								<TD style="HEIGHT: 10px"></TD>
																							</TR>
																						</TBODY>
																					</TABLE>
																					<TABLE border=0 cellSpacing=0 cellPadding=2
																						width="100%" align=center>
																						<TBODY>
																							<TR>
																								<TD vAlign=top>
																									<TABLE cellSpacing=0 cellPadding=0 width="100%"
																										align=center>
																										<TBODY>
																											<TR>
																												<TD align=middle><A href=""><IMG
																														style="WIDTH: 150px; HEIGHT: 120px"
																														border=0 src="../image/2.jpg"></A></TD>
																											</TR>
																										</TBODY>
																									</TABLE>
																								</TD>
																								<TR>
																									<TD height=10></TD>
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
																					</TABLE>
																				</TD>
																			</TR>
																			<TR vAlign=top>
																				<TD colSpan=3>
																					<TABLE border=0 cellSpacing=0 cellPadding=5
																						width="100%" align=center>
																						<TBODY>

																							<TR vAlign=top>
																								<TD width="50%">
																									<TABLE border=0 cellSpacing=1 cellPadding=3
																										width="100%" bgColor=#cccccc align=center>
																										<TBODY>
																											<TR>
																												<TD class=bg_grad_gray_ffffff_eeeeee
																													align=left>
																													<TABLE border=0 cellSpacing=0 cellPadding=0
																														width="100%" align=center>
																														<TBODY>
																															<TR>
																																<TD align=center>&nbsp; <A href="/Main/fboard/flist.do"><FONT
																																		color=#555555><B>자유 게시판</B> </FONT></A></TD>
																																<TD align=right>&nbsp;</TD>
																															</TR>
																														</TBODY>
																													</TABLE>
																												</TD>
																											</TR>
																										</TBODY>
																									</TABLE> 
																										<table align=center>

																											<c:forEach var="fo" items="${ff}"
																												varStatus="num">
																												<tr>
																													<td align=center><a
																														href="/Main/fboard/fcontent.do?num=${fo.num}&pageNum=${bp.cur_Page}">
																														&nbsp;${fo.subject}</a>
																													</td>
																												</tr>
																											</c:forEach>
																										</table>
																								

																									<TABLE border=0 cellSpacing=0 cellPadding=0
																										width="100%">
																										<TBODY>
																											<TR>
																												<TD style="HEIGHT: 10px"></TD>
																											</TR>
																										</TBODY>
																									</TABLE>


																									<TD width="50%">
																										<TABLE border=0 cellSpacing=1 cellPadding=3
																											width="100%" bgColor=#cccccc align=center>
																											<TBODY>
																												<TR>
																													<TD class=bg_grad_gray_ffffff_eeeeee
																														align=left>
																														<TABLE border=0 cellSpacing=0
																															cellPadding=0 width="100%" align=center>
																															<TBODY>
																																<TR>
																																	<TD align=center>&nbsp; <A href="/Main/qboard/list.do"><FONT
																																			color=#555555><B>Q&A 게시판</B> </FONT></A></TD>
																																	<TD align=right>&nbsp;</TD>
																																</TR>

																															</TBODY>
																														</TABLE>
																													</TD>
																												</TR>
																											</TBODY>
																										</TABLE> <c:if test="${not empty qq}">
																											<table align=center>

																												<c:forEach var="qo" items="${qq}"
																												varStatus="num">
																												<tr>
																													<td align=center><a
																														href="/Main/qboard/content.do?num=${qo.num}&pageNum=${bp.cur_Page}">
																														&nbsp;${qo.subject}</a>
																													</td>
																												</tr>
																											</c:forEach>
																											</table>
																										</c:if>
																										<TABLE border=0 cellSpacing=0 cellPadding=0
																											width="100%">
																											<TBODY>
																												<TR>
																													<TD style="HEIGHT: 10px"></TD>
																												</TR>
																											</TBODY>
																										</TABLE>

																								</TD>
																								<TD width="50%">
																									<TABLE border=0 cellSpacing=0 cellPadding=0
																										width="100%">

																										<TBODY>


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
					</TABLE>
					<center> --%>
</body>
</html>