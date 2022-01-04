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
						
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr><td height="10"></td></tr>
								<tr><td class="subTitle">&nbsp;&nbsp;&nbsp;다운로드 내역</td></tr>
								<tr>
									<td>
										<table width="700" align="center" border="0" cellpadding="0" cellspacing="0">
											<tr><td colspan="5" align="right" height="30">다운로드한 음원 : 총 <b>${ count }</b> 곡</td></tr>
											<tr bgcolor="#C2C2C2"><td colspan="5" height="3"></td></tr>
											<tr bgcolor="#E7E7E7">
												<th width="70" height="30"></th>
												<th width="20"></th>
												<th width="*">음원명 - 아티스트명</th>
												<th width="20"></th>
												<th width="150">일시</th>
											</tr>
											
											<!-- 내역이 없을 경우 -->
											<c:if test="${ count == 0 }">
												<tr><td colspan="5" align="center" height="60">- 다운로드한 음원 내역이 없습니다 -</td></tr>
											</c:if>
											
											<!-- 내역이 있을 경우 -->
											<c:if test="${ count != 0 }">
												<c:forEach var="mp" items="${ downloadList }">
													<tr>
														<td align="center" height="30">
															${ number } <c:set var="number" value="${ number - 1 }" scope="page" />
														</td>
														<td></td>
														<td align="center">
															<%-- (${ mp.d_mnum }) --%>${ mp.m_title }&nbsp;-&nbsp;${ mp.m_singer }
														</td>
														<td></td>
														<td align="center">${ mp.d_date }</td>
													</tr>
													<tr bgcolor="#E0E0E0"><td colspan="5" height="1"></td></tr>
												</c:forEach>
											</c:if>
											
											<tr bgcolor="#E0E0E0"><td colspan="5" height="2"></td></tr>
											
										</table>
									</td>
								</tr>
								
								<!-- 페이징 -->
								<tr>
									<td colspan="3" align="center" height="30">
										<c:if test="${ mpp.isPre() }">
											<a href="mpDownloadList.do?pageNum=${ mpp.getPage_Start() - mpp.p_size }">[이전]</a>
										</c:if>
										<c:forEach var="counter" begin="${ mpp.getPage_Start() }" end="${ mpp.getPage_End() }">
											<a href="javascript:window.location='mpDownloadList.do?pageNum=${ counter }'">&nbsp;${ counter }&nbsp;</a>
										</c:forEach>
										<c:if test="${ mpp.isNext() }">
											<a href="mpDownloadList.do?pageNum=${ mpp.getPage_Start() + mpp.p_size }">[다음]</a>
										</c:if>
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