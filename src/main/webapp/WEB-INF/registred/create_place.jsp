<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 01/05/2020
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>

<form method="post" action="<c:url value="/registred/create_place"/> ">
        <fieldset>
                <legend>Créez un nouveau site</legend>
                <label for="regions">Choisissez une région</label>
                <select name="regions" id="regions">
                        <c:forEach items="${sessionScope.regions}" var="regions">
                                <option  value="${regions.value}">${regions.key}</option>
                        </c:forEach>
                </select>
                <br/>
        <label for="placeName">Nom du site : </label>
        <input type="text" id="placeName" name="placeName" value="<c:out value="${place.placeName}" />" size="60"
               maxlength="60" minlength="4" required/>
        <span class="error">${sessionScope.create_place_form.errors['placeName']}</span>
        <br/>

        <label for="placeDescription">Description du site : </label>
        <textarea id="placeDescription" cols="100" maxlength="3000" name="placeDescription" rows="10" spellcheck="true"
                  required></textarea>
        <br/>
                <br/>
                <input type="submit" value="Valider">
        </fieldset>
</form>




