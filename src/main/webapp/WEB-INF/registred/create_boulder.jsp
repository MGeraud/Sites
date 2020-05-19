<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form method="post" action="<c:url value="create_boulder"/>">
    <c:if test="${not empty requestScope.sectors}">
        <select name="liste2" id="liste2" required>
            <c:forEach items="${requestScope.sectors}" var="listSector">
                <option value="${listSector.id}">${listSector.sectorName}</option>
            </c:forEach>
        </select>
    </c:if>
    <c:import url="create_route_common.jsp"/>

    <label for="sitStart">Depart assis</label>
    <input type="checkbox" name="sitStart" id="sitStart">
    <input type="submit" value="Valider">
</form>