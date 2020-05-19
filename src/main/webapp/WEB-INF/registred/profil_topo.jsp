<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 15/05/2020
  Time: 18:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profil et Topos</title>
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
<H2><c:out value="${sessionScope.sessionUtilisateur.nickname} : liste de vos Topos." /></H2>
<br />
<c:choose>
    <c:when test="${  requestScope.topos.size() == 0}">
        <c:out value="Vous n'avez aucun topo enregistré pour le moment."/>
    </c:when>
    <c:otherwise>
        <form method="post"  action="<c:url value="updateTopoAvailability"/>" >
            <table >
                <tr>
                    <th>Titre</th>
                    <th>Lieu</th>
                    <th>Edition</th>
                    <th>Disponibilité</th>
                    <th>Modifier disponibilité</th>
                    <th>Description</th>
                </tr>
                <c:forEach items="${requestScope.topos}" var="topos" varStatus="colorLoop" >
                    <tr class="${colorLoop.index % 2 == 0 ? 'pair' : 'impair'}">
                        <td><c:out value="${topos.topoName}"/></td>
                        <td><c:out value="${topos.topoPlace}"/> </td>
                        <td><c:out value="${topos.year}"/> </td>
                        <td><c:out value="${topos.topoAvailable ? 'Disponible' : 'Non disponible'}"/> </td>
                        <td><input name="topos" id="topos" type="hidden" value="<c:out value="${topos.id}"/>"><input type="button" name="changeAvailable" id="changeAvailable" value="Modifier" onclick="this.form.submit()" ></td>
                        <td><c:out value="${topos.topoDescription}"/> </td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </c:otherwise>
</c:choose>


<div id="addTopo" style="display: none">
<form method="post" action="<c:url value="/addTopo"/> " name="addTopo"  >
    <fieldset>
        <legend>Merci de fournir les informations concernant le topo à ajouter</legend>
        <label for="topoName">Titre du topo</label>
        <input type="text" id="topoName" name="topoName"  size="40"  required/>

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

    }


</script>
</body>
</html>