<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gerau
  Date: 15/04/2020
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>login</title>

</head>
<body>
<%-- formulaire de connexion qui devra figurer en bandeau sur les pages d'accueil publiques --%>
<form method="post" action="<c:url value="/login"/> ">
    <fieldset>
        <legend>Connectez vous pour profiter des topos</legend>
        <label for="nickname">Pseudo</label>
        <input type="text" id="nickname" name="nickname" value="" size="20" maxlength="20" minlength="4"/>
        <br />

        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="password" value="" size="20" maxlength="20" minlength="4" />
        <br />

        <input type="submit" value="Envoyer">
    </fieldset>
</form>
</body>
</html>
