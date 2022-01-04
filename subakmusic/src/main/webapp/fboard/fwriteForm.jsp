<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../color.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>수박뮤직</title>
	<script type="text/javascript" src="../js/rollover.js"></script>
	<link type="text/css" rel="stylesheet" href="../css/style.css" />
	<script type="text/javascript" src="../js/script.js"></script>
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
					<%-- <tr><td><jsp:include page="../include/board_submenu.jsp" /></td></tr>
					<tr><td height="20"></td></tr> --%>
					<tr>
						<td>
							<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">
								<tr>
									<td>
										<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
											<tr>
												<td width="250"></td>
												<td width="*" class="subTitle" align="center"><font color="${ subTitle }">자 유 게 시 판</font></td>
												<td width="250" align="right" valign="bottom"></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr><td height="10"></td></tr>
								<tr>
									<td>
									
										<form method="post" name="writeForm" action="fwriteForm.do" enctype="multipart.form-data">
											<table width="800" border="0" cellpadding="0" cellspacing="0" align="center">
												<tr><td colspan="5" height="3" bgcolor="${ spline_3px }"></td></tr>
												<tr>
													<td width="10" height="30"></td>
													<td width="240">작성자&nbsp;<input type="text" name="writer" value="${ sessionScope.id }" readonly="readonly" style="width:190px;" /></td>
													<td width="250">비밀번호&nbsp;<input type="password" name="pass" value="${ sessionScope.pass }" style="width:190px;" /></td>
													<td width="*">이메일&nbsp;<input type="text" name="email" value="${ email }" style="width:250px;" /></td>
													<td width="10"></td>
												</tr>
												<tr><td colspan="5" height="1" bgcolor="${ spline_1px }"></td></tr>
												<tr>
													<td height="30"></td>
													<td colspan="3">&nbsp;제&nbsp;목&nbsp;&nbsp;<input type="text" name="subject" value="${ subject }" style="width:740px;" /></td>
													<td></td>
												</tr>
												<tr><td colspan="5" height="1" bgcolor="${ spline_1px }"></td></tr>
												<tr><td colspan="5" height="10"></td></tr>
												<tr>
													<td></td>
													<td colspan="3" align="left" valign="top" height="100"><textarea name="content" style="width:780px;height:300px;"></textarea></td>
													<td></td>
												</tr>
												<tr><td colspan="5" height="10"></td></tr>
												<tr><td colspan="5" height="3" bgcolor="${ spline_3px }"></td></tr>
												<tr><td colspan="5" height="10"></td></tr>
												<tr>
													<td colspan="5" align="center">
														<input type="button" value="글쓰기" onclick="writeCheck()" />
														<input type="button" value="목록보기" onclick="window.location='flist.do'" />
													</td>
												</tr>
											</table>
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
		<form method="post" name="writeForm" action="fwriteForm.do" enctype="multipart.form-data">
			<center>
				<h3>글쓰기</h3>
				<table width="450" border="1">
					<tr>
						<td align="center" bgcolor="${value_c }">작성자</td>
						<td align="left"><input type="text" name="writer"
							value="${writer }" /></td>
					</tr>
					<tr>
						<td align="center" bgcolor="${value_c }">비밀번호</td>
						<td align="left" width=145><input type="password" name="pass"
							value="${pass }" /></td>
					</tr>
			<!--   	<tr>
						<td align="center" bgcolor="${value_c }">이메일</td>
						<td align="left"><input type="text" size="60" name="email"
							value="${email }" /></td>
					</tr> -->	
					<tr>
						<td align="center" bgcolor="${value_c }">제목</td>
						<td align="left"><input type="text" size="60" name="subject"
							value="${subject }" /></td>
					</tr>
				<!-- 	<tr>
						<td align="center" bgcolor="${value_c }">파일</td>
						<td align="left"><input type="file" size="43" name="picture" /></td>
					</tr>  -->
					<tr>
						<td align="center" bgcolor="${value_c }">내용</td>
						<td align="left"><textarea name="content" rows="13" cols="60"></textarea></td>
					</tr>
				</table>
				<br /> 
				<input type="button" value="글쓰기" onclick="writeCheck()" />
				<input type="button" value="목록보기" onclick="window.location='flist.do'" />
					
			</center>
		</form>
	</div> --%>










	<%-- <table>
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
<!-- --------------------------------------------------------------------여따 집어넣어 ----------------------------------------------------------------------------------------------------------------------->
																			<div align="center" class="body">
		<form method="post" name="writeForm" action="fwriteForm.do" enctype="multipart.form-data">
			<center>
				<h3>글쓰기</h3>
				<table width="450" border="1">
					<tr>
						<td align="center" bgcolor="${value_c }">작성자</td>
						<td align="left"><input type="text" name="writer"
							value="${writer }" /></td>
					</tr>
					<tr>
						<td align="center" bgcolor="${value_c }">비밀번호</td>
						<td align="left" width=145><input type="password" name="pass"
							value="${pass }" /></td>
					</tr>
			<!--   	<tr>
						<td align="center" bgcolor="${value_c }">이메일</td>
						<td align="left"><input type="text" size="60" name="email"
							value="${email }" /></td>
					</tr> -->	
					<tr>
						<td align="center" bgcolor="${value_c }">제목</td>
						<td align="left"><input type="text" size="60" name="subject"
							value="${subject }" /></td>
					</tr>
				<!-- 	<tr>
						<td align="center" bgcolor="${value_c }">파일</td>
						<td align="left"><input type="file" size="43" name="picture" /></td>
					</tr>  -->
					<tr>
						<td align="center" bgcolor="${value_c }">내용</td>
						<td align="left"><textarea name="content" rows="13" cols="60"></textarea></td>
					</tr>
				</table>
				<br /> 
				<input type="button" value="글쓰기" onclick="writeCheck()" />
				<input type="button" value="목록보기"
					onclick="window.location='flist.do'" />
					
			</center>
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