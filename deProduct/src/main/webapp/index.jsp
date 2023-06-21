<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 20/06/2023
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="bootstrap-5.1.3-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="fontawesome-free-6.4.0-web/css/all.min.css">
<link rel="stylesheet" href="css/main.css">
<html>
<head>
    <title>De Product</title>
</head>
<body>
<div class="container-fluid">
    <header class="row border">
        <div class="col-9 ps-5 pt-2">
          <button class="btn btn-info text-white">
              <i class="fa-solid fa-plus"></i> Add New Product
          </button>
        </div>
        <div class="col-3 pe-5 pt-2">
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </header>

    <div class="product">
        <header class="product__header">
            <i class="fa-solid fa-list ms-2"></i> Product List
        </header>
        <div class="product__container">
            <div class="product__list m-4">
                <table class="table table-bordered">
                    <thead>
                    <th>#</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Color</th>
                    <th>Category</th>
                    <th>Action</th>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>


</div>
</body>
</html>
