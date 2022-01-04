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
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
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
						<td width="*" valign="top">
							<table align="center" border="0" cellpadding="0" cellspacing="0">
								<tr><td colspan="5" height="30"></td></tr>
								<tr>
									<td align="center" width="200" height="150" style="background-image: url('../subak_images/sub/mypage/mpmain_boxbg.gif');">
										<font class="subPoint"><a href="mpPointList.do">포인트 내역</a></font><br/><br/>${ havingPoint } point
									</td>
									<td width="15"></td>
									<td align="center" width="200" height="150" style="background-image: url('../subak_images/sub/mypage/mpmain_boxbg.gif');">
										<font class="subPoint"><a href="mpDownloadList.do">다운로드 내역</a></font><br/><br/>총 ${ dmcCount } 곡
									</td>
									<td width="15"></td>
									<td align="center" width="200" height="150" style="background-image: url('../subak_images/sub/mypage/mpmain_boxbg.gif');">
										<font class="subPoint"><a href="mpMyAlbumList.do">내가 만든 앨범</a></font><br/><br/>총 ${ macCount } 개
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
	
</body>
</html>