<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 25/05/2020
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Les Amis de l'escalade</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <style type="text/css">
        tr.pair {
            background-color: #d7d6d6;
        }

        tr.impair {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<h2>Bienvenue sur la recherche de sites des amis de l'escalade</h2>
 <%-- Formulaire recherche de voies multicritères --%>
<c:import url="findRouteForm.jsp"/>
<br/>

<h2>Résultat de la recherche</h2>
<c:choose>
    <c:when test="${empty sessionScope.foundRoutes}">
        <c:out value="Pas de résultat pour cette recherche"/>
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th>Nom du site</th>
                <th>Type de voie</th>
                <th>Nom de la voie</th>
                <th>Cotation</th>

            </tr>
            <c:forEach items="${sessionScope.foundRoutes}" var="foundRoutes" varStatus="colorLoop">
                <tr class="${colorLoop.index % 2 == 0 ? 'pair' : 'impair'}">
                    <td><c:out value="${foundRoutes.foundPlaceName}"/></td>
                    <td><c:out value="${foundRoutes.foundRouteType}"/></td>
                    <td><c:out value="${foundRoutes.foundRouteName}"/></td>
                    <td><c:out value="${foundRoutes.foundRouteGrade}"/></td>
                    <td>
                        <a href="<c:url value="/placeDescription"><c:param name="placeID" value="${foundRoutes.foundPlaceId}"/></c:url>">
                        <input type="button" value="Voir les Détails du site">
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>

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
