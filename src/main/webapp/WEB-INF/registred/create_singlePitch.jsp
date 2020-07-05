<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Vérification si un site a été choisi auparavant, si non alerter--%>
<c:choose>
    <c:when test="${not empty requestScope.sectors}">
        <form method="post" action="<c:url value="/registred/create_singlePitch"/>">
            <div class="form-group">
            <select class="form-control" name="liste2" id="liste2" required>
                <c:forEach items="${requestScope.sectors}" var="listSector">
                    <option value="${listSector.id}">${listSector.sectorName}</option>
                </c:forEach>
            </select>
            </div>
            <c:import url="create_route_common.jsp"/>
            <div class="form-group">
                <label for="spit">Nombre de points</label>
                <input class="form-control" type="number" name="spit" id="spit" maxlength="2" size="2" value="2">
            </div>
            <div class="form-group">
                <label for="routeLength">Longueur de la voie</label>
                <input class="form-control" type="number" id="routeLength" name="routeLength" maxlength="3" size="3" value="2">m.            </div>
            <input class="btn btn-primary" type="submit" value="Valider">
        </form>
    </c:when>
    <c:otherwise>
        <h4 class="alert-danger">Merci de choisir d'abord un site dans le menu déroulant</h4>
    </c:otherwise>
</c:choose>
