<%--
  Created by IntelliJ IDEA.
  User: geraud
  Date: 15/06/2020
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Update comment.jsp</title>
</head>
<body>
<form method="post" action="<c:url value="updateComment"/> ">
    <label for="modifiedComment">Modifier le commentaire </label>
    <br/>
    <input hidden name="">
    <textarea id="modifiedComment" maxlength="280" rows="5" name="modifiedComment" ><c:out value="${comments.comment}"/> </textarea>
    <input type="submit" value="Enregistrer les modifications"  >
</form>

</body>
</html>
