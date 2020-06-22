<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form method="post" action="<c:url value="/registred/create_multiPitch"/>">
    <c:if test="${not empty requestScope.sectors}">
                <select name="liste2" id="liste2" required>
                    <c:forEach items="${requestScope.sectors}" var="listSector">
                        <option value="${listSector.id}">${listSector.sectorName}</option>
                    </c:forEach>
                </select>
    </c:if>
    <c:import url="create_route_common.jsp"/>

    <label for="numberOfPitch">Nombre de relais</label>
    <input type="number" name="numberOfPitch" id="numberOfPitch" maxlength="2" size="2" value="2">
    <input type="submit" value="Valider">
</form>