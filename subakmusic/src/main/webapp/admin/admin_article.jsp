<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>articlePage</title>
	<link href="../css/style_nobg.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function deleteArticle(num){
	window.location='deleteArticle.do?num='+num;
}
</script>
</head>
<body>

	<table width="1000" align="center" border="0" cellpadding="0" cellspacing="0">
		<tr><td colspan="3"><hr /></td></tr>
		<tr>
			<td width="150" align="left" valign="top">
				<jsp:include page="admin_Leftmenu.jsp" flush="false" />
			</td>
			<td width="10"></td>
			<td align="left" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<table width="750" align="center" border="0" cellpadding="0"
							cellspacing="0">
							<tr>
								<td align="center" width="60">글번호</td>
								<td align="center" width="150">제목</td>
								<td align="center" width="150">이름</td>
								<td align="center" width="330">경고수</td>
								<td align="center">삭제</td>
							</tr>
							<c:if test="${count==0}">
								<tr>
									<td colspan="6" align="center">게시글이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${count != 0}">
								<c:forEach var="vo" items="${articleList}">
									<tr>
										<td align="center">${vo.num}</td>
										<td align="center">${vo.subject}</td>
										<td align="center">${vo.writer}</td>
										<td align="center">${vo.report}</td>
										<td align="center"><input type="button" value="삭제" onclick="deleteArticle('${vo.num}')"></input></td>
									</tr>
								</c:forEach>
							</c:if>
						</table> <br />
						<center>
						<c:if test="${fp.isPre()}">
							<a href="articleAdminPage.do?pageNum=${fp.getPage_Start()-fp.p_size}">[이전]</a>
						</c:if>
						<c:forEach var="counter" begin="${fp.getPage_Start()}" end="${fp.getPage_End()}">
							<a href="javascript:window.location='articleAdminPage.do?pageNum=${counter}'">[${counter}]</a>
						</c:forEach>
						<c:if test="${fp.isNext()}">
							<a href="articleAdminPage.do?pageNum=${fp.getPage_Start()+fp.p_size}">[다음]</a>
						</c:if>
						</center>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
</body>
</html>