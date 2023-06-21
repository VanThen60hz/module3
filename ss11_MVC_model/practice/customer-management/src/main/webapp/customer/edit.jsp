<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 06/06/2023
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit customer</title>
    <link rel="stylesheet" href="bootstrap5/css/bootstrap.css">
</head>
<body>
<h1>Edit customer</h1>
<p>
    <c:if test ='${requestScope["message"] != null}'>
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/customers" class="btn btn-info ms-1">Back to customer list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table class="table-bordered">
            <input type="text" name="name" id="name" value="${requestScope["customer"].getName()}">

            <tr>
                <td>Email: </td>
                <td><input type="text" name="email" id="email" value="${requestScope["customer"].getEmail()}"></td>
            </tr>
            <tr>
                <td>Address: </td>
                <td><input type="text" name="address" id="address" value="${requestScope["customer"].getAddress()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update customer"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
