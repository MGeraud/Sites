<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<span id="spit">
    <label for="spit">Nombre de points</label>
    <input type="number" name="spit" maxlength="2" size="2">
    <label for="routeLength">Longueur de la voie</label>
    <input type="number" id="routeLength" name="routeLength" maxlength="3" size="3">m.
</span>
<input type="submit" value="Valider">