<%@ page contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

{"allcommentlist":[

<c:forEach var="allcommentlist" items="${allcommentlist}" varStatus="num">
<c:if test="${num.count>1}">,</c:if>
{
 
 "num":"${allcommentlist.num }",
 "gulnum":"${allcommentlist.gulnum }",
 "id":"${allcommentlist.id }",
 "writer":"${allcommentlist.writer }",
 "comment":"${allcommentlist.comment }",	
 "regdate":"${allcommentlist.regdate }",
 "profileimg":"${allcommentlist.profileimg }"	
 
 }
</c:forEach>
]}
