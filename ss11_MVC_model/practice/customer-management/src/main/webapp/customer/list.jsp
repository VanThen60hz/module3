<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 05/06/2023
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="bootstrap5/css/bootstrap.css">
</head>
<body>
<h1 style="text-align: center">Customers</h1>
<p style="text-align: center">
    <a class="btn btn-success" href="/customers?action=create">Create new customer</a>
</p>
<div align="center">
    <table class="table table-bordered table-hover" style="width: 90%">
        <tr>
            <td>Name</td>
            <td>Email</td>
            <td>Address</td>
            <td class="text-center">Edit</td>
            <td class="text-center">Delete</td>
        </tr>

        <c:forEach var="customer" items='${customers}'>
            <tr>
                <td><a href="customers?action=view&id=${customer.getId()}">${customer.getName()}</a></td>
                <td>${customer.getEmail()}</td>
                <td>${customer.getAddress()}</td>
                <td>
                    <div class="d-flex justify-content-center align-items-center">
                        <a class="btn btn-primary" href="/customers?action=edit&id=${customer.getId()}">edit</a>
                    </div>
                </td>
                <td>
                    <div class="d-flex justify-content-center align-items-center">
                        <a class="btn btn-danger" href="/customers?action=delete&id=${customer.getId()}">delete</a>
                    </div>
                </td>
            </tr>
        </c:forEach>


    </table>
</div>
</body>
</html>
