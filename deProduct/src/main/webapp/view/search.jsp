<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 23/06/2023
  Time: 01:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<c:import url="../header.jsp"></c:import>
<body>

<div class="container-fluid">
    <div class="product">
        <header class="product__header">
            <i class="fa-solid fa-list ms-2"></i> After search
        </header>
        <div class="product__container">
            <h3 class="text-success ms-4" id="createMess"></h3>
            <h3 class="text-success ms-4" id="editMess"></h3>
            <h3 class="text-success ms-4" id="delMess"></h3>
            <div class="product__list m-4">
                <table class="table table-bordered">
                    <thead style="color: grey">
                    <th>#</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Color</th>
                    <th>Category</th>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${productList}">
                        <td>${product.getId()}</td>
                        <td>${product.getName()}</td>
                        <td>${product.getPrice()}</td>
                        <td>${product.getQuantity()}</td>
                        <td>${product.getColor()}</td>
                        <c:choose>
                            <c:when test="${product.getCategoryId()==1}">
                                <td>Computer</td>
                            </c:when>
                            <c:when test="${product.getCategoryId()==2}">
                                <td>Phone</td>
                            </c:when>
                            <c:when test="${product.getCategoryId()==3}">
                                <td>Television</td>
                            </c:when>
                            <c:otherwise>
                                <td>Chưa xác định</td>
                            </c:otherwise>
                        </c:choose>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
