<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Notice page</title>
<link href="../css/style_nobg.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>

	<table width="1000" align="center" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="3"><hr /></td>
		</tr>
		<tr>
			<td width="150" align="left" valign="top"><jsp:include
					page="admin_Leftmenu.jsp" flush="false" /></td>
			<td width="10"></td>
			<td align="left" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<form method="post" name="writeForm">
						<input type="hidden" name="num" value="${vo.num }" />
						<table width="750" border="0" cellpadding="0" cellspacing="0"
							align="center">
							<tr>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0"
										align="center">
										<tr>
											<td width="250"></td>
											<td width="*" class="subTitle" align="center"><font
												color="${ subTitle }">공 지 사 항</font></td>
											<td width="250" align="right" valign="bottom"><input
												type="button" value="전체목록"
												onclick="window.location='noticePage.do'" /> <input type="button"
												value="글쓰기" onclick="window.location='writeForm.do'" /></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td height="10"></td>
							</tr>
							<tr>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="0"
										align="center">
										<tr>
											<td colspan="4" height="3" bgcolor="${ spline_3px }"></td>
										</tr>
										<tr>
											<td width="10" height="30"></td>
											<td width="*" align="left"><b>${
													vo.subject }</b></td>
											<td width="350" align="right">작성일 : <fmt:formatDate value="${vo.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm" /></td>
											<td width="10"></td>
										</tr>
										<tr>
											<td colspan="4" height="1" bgcolor="${ spline_1px }"></td>
										</tr>
										<tr>
											<td height="30"></td>
											<td align="left">작성자 : ${ vo.writer }&nbsp;<a
												href="mailto:${ vo.email }"><img
													src="../subak_images/sub/board/email.gif" border="0"
													height="10" /></a></td>
											<td align="right">조회수 : ${ vo.readcount }</td>
											<td></td>
										</tr>
										<tr>
											<td colspan="4" height="1" bgcolor="${ spline_1px }"></td>
										</tr>
										<tr>
											<td colspan="4" height="10"></td>
										</tr>
										<tr>
											<td></td>
											<td colspan="2" align="left" valign="top" height="100"><pre>${vo.content }</pre></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="4" height="10"></td>
										</tr>
										<tr>
											<td colspan="4" height="3" bgcolor="${ spline_3px }"></td>
										</tr>
										<tr>
											<td colspan="4" height="10"></td>
										</tr>
										<tr>
											<td></td>
											<td colspan="2" align="right"><input type="button"
												value="글수정"
												onclick="window.location='updateForm.do?num=${vo.num }'" />
												<input type="button" value="글삭제"
												onclick="window.location='deleteForm.do?num=${vo.num }'" />
											</td>
											<td></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</form>
				</table>
			</td>
		</tr>
	</table>


</body>
</html>