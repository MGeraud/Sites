<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 01/05/2020
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%><%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

        <label for="SectorName">Nom du site : </label>
        <input type="text" id="SectorName" name="SectorName" value="<c:out value="${sector.sectorName}" />" size="60" maxlength="60" minlength="4" required/>
        <span class="error">${form.errors['sectorName']}</span>
        <br />

        <label for="sectorDescription">Description du site : </label>
        <textarea id="sectorDescription" cols="100" maxlength="3000" name="sectorDescription" rows="30" spellcheck="true" required></textarea>
        <span class="error">${form.errors['sectorDescription']}</span>
        <br />




