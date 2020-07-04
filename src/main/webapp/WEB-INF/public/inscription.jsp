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
    <meta charset="UTF-8"/>
    <title>Les Amis de l'escalade</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
<%--Navbar avec logo et lien pour retour accueil si ne souhaite pas remplir formulaire inscription--%>
<div class="container-fluid bg-light">
    <div class="row">
        <nav class="col navbar navbar-expand-md navbar-light ">
            <a class="navbar-brand" href="<c:url value="/index"/> ">
                <img src="inc/amis_escalade.png" width="70" height="40" alt="Site logo">
                Les Amis de l'escalade
            </a>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="<c:url value="/index"/> ">Accueil</a>
                </li>
            </ul>
        </nav>
    </div>
</div>

<%-- Présentation du formulaire d'inscription dans une card --%>
<div class="container">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <div class="card-title alert">
                        <h3 class="alert-warning"><strong>Créez votre espace pour pouvoir ajouter vos spots d'escalade
                            préférés ou rechercher des topos</strong></h3>
                    </div>
                    <div class="card-text">
                        <form method="post" action="<c:url value="/inscription"/> ">
                            <fieldset>
                                <legend class="text-primary">Formulaire d'inscription</legend>
                                <label for="email">Email</label>
                                <input class="form-control" type="email" id="email" name="email"
                                       value="<c:out value="${climber.email}" />" size="40"
                                       maxlength="60" minlength="4" required/>
                                <span class=" text-danger">${form.errors['email']}</span>
                                <br/>

                                <label for="password">Mot de passe</label>
                                <input class="form-control" type="password" id="password" name="password" value=""
                                       size="40" maxlength="30" minlength="4"
                                       required/>
                                <span class="text-danger">${form.errors['password']}</span>
                                <br/>

                                <label for="confirmation">Confirmation du mot de passe</label>
                                <input class="form-control" type="password" id="confirmation" name="confirmation"
                                       value="" size="40" maxlength="30" minlength="4"
                                       required/>
                                <span class="text-danger">${form.errors['confirmation']}</span>
                                <br/>

                                <label for="nickname">Pseudonyme</label>
                                <input class="form-control" type="text" id="nickname" name="nickname"
                                       value="<c:out value="${climber.nickname}" />" size="40"
                                       maxlength="20" minlength="3" required/>
                                <span class="text-danger">${form.errors['nickname']}</span>
                                <br/>
                                <h5>Membre de l'association "Les amis de l'escalde" ?</h5>
                                <div class="form-group ml-4">
                                    <input class="form-check-input " type="checkbox" id="association" name="association"
                                           value="association">
                                    <label class="form-check-label" for="association">Si oui, cochez la case </label>
                                    <br/>
                                </div>
                                <input class="btn btn-primary" type="submit" value="S'inscrire">
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
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
