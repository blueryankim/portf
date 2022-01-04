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
<script type="text/javascript">
	function passCheck(value) {
		if (value == "successDelete") {
			alert("글이 삭제되었습니다.");
			window.location = "noticePage.do";
		}
		if (value == "passerror") {
			alert("비밀번호가 틀렸습니다.");
		}
	}
	window.onload = passCheck("${value}");
	</script>
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
						<table width="750" border="0" cellpadding="0" cellspacing="0" align="center">
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
										<table width="400" border="0" cellpadding="0" cellspacing="0" align="center">
											<tr>
												<td height="250" style="background:url('../subak_images/sub/board/boxbg.gif');">
													<form method="post" action="deleteForm.do?num=${num }">
														<table border="0" cellpadding="0" cellspacing="0" align="center">
															<tr><td align="center">글을 삭제하시려면 비밀번호를 입력해주세요.<p/></td></tr>
															<tr>
																<td align="center">
																	<input type="password" name="pass" value="${pass}" />
																	<input type="submit" value="글삭제" />
																	<input type="button" value="취소" onclick="javascript:history.back(-1)" />
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
				</table>
			</td>
		</tr>
	</table>


</body>
</html>