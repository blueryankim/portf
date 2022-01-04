<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitionmp.dtd">
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
								<tr><td class="subTitle">&nbsp;&nbsp;&nbsp;내가 만든 앨범</td></tr>
								<tr>
									<td>
										<table width="700" align="center" border="0" cellpadding="0" cellspacing="0">
											<tr><td colspan="5" align="right" height="30">내가 만든 앨범 : 총 <b>${ count }</b> 개</td></tr>
											<tr bgcolor="#C2C2C2"><td colspan="5" height="3"></td></tr>
											<!-- 내역이 없을 경우 -->
											<c:if test="${ count == 0 }">
												<tr><td align="center" height="60">- 회원님이 만든 앨범의 내역이 없습니다 -</td></tr>
											</c:if>
											
											<!-- 내역이 있을 경우 -->
											<c:if test="${ count != 0 }">
												<c:forEach var="mp" items="${ albumList }">
													<tr>
														<td>
															<table width="400" align="center" border="0" cellpadding="5" cellspacing="0">
																<tr>
																	<td>
																		<table width="100%" align="center" border="0" cellpadding="5" cellspacing="0">
																			<tr>
																				<td rowspan="4" width="125" align="left">
																					<a href="#"><img src="../uploadshareimage${ mp.a_imagepath }/${ mp.a_num }.jpg" border="2" style="border-style:solid; border-color:silver; width:120px; height:120px;" /></a>
																				</td>
																				<td width="65" align="right"><b>제목 :</b></td>
																				<td width="*"><a href="#">${ mp.a_subject }</a></td>
																			</tr>
																			<tr>
																				<td align="right"><b>등록일 :</b></td>
																				<td><fmt:formatDate value="${ mp.a_regdate }" type="DATE" pattern="yyyy-MM-dd HH:mm:ss" /></td>
																			</tr>
																			<tr>
																				<td align="right"><b>조회수 :</b></td>
																				<td>${ mp.a_readcount }</td>
																			</tr>
																			<tr>
																				<td align="right"><b>추천수 :</b></td>
																				<td>${ mp.a_recom }</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr height="1" bgcolor="#E0E0E0"><td></td></tr>
												</c:forEach>
											</c:if>
											<tr height="2" bgcolor="#E0E0E0"><td></td></tr>
										
										</table>
									</td>	
								</tr>
								
								<!-- 페이징 -->
								<tr height="30">
									<td colspan="3" align="center">
										<c:if test="${ mpp.isPre() }">
											<a href="mpMyAlbumList.do?pageNum=${ mpp.getPage_Start() - mpp.p_size }">[이전]</a>
										</c:if>
										<c:forEach var="counter" begin="${ mpp.getPage_Start() }" end="${ mpp.getPage_End() }">
											<a href="javascript:window.location='mpMyAlbumList.do?pageNum=${ counter }'">&nbsp;${ counter }&nbsp;</a>
										</c:forEach>
										<c:if test="${ mpp.isNext() }">
											<a href="mpMyAlbumList.do?pageNum=${ mpp.getPage_Start() + mpp.p_size }">[다음]</a>
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
						<td fstyle="subpt">내가 만든 앨범</td>
					</tr>
					<tr>
						<td>
							<table width="750" align="center" border="0" cellpadding="0" cellspacing="0">
								<tr height="30">
									<td colspan="3" align="right">내가 만든 앨범 : 총 <b>${ count }</b> 개</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width="750" align="center" border="0" cellpadding="0" cellspacing="0">
								<tr height="3" bgcolor="#C2C2C2"><td></td></tr>
								<!-- 내역이 없을 경우 -->
								<c:if test="${ count == 0 }">
									<tr height="60">
										<td align="center">- 회원님이 만든 앨범의 내역이 없습니다 -</td>
									</tr>
								</c:if>
								
								<!-- 내역이 있을 경우 -->
								<c:if test="${ count != 0 }">
									<c:forEach var="mp" items="${ albumList }">
										<tr>
											<td>
												<table width="400" align="center" border="0" cellpadding="5" cellspacing="0">
													<tr>
														<td>
															<table width="100%" align="center" border="0" cellpadding="5" cellspacing="0">
																<tr>
																	<td rowspan="4" width="125" align="left">
																		<c:if test="${ mp.a_image == null }"><a href="#"><img src="/Main/albumImg/noimage.jpg" border="2" style="border-style:solid; border-color:silver; width:120px; height:120px;" /></a></c:if>
																		<c:if test="${ mp.a_image != null }"><a href="#"><img src="${ mp.a_image }" border="2" style="border-style:solid; border-color:silver; width:120px; height:120px;" /></a></c:if>
																	</td>
																	<td width="65" align="right"><b>제목 :</b></td>
																	<td width="*"><a href="#">${ mp.a_subject }</a></td>
																</tr>
																<tr>
																	<td align="right"><b>등록일 :</b></td>
																	<td>${ mp.a_regdate }</td>
																</tr>
																<tr>
																	<td align="right"><b>조회수 :</b></td>
																	<td>${ mp.a_readcount }</td>
																</tr>
																<tr>
																	<td align="right"><b>추천수 :</b></td>
																	<td>${ mp.a_recom }</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
										<tr height="1" bgcolor="#E0E0E0"><td></td></tr>
									</c:forEach>
								</c:if>
								<tr height="2" bgcolor="#E0E0E0"><td></td></tr>
							
							</table>
						</td>	
					</tr>
					
					<!-- 페이징 -->
					<tr height="30">
						<td colspan="3" align="center">
							<c:if test="${ mpp.isPre() }">
								<a href="mpMyAlbumList.do?pageNum=${ mpp.getPage_Start() - mpp.p_size }">[이전]</a>
							</c:if>
							<c:forEach var="counter" begin="${ mpp.getPage_Start() }" end="${ mpp.getPage_End() }">
								<a href="javascript:window.location='mpMyAlbumList.do?pageNum=${ counter }'">&nbsp;${ counter }&nbsp;</a>
							</c:forEach>
							<c:if test="${ mpp.isNext() }">
								<a href="mpMyAlbumList.do?pageNum=${ mpp.getPage_Start() + mpp.p_size }">[다음]</a>
							</c:if>
						</td>
					</tr>
					
				</table>
			</td>
		</tr>
	</table> --%>
	
</body>
</html>