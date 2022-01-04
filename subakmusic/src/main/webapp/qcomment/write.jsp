<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/xml; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<result>
	<code>success</code>
	<data><![CDATA[
	{
		id:${comment.comment_id},
		num:${comment.num},
		name:'${comment.comment_name}',
		content:'${comment.comment}',
		regdate:'<fmt:formatDate value="${comment.regdate}"
		type="DATE" pattern="yyyy-MM-dd HH:mm:ss" />'
	}
	]]>	</data>
</result>