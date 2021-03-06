<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>

<style>
	a { text-decoration:none }

	
	.ui-header { background:#4086cd;
				 overflow:hidden;
				 
		
	}
	
	.ui-footer { background:silver;}
	
	#panellistview{
				
	}
	#title{ font-size:40px;
			color:white;
			display:inline;
			font-family: 'Pacifico', cursive;
			
			}
	
	#header1{
			height:50px;
			text-align:center;
			border:0px;}
		
	#footer1{
			border:0px;}	
			
			#page * {
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    -o-user-select: none;
    user-select: none;
}
	/* Arrow only buttons in the header. */
	#page .ui-header .ui-btn {
    background: none;
    border: none;
    top: 9px;
}

	.ui-navbar{
 	 color:white;
     border: none;
    
}

	#page .ui-header .ui-btn-inner {
    border: none;
}


	#content1[data-role=content]{
	height: 100%;
    width: 100%;
    margin: 0px;	
    padding: 0px;
}

	#content[data-role=content]{
	height: 100%;
    width: 100%;
    margin: 2px;	
    padding: 2px;
}

	#left-panel{
	
    margin: 0px;	
    padding: 0px;
}

	#top{
	background:#4086cd;
	color:white;
	font-size:16px;
	
	}

	.ui-grid-a img{
		width:96.5%;
		height:140px;
	
		}
	
	.ui-grid-a div{
		height:220px;
		
		}		
		
	.ui-grid-a span{
		
		text-align:center;
		font-size:12px;
		font-family:'NanumGothic';
		}		
	
	.imgCaption{
		background-color:white;
		width:96.5%;
		height:80px;
		text-align:center;
		font-size:15px;
		font-weight:bold;
		font-family:'NanumGothic';
	}

	.visual { width:100%;  margin:0 auto; text-align:center; }
	.visual img { max-width:1024; max-height:100px;  width:100%; height:100%; }

</style>
<script type="text/javascript">



	$(document).on("pagecreate","#page",function(){
	 
	$(document).on("scrollstop",function(){	
	  if($(document).height() > $(window).height())
	    {
	        if($(window).scrollTop() == $(document).height() - $(window).height()){
	    		
	        	var param={flag:"albumgrid"};
	    		$.post("/Finder/gridpage/bringgridpage.do",param,getMoreGridContentResult,"json");
	    		
	   		}
	    }
	  }); 
	});


	function getMoreGridContentResult(jsonInfor){
	

	var gl=jsonInfor.gridlist;
	
	
	if(gl.length==0){
		
		return false;
	}
	
	
	var gridcount=$("#gridcount").val();
	$("#gridcount").attr("value",gridcount+gl.length);

	
	
			if(gridcount%2==1){

				var innerhtml='<div class="ui-block-b"><a href="#"><img src="../images/'+gl[0].num+'.jpg"/></a>';
				var innerhtml2='<div class="imgCaption">'+gl[0].title+'<br/><span>'+gl[0].subtitle+'</span></div><div>';
				$("#uigrida").html($("#uigrida").html()+innerhtml+innerhtml2);
			
			for(var i=1; i< gl.length; i++){
				
			if(i%2==1){
			
				var innerhtml='<div class="ui-block-a"><a href="#"><img src="../images/'+gl[i].num+'.jpg"/></a>';
				var innerhtml2='<div class="imgCaption">'+gl[i].title+'<br/><span>'+gl[i].subtitle+'</span></div><div>';
				$("#uigrida").html($("#uigrida").html()+innerhtml+innerhtml2);
			}	
			
			else{
				
				var innerhtml='<div class="ui-block-b"><a href="#"><img src="../images/'+gl[i].num+'.jpg"/></a>';
				var innerhtml2='<div class="imgCaption">'+gl[i].title+'<br/><span>'+gl[i].subtitle+'</span></div><div>';
				$("#uigrida").html($("#uigrida").html()+innerhtml+innerhtml2);
				
			}
			
			}
		
		}
		
		else{
	
			
			for(var i=0; i< gl.length; i++){
				
			if(i%2==0){

				var innerhtml='<div class="ui-block-a"><a href="#"><img src="../images/'+gl[i].num+'.jpg"/></a>';
				var innerhtml2='<div class="imgCaption">'+gl[i].title+'<br/><span>'+gl[i].subtitle+'</span></div><div>';
				$("#uigrida").html($("#uigrida").html()+innerhtml+innerhtml2);
			}	
			
			else{

				var innerhtml='<div class="ui-block-b"><a href="#"><img src="../images/'+gl[i].num+'.jpg"/></a>';
				var innerhtml2='<div class="imgCaption">'+gl[i].title+'<br/><span>'+gl[i].subtitle+'</span></div><div>';
				//$div1.html(innerhtml+innerhtml2);
				$("#uigrida").html($("#uigrida").html()+innerhtml+innerhtml2);
			}
			
			}
			
		
		}
	}		


