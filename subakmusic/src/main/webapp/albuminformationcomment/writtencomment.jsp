<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<result> <code>success</code> <data><![CDATA[
		[
			<c:forEach items="${albuminforcomment}" var="albuminforc" varStatus="num">
			<c:if test="${num.count>1}">,</c:if>
	{		
			commentid:${albuminforc.commentid},
			albumnum:${albuminforc.albumnum},
			id:'${albuminforc.id}',
			comment:'${albuminforc.comment}',
			regdate:'<fmt:formatDate value="${albuminforc.regdate}" type="DATE" pattern="yyyy-MM-dd HH:mm:ss"/>'
			
	}
			</c:forEach>
	]
	]]> </data> </result>



