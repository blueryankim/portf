<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../color.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>수박뮤직</title>
	<script type="text/javascript" src="../js/rollover.js"></script>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../js/httpRequest.js"></script>
	<script type="text/javascript">
	var precount=0;
	var nextcount=1;
	var lastpage=0;
	var search_type=null;
	var mediaaddress=new Array();
	
	window.onload=getLastPage;
	
	function getLastPage(){
		lastpage=document.getElementById("lastpage").value;
		search_type=document.getElementById("search_type").value;
	}	
		
	//innerHTML부분	
	function choicemedia(index){
		var mediaarea=document.getElementById("mediaarea");
		var linkaddr=document.getElementById("linkaddr"+index).value;
		var html='<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">'
			+ '<tr><td height="30"></td></tr>'
			+ '<tr><td align="center"><embed width="600" height="400" src="' + linkaddr + '"/></td></tr>'
			+ '</table>'
		mediaarea.innerHTML=html;
	}
	
	function prePage() {
		if(precount==0) {
			alert("이전 페이지가 없습니다.");
			return false;	  
		}
		var params="pageNum="+precount+"&search_type="+search_type;
		new ajax.xhr.Request("/Main/linkmedia/linkmedia.do",params,PageResult,'POST');
		precount--;
		nextcount--;
	}
	
	function choicemedia2(index){
		var mediaarea=document.getElementById("mediaarea");
		var html = '<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">'
				+ '<tr><td height="30"></td></tr>'
				+ '<tr><td align="center"><embed width="600" height="400" src="'+mediaaddress[index]+'"/></td></tr>'
				+ '</table>'
		mediaarea.innerHTML=html;
	}
	
	function nextPage(){
		if(nextcount==lastpage){
			alert("다음 페이지가 없습니다.");
			return false;
		}
		
		nextcount++;
		precount++;
		var params="pageNum="+nextcount+"&search_type="+search_type;
		
		new ajax.xhr.Request("/Main/linkmedia/linkmedia.do",params,PageResult,'POST');
	}
	
	function PageResult(req) {
		if (req.readyState == 4) {
			if (req.status == 200) {
				var xmlDoc = req.responseXML;
				var code = xmlDoc.getElementsByTagName('code').item(0).firstChild.nodeValue;
			
				if (code == 'success') {
					var medialinklist = eval("(" + xmlDoc.getElementsByTagName('data').item(0).firstChild.nodeValue + ")");	
					var totalhtml=makeNewView(medialinklist);
					var mediaarea=document.getElementById("imagemenu");
					mediaarea.innerHTML=totalhtml;
				}
			}
		}
	}
	
	function makeNewView(medialinklist){
		var html='<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">'
				+ '<tr>'
					+ '<td width="110"><a href="#" onclick="prePage()"><img src="../subak_images/sub/linkmedia/prev.gif" border="0" /></a></td>'
					+ '<td width="10"></td>'
					+ '<td width="660">';
		
		var html2='';
		for(var i=0;i<medialinklist.length;i++) {
			mediaaddress[i]=medialinklist[i].linkaddress;
			if(i==0) {
				html2 = '<td><a href="#" onclick="choicemedia2(' + i + ')"><img src="../linkmediaimage/' + medialinklist[i].linkid + '.jpg" border="0" /></a>'
						+ '<input type="hidden" id="linkaddr' + i + '" value="' + medialinklist[i].linkaddress + '" /></td>';
			}
			if(i>0) {
				html2 += '<td><a href="#" onclick="choicemedia2(' + i + ')"><img src="../linkmediaimage/' + medialinklist[i].linkid + '.jpg" border="0" /></a></td>';
			}
		}
		var html3 = '</td>'
				+ '<td width="10"></td>'
				+ '<td><a href="#" onclick="nextPage()"><img src="../subak_images/sub/linkmedia/next.gif" border="0" /></a></td></tr>'
			+ '</table>';
		
		var totalhtml = html + html2 + html3;
		
		return totalhtml;
	}
	</script>
