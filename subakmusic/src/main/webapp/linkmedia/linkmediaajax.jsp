<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <result>


		<code>success</code>
		<data><![CDATA[
		
		[
		<c:forEach items="${linklist}" var="linklist" varStatus="i">
		<c:if test="${i.count>1}">,</c:if>
		{
		linkid: ${linklist.linkid},
		songname:'${linklist.songname}',
		linkaddress:'${linklist.linkaddress}'
		
		
		
		}
		</c:forEach>
		]
		]]>
		</data>
		</result>