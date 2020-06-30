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
    <title>Les Amis de l'escalade</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
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

    <%-- jquery, popper et bootstrap4.js pour bootstrap --%>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>
</body>
</html>
