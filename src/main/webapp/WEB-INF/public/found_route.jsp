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

</head>
<body>
<%-- Navbar différente importée selon si utilisateur enregistré ou non --%>
<c:choose>
    <c:when test="${not empty sessionScope.sessionUtilisateur}">
        <c:import url="navbar.jsp"/>
    </c:when>
    <c:otherwise>
        <c:import url="login.jsp"/>
    </c:otherwise>
</c:choose>


<%-- Import du formulaire de recherche de voies--%>
<div class="container-fluid bg-secondary">
    <c:import url="findRouteForm.jsp"/>
</div>
<div class="alert mx-2">
<h2 class="alert-warning pl-5" ><strong>Résultat de la recherche</strong></h2>
</div>
<c:choose>
    <c:when test="${empty sessionScope.foundRoutes}">
        <div class="alert alert-secondary mx-auto"  role="alert">
            <c:out value="Pas de résultat pour cette recherche"/>
        </div>
    </c:when>
    <c:otherwise>
        <table class="table table-striped table-bordered table-hover mx-2">
            <thead>
            <tr>
                <th scope="col">Nom du site</th>
                <th scope="col">Type de voie</th>
                <th scope="col">Nom de la voie</th>
                <th scope="col">Cotation</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${sessionScope.foundRoutes}" var="foundRoutes" varStatus="colorLoop">
                <tr>
                    <th scope="row"><c:out value="${foundRoutes.foundPlaceName}"/></th>
                    <td><c:out value="${foundRoutes.foundRouteType}"/></td>
                    <td><c:out value="${foundRoutes.foundRouteName}"/></td>
                    <td><c:out value="${foundRoutes.foundRouteGrade}"/></td>
                    <td>
                        <a href="<c:url value="/placeDescription"><c:param name="placeID" value="${foundRoutes.foundPlaceId}"/></c:url>">
                        <input class="btn btn-secondary btn-sm" type="button" value="Voir les Détails du site">
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
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
