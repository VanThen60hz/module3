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
        <input name="id" placeholder="nhập id"><br>
        <input name="name"  oninput="checkName()" required placeholder="nhập tên" id="name"><br>
         <small id="nameError" style="color: red"></small>
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

<script>
    function checkName(){
        let name = document.getElementById("name").value;
        if (name.length<6){
            document.getElementById("nameError").innerText="Tên quá ngắn";
        }else {
            document.getElementById("nameError").innerText="";
        }
    }
</script>
</body>
</html>
