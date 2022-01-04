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
	<script type="text/javascript">
	function passCheck(value) {
		if (value == "successDelete") {
			alert("글이 삭제되었습니다.");
			window.location = "list.do";
		}
		if (value == "passerror") {
			alert("비밀번호가 틀렸습니다.");
		}
	}
	window.onload = passCheck("${value}");
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
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<!-- 푸터 / 카피라이트 -->
		<tr><td height="50"></td></tr>
		<tr><td align="center"><jsp:include page="../include/footer.jsp" /></td></tr>
		
	</table>
	
</body>
</html>