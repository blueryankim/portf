<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<style type="text/css">
		#diva {
			height:2500px;
		}
		#scrollBtn1,#scrollBtn2 {
			cursor:pointer;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){

			$("#scrollBtn1").click(function(){
				//divb의 top의 위치 값으로 이동
				var pos=$("#divb").position().top;
				$("html, body").animate({scrollTop:pos},'slow');
			});

			$("#scrollBtn2").click(function(){
				$("html, body").animate({scrollTop:0},'slow');
			});
		});
	</script>
</head>
<body>
	<div id="diva"> 
		맨위
		<p id="scrollBtn1">[맨아래로 이동]</p>
	</div>
	<div id="divb">
		맨 아래 
		<p id="scrollBtn2">[맨위로 이동]</p>
	</div>
</body>
</html>