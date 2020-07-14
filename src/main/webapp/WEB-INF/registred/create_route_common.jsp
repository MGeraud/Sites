<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- partie de formulaire commun à tous les types de voies--%>
<div class="form-group">
    <label for="routeName">Nom de la voie :</label>
    <input class="form-control" type="text" name="routeName" id="routeName" maxlength="100" minlength="2">
</div>
<div class="form-group">
    <label for="grade">Cotation</label>
    <input class="form-control" type="text" name="grade" id="grade" maxlength="6" size="6">
</div>
<div class="form-group">
    <label for="routeDescription">Description</label>
    <input class="form-control" type="text" name="routeDescription" id="routeDescription" maxlength="300">
</div>
