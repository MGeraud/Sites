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
    <link type="text/css" rel="stylesheet" href="/WEB-INF/inc/creation.css" />
</head>
<body>
    <div>
        <form method="post" action="<c:url value="/create_route"/> " >
            <fieldset>
                <legend>Choisissez un site existant ou créez en un nouveau</legend>

                <div id="registredPlace">
                    <select name="placeList" id="PlaceListe">
                        <option value="">Choisissez un site existant dans la liste</option>

                        <c:forEach items="${ sessionScope.places }" var="mapPlace">
                            <option value="${ mapPlace.value.placeName }">${ mapPlace.value.placeName }</option>
                        </c:forEach>
                    </select>
                </div>
                <div id="newPlace">
                    <c:import url="create_site.jsp"/>
                </div>
            </fieldset>
            <fieldset>
                <legend>Choisissez un secteur existant ou créez en un nouveau</legend>

                <div id="registredSector">
                    <select name="sectorList" id="sectorList">
                        <option value="">Choisissez un secteur existant dans la liste</option>

                        <c:forEach items="${sessionScope.sector }" var="mapSector">
                            <option value="${ mapSector.value.sectorName }">${ mapSector.value.sectorName }</option>
                        </c:forEach>
                    </select>
                </div>
                <div id="newSector">
                    <c:import url="create_sector.jsp"/>
                </div>
            </fieldset>
            <fieldset>
                <legend>Renseignez les différents champs selon le type de voie choisie</legend>
                <select name="routeType" id="routeType">
                    <option value="">Choisissez un type de voie</option>
                    <option value="boulder" >Bloc</option>
                    <option value="singlePitch">Voie</option>
                    <option value="mutliPitch">Grande voie</option>
                </select>
                <label for="routeName">Nom de la voie :</label>
                <input type="text" name="routeName" id="routeName" maxlength="100" minlength="2">
                <label for="grade">Cotation</label>
                <input type="text" name="grade" id="grade" maxlength="6">
                <label for="routeDescription">Description</label>
                <input type="text" name="routeDescription" id="routeDescription" maxlength="300">
            </fieldset>
            <span id="sitStart">
                <label for="sitStart">Depart assis</label>
                <input type="checkbox" name="sitStart" >
            </span>
            <span id="spit">
                <label for="spit">Nombre de points</label>
                <input type="number" name="spit" maxlength="2" size="2">
                <label for="routeLength">Longueur de la voie</label>
                <input type="number" id="routeLength" name="routeLength" maxlength="3" size="3">m.
            </span>
            <span id="numberOfPitch">
                <label for="numberOfPitch">Nombre de relais</label>
                <input type="number" name="numberOfPitch" maxlength="2" size="2">
            </span>
            <br />

        </form>
    </div>

</body>
</html>
