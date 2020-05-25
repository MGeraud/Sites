<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 25/05/2020
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Accueil</title>
</head>
<body>
<h2>Bienvenue sur la recherche se sites des amis de l'escalade</h2>
<form method="post" action="/accueil">
    <fieldset>
        <legend>Entrez les critères de vos choix pour trouver votre spot de grimpe!</legend>
    </fieldset>
</form>

<c:if test="${empty sessionScope.selected_places}">
    <table>
        <tr>
            <th>Nom du site</th>
            <th></th>
        </tr>
        <c:forEach items="${requestScope.places}" var="places" varStatus="colorLoop">
            <tr class="${colorLoop.index % 2 == 0 ? 'pair' : 'impair'}">
                <td><c:out value="${places.placeName}"/></td>
                <td><c:if test="${places.tag}"><c:out value="Site officiel les amis de l'escalade"/> </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>
