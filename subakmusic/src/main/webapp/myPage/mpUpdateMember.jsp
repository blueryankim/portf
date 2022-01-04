<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>myPage</title>
	<script type="text/javascript" src="../js/rollover.js"></script>
	<script type="text/javascript" src="../js/updateMember.js"></script>
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
								<tr><td class="subTitle">&nbsp;&nbsp;&nbsp;정보수정</td></tr>
								<tr>
									<td>
										
										<form method="post" name="updateForm" action="mpUpdateMember.do?userID=${vo.id}">
											<input type="hidden" name="birth1" value="${ vo.birth1 }" />
											<input type="hidden" name="birth2" value="${ vo.birth2 }" />
											<input type="hidden" name="birth3" value="${ vo.birth3 }" />
											<input type="hidden" name="id" value="${ vo.id }" />
											<input type="hidden" name="name" value="${ vo.name }" />
											<input type="hidden" name="point" value="${ vo.point }" />
											<input type="hidden" name="regdate" value="${ vo.regdate }" />
											
											<table width="700" align="center" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td colspan="3" align="right" height="30">
														<font color="red">*</font> 필수입력
													</td>
												</tr>
												<tr bgcolor="#C2C2C2"><td colspan="3" height="3"></td></tr>
												<tr>
													<td>
													
														<table width="700" align="center" border="0" cellpadding="0" cellspacing="0">
															<tr><td colspan="3" height="30">&nbsp;<b>기본 입력 사항</b></td></tr>
															<tr>
																<td width="95" align="left" height="30"><font color="red">*</font> ID</td>
																<td width="15"></td>
																<td width="*" align="left">${ vo.id }</td>
															</tr>
															<tr>
																<td align="left" height="30"><font color="red">*</font> 이름</td>
																<td></td>
																<td align="left">${ vo.name }</td>
															</tr>
															<tr>
																<td align="left" height="30"><font color="red">*</font> 비밀번호</td>
																<td></td>
																<td align="left"><input type="password" name="pass" /></td>
															</tr>
															<%-- <tr>
																<td align="left" height="30">새로운 비밀번호</td>
																<td></td>
																<td align="left">
																	<input type="password" name="pass" id="newpass" />&nbsp;&nbsp;&nbsp;
																	비밀번호확인&nbsp;<input type="password" name="pass" id="newrepass" />
																</td>
															</tr> --%>
															<tr>
																<td align="left" height="30"><font color="red">*</font> 휴대번호</td>
																<td></td>
																<td align="left">
																	<input type="text" name="phone1" value="${ vo.phone1 }" style="width:30px;" /> -
																	<input type="text" name="phone2" value="${ vo.phone2 }" style="width:30px;" /> -
																	<input type="text" name="phone3" value="${ vo.phone3 }" style="width:30px;" />
																</td>
															</tr>
															<tr>
																<td align="left" height="30"><font color="red">*</font> 이메일주소</td>
																<td></td>
																<td align="left"><input type="text" name="email" value="${ vo.email }" /></td>
															</tr>
															<tr>
																<td align="left" height="30"><font color="red">*</font> 생년월일</td>
																<td></td>
																<td align="left">${ vo.birth1 }년 ${ vo.birth2 }월 ${ vo.birth3 }일</td>
															</tr>
															<tr><td colspan="3" height="10"></td></tr>
															<tr><td colspan="3" height="30"><b>선택 입력 사항</b></td></tr>
															<tr>
																<td align="left" height="30">선호하는 가수</td>
																<td></td>
																<td align="left">
																	<input type="hidden" name="f_singer" value="${ vo.f_singer }" />
																	<input type="text" name="f_singer1" size="10" value="${ f_singer1 }" /> ,
																	<input type="text" name="f_singer2" size="10" value="${ f_singer2 }" /> ,
																	<input type="text" name="f_singer3" size="10" value="${ f_singer3 }" /> ,
																	<input type="text" name="f_singer4" size="10" value="${ f_singer4 }" /> ,
																	<input type="text" name="f_singer5" size="10" value="${ f_singer5 }" />
																</td>
															</tr>
															<tr>
																<td align="left" height="30">선호하는 장르</td>
																<td></td>
																<td align="left">
																	<input type="hidden" name="f_genre" value="${ vo.f_genre }" />
																	<input type="checkbox" name="fgenre_c" id="fgenre_c1" value="발라드" ${ f_genre1 } />
																		<label for="fgenre_c1" >발라드</label>&nbsp;
																	<input type="checkbox" name="fgenre_c" id="fgenre_c2" value="댄스" ${ f_genre2 } />
																		<label for="fgenre_c2" >댄스</label>&nbsp;
																	<input type="checkbox" name="fgenre_c" id="fgenre_c3" value="랩/힙합" ${ f_genre3 } />
																		<label for="fgenre_c3" >랩/힙합</label>&nbsp;
																	<input type="checkbox" name="fgenre_c" id="fgenre_c4" value="R&B/소울" ${ f_genre4 } />
																		<label for="fgenre_c4" >R&B/소울</label>&nbsp;
																	<input type="checkbox" name="fgenre_c" id="fgenre_c5" value="락" ${ f_genre5 } />
																		<label for="fgenre_c5" >락</label>&nbsp;
																	<input type="checkbox" name="fgenre_c" id="fgenre_c6" value="팝" ${ f_genre6 } />
																		<label for="fgenre_c6" >팝</label>&nbsp;
																	<input type="checkbox" name="fgenre_c" id="fgenre_c7" value="트로트" ${ f_genre7 } />
																		<label for="fgenre_c7" >트로트</label>&nbsp;
																	<input type="checkbox" name="fgenre_c" id="fgenre_c8" value="기타" ${ f_genre8 } />
																		<label for="fgenre_c8" >기타</label>&nbsp;
																</td>
															</tr>
															<tr><td colspan="3" height="5"></td></tr>
															<tr>
																<td colspan="3" height="40" align="right">
																	<input type="button" value="정보수정" onclick="writeCheck()" />
																	<input type="button" value="취소" onclick="window.location='myPageHome.do'" />
																</td>
															</tr>
														</table>
														
													</td>
												</tr>
												<tr bgcolor="#C2C2C2"><td colspan="3" height="3"></td></tr>
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
						<td><b>정보수정</b></td>
					</tr>
					<tr>
						<td>
							
						</td>	
					</tr>
				</table>
			</td>
		</tr>
	</table> --%>

</body>
</html>