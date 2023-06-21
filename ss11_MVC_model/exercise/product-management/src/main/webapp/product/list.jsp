<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 07/06/2023
  Time: 02:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ProductList</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.0/css/bootstrap.min.css">

</head>
<body>
<h1 class="text-center">Products</h1>
<p class="text-center">
    <a class="btn btn-success" href="/products?action=create">Create New Product</a>
    <button type="button"
            class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal2">
        Find By Name
    </button>
</p>

<div align="center">
    <table class="table table-bordered table-hover d-flex justify-content-center">
        <tr>
            <td>Name</td>
            <td>Price</td>
            <td>Quantity</td>
            <td>Description</td>
            <td class="text-center">Edit</td>
            <td class="text-center">Delete</td>
        </tr>
        <c:forEach var="product" items='${products}'>
            <tr>
                <td><a href="products?action=view&id=${product.getId()}">${product.getName()}</a></td>
                <td>${product.getPrice()}</td>
                <td>${product.getQuantity()}</td>
                <td>${product.getDescription()}</td>
                <td>
                    <div class="d-flex justify-content-center align-items-center">
                        <a class="btn btn-success" href="/products?action=edit&id=${product.getId()}">Edit</a>
                    </div>
                </td>
                <td>
                    <div class="d-flex justify-content-center align-items-center">
                        <button type="button" onclick ="showInforDelete('${product.getId()}','${product.getName()}')"
                                class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Delete
                        </button>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/products?action=delete" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" name="id" id="id">
                    <span></span><span id="name"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- Modal  Find By Name-->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/products?action=search" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">Tìm kiếm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <span>Bạn có muốn tìm thằng này?</span><span id="name2"></span>
                    <input type="text" name="id2" id="id2">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="/webjars/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script>
    function showInforDelete(id, name) {
        document.getElementById("name").innerText = name;
        document.getElementById("id").value = id;
    }
</script>
</body>
</html>
