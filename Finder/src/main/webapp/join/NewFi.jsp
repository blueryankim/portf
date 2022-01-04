<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>



		
</style>
<script type="text/javascript">



</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Finder 로그인</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="../js/jquery.mobile-1.4.5.min.css"/>
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript" src="../js/jquery.placeholder.js"></script>
</head>
<body>
 <div data-role="page">

  <div id="tabs" data-role="tabs">
  <div data-role="navbar">
    <ul>
      <li><a href="#one" data-ajax="false">one</a></li>
      <li><a href="#two" data-ajax="false">two</a></li>
      <li><a href="ajax-content.html" data-ajax="false">three</a></li>
    </ul>
  </div>
  <div class="ui-body-d ui-content" id="one">
    <h1>First tab contents</h1>
  </div>
  <div id="two">
    <ul data-role="listview" data-inset="true">
        <li><a href="#">Acura</a></li>
        <li><a href="#">Audi</a></li>
        <li><a href="#">BMW</a></li>
        <li><a href="#">Cadillac</a></li>
        <li><a href="#">Ferrari</a></li>
    </ul>
  </div>
  </div>
</div>

</body>
</html>