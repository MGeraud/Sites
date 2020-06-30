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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
    <%--import de la navbar pour les pages réservées aux utilisateurs enregistrés --%>
    <c:import url="registred_navbar.jsp"/>

    <%--Création d'un nouveau site : import du formulaire de création de site --%>
    <div id="newPlace">

            <c:import url="create_place.jsp"/>

    </div>

    <%--Création secteur : liste déroulante pour le choix du site avant création de secteur et import du formulaire de remplissage détail du secteur --%>
    <div id="newSector">
        <form method="post" action="<c:url value="/registred/create_sector"/> ">
            <fieldset>
                <legend>Créez un nouveau secteur</legend>
                <label for="placeListe">Choisissez un site</label>
                <select name="placeList" id="placeListe">
                    <c:forEach items="${ sessionScope.places }" var="listPlace">
                        <option value="${ listPlace.placeId }">${ listPlace.placeName }</option>
                    </c:forEach>
                </select>

                <c:import url="create_sector.jsp"/>
                <br />
                <input type="submit" value="Valider">
            </fieldset>
        </form>
    </div>
    <div>

</div>

    <%--Création d'une nouvelle voie : liste déroulante du choix du site sur lequel sera crée la voie, liste déroulante du type de voie, liste déroulante liste secteur du site choisi --%>
    <div>

        <fieldset>

            <legend>Renseignez les différents champs selon le type de voie choisie</legend>
            <form method="post" action="<c:url value="/registred/create_route"/>" >

                    <label for="liste1" >Choisissez un site</label>
                    <select name="liste1" id="liste1" onchange="this.form.submit()" >
                        <option value="choix">Choisissez un site</option>
                        <c:forEach items="${ sessionScope.places }" var="listPlace">
                            <option value="${ listPlace.placeId }">${ listPlace.placeName }</option>
                        </c:forEach>
                    </select>
            </form>

            <%-- liste déroulante afficahnt ensuite le formulaire adapté au type de voie via la fonction javascript chose_route_type --%>
            <select name="routeType" id="routeType" onchange="chose_route_type()">
                <option >Choisissez un type de voie</option>
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

        </fieldset>

    </div>

<%--javascript pour afficher le formulaire adéquat en fonction du type de voie choisi en menu déroulant --%>
<script type="text/javascript">
    function chose_route_type() {

        document.getElementById("boulder").style.display="none";
        document.getElementById("singlePitch").style.display="none";
        document.getElementById("multiPitch").style.display="none";
        var choosen_route = document.getElementById("routeType").value;
        switch (choosen_route) {
            case 'boulder':
                document.getElementById("boulder").style.display="block";
                break;
            case 'singlePitch' :
                document.getElementById("singlePitch").style.display="block";
                break;
            case 'multiPitch':
                document.getElementById("multiPitch").style.display="block";
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
