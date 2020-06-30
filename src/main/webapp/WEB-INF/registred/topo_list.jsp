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

<c:if test="${not empty sessionScope.topos}">
    <form method="post" action="<c:out value="topo_list"/>" >
        <fieldset>
            <legend>Merci d'entrer renseigner les critères de recherche </legend>
            <label for="topo_name">Titres disponibles</label>
            <select name="topo_name" id="topo_name">
                <option value="<c:out value=""/>"><c:out value="Tous les titres"/></option>
                <c:forEach items="${ sessionScope.topos }" var="topos">
                    <option value="${ topos.topoName }">${ topos.topoName }</option>
                </c:forEach>
            </select>
            <label for="topo_place">Sites traités</label>
            <select name="topo_place" id="topo_place">
                <option value="<c:out value=""/>"><c:out value="Tous les sites"/></option>
                <c:forEach items="${ sessionScope.topos }" var="topos">
                    <option value="${ topos.topoPlace }">${ topos.topoPlace }</option>
                </c:forEach>
            </select>
            <input type="submit" value="Rechercher">
        </fieldset>
    </form>
</c:if>
<c:if test="${not empty requestScope.selected_topos}">
    <form method="post" action="<c:out value="book_topo"/>">
        <table >
            <tr>
                <th>Titre</th>
                <th>Lieu</th>
                <th>Edition</th>
                <th>Disponibilité</th>
                <th>Personne à contacter</th>
                <th>Description</th>
                <th>Demande de réservation</th>
            </tr>
            <c:forEach items="${requestScope.selected_topos}" var="selected_topos" varStatus="colorLoop" >
                <tr class="${colorLoop.index % 2 == 0 ? 'pair' : 'impair'}">
                    <td><c:out value="${selected_topos.topoName}"/></td>
                    <td><c:out value="${selected_topos.topoPlace}"/> </td>
                    <td><c:out value="${selected_topos.year}"/> </td>
                    <td><c:out value="${selected_topos.topoAvailable ? 'Disponible' : 'Non disponible'}"/> </td>
                    <td><c:out value="${selected_topos.climber.email}"/></td>
                    <td><c:out value="${selected_topos.topoDescription}"/> </td>
                    <td>
                        <a href="<c:url value="/registred/book_topo"><c:param name="book_topo" value="${selected_topos.id}"/></c:url>">
                            <input type="button" value="Réserver"/>
                        </a>
                    </td>


                </tr>
            </c:forEach>
        </table>
    </form>
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
