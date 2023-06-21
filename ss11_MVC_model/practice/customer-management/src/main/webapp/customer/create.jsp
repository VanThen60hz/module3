<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 05/06/2023
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create new customer</title>
    <style>
        .message {
            color: green;
        }
    </style>
    <link rel="stylesheet" href="bootstrap5/css/bootstrap.css">
</head>
<body>
<h1>Create new customer</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/customers" class="btn btn-info ms-1">Back to customer list</a>
</p>

<form action="create" method="post">
    <fieldset>
        <legend>Customer information</legend>

        <table class="table-bordered">
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><input type="text" name="address" id="address"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Create customer"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
