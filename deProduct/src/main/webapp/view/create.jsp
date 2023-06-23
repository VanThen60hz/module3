<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 22/06/2023
  Time: 00:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/bootstrap-5.1.3-dist/css/bootstrap.min.css">
<html>
<head>
    <title>Create new product</title>
</head>
<body>

<div class="create p-5" >
    <form action="/product?action=create" method="post">
        <div>
            <h3>Add new product</h3>
        </div>
        <div class="mb-3">
            <label for="id" class="form-label"></label>
            <input type="hidden" class="form-control" id="id">
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" name="name" id="name">
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="text" class="form-control" name="price" id="price">
        </div>
        <div class="mb-3">
            <label for="quantity" class="form-label">Quantity</label>
            <input type="text" class="form-control" name="quantity" id="quantity">
        </div>
        <div class="mb-3">
            <label for="color" class="form-label">Color</label>
            <input type="text" class="form-control" name="color" id="color">
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Decription</label>
            <textarea name="description" class="form-control" id="description" cols="30" rows="10"></textarea>
        </div>
        <div class="mb-3">
            <label for="category_id" class="form-label">Category</label>
            <select name="category_id" class="form-control" id="category_id">
                <option value="1">Computer</option>
                <option value="2">Phone</option>
                <option value="3">Television</option>
            </select><br>
        </div>

        <button type="submit" class="btn btn-success">Create</button> | <a href="/product" class="btn btn-secondary">Back</a>

    </form>
</div>

</body>
</html>
