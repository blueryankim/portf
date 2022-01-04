<%@ page contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

{"unilist":[

<c:forEach var="ulist" items="${unilist}" varStatus="num">
<c:if test="${num.count>1}">,</c:if>
{"uniname":"${ulist}"}
</c:forEach>
]}

    