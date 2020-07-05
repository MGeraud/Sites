<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 19/05/2020
  Time: 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Les Amis de l'escalade</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

</head>
<body>
<%--import de la navbar pour les pages réservées aux utilisateurs enregistrés --%>
<c:import url="registred_navbar.jsp"/>

<%-- Vérification de présence de topo dans la base de données , sinon message --%>
<c:if test="${empty sessionScope.topos}">
    <h3 class="alert-danger text-center">Aucun topo actuellement disponible sur notre site</h3>
</c:if>

<%-- Mise en place formulaire de recherche s'il y a des topos en base de données --%>
<c:if test="${not empty sessionScope.topos}">
    <div class="container-fluid bg-secondary">
        <form method="post" action="<c:out value="topo_list"/>">
            <fieldset>
                <legend>Merci de sélectionner les critères de recherche</legend>
                <div class="row">
                    <div class="form-group col-12 col-md-6">
                        <label for="topo_name">Titres disponibles</label>
                        <select class="form-control" name="topo_name" id="topo_name">
                            <option value="<c:out value=""/>"><c:out value="Tous les titres"/></option>
                            <c:forEach items="${ sessionScope.topos }" var="topos">
                                <option value="${ topos.topoName }">${ topos.topoName }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-12 col-md-6">
                        <label for="topo_place">Sites traités</label>
                        <select class="form-control" name="topo_place" id="topo_place">
                            <option value="<c:out value=""/>"><c:out value="Tous les sites"/></option>
                            <c:forEach items="${ sessionScope.topos }" var="topos">
                                <option value="${ topos.topoPlace }">${ topos.topoPlace }</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col">
                    <input class="form-control btn btn-primary" type="submit" value="Rechercher">
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
</c:if>

<%-- Résultats résultats de recherche avec bouton de réservation pour chaque topo disponible--%>
<div class="container mt-5">
    <c:if test="${not empty requestScope.selected_topos}">
        <form method="post" action="<c:out value="book_topo"/>">
            <table class="table table-striped border">
                <thead>
                <tr>
                        <%--pour les smartphones affichage uniquement titre / personne a contacter / bouton réservation --%>
                    <th scope="col">Titre</th>
                    <th class="d-none d-sm-block" scope="col">Lieu</th>
                    <th class="d-none d-sm-block" scope="col">Edition</th>
                    <th scope="col">Personne à contacter</th>
                    <th class="d-none d-sm-block" scope="col">Description</th>
                    <th class="d-none d-sm-block" scope="col">Disponibilité</th>
                    <th scope="col">Demande de réservation</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.selected_topos}" var="selected_topos">
                    <tr>
                        <th scope="row"><c:out value="${selected_topos.topoName}"/></th>
                        <td class="d-none d-sm-block"><c:out value="${selected_topos.topoPlace}"/></td>
                        <td class="d-none d-sm-block"><c:out value="${selected_topos.year}"/></td>
                        <td><c:out value="${selected_topos.climber.email}"/></td>
                        <td class="d-none d-sm-block"><c:out value="${selected_topos.topoDescription}"/></td>
                        <td class="d-none d-sm-block"><strong><c:out value="${selected_topos.topoAvailable ? 'Disponible' : 'Non disponible'}"/></strong></td>
                        <td>
                            <c:if test="${selected_topos.topoAvailable}">
                                <a href="<c:url value="/registred/book_topo"><c:param name="book_topo" value="${selected_topos.id}"/></c:url>">
                                    <input class="btn btn-primary" type="button" value="Réserver"/>
                                </a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
    </c:if>
</div>
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
