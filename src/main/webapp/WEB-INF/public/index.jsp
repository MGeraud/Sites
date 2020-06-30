<%--
  Created by IntelliJ IDEA.
  User: gerau
  Date: 27/06/2020
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><html>
<head>
    <title>Amis de l'escalade</title>
    <%-- bootstrap4 --%>
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

<%-- Utilisation d'une card pour mettre en avant les avantages de créer un compte --%>
<%-- Affichage de cette carte uniquement si utilisateur non connecté--%>
<c:if test="${empty sessionScope.sessionUtilisateur}">
    <div class="container">
        <div class="row ">
            <div class="col">
                <div class="card">
                        <%--Affichage d'une image en ahut de la carte sur les écran de taille moyenne et +   --%>
                    <img src="inc/RockMountains.JPG" class="card-img-top d-none d-md-block w-100" alt="Paysage"/>
                    <div class="card-body">
                        <h4 class="card-title">Créez votre compte et connectez vous pour profiter de tous les services
                            !</h4>
                            <%-- Bouton d'envoi vers la page d'inscription --%>
                        <a class="card-text" href="<c:url value="/inscription"/>">
                            <input class="btn btn-primary" type="button" value="Créer compte">
                        </a>
                        <br/>
                        <p class="card-text">Vous pourrez ainsi :
                            <br/>
                        <ul class="list-group">
                            <li class="list-group-item list-group-item-info">Créer votre liste de topo</li>
                            <li class="list-group-item list-group-item-info">Rechercher des topos pour les emprunter
                            </li>
                            <li class="list-group-item list-group-item-info">Ajouter de nouveaux sites / secteurs /
                                voies
                            </li>
                            <li class="list-group-item list-group-item-info">Laisser des commentaires sur les sites</li>
                            <li class="list-group-item list-group-item-info">Créer votre liste de topo</li>
                        </ul>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>

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
