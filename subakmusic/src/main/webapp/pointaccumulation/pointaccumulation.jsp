<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String id = (String) session.getAttribute("id"); %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 충전</title>
<link href="../css/style_nobg.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function pointAccum(point){
	if(confirm(point+"포인트를 \n충전하시겠습니까?")){
		var id=document.getElementById("id").value;
		window.location="pointaccumulation.do?id="+id+"&point="+point;
	}
	return false;
}
</script>

</head>
<body>
	<table width="300" align="center" border="0" cellpadding="0" cellspacing="0">
		<tr><td height="10"></td></tr>
		<tr><td class="subPoint" align="center">포인트 충전<input type="hidden" value="<%=id%>" id="id"></td></tr>
		<tr><td height="10"></td></tr>
		<tr>
			<td align="center" height="50">
				<input type="button" value="1000" onclick="pointAccum(1000)"/>&nbsp;&nbsp;&nbsp;
				<input type="button" value="5000" onclick="pointAccum(5000)"/>&nbsp;&nbsp;&nbsp;
				<input type="button" value="10000" onclick="pointAccum(10000)"/>
			</td>
		</tr>
		<tr><td height="10"></td></tr>
		<tr><td align="center"><input type="button" value="닫기" onclick="self.close();"/></td></tr>
	</table>
</body>
</html>
