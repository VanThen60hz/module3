<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 07/06/2023
  Time: 20:15
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
    <a href="/products" class="btn btn-info ms-1">Back to product list</a>
</p>
<table class="table-bordered">
    <tr>
        <td>Name:</td>
        <td>${product.getName()}</td>
    </tr>
    <tr>
        <td>Price:</td>
        <td>${product.getPrice()}</td>
    </tr>
    <tr>
        <td>Quantity:</td>
        <td>${product.getQuantity()}</td>
    </tr>
    <tr>
        <td>Description:</td>
        <td>${product.getDescription()}</td>
    </tr>
</table>
</body>
</html>
