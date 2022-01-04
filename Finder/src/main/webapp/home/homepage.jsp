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

	body{
		margin:0px;
		padding:0px;
		}

	a { text-decoration:none }

	
	.ui-header { background:#4086cd;
				 overflow:hidden;
		
	}
	
	.ui-footer { background:silver;}
	
	#panellistview{
				background:yellow;
	}
	#title{ font-size:40px;
			font-family: 'Pacifico', cursive;
			color:white;
			display:inline;
			
			}
			
	#top{
	background:#4086cd;
	color:white;
	font-size:15px;
	
	}	
	
	#header1{
			height:50px;
			text-align:center;
			border:0px;}
		
	#footer1{
			border:0px;}		
			
		
			
	#bookthinkings{background:#4086cd;
					font-size:15px;
					color:white;
					
			}	
			
	#albumthinkings{background:#4086cd;
					font-size:15px;
					color:white;
			}
	#writhingsharings{background:#4086cd;
					  font-size:15px;
					  color:white;
			}	
			
			
			

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

	#left-panel{

    margin: 0px;	
    padding: 0px;
}

	#nodata1{text-align:center;}
	#nodata2{text-align:center;}
	#nodata3{text-align:center;}
	
	.visual { width:100%;  margin:0 auto; text-align:center;
				position:relative; float:left; }
				
	.visual img { max-width:1024; max-height:200px;  width:100%; height:100%; }
		
	.visual .text{position:absolute; 
			bottom:10px; right:10px; max-width:1024px;
			font-size:16px;
	}	
	

		
</style>

<script type="text/javascript">


$(document).keydown(function(e){    
if(e.target.nodeName != "INPUT" && e.target.nodeName != "TEXTAREA"){        
if(e.keyCode === 8){    


    return false;
	}
  }
});


$(window).on("navigate", function(event, data) {
	  var direction = data.state.direction;
	  if (direction == 'back') {
	    alert('Going back');
	  }
	  if (direction == 'forward') {
	    alert('Going forward');
	  }
	});
	
	
window.onload=function(){
	 imgSize(); 
	}
	
	function imgSize(){
	 
	 var img = $("#mainimg");
	  
	 img.each(function() {
	     
	  var imgWidth = $(this).width();
	  var imgHeight = $(this).height();
	   
	  if (imgWidth > 300) {
	    
	   var ratio = imgWidth / imgHeight;
	    
	   var newHeight = Math.round(350 / ratio);
	     
	   $(this).attr({ width : "100%", height : newHeight });
	   $(this).css({width:"100%",height:newHeight});
	  
	  }
	      
	    });
	  
	}
	
	
	 /*
	$(document).on('click', '.showNextPage', function() {
	  $.mobile.navigate("#second", {
	    transition: "slide"
	  });
	});
	 
	$(document).on('click', '.showPrevPage', function() {
	  $.mobile.navigate("#index", {
	    transition: "slide"
	  });
	});
*/


	//window.history.forward(1);
	

/*
.ui-panel.ui-panel-open {
   position:fixed;
}

.ui-panel-inner {
    position: absolute;
    top: 1px;
    left: 0;
    right: 0;
    bottom: 0px;
    overflow: scroll;
    -webkit-overflow-scrolling: touch;
}*/
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

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Finder-사람들과 글을 나누는 공간</title>
<meta name="viewport" content="width=device-width,initial-scale=1 minimum-scale=1, maximum-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../js/jquery.mobile-1.4.5.min.css"/>
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>
<div id="page" data-role="page" data-theme="a">

<div id="left-panel" data-role="panel" data-theme="a" data-display="reveal" data-position-fixed="true" data-position="left" data-inset="false">
  
          <ul id="panellistview" data-role="listview" data-theme="a" data-insert="true">
          	<li id="top" data-role="list-divider" data-theme="c"><h2>${loginerinfor.id}</h2></li>
            <li data-icon="edit" data-iconpos="left"><a href="/Finder/makecontent/bringpostpage.do"  data-ajax="false"  title="글쓰기" >글쓰기</a></li>
            <li data-icon="false"><a href="#" title="Profile">나의 책 생각들<span class="ui-li-count">${loginerinfor.mybookcount}</span></a></li>
            <li data-icon="false"><a href="#" title="Setting">나의 앨범 생각들<span class="ui-li-count">${loginerinfor.myalbumcount}</span></a></li>
            <li data-icon="false"><a href="#" title="Logout">나의 다양한 글들<span class="ui-li-count">${loginerinfor.mywritingcount}</span></a></li>
             <li data-icon="false"><label for="name"></label><input type="search" name="name" id="name" value="" /></li>
	
        </ul>
      
	 </div>
	 
	 
