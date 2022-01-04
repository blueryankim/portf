<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
* {
	margin: 0px;
	padding: 0px;
}

#headerdiv {
	width: 100%;
	height: 50px;
	background: #4086cd;
	color: white;
	position: relative;
}

#logo {
	position:absolute;
	left:10px;
	line-height: 50px;
}


#requestfriend{
	position:absolute;
	left:125px;
	bottom:10px;
	
}

#notification{
	position:absolute;
	left:160px;
	bottom:10px;

}

#findfriend {
	width: 350px;
	height: 20px;
	position: absolute;
	left: 230px;
	bottom: 13px;
}

#friendsearch {
	position: absolute;
	background: #4086cd;
	border: 0px;
	color: white;
	left: 590px;
	bottom: 16px;
}

DIV#list_item_container {
	height: 60px;
	padding: 5px;
}

DIV#image {
	width: 70px;
	height: 60px;
	float: left;
}

DIV#description {
	font-style: italic;
	font-size: 0.8em;
	color: gray;
}

#profileimg{
	width: 70px;
	height: 60px;
}
</style>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script type="text/javascript">
	$(document).ready(
			function() {

						$("#findfriend").autocomplete(
						{	
						 minLength : 1,
					     delay : 100,
						 contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						 source : function(request, response) {

						 $.getJSON("/circle/autocomplete/autocomplete.do",request,function(result) {
							//$.map 잘외워두기
						 response($.map(result.autocompletelist,function(item) {

						return {

							 name:item.name,
							 university:item.university,
							 profileimg:item.profileimg
							};

						    }));
							});
						    },

							}).data("ui-autocomplete")._renderItem = function(ul, item) {
							
							var inner_html = '<a><div id="list_item_container"><div id="image"><img id="profileimg" src="' + item.profileimg + '.jpg"></div><div id="label">'
									+ item.name
									+ '</div><div id="description">'
									+ item.university + '</div></div></a>';
							return $("<li></li>").data("item.autocomplete",item).append(inner_html).appendTo(ul);
						};
					});
</script>


<div id="headerdiv">
	<h1 id="logo">Circle</h1>
	<img id="requestfriend" src="image/friend.png">
	<img id="notification" src="image/notification.png">
	<input id="findfriend" size="20" placeholder="친구의 이름을 입력해주세요.">
	<input type="button" value="search" id="friendsearch"> 
</div>