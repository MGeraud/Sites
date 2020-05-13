<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 01/05/2020
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form method="post" action="<c:url value="/create_place"/> " >
        <fieldset>
                <legend>Choisissez un site existant ou créez en un nouveau</legend>
        <label for="placeName">Nom du site : </label>
        <input type="text" id="placeName" name="placeName" value="<c:out value="${place.placeName}" />" size="60" maxlength="60" minlength="4" required/>
        <span class="error">${form.errors['placeName']}</span>
        <br />

        <label for="placeDescription">Description du site : </label>
        <textarea id="placeDescription" cols="100" maxlength="3000" name="placeDescription" rows="10" spellcheck="true" required></textarea>
        <span class="error">${form.errors['placeDescription']}</span>
        <br />
                <input type="submit" value="Valider">

        </fieldset>
</form>

