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
	<script type="text/javascript">
	function passCheck(value) {
		if (value == "pass" || value.equals("pass")) {
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
									
										<form method="post" name="writeForm" action="updateForm.do?num=${vo.num }">
											<table width="800" border="0" cellpadding="0" cellspacing="0" align="center">
												<tr><td colspan="5" height="3" bgcolor="${ spline_3px }"></td></tr>
												<tr>
													<td width="10" height="30"></td>
													<td width="240">작성자&nbsp;<input type="text" name="writer" value="${ vo.writer }" style="width:190px;" /></td>
													<td width="250">비밀번호&nbsp;<input type="password" name="pass" value="${ pass }" style="width:190px;" /></td>
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
														<input type="button" value="목록보기" onclick="window.location='list.do'" />
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
	
</body>
</html>