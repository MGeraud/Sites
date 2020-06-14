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
                <h1><c:out value="${sessionScope.place.placeName}" /></h1>
            </th>
        </tr>
        <tr>
            <td>
                <c:out value="${sessionScope.place.placeDescription}"/>
            </td>
        </tr>
    </table>
<br />
<c:if test="${sessionScope.place.tag}" >
    <h1><c:out value="YOUHOU C'EST TAGGUÉ !!!!"/></h1>
</c:if>
    <a href="<c:url value="/updatePlaceTag"><c:param name="updatePlaceTag" value="${sessionScope.place.placeId}"/></c:url>">
        <input type="button" value="Modifier Tag"/>
    </a>
</div>
<div>
    <h2>Secteurs</h2>
    <br/>
    <c:forEach items="${sessionScope.sectors}" var="visitedSectors">
        <h3><c:out value="${visitedSectors.sectorName}"/></h3>

        <c:out value="${visitedSectors.sectorDescription}"/>
        <br/>
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
        <br/>
    </c:forEach>
</div>
<div>
    <form method="post" action="<c:url value="placeDescription"/> ">
        <label for="addComment">Entrez votre commentaire </label>
        <br/>
        <textarea id="addComment" maxlength="280" rows="5" name="addComment" ></textarea>
        <input type="submit" value="Enregistrer"  >
    </form>
</div>
</body>
</html>
