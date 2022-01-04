<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<result>
	
	

			
	<code>success</code>
	<data><![CDATA[
	[
	<c:forEach items="${commentList}" var="clist" varStatus="num">
		<c:if test="${num.count>1}">,</c:if>
		{
			commentid:${clist.commentid},
			albumnum:${clist.albumnum},
			id:'${clist.id}',
			comment:'${clist.comment}',
			regdate:'<fmt:formatDate value="${clist.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm:ss"/>'
			
			}
		</c:forEach>
		]
		]]>
		</data>
	<paging>
			<![CDATA[
			{
			ispre:${cp.isPre()},
			isnext:${cp.isNext()},
			pagestart:${cp.getPage_Start()},
			pageend:${cp.getPage_End()},
			p_size:${cp.p_size}
			}
			]]>	
	
	</paging>	
	</result>	
