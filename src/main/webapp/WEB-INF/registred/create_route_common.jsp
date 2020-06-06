<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<fieldset>
    <label for="routeName">Nom de la voie :</label>
    <input type="text" name="routeName" id="routeName" maxlength="100" minlength="2">
    <label for="grade">Cotation</label>
    <input type="text" name="grade" id="grade" maxlength="6" size="6">
    <label for="routeDescription">Description</label>
    <input type="text" name="routeDescription" id="routeDescription" maxlength="300">
</fieldset>

