<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 20/06/2023
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<c:import url="../header.jsp"></c:import>
<body>

<div class="container-fluid">
    <header class="row border">
        <div class="col-9 ps-5 pt-2">
            <a href="/product?action=add" class="btn btn-info text-white">
                <i class="fa-solid fa-plus"></i> Add New Product
            </a>
        </div>
        <div class="col-3 pe-5 pt-2">
            <form class="d-flex" method="post" action="/product?action=search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="fullSearchName" id="fullSearchName">
                <button class="btn btn-outline-success" type="submit">Search</button>
<%--                <button onclick="showInfoSearch('${product.getName()}')"--%>
<%--                        class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#searchModal">Search--%>
<%--                </button>--%>
            </form>
        </div>
    </header>

    <div class="product">
        <header class="product__header">
            <i class="fa-solid fa-list ms-2"></i> Product List
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
                    <th>Action</th>
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
                        <td>
                            <button type="button"
                                    onclick="showInfoEdit('${product.getId()}','${product.getName()}','${product.getPrice()}','${product.getQuantity()}','${product.getColor()}','${product.getCategoryId()}')"
                                    class="btn btn-info" data-bs-toggle="modal" data-bs-target="#editModal">
                                Edit
                            </button>
                            <button type="button" onclick="showInfoDelete('${product.getId()}','${product.getName()}')"
                                    class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
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
</div>

<%--Search Modal--%>
<div class=" modal fade" id="searchModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/product?action=edit" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="searchModalLable">Edit this product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <label for="searchId" class="form-label">Id</label>
                    <input class="form-control" id="searchId" name="searchId">
                </div>
                <div class="modal-body">
                    <label for="searchName" class="form-label">Name</label>
                    <input type="text" class="form-control" name="searchName" id="searchName">
                </div>
                <div class="modal-body">
                    <label for="searchPrice" class="form-label">Price</label>
                    <input type="text" class="form-control" name="searchPrice" id="searchPrice">
                </div>
                <div class="modal-body">
                    <label for="SearchQuantity" class="form-label">Quantity</label>
                    <input type="text" class="form-control" name="SearchQuantity" id="SearchQuantity">
                </div>
                <div class="modal-body">
                    <label for="searchColor" class="form-label">Color</label>
                    <input type="text" class="form-control" name="searchColor" id="searchColor">
                </div>
                <div class="modal-body">
                    <label for="SearchCategory" class="form-label">Category</label>
                    <input type="text" class="form-control" name="searchColor" id="SearchCategory">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No
                    </button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%--Edit Modal--%>
<div class=" modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/product?action=edit" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">Edit this product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" class="form-control" id="id" name="id">
                </div>
                <div class="modal-body">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" name="name" id="name">
                </div>
                <div class="modal-body">
                    <label for="price" class="form-label">Price</label>
                    <input type="text" class="form-control" name="price" id="price">
                </div>
                <div class="modal-body">
                    <label for="quantity" class="form-label">Quantity</label>
                    <input type="text" class="form-control" name="quantity" id="quantity">
                </div>
                <div class="modal-body">
                    <label for="color" class="form-label">Color</label>
                    <input type="text" class="form-control" name="color" id="color">
                </div>
                <div class="modal-body">
                    <label for="category_id" class="form-label">Category</label>
                    <select name="category_id" class="form-control" id="category_id">
                        <option value="1">Computer</option>
                        <option value="2">Phone</option>
                        <option value="3">Television</option>
                    </select><br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No
                    </button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%--Delete Modal--%>
<div class=" modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/product?action=delete" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Delete this product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden type="text" id="idDelete" name="idDelete">
                    <span>Bạn có muốn xóa sản phẩm : </span><span id="nameDelete" style="color: red"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No
                    </button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    const urlParams = new URLSearchParams(window.location.search);
    const createM = urlParams.get('createM');

    console.log(createM);

    if (createM) {
        createMess.innerHTML = "Created successfully!";
    }

    const delM = urlParams.get('delM');

    console.log(delM);

    if (delM) {
        delMess.innerHTML = "Deleted successfully!";
    }

    const editM = urlParams.get('editM');

    console.log(editM);

    if (editM) {
        editMess.innerHTML = "Edited successfully!";
    }


    function showInfoDelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }

    function showInfoEdit(id, name, price, quantity, color, category_id) {
        document.getElementById("id").value = id;
        document.getElementById("name").value = name;
        document.getElementById("price").value = price;
        document.getElementById("quantity").value = quantity;
        document.getElementById("color").value = color;
        document.getElementById("category_id").value = category_id;
    }

</script>

</body>
</html>