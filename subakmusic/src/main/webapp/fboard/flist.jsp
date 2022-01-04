<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../color.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>수박뮤직</title>
	<script type="text/javascript" src="../js/rollover.js"></script>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	function search() {
		var form = document.listForm;
		if (form.search_text.value == null || form.search_text.value == "") {
			alert("검색어를 입력해 주세요");
			return;
		}
		var url = 'flist.do?pageNum=1&search_type=' + form.search_type.value + '&search_text=' + encodeURI(form.search_text.value);
		window.location = url;
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
						
							<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">
								<tr>
									<td colspan="9">
										<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
											<tr>
												<td width="250"></td>
												<td width="*" class="subTitle" align="center"><font color="${ subTitle }">자 유 게 시 판</font></td>
												<td width="250" align="right" valign="bottom">
													<input type="button" value="전체목록" onclick="window.location='flist.do'" />
													<c:if test="${not empty sessionScope and sessionScope.id != null }">
														<input type="button" value="글쓰기" onclick="window.location='fwriteForm.do'" />
													</c:if>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr><td colspan="9" height="10"></td></tr>
								<tr><td colspan="9" height="3" bgcolor="${ spline_3px }"></td></tr>
								<tr bgcolor="${ th_bg }">
									<th align="center" width="50" height="30">번호</th>
									<th width="5"></th>
									<th align="center" width="530">제목</th>
									<th width="5"></th>
									<th align="center" width="100">작성자</th>
									<th width="5"></th>
									<th align="center" width="100">작성일</th>
									<th width="5"></th>
									<th align="center" width="100">조회수</th>
								</tr>
								<!-- 글이 없을 경우 -->
								<c:if test="${ count == 0 }"><tr><td colspan="9" align="center" height="100">- 게시판에 저장된 글이 없습니다. -</td></tr></c:if>
								<!-- 글이 있는 경우 -->
								<c:if test="${ count != 0 }">
									<c:forEach var="vo" items="${ boardList }">
										<tr onmouseover="this.style.backgroundColor='${ tr_onmouseover }'" onmouseout="this.style.backgroundColor=''">
											<td align="center" width="50" height="30">${ number}<c:set var="number" value="${ number -1 }" scope="page" /></td>
											<td width="5"></td>
											<td align="left" width="530">
												<a href="fcontent.do?num=${ vo.num }&pageNum=${ bp.cur_Page }">${ vo.subject }</a>
												<c:if test="${ vo.readcount > 10 }"><img src="../subak_images/sub/board/hot.gif" border="0" height="10" /></c:if>
											</td>
											<td width="5"></td>
											<td align="center" width="100">${ vo.writer }&nbsp;<a href="mailto:${ vo.email }"><img src="../subak_images/sub/board/email.gif" border="0" height="10" /></a></td>
											<td width="5"></td>
											<td align="center" width="100"><fmt:formatDate value="${ vo.regdate }" type="DATE" pattern="yyyy-MM-dd HH:mm" /></td>
											<td width="5"></td>
											<td align="center" width="100">${ vo.readcount }</td>
										</tr>
										<tr><td colspan="9" height="1" bgcolor="${ spline_1px }"></td></tr>
									</c:forEach>
								</c:if>
								<tr><td colspan="9" height="2" bgcolor="${ spline_2px }"></td></tr>
								<tr><td colspan="9" height="10"></td></tr>
								<tr>
									<td colspan="9" height="30" align="center">
										<!-- 페이징 -->
										<c:if test="${bp.isPre()}"><a href="flist.do?pageNum=${bp.getPage_Start()-bp.p_size }">[이전]</a></c:if>
										<c:forEach var="counter" begin="${bp.getPage_Start() }" end="${bp.getPage_End() }">
											<c:if test="${ search_text ne '' }">
												<a href="javascript:window.location='flist.do?pageNum=${counter }&search_type=${search_type}&search_text=${search_text}'">&nbsp;${counter}&nbsp;</a>
											</c:if>
											<c:if test="${ search_text eq '' }">
												<a href="javascript:window.location='flist.do?pageNum=${counter }'">&nbsp;${counter}&nbsp;</a>
											</c:if>
										</c:forEach>
										<c:if test="${ bp.isNext() }"><a href="list.do?pageNum=${ bp.getPage_Start() + bp.p_size }">[다음]</a></c:if>
									</td>
								</tr>
								<tr>
									<td colspan="9" height="30" align="center">
										<!-- 검색 -->
										<form method="get" name="listForm" action="flist.do">
											<input type="hidden" name="pageNum" value="${ pageNum }" />
											<select name="search_type">
												<option value="all" ${ search_type == "all" ? "selected" : "" }>전체</option>
												<option value="subject" ${ search_type == "subject" ? "selected" : "" }>제목</option>
												<option value="writer" ${ search_type == "writer" ? "selected" : "" }>작성자</option>
												<option value="content" ${ search_type == "content" ? "selected" : "" }>내용</option>
											</select>
											<input type="text" name="search_text" value="${ search_text }" />
											<input type="button" value="검색" onclick="search()" />
										</form>
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
		
	</table>



<%-- 

<form method="get" name="listForm" action="flist.do">
	<input type="hidden" name="pageNum" value="${pageNum}" />
	<select name="search_type">
		<option value="all" ${search_type == "all" ? "selected" : ""}>전체</option>
		<option value="subject" ${search_type == "subject" ? "selected" : ""}>제목</option>
		<option value="writer" ${search_type == "writer" ? "selected" : ""}>작성자</option>
		<option value="content" ${search_type == "content" ? "selected" : ""}>내용</option>
	</select>
	<input type="text" name="search_text" value="${search_text}" />
	<input type="button" value="검색" onclick="search()" />
</form>
<tr>
	<td align="right" colspan="5">
	<input type="button" value="전체목록" onclick="window.location='flist.do'" />
	<input type="button" value="글쓰기" onclick="window.location='fwriteForm.do'" />
	</td>
</tr>
<tr bgcolor="${value_c }">
	<td align="center" width="60">번호</td>
	<td align="center" width="380">제목</td>
	<td align="center" width="100">작성자</td>
	<td align="center" width="100">작성일</td>
	<td align="center" width="60">조회수</td>
</tr>
<!-- 글이 없을 경우 -->
<c:if test="${count == 0  }">
<tr>
	<td colspan="6" align="center">게시판에 저장된 글이
		없습니다.</td>
</tr>
</c:if>

<c:if test="${count != 0  }">
	<c:forEach var="vo" items="${boardList }">
		<tr>
			<td align="center">${number}<c:set var="number" value="${number -1 }" scope="page" /></td>
			<td align="left"><a href="fcontent.do?num=${vo.num}&pageNum=${bp.cur_Page}">${vo.subject}</a>
				<c:if test="${ vo.readcount > 10 }"><img src="images/hot.gif" border="0" height="16" /></c:if></td>
			<td align="center"><a href="mailto:${ vo.email }">${vo.writer}</a></td>
			<td align="center">${ vo.regdate }</td>
			<td align="center">${ vo.readcount }</td>
		</tr>
	</c:forEach>
</c:if>



 --%>





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
										<TABLE border=0 cellSpacing=0 cellPadding=0 width=980
											height=45>
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
																				<TR
																				onmouseover="this.style.backgroundColor='#DEEBFB'"
																				onmouseout="this.style.backgroundColor=''" height=25>
																				<TD>&nbsp;&nbsp;&nbsp; <A
																					href="/Main/board/list.do"><FONT
																						style="FONT-SIZE: 10pt" color=#333333>공지 사항 </FONT></B></A></TD>
																			</TR>																				<!-------------------------------------------------------->
																				<TR
																					onmouseover="this.style.backgroundColor='#DEEBFB'"
																					onmouseout="this.style.backgroundColor=''"
																					height=25>
																					<TD>&nbsp;&nbsp;&nbsp; <A
																						href="/Main/fboard/flist.do"><FONT
																							style="FONT-SIZE: 10pt" color=#333333>자유
																								게시판 </FONT></B></A></TD>
																				</TR>
																				<!-------------------------------------------------------->
																				<TR
																					onmouseover="this.style.backgroundColor='#DEEBFB'"
																					onmouseout="this.style.backgroundColor=''"
																					height=25>
																					<TD>&nbsp;&nbsp;&nbsp; <A
																						href="/Main/qboard/list.do"><FONT
																							style="FONT-SIZE: 10pt" color=#333333>Q&A
																						</FONT></B></A></TD>
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
																					<center>
																					<tr bgColor=#004f98 align="center" >자유 게시판
																					</tr>
																						<form method="get" name="listForm"
																							action="flist.do">
																							<input type="hidden" name="pageNum"
																								value="${pageNum}" /> <select
																								name="search_type">
																								<option value="all"
																									${search_type == "all" ? "selected" : ""}>전체</option>
																								<option value="subject"
																									${search_type == "subject" ? "selected" : ""}>제목</option>
																								<option value="writer"
																									${search_type == "writer" ? "selected" : ""}>작성자</option>
																								<option value="content"
																									${search_type == "content" ? "selected" : ""}>내용</option>
																							</select> <input type="text" name="search_text"
																								value="${search_text}" /> <input type="button"
																								value="검색" onclick="search()" />
																						</form>
																				<tr>
																					<td align="right" colspan="5"><input
																						type="button" value="전체목록"
																						onclick="window.location='flist.do'" /> <input
																						type="button" value="글쓰기"
																						onclick="window.location='fwriteForm.do'" /></td>
																				</tr>
																				<tr bgcolor="${value_c }">
																					<td align="center" width="60">번호</td>
																					<td align="center" width="380">제목</td>
																					<td align="center" width="100">작성자</td>
																					<td align="center" width="100">작성일</td>
																					<td align="center" width="60">조회수</td>
																				</tr>
																				<!-- 글이 없을 경우 -->
																				<c:if test="${count == 0  }">
																					<tr>
																						<td colspan="6" align="center">게시판에 저장된 글이
																							없습니다.</td>
																					</tr>
																				</c:if>
																				<c:if test="${count != 0  }">
																					<c:forEach var="vo" items="${boardList }">
																						<tr>
																							<td align="center">${number} <c:set
																									var="number" value="${number -1 }" scope="page" /></td>
																							<td align="left"><a
																								href="fcontent.do?num=${vo.num}&pageNum=${bp.cur_Page}">
																									&nbsp;${vo.subject}</a> <c:if
																									test="${vo.readcount > 10 }">
																									<img src="images/hot.gif" border="0"
																										height="16"></img>
																								</c:if></td>
																							<td align="center"><a
																								href="mailto:${vo.email }">${vo.writer}</a></td>
																							<td align="center">${vo.regdate }</td>
																							<td align="center">${vo.readcount }</td>
																						</tr>
																					</c:forEach>
																				</c:if>
																		</table> <br />
																		<c:if test="${bp.isPre()}"><a href="flist.do?pageNum=${bp.getPage_Start()-bp.p_size }">[이전]</a></c:if>
																		<c:forEach var="counter" begin="${bp.getPage_Start() }" end="${bp.getPage_End() }">
																			<c:if test="${ search_text ne '' }">
																				<a href="javascript:window.location='flist.do?pageNum=${counter }&search_type=${search_type}&search_text=${search_text}'">&nbsp;${counter}&nbsp;</a>
																			</c:if>
																			<c:if test="${ search_text eq '' }">
																				<a href="javascript:window.location='flist.do?pageNum=${counter }'">&nbsp;${counter}&nbsp;</a>
																			</c:if>
																		</c:forEach>
																		<c:if test="${ bp.isNext() }"><a href="list.do?pageNum=${ bp.getPage_Start() + bp.p_size }">[다음]</a></c:if>
																		<p></p>
																		<form method="get" name="listForm" action="flist.do">
																			<input type="hidden" name="pageNum" value="${ pageNum }" />
																			<select name="search_type">
																				<option value="all" ${ search_type == "all" ? "selected" : "" }>전체</option>
																				<option value="subject" ${ search_type == "subject" ? "selected" : "" }>제목</option>
																				<option value="writer" ${ search_type == "writer" ? "selected" : "" }>작성자</option>
																				<option value="content" ${ search_type == "content" ? "selected" : "" }>내용</option>
																			</select>
																			<input type="text" name="search_text" value="${search_text}" />
																			<input type="button" value="검색" onclick="search()" />
																		</form>
																		</center>
																</TR>
															</TBODY>
														</TABLE>
														<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
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