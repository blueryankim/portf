<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<tr><td><jsp:include page="../include/header_blank.jsp" /></td></tr>
		
		<!-- 메인 네비게이션 -->
		<tr><td><jsp:include page="../include/navigation.jsp" /></td></tr>
		
		<tr><td height="50"></td></tr>
		<tr>
			<td>
			
				<table width="400" align="center" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<table width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td width="200" align="center" class="subPoint"><a href="/Main/help/idView.do"><font color="#888888">아이디찾기</font></a></td>
									<td width="200" align="center" class="subPoint"><a href="/Main/help/passView.do"><font color="#045205">비밀번호찾기</font></a></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr><td height="5"></td></tr>
					<tr>
						<td style="background:url('../subak_images/error/loginerror_boxbg.gif');" height="250">
							
							<form action="getPass.do" name="passFindForm" method="post">
								<table align="center" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="50" align="right">아이디</td>
										<td width="10"></td>
										<td><input type="text" name="id" value="${id}" style="width:150px;" /></td>
										<td rowspan="5" width="10"></td>
										<td rowspan="5"><input type="submit" value="찾기" style="height:50px;width:50px;text-align:center;" /></td>
									</tr>
									<tr><td colspan="3" height="5"></td></tr>
									<tr>
										<td align="right">이름</td>
										<td></td>
										<td><input type="text" name="name" value="${name}" style="width:150px;" /></td>
									</tr>
									<tr><td colspan="3" height="5"></td></tr>
									<tr>
										<td align="right">이메일</td>
										<td></td>
										<td><input type="text" name="email" value="${email}" style="width:150px;" /></td>
									</tr>
									<tr><td colspan="3" height="10"></td></tr>
									<tr height="50">
										<c:if test="${not empty PassError}">
											<td colspan="5" valign="top" align="center"><font color="red" style="font-weight:bold;">${PassError}</font></td>
										</c:if>
										<c:if test="${not empty pass}">
											<td colspan="5" valign="top" align="center"><font color="blue">당신이 찾는 비밀번호는 <b>${pass}</b> 입니다.</font><br/>
											<a href="/Main/home/home.do">[홈으로 가기]</a></td>
										</c:if>
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










	<%-- <div id="main">
		<div id="logo"></div>
		<div id="findMenu">
			<table>
				<tr>
					<td>&nbsp;&nbsp;</td>
					<td><a href="/Main/help/idView.do">ID찾기</a></td>
					<td>&nbsp;&nbsp;</td>
					<td><a href="/Main/help/passView.do">비밀번호 재발급</a></td>
				</tr>
			</table>
		</div>
		<div id="passFind">
			<form action="getPass.do" name="passFindForm" method="post">
				<table>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td colspan="4"><font color="red" size="4">비밀번호 재발급</font></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td><font color="black" size="4">ID</font></td>
						<td><input type="text" size="11" name="id" value="${id}"></input></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td><font color="black" size="4">이름</font></td>
						<td><input type="text" size="11" name="name" value="${name}"></input></td>
						<td rowspan="3"><input type="submit" value="test"></input></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td><font color="black" size="4">E-MAIL</font></td>
						<td><input type="text" size="11" name="email" value="${email}"></input></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<td><a href="/Main/member/registForm.do">회원가입</a></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;</td>
						<c:if test="${not empty PassError}">
						<td colspan="4"><font color="red" size="5">${PassError}</font></td>
						</c:if>
						<c:if test="${not empty pass}">
						<td colspan="4"><font color="blue" size="5">당신이 찾는 비밀번호는 ${pass} 입니다.</font></td>
						</c:if>
					</tr>
				</table>
			</form>
		</div>
	</div> --%>
	
</body>
</html>