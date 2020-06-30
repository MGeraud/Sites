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

    <style type="text/css">
        tr.pair{
            background-color: #d7d6d6;
        }
        tr.impair{
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<%--import de la navbar pour les pages réservées aux utilisateurs enregistrés --%>
<c:import url="registred_navbar.jsp"/>

<H2><c:out value="${sessionScope.sessionUtilisateur.nickname} : liste de vos Topos." /></H2>
<br />
<c:choose>
    <c:when test="${  requestScope.topos.size() == 0}">
        <c:out value="Vous n'avez aucun topo enregistré pour le moment."/>
    </c:when>
    <c:otherwise>
        <c:forEach items="${requestScope.topos}" var="bookedTopo" varStatus="colorLoop" >
            <c:if test="${bookedTopo.booking}">
                <c:out value="Une demande de réservation pour le topo ${bookedTopo.topoName} a été faite, le demandeur va vous contacter par email. "/>
                <a href="<c:url value="/registred/bookingAccepted"><c:param name="bookedTopo" value="${bookedTopo.id}"/></c:url>">
                    <input type="button" value="Accepter la réservation"/>
                </a>
                <br />
            </c:if>
        </c:forEach>


            <table >
                <tr>
                    <th>Titre</th>
                    <th>Lieu</th>
                    <th>Edition</th>
                    <th>Disponibilité</th>
                    <th>Modifier disponibilité</th>
                    <!--<th>Réservation en attente</th> -->
                    <th>Description</th>
                </tr>
                <c:forEach items="${requestScope.topos}" var="topos" varStatus="colorLoop" >
                    <tr class="${colorLoop.index % 2 == 0 ? 'pair' : 'impair'}">
                        <td><c:out value="${topos.topoName}"/></td>
                        <td><c:out value="${topos.topoPlace}"/> </td>
                        <td><c:out value="${topos.year}"/> </td>
                        <td><c:out value="${topos.topoAvailable ? 'Disponible' : 'Non disponible'}"/> </td>
                        <td>
                            <a href="<c:url value="/registred/updateTopoAvailability"><c:param name="topos" value="${topos.id}"/></c:url>">
                                <input type="button" value="Modifier"/>
                            </a>
                        </td>
                        <td><c:out value="${topos.topoDescription}"/> </td>
                    </tr>
                </c:forEach>
            </table>

    </c:otherwise>
</c:choose>
<br/>
<span class="error">${sessionScope.create_topo_form.errors['topoName']}</span>
<br/>


<div id="addTopo" style="display: none">
<form method="post" action="<c:url value="/registred/addTopo"/> " name="addTopo"  >
    <fieldset>
        <legend>Merci de fournir les informations concernant le topo à ajouter</legend>
        <label for="topoName">Titre du topo</label>
        <input type="text" id="topoName" name="topoName"  size="40"  />


        <label for="topoPlace">Lieu</label>
        <input type="text" id="topoPlace" name="topoPlace"  size="40"  />

        <label for="topoYear">Année d'édition</label>
        <input type="number" id="topoYear" name="topoYear" value="2020" size="4" />

        <label for="topoAvailable">Disponible ?</label>
        <input type="checkbox" id="topoAvailable" name="topoAvailable" value="available"  >
        <br />

        <label for="topoDescription">Description</label>
        <textarea id="topoDescription" cols="100" maxlength="300" name="topoDescription"  spellcheck="true" ></textarea>
        <br/>
        <input type="submit" value="Enregistrer">
    </fieldset>
</form>
</div>
<input type="button" name="Add" value="Ajouter" id="Add" onclick="display_add_form()">
<script type="text/javascript">
    function display_add_form() {

        document.getElementById("addTopo").style.display="block";
        document.getElementById("Add").style.display="none";

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
