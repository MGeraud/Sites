<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 27/04/2020
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <meta charset="UTF-8" />
    <title>Inscription</title>
</head>
<body>
<form method="post" action="<c:url value="/inscription"/> ">
    <fieldset>
        <legend>Créez votre espace pour profiter ajouter vos spots d'escalade préférés ou rechercher des topos</legend>
        <label for="Email">Email</label>
        <input type="email" id="email" name="email" value="<c:out value="${climber.email}" />" size="40" maxlength="60" minlength="4" required/>
        <span class="error">${form.errors['email']}</span>
        <br />

        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="password" value="" size="40" maxlength="30" minlength="4" required />
        <span class="error">${form.errors['password']}</span>
        <br />

        <label for="confirmation">Confirmation du mot de passe</label>
        <input type="password" id="confirmation" name="confirmation" value="" size="40" maxlength="30" minlength="4" required/>
        <span class="error">${form.errors['confirmation']}</span>
        <br />

        <label for="nickname">Pseudonyme</label>
        <input type="text" id="nickname" name="nickname" value="<c:out value="${climber.nickname}" />" size="40" maxlength="20" minlength="3" required />
        <span class="error">${form.errors['nickname']}</span>
        <br />

        <label for="association">Membre de l'association "Les amis de l'escalde ?</label>
        <input type="checkbox" id="association" name="association" value="association" >
        <br />

        <input type="submit" value="S'inscrire">
    </fieldset>
</form>

</body>
</html>
