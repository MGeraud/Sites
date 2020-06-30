<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: gerau
  Date: 15/04/2020
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>

<%-- formulaire de connexion qui devra figurer en bandeau sur les pages d'accueil publiques --%>
<div class="bg-light">
    <div class="container-fluid">
        <div class="row ">
            <nav class="col navbar navbar-expand-lg navbar-light ">
                <a class="navbar-brand" href="<c:url value="/index"/> ">
                    <img src="inc/amis_escalade.png" width="70" height="40" alt="Site logo">
                    Les Amis de l'escalade
                </a>
                <%-- bouton pour menu burger quand largeur inférieure aux grands écrans --%>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <%--Contenu à placer dans le menu hamburger --%>
                <div id="navbarContent" class="collapse navbar-collapse " >
                <form class="form-inline ml-auto " method="post" action="<c:url value="/login"/> "> <%-- les champs formulaires sur une seule ligne --%>
                    <legend class="text-primary">Connectez vous pour profiter de toutes les fonctionnalités</legend>

                    <input class="form-control  " type="email" id="email" name="email" value="<c:out value="${climber.email}" />" minlength="4"
                            placeholder="Email" required/>
                    <span class="text-danger mx-lg-1">${form.errors['email']}</span>

                    <input class="form-control  " type="password" id="password" name="password" value="" minlength="4" placeholder="Mot de passe" required/>
                    <span class="text-danger mx-lg-1">${form.errors['password']}</span>

                    <input class="btn btn-primary  mx-lg-2" type="submit" value="Se connecter">
                </form>
                </div>
            </nav>
        </div>
    </div>
</div>


