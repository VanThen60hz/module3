<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 07/06/2023
  Time: 00:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting customer</title>
    <link rel="stylesheet" href="bootstrap5/css/bootstrap.css">
</head>
<body>
<h1 class="text-center">Delete customer</h1>
<p class="text-center">
    <a href="/customers" class="btn btn-info">Back to customer list</a>
</p>

<form method="post">
    <h3 class="text-center">Are you sure?</h3>
    <fieldset>
        <legend class="text-center">Customer information</legend>
        <table class="table-bordered d-flex justify-content-center">
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
            <tr>
                <td colspan="2"><input type="submit" value="Delete customer"></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
