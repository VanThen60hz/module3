<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 11/06/2023
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<c:import url="../header.jsp"></c:import>
<body>
<c:import url="../navbar.jsp"></c:import>
<h1 class="text-center">User Management</h1>
<div class="add text-center ">
    <a class="btn btn-primary" href="/users?action=create">Add New User</a>
</div>
<p style="color: red" class="text-center">${mess}</p>
<table class="table table-bordered " style="width:  70%; margin: 0 auto">
    <tr  class="text-center">
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="user" items="${listUser}">
        <tr class="text-center">
            <td><c:out value="${user.id}"/></td>
            <td><c:out value="${user.name}"/></td>
            <td><c:out value="${user.email}"/></td>
            <td><c:out value="${user.country}"/></td>
            <td>
                <div class="action" style="display: flex; justify-content: space-around">
                    <a class="btn btn-info" href="/users?action=edit&id=${user.id}">Edit</a>
                    <a class="btn btn-danger" href="/users?action=delete&id=${user.id}">Delete</a>
                </div>
            </td>
        </tr>
    </c:forEach>
</table>
<p>${myDate}</p>
<p><fmt:formatDate value="${myDate}" pattern="dd/MM/yyyy"></fmt:formatDate></p>
</body>
</html>

