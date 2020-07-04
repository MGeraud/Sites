<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 25/05/2020
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Les Amis de l'escalade</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

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
<%-- Récupération de la navbar selon si connecté ou non --%>
<c:choose>
    <c:when test="${not empty sessionScope.sessionUtilisateur}">
        <c:import url="navbar.jsp"/>
    </c:when>
    <c:otherwise>
        <c:import url="login.jsp"/>
    </c:otherwise>
</c:choose>


<%-- récupération et affichage du nom et de la description du site --%>
<div class="jumbotron">
    <h1 class="alert-warning"><strong><c:out value="${sessionScope.place.placeName}"/></strong></h1>
    <p class="lead">
        <%--Vérification si le site est tag comme site officiel de l'association , si oui affichage du logo --%>
        <c:if test="${sessionScope.place.tag}">
    <h2><c:out value="Site officiel    "/></h2>
    <img src="inc/amis_escalade.png" height="80" alt="Site logo">
    </c:if>
    <%--Bouton de modification du tag pour les membres de l'association --%>
    <c:if test="${not empty sessionScope.sessionUtilisateur}">
        <c:if test="${sessionScope.sessionUtilisateur.association}">
            <a href="<c:url value="/updatePlaceTag"><c:param name="updatePlaceTag" value="${sessionScope.place.placeId}"/></c:url>">
                <input class="btn btn-primary ml-auto" type="button" value="Modifier Tag"/>
            </a>
        </c:if>
    </c:if>
    </p>
    <hr class="my-3">
    <p><c:out value="${sessionScope.place.placeDescription}"/></p>
</div>
<div>
    <%-- récupération et affichage des secteurs et voies du site --%>
    <h2 class="alert-warning pl-4"><strong>Secteurs</strong></h2><h6 class="alert-warning">(cliquez sur un secteur pour
    voir
    apparaître toutes les voies de celui-ci)</h6>
    <br/>
    <%-- récupération et affichage des secteurs et voies du site --%>
    <c:forEach items="${sessionScope.sectors}" var="visitedSectors">
        <%-- Création de l'accordion pour les secteurs --%>
        <div class="accordion" id="sectorsAccordion-${visitedSectors.id}" role="tablist">
            <div class="card">
                    <%-- titre qui servira de zone à cliquer pour dérouler --%>
                <div class="card-header border border-primary m-1" id="sectorCard-${visitedSectors.id}" role="tab">
                    <a data-toggle="collapse" data-parent="#sectorsAccordion-${visitedSectors.id}"
                       href="#hiddenRoutes-${visitedSectors.id}" aria-expanded="false"
                       aria-controls="hiddenRoutes" class="stretched-link">
                        <h3><strong><c:out value="${visitedSectors.sectorName}"/></strong></h3>
                        <hr class="my-3">
                        <c:out value="${visitedSectors.sectorDescription}"/>
                        <br/>
                    </a>
                </div>
                    <%-- Partie cachée / affichée (liste des voies du secteurs) --%>
                <div id="hiddenRoutes-${visitedSectors.id}" class="collapse hide" role="tabpanel"
                     aria-labelledby="sectorCard-${visitedSectors.id}"
                     data-parent="#sectorsAccordion-${visitedSectors.id}">
                    <div class="card-body">
                        <table class="table table-striped table-bordered">
                            <thead class="text-primary">
                            <tr>
                                <th scope="col">Nom de la voie</th>
                                <th scope="col">Type de voie</th>
                                <th scope="col">Cotation</th>
                                <th scope="col">Description</th>
                            </tr>
                            </thead>
                            <tbody>
                                <%--boucle interne pour qu'aparaissent les voies liées au secteur affiché --%>
                            <c:forEach items="${visitedSectors.routes}" var="visitedRoutes">
                                <tr>
                                    <th scope="row"><c:out value="${visitedRoutes.routeName}"/></th>
                                    <td><c:out value="${visitedRoutes.routeType}"/></td>
                                    <td><c:out value="${visitedRoutes.grade}"/></td>
                                    <td><c:out value="${visitedRoutes.routeDescription}"/></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <br/>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<%-- Vérification si utilisateur enregistré pour affichage ou non de l'ajout de commentaire--%>
<c:if test="${not empty sessionScope.sessionUtilisateur}">
    <div>
            <%-- Formulaire d'ajout de commentaire pour le site affiché --%>
        <form class="border border-primary m-1" method="post" action="<c:url value="placeDescription"/> ">
            <label for="addComment"><h5 class="text-primary m-3">Entrez votre commentaire </h5></label>
            <br/>
            <textarea class="form-control mx-3 w-75" id="addComment" maxlength="280" rows="5"
                      name="addComment"></textarea>
            <br/>
            <input class="btn btn-primary m-3" type="submit" value="Enregistrer">
        </form>
    </div>

</c:if>

<%--Affichage des commentaires sur le site s'il y en a --%>
<c:if test="${not empty sessionScope.coms}">
    <div class="mt-3">
        <fieldset>
            <legend class="alert-warning pl-4"><strong>Commentaires</strong></legend>
            <div class="row">
                    <c:forEach items="${sessionScope.coms}" var="comments">
                        <div class="col-12 col-md-4 col-lg-3">
                         <div class="card border border-primary m-1 ">
                             <div class="card-header">
                                <h4>De : <c:out value="${comments.climber.nickname}"/></h4>
                             </div>
                             <div class="card-body">
                                <p><c:out value="${comments.comment}"/></p>
                            </div>
                            <div class="card-footer">
                                <c:if test="${not empty comments.modifiedBy}">
                                    <h6>Modifié par : <c:out value="${comments.modifiedBy}"/></h6>
                                    <br/>
                                </c:if>

                                <c:if test="${not empty sessionScope.sessionUtilisateur}">
                                    <c:if test="${sessionScope.sessionUtilisateur.association}">
                                        <%-- mettre en place script pour afficher formulaire modif --%>
                                        <button class="btn btn-primary" type="button" data-toggle="collapse"
                                            data-target="#modifications-${comments.id}" aria-expanded="false" aria-controls="modifications-${comments.id}">Modifier
                                        </button>
                                        <a href="<c:url value="/deleteComment"><c:param name="comId" value="${comments.id}"/></c:url>">
                                            <input class="btn btn-primary" type="button" value="Supprimer"/>
                                        </a>
                                        <br/>
                                        <div class="collapse" id="modifications-${comments.id}">
                                            <form method="post" action="<c:url value="updateComment"/> ">
                                                <label for="modifiedComment">Modifier le commentaire </label>
                                                <br/>
                                                <input type="hidden" name="comId" value="${comments.id}"/>
                                                <textarea id="modifiedComment" maxlength="280" rows="5" name="modifiedComment"><c:out value="${comments.comment}"/> </textarea>
                                                <input class="btn btn-primary" type="submit" value="Enregistrer les modifications">
                                            </form>
                                        </div>
                                    </c:if>
                                </c:if>
                            </div>
                         </div>
                        </div>
                    </c:forEach>
                </div>

        </fieldset>
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
