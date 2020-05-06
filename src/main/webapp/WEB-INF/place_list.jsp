<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 06/05/2020
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>place list</title>
</head>
<body>

<c:forEach items="${ sessionScope.places }" var="mapPlace">
    <c:out value="${mapPlace.placeName}"/>



</c:forEach>


</body>
</html>
