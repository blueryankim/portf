<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<table width="750" border="0" cellpadding="0" cellspacing="0"
						align="center">
							<tr>
									<td>
										<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
											<tr>
												<td width="250"></td>
												<td width="*" class="subTitle" align="center"><font color="${ subTitle }">공 지 사 항</font></td>
												<td width="250" align="right" valign="bottom"></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr><td height="10"></td></tr>
								<tr>
									<td>
									
										<form method="post" name="writeForm" action="updateForm.do?num=${vo.num }">
											<table width="800" border="0" cellpadding="0" cellspacing="0" align="center">
												<tr><td colspan="5" height="3" bgcolor="${ spline_3px }"></td></tr>
												<tr>
													<td width="10" height="30"></td>
													<td width="240">작성자&nbsp;<input type="text" name="writer" value="${ vo.writer }" style="width:190px;" /></td>
													<td width="250">비밀번호&nbsp;<input type="password" name="pass" value="${ vo.pass }" style="width:190px;" /></td>
													<td width="*">이메일&nbsp;<input type="text" name="email" value="${vo.email }" style="width:250px;" /></td>
													<td width="10"></td>
												</tr>
												<tr><td colspan="5" height="1" bgcolor="${ spline_1px }"></td></tr>
												<tr>
													<td height="30"></td>
													<td colspan="3">&nbsp;제&nbsp;목&nbsp;&nbsp;<input type="text" name="subject" value="${vo.subject }" style="width:740px;" /></td>
													<td></td>
												</tr>
												<tr><td colspan="5" height="1" bgcolor="${ spline_1px }"></td></tr>
												<tr><td colspan="5" height="10"></td></tr>
												<tr>
													<td></td>
													<td colspan="3" align="left" valign="top" height="100"><textarea name="content" style="width:780px;height:300px;">${vo.content }</textarea></td>
													<td></td>
												</tr>
												<tr><td colspan="5" height="10"></td></tr>
												<tr><td colspan="5" height="3" bgcolor="${ spline_3px }"></td></tr>
												<tr><td colspan="5" height="10"></td></tr>
												<tr>
													<td colspan="5" align="center">
														<input type="button" value="글수정" onclick="writeCheck()" />
														<input type="button" value="목록보기" onclick="window.location='noticePage.do'" />
													</td>
												</tr>
											</table>
										</form>
										
									</td>
								</tr>
							</table>
					
				</table>
			</td>
		</tr>
	</table>


</body>
</html>