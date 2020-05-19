<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form method="post" action="<c:url value="create_singlePitch"/>">
    <c:if test="${not empty requestScope.sectors}">
                <select name="liste2" id="liste2" required>
                    <c:forEach items="${requestScope.sectors}" var="listSector">
                        <option value="${listSector.id}">${listSector.sectorName}</option>
                    </c:forEach>
                </select>
    </c:if>
    <c:import url="create_route_common.jsp"/>

    <label for="spit">Nombre de points</label>
    <input type="number" name="spit" id="spit" maxlength="2" size="2">
    <label for="routeLength">Longueur de la voie</label>
    <input type="number" id="routeLength" name="routeLength" maxlength="3" size="3">m.
    <input type="submit" value="Valider">
</form>