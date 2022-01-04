<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/xml; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<result> <code>success</code> <data><![CDATA[
	[
	<c:forEach items="${list}" var="list" varStatus="i">
		<c:if test = "${i.count > 1}">,</c:if>
		{
		id:${list.comment_id},
		num:${list.num},
		name:'${list.comment_name}',
		content:'${list.comment}',
		regdate:'<fmt:formatDate value="${list.regdate}" type="DATE"
			pattern="yyyy-MM-dd HH:mm:ss" />'
	}
	</c:forEach>
	]
	]]> </data> </result>
