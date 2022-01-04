<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<result>
	<code>success</code>
	<data><![CDATA[
	[
	<c:forEach items="${searchlist}" var="slist" varStatus="num">
		<c:if test="${num.count>1}">,</c:if>
		{
			songnum:${slist.songnum},
			songname:'${slist.songname}',
			singer:'${slist.singer}'
			
			}
		</c:forEach>
		]
		]]>
		</data>
	<paging>
			<![CDATA[
			{
			ispre:${sp.isPre()},
			isnext:${sp.isNext()},
			pagestart:${sp.getPage_Start()},
			pageend:${sp.getPage_End()},
			p_size:${sp.p_size}
			}
			]]>	
	
	</paging>	
	</result>	
