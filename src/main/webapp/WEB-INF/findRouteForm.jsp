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
    <!-- Formulaire mulit-critères pour recherche de site ou de voie -->
    <form method="post" name="find_route_form" action="<c:url value="/findRouteForm"/> ">
        <fieldset>
            <legend><c:out value="Cherchez votre futur spot à partir d'un ou plusieurs critères "/> </legend>
            <!-- liste déroulante choix des régions -->
            <label for="byRegion">Choix de la région</label>
            <select name="byRegion" id="byRegion" required>
                <c:forEach items="${ sessionScope.regions }" var="regions">
                    <option  value="${regions.value}">${regions.key}</option>
                </c:forEach>
            </select>
            <!-- liste déroulante choix par type de voie -->
            <label for="byRouteType">Choix du type de voie</label>
            <select name="byRouteType" id="byRouteType">
                <option value="<c:out value="AllRouteType"/>">Tout type de voie</option>
                <option value="<c:out value="Bloc"/>">Bloc</option>
                <option value="<c:out value="Voie Sportive"/>">Voie</option>
                <option value="<c:out value="Grande Voie"/>">Grande Voie</option>
            </select>
            <!-- champ de saisie pour recherche par cotation précise ou par crénau basé sur le chiffre -->
            <label for="byGrade">Cotation (cotation précise ou uniquement le chiffre)</label>
            <input type="text" name="byGrade" id="byGrade" maxlength="12"/>
            <!-- champ de saisie texte pour une recherche par mot clé , exemple partie du nom de la voie -->
            <label for="coutainText">Recherche par mot clé</label>
            <input type="text" name="coutainText" id="coutainText" maxlength="50">
            <input type="submit" value="Rechercher">
        </fieldset>
    </form>
</body>
</html>
