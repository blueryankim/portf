<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 충전</title>
<script type="text/javascript">

window.onload=pointAccumulation;
	
	function pointAccumulation(){
	var point=document.getElementById("point").value;
	alert(point+"포인트를 \n충전하였습니다.");

	opener.history.go(0);
	self.close();
}

</script>
</head>
<body>
<input type="hidden" id="point" value="${point}"/>
</body>
</html>
