<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>수박뮤직</title>
	<script type="text/javascript" src="../js/rollover.js"></script>
	<script type="text/javascript" src="../js/home.js"></script>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<table width="1000" align="center" border="0" cellpadding="0" cellspacing="0">
	
		<!-- 헤더 -->
		<tr><td><jsp:include page="../include/header_blank.jsp" /></td></tr>
		
		<!-- 메인 네비게이션 -->
		<tr><td><jsp:include page="../include/navigation.jsp" /></td></tr>
		
		<tr><td height="50"></td></tr>
		<tr>
			<td>
			
				<table width="400" align="center" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td style="background:url('../subak_images/error/loginerror_boxbg.gif');" height="250">
							
							<form action="/Main/home/login.do" name="loginForm" method="post" onsubmit="return false;">
								<table align="center" border="0" cellpadding="0" cellspacing="0">
									<tr><td colspan="5" align="center"><font class="loginForm_error" color="red">${error}</font></td></tr>
									<tr><td colspan="4" height="5"></td></tr>
									<tr>
										<td width="50" align="right">아이디</td>
										<td width="5"></td>
										<td><input type="text" name="id" style="width:130px;" /></td>
										<td width="5"></td>
										<td width="55" rowspan="3"><input type="button" value="로그인" onclick="idCheck()" style="height:50px;" /></td>
									</tr>
									<tr><td colspan="4" height="5"></td></tr>
									<tr>
										<td align="right">비밀번호</td>
										<td></td>
										<td><input type="password" name="pass" style="width:130px;" /></td>
										<td></td>
									</tr>
									<tr><td colspan="5" height="5"></td></tr>
									<tr>
										<td colspan="5" align="center"><a href="/Main/member/registForm.do">회원가입</a> / <a href="/Main/help/idView.do">ID,PWD 찾기</a></td>
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
	
</body>
</html>