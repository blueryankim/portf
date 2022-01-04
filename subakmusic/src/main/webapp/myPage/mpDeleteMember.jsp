<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="../color.jspf" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>myPage</title>
	<script type="text/javascript" src="../js/rollover.js"></script>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	function passCheck(value) {
		if(value == "successDelete") {
			alert("성공적으로 탈퇴되었습니다.");
			window.location = "/Main/home/logout.do";
		}
		else if(value == "passError") {
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
		
		
		<tr><td height="10"></td></tr>
		
		<tr>
			<td>
				<table width="940" border="0" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<!-- 마이페이지 서브메뉴 -->
						<td width="150" valign="top"><jsp:include page="../include/mypage_submenu.jsp" /></td>
						<td width="10"></td>
						<td width="*" valign="top" height="50">
							
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr><td height="10"></td></tr>
								<tr><td class="subTitle">&nbsp;&nbsp;&nbsp;회원탈퇴</td></tr>
								<tr>
									<td>
										<form method="post" name="deleteForm" action="mpDeleteMember.do?userID=${ userID }">
											<table width="700" align="center" border="0" cellpadding="0" cellspacing="0">
												<tr><td height="30"></td></tr>
												<tr bgcolor="#C2C2C2"><td height="3"></td></tr>
												<tr><td height="100" align="center"><b>비밀번호입력</b>&nbsp;<input type="password" name="pass" />&nbsp;<input type="submit" value="확인" /></td></tr>
												<tr bgcolor="#C2C2C2"><td height="3"></td></tr>
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
		<tr><td height="20"></td></tr>
		
		<tr><td align="center"><jsp:include page="../include/footer.jsp" /></td></tr>
		
	</table>

	<%-- <table width="1000" align="center" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="3"><jsp:include page="/home/home_top.jsp" flush="false" /></td>
		</tr>
		<tr><td colspan="3"><hr /></td></tr>
		<tr>
			<td width="150" align="left" valign="top">
				<jsp:include page="mpLeftmenu.jsp" flush="false" />
			</td>
			<td width="10"></td>
			<td align="left" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td fstyle="subpt">회원탈퇴</td>
					</tr>
					<tr><td height="30"></td></tr>
					<tr>
						<td height="70">
							<form method="post" name="deleteForm" action="mpDeleteMember.do?userID=${ userID }">
								<table width="700" align="center" border="0" cellpadding="0" cellspacing="0">
									<tr><th>비밀번호 확인</th></tr>
									<tr>
										<td align="center">
											<input type="password" name="pass" />
											<input type="submit" value="확인" />
										</td>
									</tr>
								</table>
							</form>
						</td>	
					</tr>
				</table>
			</td>
		</tr>
	</table> --%>
	
</body>
</html>