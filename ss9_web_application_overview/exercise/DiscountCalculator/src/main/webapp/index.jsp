
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Product Discount Calculator</title>
  </head>
  <body>
  <form action="/discount" method="get">
    <label for="product-description">Product Description:</label>
    <input type="text" id="product-description" name="product-description" required><br>
    <br>
    <label for="list-price">List Price:</label>
    <input type="number" id="list-price" name="list-price" min="0" required><br>
    <br>
    <label for="discount-percent">Discount Percent:</label>
    <input type="number" id="discount-percent" name="discount-percent" min="0" max="100" required><br>
    <br>
    <input type="submit" value="Calculate Discount">
  </form>
  </body>
</html>
