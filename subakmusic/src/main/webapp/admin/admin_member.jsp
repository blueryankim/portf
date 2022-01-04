<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>memberPage</title>
<script type="text/javascript">
function search(){
	var form = document.listForm;
	if(form.search_text.value==null || form.search_text.value==""){
		alert("검색어를 입력해 주세요");
		return;
	}
	var url='memberAdminPage.do?pageNum=1&search_type='+
			form.search_type.value + '&search_text='+
			form.search_text.value;
	window.location=url;
}
function deleteMember(id){
	window.location='deleteMember.do?id='+id;
}

</script>
<link href="../css/style_nobg.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="1000" align="center" border="0" cellpadding="0"
	cellspacing="0">
	<tr>
		<td colspan="3"><hr /></td>
	</tr>
	<tr>
		<td width="150" align="left" valign="top"><jsp:include
				page="admin_Leftmenu.jsp" flush="false" /></td>
		<td width="10"></td>
		<td align="left" valign="top">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<table width="750" align="center" border="0" cellpadding="0"
							cellspacing="0">
							<tr>
								<td align="center" width="60">번호</td>
								<td align="center" width="150">아이디</td>
								<td align="center" width="150">이름</td>
								<td align="center" width="330">가입날짜</td>
								<td align="center">삭제</td>
							</tr>
							<c:if test="${count==0}">
								<tr>
									<td colspan="6" align="center">멤버가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${count != 0}">
								<c:forEach var="vo" items="${memberList}">
									<tr>
										<td align="center">${number}<c:set var="number"
												value="${number-1}" scope="page"></c:set></td>
										<td align="center">${vo.id}</td>
										<td align="center">${vo.name}</td>
										<td align="center">${vo.regdate}</td>
										<td align="center"><input type="button" value="삭제" onclick="deleteMember('${vo.id}')"></input></td>
									</tr>
								</c:forEach>
							</c:if>
						</table> <br />
						<center>
						<c:if test="${mp.isPre()}">
							<a href="memberAdminPage.do?pageNum=${mp.getPage_Start()-mp.p_size}">[이전]</a>
						</c:if>
						<c:forEach var="counter" begin="${mp.getPage_Start()}" end="${mp.getPage_End()}">
							<c:if test="${search_text ne ''}">
							<a href="javascript:window.location='memberAdminPage.do?pageNum=${counter}&search_type=${search_type}&search_text=${search_text}'">[${counter}]</a>
							</c:if>
							
							<c:if test="${search_text eq ''}">
							<a href="javascript:window.location='memberAdminPage.do?pageNum=${counter}'">[${counter}]</a>
							</c:if>
						</c:forEach>
						<c:if test="${mp.isNext()}">
							<a href="memberAdminPage.do?pageNum=${mp.getPage_Start()+mp.p_size}">[다음]</a>
						</c:if>
						<p></p>
						<form method="get" name="listForm" action="memberAdminPage.do">
							<input type="hidden" name="pageNum" value="${pageNum}"/>
							<select name="search_type">
								<option value="id" ${search_type == "id" ? "selected" : "" }>아이디</option>
								<option value="name" ${search_type == "name" ? "selected" : ""}>이름</option>
							</select>
							<input type="text" name="search_text" value="${search_text}"/>
							<input type="button" value="검색" onclick="search()"/>
						</form>
						</center>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</body>
</html>