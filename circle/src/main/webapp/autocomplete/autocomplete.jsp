<%@ page contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

{"autocompletelist":[

<c:forEach var="autocompletelist" items="${autocompletelist}" varStatus="num">
<c:if test="${num.count>1}">,</c:if>
{
 "id":"${autocompletelist.id}",	
 "profileimg":"${autocompletelist.profileimg}",
 "name":"${autocompletelist.name}",
 "university":"${autocompletelist.university}"}
</c:forEach>
]}
