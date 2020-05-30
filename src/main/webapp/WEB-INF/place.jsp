<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 25/05/2020
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Place presentation</title>
</head>
<body>
<h2><c:out value="${visitedPlace.placeName}" /></h2>
<br />
<div>
    <c:out value="${visitedPlace.placeDescription}"/>
</div>
<div>
    <h4>Secteur</h4>
    <c:forEach items="${sessionScope.visitedSectors}" var="visitedSectors">
        <c:out value="${visitedSectors.sectorName}"/>
        <br />
        <c:out value="${visitedSectors.sectorDescription}"/>
        <table>
            <tr>
                <th>Nom</th>
                <th>Type de voie</th>
                <th>Cotation</th>
                <th>Description</th>
                <th></th>
            </tr>
        <c:forEach items="${sessionScope.visitedRoutes}" var="visitedRoutes" varStatus="colorLoop">

        </c:forEach>
        </table>
    </c:forEach>
</div>
</body>
</html>
