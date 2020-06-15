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
    <title>Place presentation</title>
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
<div>
    <%-- récupération et affichage du nom et de la description du site --%>
    <table>
        <tr>
            <th>
                <h1><c:out value="${sessionScope.place.placeName}" /></h1>
            </th>
        </tr>
        <tr>
            <td>
                <c:out value="${sessionScope.place.placeDescription}"/>
            </td>
        </tr>
    </table>
<br />
        <%--Vérification si le site est tag comme site officiel de l'association , si oui affichage du logo --%>
<c:if test="${sessionScope.place.tag}" >
    <h1><c:out value="YOUHOU C'EST TAGGUÉ !!!!"/></h1>
</c:if>
        <%--Bouton de modification du tag pourles membres de l'association --%>
    <a href="<c:url value="/updatePlaceTag"><c:param name="updatePlaceTag" value="${sessionScope.place.placeId}"/></c:url>">
        <input type="button" value="Modifier Tag"/>
    </a>
</div>
<div>
    <%-- récupération et affichage des secteurs et voies du site --%>

    <h2>Secteurs</h2>
    <br/>
    <c:forEach items="${sessionScope.sectors}" var="visitedSectors">
        <h3><c:out value="${visitedSectors.sectorName}"/></h3>

        <c:out value="${visitedSectors.sectorDescription}"/>
        <br/>
        <table>
            <tr>
                <th>Nom</th>
                <th>Type de voie</th>
                <th>Cotation</th>
                <th>Description</th>
                <th></th>
            </tr>
            <%--boucle interne pour qu'aparaissent les voies liées au secteur affiché --%>
        <c:forEach items="${visitedSectors.routes}" var="visitedRoutes" varStatus="colorLoop">
            <tr class="${colorLoop.index % 2 == 0 ? 'pair' : 'impair'}">
                <td><c:out value="${visitedRoutes.routeName}"/> </td>
                <td><c:out value="${visitedRoutes.routeType}"/> </td>
                <td><c:out value="${visitedRoutes.grade}"/> </td>
                <td><c:out value="${visitedRoutes.routeDescription}"/> </td>
            </c:forEach>
        </table>
        <br/>
    </c:forEach>
</div>
<div>
    <%-- Formulaire d'ajout de commentaire pour le site affiché --%>
    <form method="post" action="<c:url value="placeDescription"/> ">
        <label for="addComment">Entrez votre commentaire </label>
        <br/>
        <textarea id="addComment" maxlength="280" rows="5" name="addComment" ></textarea>
        <input type="submit" value="Enregistrer"  >
    </form>
</div>
<div>
    <%--Affichage des commentaires sur le site s'il y en a --%>
    <c:if test="${not empty sessionScope.coms}">


                <c:forEach items="${sessionScope.coms}" var="comments">
                    <fieldset>
                    <legend>Commentaire de : <c:out value="${comments.climber.nickname}"/></legend>
                    <table>
                        <tr>
                             <td><c:out value="${comments.comment}"/></td>
                        </tr>
                            <c:if test="${not empty comments.modifiedBy}">
                        <tr>
                            <td>Modifié par : <c:out value="${comments.modifiedBy}"/></td>
                        </tr>
                            </c:if>
                        <tr>
                            <td>
                                <a href="<c:url value="/updateComment"><c:param name="comId" value="${comments.id}"/></c:url>">
                                    <input type="button" value="Modifier"/>
                                </a>
                            </td>
                            <td>
                                <a href="<c:url value="/deleteComment"><c:param name="comId" value="${comments.id}"/></c:url>">
                                    <input type="button" value="Supprimer"/>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                     <form method="post" action="<c:url value="updateComment"/> ">
                                         <label for="modifiedComment">Modifier le commentaire </label>
                                         <br/>
                                         <input type="hidden" name="comId" value="${comments.id}"/>
                                         <textarea id="modifiedComment" maxlength="280" rows="5" name="modifiedComment" ><c:out value="${comments.comment}"/> </textarea>
                                         <input type="submit" value="Enregistrer les modifications"  >
                                     </form>
                            </td>
                        </tr>
                    </table>
                    </fieldset>
                </c:forEach>


    </c:if>
</div>
</body>
</html>
