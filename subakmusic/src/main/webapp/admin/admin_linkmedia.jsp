<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>musicPage</title>
<link href="../css/style_nobg.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<table width="1000" align="center" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td colspan="3"><hr /></td>
		</tr>
		<tr>
			<td width="150" align="left" valign="top"><jsp:include page="admin_Leftmenu.jsp" flush="false" /></td>
			<td width="10"></td>
			<td align="left" valign="top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<table width="750" align="center" border="1" cellpadding="10"
								cellspacing="15"
								style="border-color: #DDDDDD; border-style: none;">
								<jsp:include page="../uploadlink/uploadlink.jsp" />
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

</body>
</html>