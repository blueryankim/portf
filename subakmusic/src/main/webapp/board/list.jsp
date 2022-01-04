<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../color.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>수박뮤직</title>
	<script type="text/javascript" src="../js/rollover.js"></script>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
	function search() {
		var form = document.listForm;
		if (form.search_text.value == null || form.search_text.value == "") {
			alert("검색어를 입력해 주세요");
			return;
		}
		var url = 'list.do?pageNum=1&search_type=' + form.search_type.value + '&search_text=' + encodeURI(form.search_text.value);
		window.location = url;
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
		
		<tr>
			<td>
			
				<table width="940" border="0" cellpadding="0" cellspacing="0" align="center">
					<tr><td><jsp:include page="../include/board_submenu.jsp" /></td></tr>
					<tr><td height="20"></td></tr>
					<tr>
						<td>
						
							<table width="900" border="0" cellpadding="0" cellspacing="0" align="center">
								<tr>
									<td colspan="9">
										<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
											<tr>
												<td width="250"></td>
												<td width="*" class="subTitle" align="center"><font color="${ subTitle }">공 지 사 항</font></td>
												<td width="250" align="right" valign="bottom">
													<input type="button" value="전체목록" onclick="window.location='list.do'" />
													<c:if test="${ sessionScope.id == 'admin' }">
														<input type="button" value="글쓰기" onclick="window.location='writeForm.do'" />
													</c:if>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr><td colspan="9" height="10"></td></tr>
								<tr><td colspan="9" height="3" bgcolor="${ spline_3px }"></td></tr>
								<tr bgcolor="${ th_bg }">
									<th align="center" width="50" height="30">번호</th>
									<th width="5"></th>
									<th align="center" width="530">제목</th>
									<th width="5"></th>
									<th align="center" width="100">작성자</th>
									<th width="5"></th>
									<th align="center" width="100">작성일</th>
									<th width="5"></th>
									<th align="center" width="100">조회수</th>
								</tr>
								<!-- 글이 없을 경우 -->
								<c:if test="${ count == 0 }"><tr><td colspan="9" align="center" height="100">- 게시판에 저장된 글이 없습니다. -</td></tr></c:if>
								<!-- 글이 있는 경우 -->
								<c:if test="${ count != 0 }">
									<c:forEach var="vo" items="${ boardList }">
										<tr onmouseover="this.style.backgroundColor='${ tr_onmouseover }'" onmouseout="this.style.backgroundColor=''">
											<td align="center" width="50" height="30">${ number}<c:set var="number" value="${ number -1 }" scope="page" /></td>
											<td width="5"></td>
											<td align="left" width="530">
												<a href="content.do?num=${ vo.num }&pageNum=${ bp.cur_Page }">${ vo.subject }</a>
												<c:if test="${ vo.readcount > 10 }"><img src="../subak_images/sub/board/hot.gif" border="0" height="10" /></c:if>
											</td>
											<td width="5"></td>
											<td align="center" width="100">관리자&nbsp;<a href="mailto:${ vo.email }"><img src="../subak_images/sub/board/email.gif" border="0" height="10" /></a></td>
											<td width="5"></td>
											<td align="center" width="100"><fmt:formatDate value="${ vo.regdate }" type="DATE" pattern="yyyy-MM-dd HH:mm" /></td>
											<td width="5"></td>
											<td align="center" width="100">${ vo.readcount }</td>
										</tr>
										<tr><td colspan="9" height="1" bgcolor="${ spline_1px }"></td></tr>
									</c:forEach>
								</c:if>
								<tr><td colspan="9" height="2" bgcolor="${ spline_2px }"></td></tr>
								<tr><td colspan="9" height="10"></td></tr>
								<tr>
									<td colspan="9" height="30" align="center">
										<!-- 페이징 -->
										<c:if test="${ bp.isPre() }"><a href="list.do?pageNum=${ bp.getPage_Start() - bp.p_size }">[이전]</a></c:if>
										<c:forEach var="counter" begin="${ bp.getPage_Start() }" end="${ bp.getPage_End() }">
											<c:if test="${search_text ne ''}">
												<a href="javascript:window.location='list.do?pageNum=${ counter }&search_type=${ search_type }&search_text=${ search_text }'">&nbsp;${ counter }&nbsp;</a>
											</c:if>
											<c:if test="${ search_text eq '' }">
												<a href="javascript:window.location='list.do?pageNum=${ counter }'">&nbsp;${ counter }&nbsp;</a>
											</c:if>
										</c:forEach>
										<c:if test="${ bp.isNext() }"><a href="list.do?pageNum=${ bp.getPage_Start() + bp.p_size }">[다음]</a></c:if>
									</td>
								</tr>
								<tr>
									<td colspan="9" height="30" align="center">
										<!-- 검색 -->
										<form method="get" name="listForm" action="list.do">
											<input type="hidden" name="pageNum" value="${pageNum}" />
											<select name="search_type">
												<option value="all" ${search_type == "all" ? "selected" : ""}>전체</option>
												<option value="subject" ${search_type == "subject" ? "selected" : ""}>제목</option>
												<option value="writer" ${search_type == "writer" ? "selected" : ""}>작성자</option>
												<option value="content" ${search_type == "content" ? "selected" : ""}>내용</option>
											</select>
											<input type="text" name="search_text" value="${search_text}" />
											<input type="button" value="검색" onclick="search()" />
										</form>
									</td>
								</tr>
							</table>
								
						</td>
					</tr>
				</table>
				
			</td>
		</tr>
		
		<!-- 푸터 / 카피라이트 -->
		<tr><td height="50"></td></tr>
		<tr><td align="center"><jsp:include page="../include/footer.jsp" /></td></tr>
		
	</table>

</body>
</html>