$( document ).on( "pageinit", "#demo-page", function() {
    $( document ).on( "swipeleft swiperight", "#demo-page", function( e ) {
        // We check if there is no open panel on the page because otherwise
        // a swipe to close the left panel would also open the right panel (and v.v.).
        // We do this by checking the data that the framework stores on the page element (panel: open).
        if ( $.mobile.activePage.jqmData( "panel" ) !== "open" ) {
           if ( e.type === "swiperight" ) {
                $( "#left-panel" ).panel( "open" );
            }
        }
    });
});

$('#left-panel').panel({
    open: function(event, ui) {
        //check the event alert('kpl');
        $('body').bind('touchmove', function(e){e.preventDefault()});
    },
    close: function(event, ui) {
        //check the event alert('kpl1');
        $('body').unbind('touchmove');
    }
});

</script>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="../js/jquery.mobile-1.4.5.min.css"/>
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/jquery.mobile-1.4.5.min.js"></script>
<title>??? ????????? ?????????</title>
</head>
<body>

<div id="page" data-role="page" data-theme="a">

<div id="left-panel" data-role="panel" data-display="reveal" data-position-fixed="true" data-position="left" data-inset="false">
  
          <ul id="panellistview" data-role="listview"  data-insert="true">
          	<li id="top" data-role="list-divider" data-theme="c"><h3>${loginerinfor.id}</h3></li>
            <li data-icon="edit" data-iconpos="left"><a href="/Finder/makecontent/bringpostpage.do"  data-ajax="false"  title="?????????" >?????????</a></li>
            <li data-icon="false"><a href="#" title="Profile">?????? ??? ?????????<span class="ui-li-count">${loginerinfor.mybookcount}</span></a></li>
            <li data-icon="false"><a href="#" title="Setting">?????? ?????? ?????????<span class="ui-li-count">${loginerinfor.myalbumcount}</span></a></li>
            <li data-icon="false"><a href="#" title="Logout">?????? ????????? ??????<span class="ui-li-count">${loginerinfor.mywritingcount}</span></a></li>
             <li data-icon="false"><label for="name"></label><input type="search" name="name" id="name" value="" /></li>
	
        </ul>
      
	 </div>
	 
	 
<div id="header1" data-role="header" data-position="fixed" data-id="header" data-theme="c">

<a class="ui-icon-nodisc" href="#left-panel" data-iconpos="notext" data-iconshadow="false" data-shadow="false" data-theme="d" data-icon="bars"></a>
<h1 id="title">Finder</h1>
<!-- <div data-role="controlgroup" data-type="horizontal" class="ui-btn-right"> -->
<a href="#" data-iconpos="notext" data-iconshadow="false" data-shadow="false" data-theme="d" data-icon="user"></a>
</div>

<div id="content1" data-role="content" data-inset="true">
<div class="visual" data-inset="false"><img src="./image/IMG_1649.PNG"/></div>
</div>

<div id="content" data-role="content" data-inset="false" data-theme="a">
<div class="ui-grid-a" id="uigrida">

	<c:if test="${  not empty albumgridlist }">
	<c:forEach var="agl" items="${ albumgridlist }" varStatus="status">
	<c:if test="${ status.index %2 ==0}">
	<div class="ui-block-a"><a href="#"><img src="../thumbnails/${agl.num}.jpg"/></a><div class="imgCaption">${agl.title}
	<br/><span>${agl.subtitle}</span>
	</div></div>
	</c:if>
	<c:if test="${ status.index %2 ==1}">
	<div class="ui-block-b"><a href="#"><img src="../thumbnails/${agl.num}.jpg"/></a><div class="imgCaption">${agl.title}
	<br/><span>${agl.subtitle }</span>
	</div></div>
	</c:if>
	<c:if test="${ agl==null}">
	<div class="ui-block-b"><img src=""/><div class="imgCaption">sdfdsfsadfsdfasdfasdfsdfasdfsaddsaf</div></div>
	</c:if>
	</c:forEach>
	</c:if>
	
	<c:if test="${  empty albumgridlist }">
	<div class="ui-block-a"><div class="ui-bar ui-bar-a" style="height: 180px; background-color:white;">no data</div></div>
    <div class="ui-block-b"><div class="ui-bar ui-bar-a" style="height: 180px; background-color:white;">no data</div></div>

	</c:if>





</div>


</div>

<div id="footer1" data-theme="b" data-role="footer" data-position="fixed" data-id="footer">

<div data-role="navbar" data-id="homenav" data-position="fixed">
<ul>
	<li><a href="/Finder/home/homepage.do" data-ajax="false"  data-id="home">???</a></li>
	<li><a href="/Finder/gridpage/bringgridpage.do?flag=bookgrid" data-ajax="false" data-id="bookinfo">??? ??????</a></li>
	<li><a href="/Finder/gridpage/bringgridpage.do?flag=albumgrid" data-ajax="false" class="ui-btn-active" data-id="albuminfo">?????? ??????</a></li>
	<li><a href="/Finder/gridpage/bringgridpage.do?flag=writinggird" data-ajax="false" data-id="writinginfo">????????????</a></li>
</ul>
</div>

</div>
</div>


</body>
</html>