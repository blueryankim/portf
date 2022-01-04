<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>ID 찾기</title>
	<link href="../css/style_nobg.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	function sendId(id) {
		opener.document.registForm.id.value = id;
		opener.document.registForm.name.focus();
		self.close();
	}
	function idSearch(){
		if(document.idCheck.id.value==""){
			alert("ID를 입력하십시오.");
			document.idCheck.id.focus();
			return;
		}
		document.idCheck.submit();
	}
	</script>
</head>
<body>

<form method="post" name="idCheck" action="idCheck.do">
	<table width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
		<tr><td height="10"></td></tr>
		<tr>
			<td align="center">
				<b>ID 찾기</b>
			</td>
		</tr>
		<tr><td height="10"></td></tr>
		<tr>
			<td align="center">
				<input type="text" name="id" />
				<input type="button" value="검색" onclick="idSearch()"/>
			</td>
		</tr>
		<tr><td height="10"></td></tr>
		<c:if test="${value eq 'nono' }">
			<tr align="center">
				<td align="center">
					<font color="red">사용중인 아이디입니다.</font>
				</td>
			</tr>
		</c:if>
		<c:if test="${value eq 'ok' }">
			<tr>
				<td align="center">
					<font color="blue">※ 사용가능한 아이디입니다.<br/>아래 아이디를 클릭하면 자동으로 입력됩니다.</font>
				</td>
			</tr>
			<tr>
				<td align="center">
					[ <a href="javascript:sendId('${id }')">${id}</a> ]
				</td>
			</tr>
		</c:if>
		<tr><td height="10"></td></tr>
		<tr>
			<td align="center">
				<input type="button" value="닫기" onclick="javascript:self.close();" />
			</td>
		</tr>
	</table>
</form>
	
</body>
</html>