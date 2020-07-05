<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 15/05/2020
  Time: 18:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Les Amis de l'escalade</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">


</head>
<body>
<%--import de la navbar pour les pages réservées aux utilisateurs enregistrés --%>
<c:import url="registred_navbar.jsp"/>

<%-- Profil mis en avant avec image préchoisie (prévoir possibilité de charger une image personnalisée ? )
     Prévoir formulaire de modif mot de passe ou mail ? --%>
<div class="jumbotron ">
    <div class="row ">
        <div class="col-4 justify-content-center">
            <img class="rounded" src="../inc/profil.png" width="100" alt="Image profil">
        </div>
        <div class="col justify-content-center">
            <p class="lead ">
                <strong class="text-primary">Pseudonyme </strong>: <c:out value="${sessionScope.sessionUtilisateur.nickname} " />
                <br/>
                <br/>
                <strong class="text-primary">Email </strong>: <c:out value="${sessionScope.sessionUtilisateur.email}" />
            </p>
        </div>
    </div>
</div>

<h2 class="alert-warning text-center" ><strong>Vos topos</strong></h2>

<div class="container mt-5">
<%-- Vérification si le grimpeur a des topos enregistrés , si non affichage "aucun topo enregistré " , si oui affichage liste--%>
<c:choose>
    <c:when test="${  requestScope.topos.size() == 0}">
        <strong class="text-danger text-center"> <c:out value="Vous n'avez aucun topo enregistré pour le moment."/></strong>
    </c:when>
    <c:otherwise>
        <c:forEach items="${requestScope.topos}" var="bookedTopo" >
            <%-- Vérification si des topos sont en attente de réservation, si oui affichage alerte et bouton validation--%>
            <c:if test="${bookedTopo.booking}">
                <c:out value="Une demande de réservation pour le topo ${bookedTopo.topoName} a été faite, le demandeur va vous contacter, pensez à vérifier vos email. "/>
                <a href="<c:url value="/registred/bookingAccepted"><c:param name="bookedTopo" value="${bookedTopo.id}"/></c:url>">
                    <input class="btn btn-primary" type="button" value="Accepter la réservation"/>
                </a>
                <br />
            </c:if>
        </c:forEach>
            <%-- Tableau listant les topos , colonnes affichées selon la taille de l'écran--%>
            <table class="table table-striped" >
                <thead>
                <tr>
                    <th scope="col">Titre</th>
                    <th class="d-none d-md-block" scope="col">Lieu</th>
                    <th scope="col">Edition</th>
                    <th scope="col">Disponibilité</th>
                    <th scope="col">Modifier disponibilité</th>
                    <th class="d-none d-md-block" scope="col">Description</th>
                </tr>
                </thead>
                <c:forEach items="${requestScope.topos}" var="topos"  >
                    <tbody>
                    <tr>
                        <th scope="row"><c:out value="${topos.topoName}"/></th>
                        <td class="d-none d-md-block"><c:out value="${topos.topoPlace}"/> </td>
                        <td><c:out value="${topos.year}"/> </td>
                        <td><c:out value="${topos.topoAvailable ? 'Disponible' : 'Non disponible'}"/> </td>
                        <td>
                            <a href="<c:url value="/registred/updateTopoAvailability"><c:param name="topos" value="${topos.id}"/></c:url>">
                                <input type="button" value="Modifier"/>
                            </a>
                        </td>
                        <td class="d-none d-md-block"><c:out value="${topos.topoDescription}"/> </td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
    </c:otherwise>
</c:choose>
</div>
<%--Bouton d'ajout de topo qui fait apparaitre le formulaire lorsque cliqué --%>
<div class="container mt-3">
    <button class="btn btn-primary" type="button" data-toggle="collapse"
            data-target="#ajout-topo" aria-expanded="false" aria-controls="ajout-topo">Ajouter un topo
    </button>
    <div class="collapse" id="ajout-topo">
        <form method="post" action="<c:url value="/registred/addTopo"/> " name="addTopo"  >
            <fieldset class="mt-5">
                <legend class="text-primary">Merci de fournir les informations concernant le topo à ajouter</legend>
                <div class="form-group">
                <label for="topoName">Titre du topo</label>
                <input class="form-control" type="text" id="topoName" name="topoName"  size="40"  />
                <span class="error">${sessionScope.create_topo_form.errors['topoName']}</span>
                </div>
                <div class="form-group">
                <label for="topoPlace">Lieu</label>
                <input class="form-control" type="text" id="topoPlace" name="topoPlace"  size="40"  />
                </div>
                <div class="form-group">
                <label for="topoYear">Année d'édition</label>
                <input class="form-control" type="number" id="topoYear" name="topoYear" value="2020" size="4" />
                </div>
                <div class="form-group ml-4">
                <input class="form-check-input" type="checkbox" id="topoAvailable" name="topoAvailable" value="available"  >
                    <label class="form-check-label" for="topoAvailable">Disponible ?</label>
                </div>
                <div class="form-group">
                <label for="topoDescription">Description</label>
                <textarea class="form-control" id="topoDescription" cols="100" maxlength="300" name="topoDescription"  spellcheck="true" ></textarea>
                </div>
                <input class="btn btn-primary" type="submit" value="Enregistrer">
            </fieldset>
        </form>
    </div>
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
