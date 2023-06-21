<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 07/06/2023
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
    <link rel="stylesheet" href="bootstrap5/css/bootstrap.css">
</head>
<body>
<h1 class="text-center">Edit this product</h1>

<p class="text-center">
    <a href="/products" class="btn btn-info ms-1 text-ce">Back to products</a>
</p>

<form action="/products?action=edit" method="post">
    <fieldset>
        <legend class="text-center">Product information</legend>

        <table class="table table-bordered d-flex justify-content-center">
            <tr>
                <td>Id</td>
                <td>
                    <c:if test = "${message != null}">
                        <p style="color: red"><c:out value="${message}"></c:out></p>
                    </c:if>
                    <input type="text" name="id" value="${product.getId()}">
                </td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="text" name="price" id="price" value="${product.getPrice()}"></td>
            </tr>
            <tr>
                <td>Quantity</td>
                <td><input type="text" name="quantity" id="quantity" value="${product.getQuantity()}"></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><textarea name="description" id="description">${product.getDescription()}</textarea></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Update Product"></td>
            </tr>
        </table>

    </fieldset>
</form>
</body>
</html>
