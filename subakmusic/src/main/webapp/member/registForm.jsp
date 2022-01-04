<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>수박뮤직</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/insertMember.js"></script>
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
			
				<form method="post" name="registForm" action="registForm.do" enctype="multipart.form-data">
					<table width="800" align="center" border="0" cellpadding="0" cellspacing="0">
						<tr><td class="subTitle">회원가입</td></tr>
						<tr>
							<td align="right" height="30">
								<font color="red">*</font> 필수입력
							</td>
						</tr>
						<tr bgcolor="#C2C2C2"><td height="3"></td></tr>
						<tr>
							<td>
								
								<table width="780" align="center" border="0" cellpadding="0" cellspacing="0">
									<tr><td colspan="3" height="30"><b>기본 입력 사항</b></td></tr>
									<tr>
										<td width="95" align="left" height="30"><font color="red">*</font> ID</td>
										<td width="15"></td>
										<td width="*">
											<input type="text" name="id" value="${ id }" readonly="readonly" onclick="idCheck()" />
											<input type="button" value="ID찾기" onclick="idCheck()" />
										</td>
									</tr>
									<tr>
										<td align="left" height="30"><font color="red">*</font> 이름</td>
										<td></td>
										<td><input type="text" name="name" value="${ name }" /></td>
									</tr>
									<tr>
										<td align="left" height="30"><font color="red">*</font> 비밀번호</td>
										<td></td>
										<td><input type="password" name="pass" value="${ pass }" /></td>
									</tr>
									<tr>
										<td align="left" height="30"><font color="red">*</font> 비밀번호확인</td>
										<td></td>
										<td><input type="password" name="repass" value="${ repass }" /></td>
									</tr>
									<tr>
										<td align="left" height="30"><font color="red">*</font> 휴대번호</td>
										<td></td>
										<td>
											<select name="phone1">
												<option value="번호 선택">번호선택</option>
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select> -
											<input type="text" name="phone2" style="width:30px;" /> -
											<input type="text" name="phone3" style="width:30px;" />
										</td>
									</tr>
									<tr>
										<td align="left" height="30"><font color="red">*</font> 이메일주소</td>
										<td></td>
										<td><input type="text" name="email"/></td>
									</tr>
									<tr>
										<td align="left" height="30"><font color="red">*</font> 생년월일</td>
										<td></td>
										<td>
											<select name="birth1" id="birth1">
												<option value="선택">선택</option>
												<c:forEach var="year" begin="1900" end="1998">
													<option value="${ year }">${ year }년</option>
												</c:forEach>
											</select>
											<select name="birth2" id="birth2">
												<option value="월">월</option>
												<c:forEach var="month" begin="1" end="12">
													<c:if test="${ month<10 }"><option value="0${ month }">${ month }월</option></c:if>
													<c:if test="${ month>9 }"><option value="${ month }">${ month }월</option></c:if>
												</c:forEach>
											</select>			
											<select name="birth3" id="birth3">
												<option value="일">일</option>
												<c:forEach var="day" begin="1" end="31">
													<c:if test="${ day<10 }"><option value="0${ day }">${ day }일</option></c:if>
													<c:if test="${ day>9 }"><option value="${ day }">${ day }일</option></c:if>
												</c:forEach>
											</select>	
										</td>	
									</tr>
									
									<tr><td colspan="3" height="10"></td></tr>
									
									<tr><td colspan="3" height="30"><b>선택 입력 사항</b></td></tr>
									<tr>
										<td align="left" height="30">선호하는 가수</td>
										<td></td>
										<td width="*">
											<input type="hidden" name="f_singer" />
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
										<td>
											<input type="hidden" name="f_genre" />
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
												<label for="fgenre_c8" >기타</label>
										</td>				
									</tr>
									<tr><td colspan="3" height="5"></td></tr>
									<tr>
										<td colspan="3" height="30" align="center">
											<input type="button" value="가입" onclick="inputCheck()" />
											<input type="button" value="취소" onclick="javascript:history.go(-1)" />
										</td>
									</tr>
								</table>
								
							</td>
						</tr>
						<tr bgcolor="#C2C2C2"><td height="3"></td></tr>
					</table>
				</form>
			
			</td>
		</tr>
		
		<!-- 푸터 / 카피라이트 -->
		<tr><td height="50"></td></tr>
		<tr><td align="center"><jsp:include page="../include/footer.jsp" /></td></tr>
	
	</table>

</body>
</html>