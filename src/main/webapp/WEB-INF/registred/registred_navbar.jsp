<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 30/06/2020
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- Creation de navbar responsive pour les utilisateurs enregistrés --%>

<div class="bg-light">
    <div class="container-fluid">
        <div class="row ">
            <nav class="col navbar navbar-expand-md navbar-light ">
                <a class="navbar-brand" href="<c:url value="/index"/> ">
                    <img src="../inc/amis_escalade.png" width="70" height="40" alt="Site logo">
                    Les Amis de l'escalade
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div id="navbarContent" class="collapse navbar-collapse " >
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="<c:url value="/index"/> ">Accueil</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="<c:url value="/registred/profil_topo"/> ">Profil</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="<c:url value="/registred/topo_list"/> ">Recherche de topo</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="<c:url value="/registred/create_route"/> ">Ajout de voies</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="<c:url value="/registred/logout"/> "><input type="button" class="btn btn-primary" value="Déconnexion"></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>