<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 07/06/2023
  Time: 01:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View customer</title>
    <link rel="stylesheet" href="bootstrap5/css/bootstrap.css">
</head>
<body>
<h1>Customer detail</h1>
<p>
    <a href="/customers" class="btn btn-info ms-1">Back to customer list</a>
</p>
<table class="table-bordered">
    <tr>
        <td>Name:</td>
        <td>${requestScope["customer"].getName()}</td>
    </tr>
    <tr>
        <td>Email:</td>
        <td>${requestScope["customer"].getEmail()}</td>
    </tr>
    <tr>
        <td>Address:</td>
        <td>${requestScope["customer"].getAddress()}</td>
    </tr>
</table>
</body>
</html>
