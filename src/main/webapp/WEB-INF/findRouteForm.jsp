<%--
  Created by IntelliJ IDEA.
  User: gerau
  Date: 31/05/2020
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><html>
<head>
    <title>Find Route Form</title>
</head>
<body>
    <form method="post" name="find_route_form" action="<c:url value="/findRouteForm"/> ">
        <fieldset>
            <legend><c:out value="Cherchez votre futur spot à partir d'un ou plusieurs critères "/> </legend>
            <!-- liste déroulante choix de site parmis les sites connus -->
            <label for="byPlace">Choix du site</label>
            <select name="byPlace" id="byPlace">
                <option value="<c:out value="AllSites"/>">Tous les sites</option>
                <c:forEach items="${ sessionScope.places }" var="listPlace">
                    <option value="${ listPlace.placeId }">${ listPlace.placeName }</option>
                </c:forEach>
            </select>
            <!-- liste déroulante choix par type de voie -->
            <label for="byRouteType">Choix du type de voie</label>
            <select name="byRouteType" id="byRouteType">
                <option value="<c:out value="AllRouteType"/>">Tout type de voie</option>
                <option value="<c:out value="Bloc"/>">Bloc</option>
                <option value="<c:out value="Voie"/>">Voie</option>
                <option value="<c:out value="Grande voie"/>">Grande Voie</option>
            </select>
            <!-- champ de saisie pour recherche par cotation précise ou par crénau basé sur le chiffre -->
            <label for="byRate">Cotation (cotation précise ou uniquement le chiffre)</label>
            <input type="text" name="byRate" id="byRate" maxlength="12"/>
            <!-- champ de saisie texte pour une recherche par mot clé , exemple partie du nom dela voie -->
            <label for="coutainText">Recherche par mot clé</label>
            <input type="text" name="coutainText" id="coutainText" maxlength="50">
        </fieldset>
        <input type="submit" value="Rechercher">
    </form>
</body>
</html>
