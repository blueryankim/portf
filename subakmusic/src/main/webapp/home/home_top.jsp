<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript" src="../js/home.js"></script>
<script type="text/javascript">
function openNewFrame(){
	window.open('/Main/pointaccumulation/pointaccumulation.jsp','','width=300, height=150, scrollbars=no, menubar=no, location=no, resizable=no');
}
</script>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td height="10"></td></tr>
	<tr>
		<td align="center">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="300" height="80"></td>
					<td width="*" align="center"><a href="/Main/home/home.do"><img src="../subak_images/subak_logo.gif" border="0" /></a></td>
					<td width="300" align="center" valign="bottom">
						<!-- 로그인 전 -->
						<c:if test="${ empty sessionScope }">
							<form action="/Main/home/login.do" name="loginForm" method="post" onsubmit="return false;">
								<table border="0" cellpadding="0" cellspacing="0">
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
									<tr><td colspan="4" height="5"></td></tr>
									<tr>
										<td colspan="5" align="center"><a href="/Main/member/registForm.do">회원가입</a> / <a href="/Main/help/idView.do">ID,PWD 찾기</a></td>
									</tr>
								</table>
							</form>
						</c:if>
						<!-- 로그인 후 -->
						<c:if test="${not empty sessionScope and sessionScope.id != null }">
							<table border="0" cellpadding="0" cellspacing="0" align="right">
								<tr><td align="right"><b>${sessionScope.id}</b> 회원님 환영합니다.</td></tr>
								<tr><td height="5"></td></tr>
								<tr><td align="right">point: ${sessionScope.point}&nbsp;(<a href="#" onclick="openNewFrame()">포인트충전</a>) / <a href="/Main/myPage/myPageHome.do">내정보</a> / <a href="/Main/home/logout.do">로그아웃</a></td></tr>
								<tr><td height="5"></td></tr>
							</table>
						</c:if>
	
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td height="10"></td></tr>
</table>