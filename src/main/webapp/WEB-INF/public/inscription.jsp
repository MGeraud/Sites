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
    <title>Les Amis de l'escalade</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
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
<%-- jquery, popper et bootstrap4.js pour bootstrap --%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</body>
</html>
