<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>수박뮤직</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	setTimeout("move()",3000);
	function move(){
		location.href="/Main/home/home.do";
	}
	</script>
</head>
<body>

	<table width="1000" align="center" border="0" cellpadding="0" cellspacing="0">
	
		<!-- 헤더 -->
		<tr><td><jsp:include page="../include/header_blank.jsp" /></td></tr>
		
		<!-- 메인 네비게이션 -->
		<tr><td><jsp:include page="../include/navigation.jsp" /></td></tr>
		
		<tr><td height="20"></td></tr>
		<tr>
			<td>
			
				<table width="700" align="center" border="0" cellpadding="0" cellspacing="0">
					<tr><td height="30"></td></tr>
					<tr>
						<td height="300" style="background:url('../subak_images/error/warning_bg.gif');">
							<table align="center" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td width="60"><img src="../subak_images/error/warning_icon.gif" border="0" /></td>
									<td width="15"></td>
									<td align="center">로그인 후 사용하실 수 있는 페이지 입니다. 로그인 후 이용해 주십시오.<br/><br/>3초 뒤 홈페이지로 이동합니다.</td>
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