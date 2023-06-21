<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 14/06/2023
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<c:import url="../header.jsp"></c:import>
<body>
<c:import url="../navbar.jsp"></c:import>
<div style="margin-left: 300px">
  <h2>Trang thêm mới</h2>
  <p>${mess}</p>
  <form action="/student?action=add" method="post">
    <%--        <input name="id" placeholder="nhập id"><br>--%>
    <input name="name"  placeholder="nhập tên" id="name"><br>
    <input type="radio" name="gender" value="true"> Nam
    <input type="radio" name="gender" value="false"> Nữ<br>
    <input type="text" value="0" name="point" placeholder="Nhập điểm"><br>
    <select name="classId">
      <option value="0">Chon lớp</option>
      <option value="1">A1122I1</option>
      <option value="2">A1222I1</option>
      <option value="3">C1122I1</option>
      <option value="4">C1222I1</option>
      <option value="5">A0123I1</option>
    </select>><br>
    <button type="submit">Save</button>
  </form>
</div>

</body>
</html>