</head>
<body>

	<table width="1000" align="center" border="0" cellpadding="0" cellspacing="0">
	
		<!-- 헤더 -->
		<tr><td><jsp:include page="../home/home_top.jsp" /></td></tr>
		
		<!-- 메인 네비게이션 -->
		<tr><td><jsp:include page="../include/navigation.jsp" /></td></tr>
		
		
		<tr><td height="20"></td></tr>
		
		<tr><td class="subTitle" align="center">뮤 직 비 디 오</td></tr>
		
		<tr>
			<td>
			
				<form name="albumlistform">
					<div id="imagemenu">
						<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">
							<tr>
								<td width="110"><a href="#" onclick="prePage()"><img src="../subak_images/sub/linkmedia/prev.gif" border="0" /></a></td>
								<td width="10"></td>
								<td width="660">
									<table border="0" cellpadding="0" cellspacing="0" align="center">
										<tr>
											<c:forEach var="linklist" items="${ linklist }" varStatus="num">
												<td>
													<a href="#" onclick="choicemedia(${ num.count })"><img src="../linkmediaimage/${ linklist.linkid }.jpg" border="0" /></a>
													<input type="hidden" id="linkaddr${ num.count }" value="${ linklist.linkaddress }" />
												</td>
											</c:forEach>
										</tr>
									</table>
								</td>
								<td width="10"><input type="hidden" id="lastpage" value="${ lastpage }" /><input type="hidden" id="search_type" value="${ search_type }" /></td>
								<td width="110"><a href="#" onclick="nextPage()"><img src="../subak_images/sub/linkmedia/next.gif" border="0" /></a></td>
							</tr>
						</table>
					</div>
					
					<div id="mediaarea">
						<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">
							<tr><td height="30"></td></tr>
							<tr>
								<td align="center">
									<c:if test="${choosedmedianum ne ''}">
										<embed width="600" height="400" src="${ choosedmediaaddr }" />
									</c:if>
									<c:if test="${choosedmedianum eq '' }">
										<embed width="600" height="400" src="${ firstlist.linkaddress}" />
									</c:if>
								</td>
							</tr>
						</table>
					</div>
				</form>
				
			</td>
		</tr>
		
		<!-- 푸터 / 카피라이트 -->
		<tr><td height="50"></td></tr>
		<tr><td align="center"><jsp:include page="../include/footer.jsp" /></td></tr>
		
	</table>



<%-- 

	<center>
	
		<form name=albumlistform>
			<div id="imagemenu">
				<table width="300">
					<tr>
						<td></td>
						<c:forEach var="linklist" items="${ linklist }" varStatus="num">
							<td rowspan="3">
							<a href="#" onclick="choicemedia(${num.count})"><img src="../linkmediaimage/${linklist.linkid}.jpg" border="0" /></a>
							<input type="hidden" id="linkaddr${ num.count }" value="${ linklist.linkaddress }" /></td>
						</c:forEach>
						<td><input type="hidden" id="lastpage" value="${lastpage}" /><input type="hidden" id="search_type" value="${search_type }" /></td>
					</tr>
					<tr>
						<td><a href="#" onclick="prePage()"><img src="../subak_images/sub/linkmedia/prev.gif" border="0" /></a></td>
						<td><a href="#" onclick="nextPage()"><img src="../subak_images/sub/linkmedia/next.gif" border="0" /></a></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
			
			<div id="mediaarea">
				<br /> <br /> <br />
				<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">
					<tr><td height="10" bgcolor="black"></td></tr>
					<tr>
						<td align="center">
							<c:if test="${choosedmedianum ne ''}">
								<embed width="400" height="400" src="${choosedmediaaddr }" />
							</c:if>
							<c:if test="${choosedmedianum eq '' }">
								<embed width="400" height="400" src="${firstlist.linkaddress}" />
							</c:if>
						</td>
					</tr>
					<tr>
						<td height="10" bgcolor="black"></td>
					</tr>
				</table>
			</div>
		</form>
		
	</center> --%>
</body>
</html>