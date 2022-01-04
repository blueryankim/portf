<%@ page contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

{"gridlist":[

<c:forEach var="gridlist" items="${gridlist}" varStatus="num">
<c:if test="${num.count>1}">,</c:if>
{
 
 "num":"${gridlist.num }",
 "title":"${gridlist.title }",
 "subtitle":"${gridlist.subtitle }",
 "regdate":"${gridlist.regdate}"
 
 }
</c:forEach>
]}
