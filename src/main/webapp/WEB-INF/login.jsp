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
        <label for="Email">Email</label>
        <input type="email" id="email" name="email" value="<c:out value="${climber.email}" />" size="40" maxlength="60" minlength="4" required/>
        <span class="error">${form.errors['email']}</span>
        <br />

        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="password" value="" size="40" maxlength="30" minlength="4" required />
        <span class="error">${form.errors['password']}</span>
        <br />

        <input type="submit" value="Se connecter">
    </fieldset>
</form>
</body>
</html>
