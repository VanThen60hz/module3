<%@ page import="model.Customer" %>
<%@ page import="java.util.stream.IntStream" %>
<%@ page import="util.Page" %>
<%@ page import="java.util.stream.Collectors" %><%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 16/06/2023
  Time: 18:32
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
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
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
            <div class="table-title mt-3">
                <div class="row">
                    <div class="col">
                        <h3><b>Customer</b></h3>
                    </div>
                    <div class="col-4">
                        <button onclick="resetCustomerForm()" class="btn btn-success float-end me-2"
                                data-bs-toggle="modal"
                                data-bs-target="#addEditModal">Add New
                        </button>
                    </div>
                </div>
            </div>

            <table class="table">
                <thead>
                <th>#</th>
                <th>Full Name</th>
                <th>Birthday</th>
                <th>Email</th>
                <th>Customer Type</th>
                <th>Action</th>
                </thead>
                <tbody>
                <c:forEach items="${result.getContent()}" var="c" varStatus="i">
                    <tr>
                        <td>${i.count + (result.getNumber() -1) * result.getPageSize()}</td>
                        <td>${c.fullName}</td>
                        <td>${c.birthday}</td>
                        <td>${c.email}</td>
                        <td>${c.customerType.name}</td>
                        <td>
                            <button onclick="showEditCustomer('${c.id}', '${c.fullName}', '${c.birthday}', '${c.gender}'
                                    , '${c.identifyNumber}', '${c.phone}', '${c.email}', '${c.address}', '${c.customerTypeId}')"
                                    class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addEditModal">Edit
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="modal fade" id="addEditModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog">
                    <form method="post" action="/customer">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Create Customer</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <input name="id" hidden value="0">
                                <div class="mb-3">
                                    <label class="form-label">Full Name</label>
                                    <input class="form-control" name="fullName"/>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Birthday</label>
                                    <input type="date" class="form-control" name="birthday"/>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Gender</label>
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="rdMale" name="gender"
                                               value="true">Male
                                        <label class="form-check-label" for="rdMale"></label>
                                    </div>
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="rdFemale" name="gender"
                                               value="false">Female
                                        <label class="form-check-label" for="rdFemale"></label>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Identify Number</label>
                                    <input class="form-control" name="identifyNumber"/>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Phone</label>
                                    <input class="form-control" name="phone"/>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input class="form-control" name="email"/>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Address</label>
                                    <input class="form-control" name="address"/>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Customer Type</label>
                                    <select name="customerType" class="form-select" aria-label="Default select example">
                                        <option>--- select customer type ---</option>
                                        <c:forEach var="ct" items="${customerTypes}">
                                            <option value="${ct.id}"
                                            >${ct.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-success">Save</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
    <div class="d-flex justify-content-between">
        <div class="row">
            <div class="col-2 dropdown">
                <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown">
                    ${result.getPageSize()}
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="?n=${result.getNumber()}&s=5${search}">5</a></li>
                    <li><a class="dropdown-item" href="?n=${result.getNumber()}&s=10${search}">10</a></li>
                    <li><a class="dropdown-item" href="?n=${result.getNumber()}&s=15${search}">15</a></li>
                    <li><a class="dropdown-item" href="?n=${result.getNumber()}&s=20${search}">20</a></li>
                    <li><a class="dropdown-item" href="?n=${result.getNumber()}&s=25${search}">25</a></li>
                </ul>
            </div>
            <div class="col-10 ps-4 pt-2">
                Showing
                <b>${result.getPageSize() > result.getTotalElements() ? result.getTotalElements() : result.getPageSize()}</b>
                out of
                <b>${result.getTotalElements()}</b> entries
            </div>
        </div>

        <ul class="pagination justify-content-end pt-1">
            <li class="page-item ${result.hasPrevious() ? '' : 'disabled'}">
                <a class="page-link" href="?n=${result.getNumber() - 1}&s=${result.getPageSize()}${search}">Previous</a>
            </li>

            <% Page<Customer> p = (Page<Customer>) request.getAttribute("result");%>
            <c:set var="t"
                   value="<%= IntStream.rangeClosed(1, p.getTotalPages()).boxed().collect(Collectors.toList()) %>"></c:set>
            <c:forEach var="i" items="${t}">
                <li class="page-item ${i == result.getNumber() ? 'active' : ''}">
                    <a class="page-link" href="?n=${i}&s=${result.getPageSize()}${search}">${i}</a>
                </li>
            </c:forEach>

            <li class="page-item ${result.hasNext() ? '' : 'disabled'}">
                <a class="page-link" href="?n=${result.getNumber() + 1}&s=${result.getPageSize()}${search}">Next</a>
            </li>
        </ul>
    </div>
    <footer class="row border">
        Footer
    </footer>
</div>

<script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>


