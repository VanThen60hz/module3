<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 03/06/2023
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<c:import url="header.jsp"></c:import>
<body>
<c:import url="navbar.jsp"></c:import>
<h1 class="d-flex justify-content-center">Danh sách khách hàng</h1>

<table class="table table-light">
    <tr>
        <th>Name</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customerList}" varStatus="status">
    <tr>
        <td>${customer.getName()}</td>
        <td>${customer.getBirthday()}</td>
        <td>${customer.getAddress()}</td>
        <td><img style="width:240px; height: 160px" src ="img/${customer.getImg()}"></td>
    </tr>
    </c:forEach>
</table>

<p>${myDate}</p>
<p><fmt:formatDate value="${myDate}" pattern="dd/MM/yyyy"></fmt:formatDate></p>
</body>
</html>
