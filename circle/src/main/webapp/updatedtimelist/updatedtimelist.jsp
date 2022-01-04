<%@ page contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    


{"updatedtimelinelist":[

<c:forEach var="updatedtimelinelist" items="${updatedtimelinelist}" varStatus="num">
<c:if test="${num.count>1}">,</c:if>
{
 "num":"${updatedtimelinelist.num}",	
 "id":"${updatedtimelinelist.id}",
 "writer":"${updatedtimelinelist.writer}",
 "towhom":"${updatedtimelinelist.towhom}",
 "content":"${updatedtimelinelist.content}",
 "openscope":"${updatedtimelinelist.openscope}",
 "imagepath":"${updatedtimelinelist.imagepath}",
 "ilike":"${updatedtimelinelist.ilike}",
 "profileimg":"${updatedtimelinelist.profileimg}",
 "regdate":"${updatedtimelinelist.regdate}"}
</c:forEach>
]}
  