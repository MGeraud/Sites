<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 01/05/2020
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create_Route</title>
    <link type="text/css" rel="stylesheet" href="/WEB-INF/inc/creation.css"/>
</head>
<body>


<div id="newPlace">
    <c:import url="create_place.jsp"/>
</div>
<div id="newSector">
    <form method="post" action="<c:url value="create_sector"/> ">
        <fieldset>
            <legend>Créez un nouveau secteur</legend>

                <select name="placeList" id="placeListe">
                    <option value="">Choisissez un site existant dans la liste</option>

                    <c:forEach items="${ sessionScope.places }" var="listPlace">
                        <option value="${ listPlace.placeId }">${ listPlace.placeName }</option>
                    </c:forEach>
                </select>

            <c:import url="create_sector.jsp"/>

        </fieldset>
        <input type="submit" value="Valider">
    </form>
</div>
<div>
    <form method="post" action="create_route">
        <fieldset>
        <legend>Renseignez les différents champs selon le type de voie choisie</legend>
        <select name="routeType" id="routeType">
            <option value="">Choisissez un type de voie</option>
            <option value="boulder">Bloc</option>
            <option value="singlePitch">Voie</option>
            <option value="multiPitch">Grande voie</option>
        </select>
            <input type="submit" value="Valider">
        </fieldset>
    </form>
</div>
<c:set var="boulder" value="boulder"/>
<c:set var="singlePitch" value="singlePitch"/>
<c:set var="multiPitch" value="multiPitch"/>
<form method="post" action="<c:url value="create_route"/> ">
    <fieldset>
        <select name="placeList">
            <option value="">Choisissez un site existant dans la liste</option>
            <c:forEach items="${ sessionScope.places }" var="mapPlace">
                <option value="${ mapPlace.placeName }">${ mapPlace.placeName }</option>
            </c:forEach>
        </select>

        <c:choose>
            <c:when test="${requestScope.routeType eq boulder}">
                <fieldset>
                <c:import url="create_route_common.jsp"/>
                <c:import url="create_boulder.jsp"/>
                </fieldset>
            </c:when>
            <c:when test="${requestScope.routeType eq singlePitch}">
                <fieldset>
                    <c:import url="create_route_common.jsp"/>
                    <c:import url="create_singlePitch.jsp"/>
                </fieldset>
            </c:when>
            <c:when test="${requestScope.routeType eq multiPitch}">
                <fieldset>
                    <c:import url="create_route_common.jsp"/>
                    <c:import url="create_multiPitch.jsp"/>
                </fieldset>
            </c:when>
            <c:otherwise>
                <c:out value="Merci de choisir un type de voie"/>
            </c:otherwise>
        </c:choose>
    </fieldset>



</form>


</body>
</html>
