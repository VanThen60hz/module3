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
        <input type="number" value="0" name="point" placeholder="Nhập điểm"><br>
        <select name="classId">
            <option value="0">Chon lớp</option>
            <option value="1">C02</option>
            <option value="2">A02</option>
            <option value="3">A03</option>
        </select>><br>
        <button type="submit">Save</button>
    </form>
</div>

</body>
</html>
