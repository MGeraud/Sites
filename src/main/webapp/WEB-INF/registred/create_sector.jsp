<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 01/05/2020
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%><%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="form-group">
<label for="sectorName">Nom du secteur : </label>
<input class="form-control" type="text" id="sectorName" name="sectorName" value="<c:out value="${sector.sectorName}" />" size="10" maxlength="60" minlength="4" required/>
<span class="error">${sessionScope.create_sector_form.errors['sectorName']}</span>
</div>
<div class="form-group">
<label for="sectorDescription">Description du secteur : </label>
<textarea class="form-control" id="sectorDescription" cols="100" maxlength="3000" name="sectorDescription" rows="10" spellcheck="true" required></textarea>
</div>




