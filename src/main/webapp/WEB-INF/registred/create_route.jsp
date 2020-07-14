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
    <title>Les Amis de l'escalade</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
<%--import de la navbar pour les pages réservées aux utilisateurs enregistrés --%>
<c:import url="registred_navbar.jsp"/>
<div class="container">
    <%--Création d'un nouveau site : import du formulaire de création de site --%>
    <c:import url="create_place.jsp"/>

    <%--Création secteur : liste déroulante pour le choix du site avant création de secteur et import du formulaire de remplissage détail du secteur --%>
    <div class="card mt-5">
        <div class="card-header">
            <h3 class="text-primary"><strong>Nouveau secteur</strong></h3>
        </div>
        <div class="card-body">
            <p>
                Ajouter un secteur sur un site existant ?
                <%-- bouton pour afficher le formuaire de création de secteur, par défaut formulaire non affiché pour prendre moins de place à l ''ecran--%>
                <button class="btn btn-primary ml-md-4" type="button" data-toggle="collapse"
                        data-target="#add-sector" aria-expanded="false" aria-controls="add-sector">Par ici pour le
                    formulaire !
                </button>
            <div class="collapse" id="add-sector">
                <form method="post" action="<c:url value="/registred/create_sector"/> ">
                    <div class="form-group">
                        <label for="placeListe">Choisissez un site</label>
                        <select class="form-control" name="placeList" id="placeListe">
                            <c:forEach items="${ sessionScope.places }" var="listPlace">
                                <option value="${ listPlace.placeId }">${ listPlace.placeName }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <c:import url="create_sector.jsp"/>
                    <div class="form-group">
                        <input class="btn btn-primary" type="submit" value="Valider">
                    </div>
                </form>
            </div>
            </p>
        </div>
    </div>


    <%--Création d'une nouvelle voie : liste déroulante du choix du site sur lequel sera crée la voie, liste déroulante du type de voie, liste déroulante liste secteur du site choisi --%>
    <div class="card mt-5">
        <div class="card-header">
            <h3 class="text-primary"><strong>Nouvelle voie</strong></h3>
        </div>
        <div class="card-body">
            <p>
                Ajouter une nouvelle voie sur un secteur existant ?

                <br/>
                <%-- Si pas de secteur en session, alors site n'a pas été choisi donc affichage liste déroulante choix de site--%>
            <c:if test="${empty requestScope.sectors}">
            <form method="post" action="<c:url value="/registred/create_route"/>">

                <label class="text-primary" for="liste1">Commencez par choisir le site </label>
                <select class="form-control" name="liste1" id="liste1" onchange="this.form.submit()">
                    <option value="choix">Choisissez un site</option>
                    <c:forEach items="${ sessionScope.places }" var="listPlace">
                        <option value="${ listPlace.placeId }">${ listPlace.placeName }</option>
                    </c:forEach>
                </select>
            </form>
            </c:if>
            <%-- bouton affichage des formulaires, par défaut ces formulaires ne sont pas affichés --%>
            <button class="btn btn-primary " type="button" data-toggle="collapse"
                    data-target="#add-route" aria-expanded="false" aria-controls="add-route">Par ici pour la
                suite !
            </button>
            <div class="collapse" id="add-route">
                <%--    test si site non selectionné avant de demander la suite de formulaire alors message alerte et non affichage formulaire
                        si site péalablement choisi alors affichage des chhoix suivants--%>
                <c:choose>
                    <c:when test="${not empty requestScope.sectors}">
                        <%-- liste déroulante afficahnt ensuite le formulaire adapté au type de voie via la fonction javascript chose_route_type --%>
                        <select class="form-control  my-4" name="routeType" id="routeType" onchange="chose_route_type()">
                            <option>Choisissez un type de voie</option>
                            <option value="boulder">Bloc</option>
                            <option value="singlePitch">Voie sportive</option>
                            <option value="multiPitch">Grande voie</option>
                        </select>
                        <%--import des différents formulaires selon le type de voie, non affichés au chargement --%>
                        <div id="boulder" style="display: none">
                            <c:import url="create_boulder.jsp"/>
                        </div>
                        <div id="singlePitch" style="display: none">
                            <c:import url="create_singlePitch.jsp"/>
                        </div>
                        <div id="multiPitch" style="display: none">
                            <c:import url="create_multiPitch.jsp"/>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <h3 class="alert-warning mt-4">Vous devez d'abord choisir un site!</h3>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <%--javascript pour afficher le formulaire adéquat en fonction du type de voie choisi en menu déroulant --%>
    <script type="text/javascript">
        function chose_route_type() {

            document.getElementById("boulder").style.display = "none";
            document.getElementById("singlePitch").style.display = "none";
            document.getElementById("multiPitch").style.display = "none";
            var choosen_route = document.getElementById("routeType").value;
            switch (choosen_route) {
                case 'boulder':
                    document.getElementById("boulder").style.display = "block";
                    break;
                case 'singlePitch' :
                    document.getElementById("singlePitch").style.display = "block";
                    break;
                case 'multiPitch':
                    document.getElementById("multiPitch").style.display = "block";
                    break;
            }
        }


    </script>
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
