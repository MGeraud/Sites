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
    <title>Accueil</title>
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


</body>
</html>
