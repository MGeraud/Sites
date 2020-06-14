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
    <style type="text/css">
        tr.pair{
            background-color: #d7d6d6;
        }
        tr.impair{
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div>
    <table>
        <tr>
            <th>
                <h2><c:out value="${sessionScope.place.placeName}" /></h2>
            </th>
        </tr>
        <tr>
            <td>
                <c:out value="${sessionScope.place.placeDescription}"/>
            </td>
        </tr>
    </table>
<br />

</div>
<div>
    <h4>Secteurs</h4>
    <c:forEach items="${sessionScope.sectors}" var="visitedSectors">
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
        <c:forEach items="${visitedSectors.routes}" var="visitedRoutes" varStatus="colorLoop">
            <tr class="${colorLoop.index % 2 == 0 ? 'pair' : 'impair'}">
                <td><c:out value="${visitedRoutes.routeName}"/> </td>
                <td><c:out value="${visitedRoutes.routeType}"/> </td>
                <td><c:out value="${visitedRoutes.grade}"/> </td>
                <td><c:out value="${visitedRoutes.routeDescription}"/> </td>
            </c:forEach>
        </table> 
    </c:forEach>
</div>
</body>
</html>
