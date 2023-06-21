<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 16/06/2023
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Furama Resort</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <header class="row border">
        <div class="col-9 ps-5 pt-2">
            Logo
        </div>
        <div class="col-3 pe-5 pt-2">
            <label class="float-end">Nguyen Van A </label>
        </div>
    </header>

    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="height:50px">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 ms-5 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="employee">Employee</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="customer">Customer</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="service">Service</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contract">Contract</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
    <main class="row border">
        <div class="col-2 border">
            <nav class="nav flex-column">
                <a class="nav-link active" aria-current="page" href="#">Item One</a>
                <a class="nav-link" href="#">Item Two</a>
                <a class="nav-link" href="#">Item Three</a>
            </nav>
        </div>
        <div class="col-10">

        </div>
    </main>
    <footer class="row border">
        Footer
    </footer>
</div>

<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>