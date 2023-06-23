<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 21/06/2023
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="bootstrap-5.1.3-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="fontawesome-free-6.4.0-web/css/all.min.css">
<link rel="stylesheet" href="css/main.css">
<html>
<head>
    <title>$Title$</title>
</head>
<body>

<div class="household">
    <header class="household__header">
        Danh sách hộ khẩu
    </header>

    <div class="table-title mt-3">
        <div class="row">
            <div class="col">
                <h3><b>Customer</b></h3>
            </div>
            <div class="col-4">
                <button onclick="resetCustomerForm()" class="btn btn-success float-end me-2" data-bs-toggle="modal"
                        data-bs-target="#addEditModal">Add New
                </button>
            </div>
        </div>
    </div>

    <div class="household__container">
        <div class="household__list">
            <table class="table table-bordered">
                <thead style="background-color:#a6a4a4;">
                <th>STT</th>
                <th>Mã hộ khẩu</th>
                <th>Tên chủ hộ</th>
                <th>Số lượng thành viên</th>
                <th>Ngày lập hộ khẩu</th>
                <th>Đại chỉ nhà</th>
                <th>Chức năng</th>
                </thead>
                <tbody>
                <c:forEach var="household" items="${householdList}" varStatus="status">
                    <td>${status.count}</td>
                    <td>${household.getId()}</td>
                    <td>${household.getName()}</td>
                    <td>${household.getQuantity()}</td>
                    <td>${household.getDateOfRegistration()}</td>
                    <td>${household.getAddress()}</td>
                    <td>
                        <button onclick="showEditHousehold('${household.id}', '${household.name}', '${household.quantity}', '${household.dateOfRegistration}'
                                , '${household.getAddress}')"
                                class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addEditModal">Edit
                        </button>
                        <button type="button" onclick="showInfoDelete('${student.getId()}','${student.getName()}')"
                                class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Delete
                        </button>
                    </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>


</div>
</body>
</html>
