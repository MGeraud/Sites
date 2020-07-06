<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 01/05/2020
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<div class="card">
    <div class="card-header">
        <h3 class="text-primary"><strong>Nouveau site</strong></h3>
    </div>
    <div class="card-body">
        <p>
            Envie de Créer un nouveau site ?
            <button class="btn btn-primary" type="button" data-toggle="collapse"
                    data-target="#ajout-site" aria-expanded="false" aria-controls="ajout-site">Afficher le formulaire
            </button>
        <div class="collapse" id="ajout-site">
            <form method="post" action="<c:url value="/registred/create_place"/> ">
                <div class="form-group">
                    <label for="regions">Choisissez une région</label>
                    <select class="form-control" name="regions" id="regions">
                        <c:forEach items="${sessionScope.regions}" var="regions">
                            <option value="${regions.value}">${regions.key}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="placeName">Nom du site : </label>
                    <input class="form-control" type="text" id="placeName" name="placeName"
                           value="<c:out value="${place.placeName}" />" size="60"
                           maxlength="60" minlength="4" required/>
                    <span class="error">${sessionScope.create_place_form.errors['placeName']}</span>
                </div>
                <div class="form-group">
                    <label for="placeDescription">Description du site : </label>
                    <textarea class="form-control" id="placeDescription" cols="100" maxlength="3000"
                              name="placeDescription" rows="10" spellcheck="true"
                              required></textarea>
                </div>
                <div class="form-group">
                    <input class="btn btn-primary" type="submit" value="Valider">
                </div>
            </form>
        </div>
        </p>
    </div>

</div>