<div id="header1" data-role="header" data-theme="c" data-position="fixed" data-id="header">

<a class="ui-icon-nodisc" href="#left-panel" data-iconpos="notext" data-iconshadow="false" data-shadow="false" data-theme="d" data-icon="bars"></a>
<h1 id="title">Finder</h1>
<!-- <div data-role="controlgroup" data-type="horizontal" class="ui-btn-right"> -->
<a href="#" data-iconpos="notext" data-iconshadow="false" data-shadow="false" data-theme="d" data-icon="user"></a>
</div>

<div id="content1" data-role="content" data-inset="false">
<div class="visual" data-inset="false"><img id="mainimg" src="./image/image3.JPG"/><div class="text"><h2>Finder를 통해서 당신의 가치를 발견하세요.</h2></div></div>
</div>
<div data-role="content">
<ul data-role="listview" data-theme="a" data-inset="false">

	
	<li id="bookthinkings" data-role="list-divider">오늘의 책 생각들</li>
	<c:if test="${  not empty homebooklist }">
	<c:forEach var="hbl" items="${ homebooklist }">
	<li><a href="#"><img src="../thumbnails/${hbl.num}.jpg" alt="${hbl.title }"/><h3>${hbl.title}</h3><p>${hbl.subtitle}</p></a></li>
	</c:forEach>
	</c:if>
	<c:if test="${  empty homebooklist }">
	<li id="nodata1">Sorry, No data.</li><br/>
	</c:if>

</ul>
<br/><br/>
<ul data-role="listview" data-theme="a" data-inset="false">
	
	<li id="albumthinkings" data-role="list-divider">오늘의 앨범 생각들</li>
	<c:if test="${  not empty homealbumlist }">
	<c:forEach var="hal" items="${ homealbumlist }">
	<li><a href="#"><img src="../thumbnails/${hal.num}.jpg"/><h3>${hal.title}</h3><p>${hal.subtitle}</p></a>
	</li>
	</c:forEach>
	</c:if>
	
	<c:if test="${  empty homealbumlist }">
	<li id="nodata2">Sorry, No data.</li><br/>
	</c:if>
</ul>
<br/><br/>
<ul data-role="listview" data-theme="a" data-inset="false">
	
	<li id="writhingsharings" data-role="list-divider">오늘의 글 나누기</li>
	<c:if test="${  not empty homewritinglist }">
	<c:forEach var="hwl" items="${ homewritinglist }">
	<li><a href="#"><img src="../thumbnails/${hwl.num}.jpg"/><h3>${hwl.title}</h3><p>${hwl.subtitle}</p></a>
	</li>
	</c:forEach>
	</c:if>
	<c:if test="${  empty homewritinglist }">
	<li id="nodata3">Sorry, No data.</li><br/>
	</c:if>
</ul>

</div>



<div id="footer1" data-theme="b" data-role="footer" data-position="fixed" data-id="footer">

<div data-role="navbar" data-id="homenav" data-position="fixed">
<ul>
	<li><a href="/Finder/home/homepage.do" data-ajax="false" class="ui-btn-active" data-id="home">홈</a></li>
	<li><a href="/Finder/gridpage/bringgridpage.do?flag=bookgrid" data-ajax="false" data-id="bookinfo">책 생각</a></li>
	<li><a href="/Finder/gridpage/bringgridpage.do?flag=albumgrid" data-ajax="false" data-id="albuminfo">앨범 생각</a></li>
	<li><a href="/Finder/gridpage/bringgridpage.do?flag=writinggird" data-ajax="false" data-id="writinginfo">글나누기</a></li>
</ul>
</div></div> 
</div>

  
   
</body>
</html>