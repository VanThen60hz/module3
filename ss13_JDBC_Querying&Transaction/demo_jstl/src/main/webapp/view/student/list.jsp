<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<c:import url="../header.jsp"></c:import>
<body>
<c:import url="../navbar.jsp"></c:import>
<h1>Trang danh sách sinh viên</h1>
<a href="/student?action=add">Thêm mới</a><br>
<a href="/student?action=transaction">Tạo một transaction</a>
<p style="color: red">${param.mess}</p>
<table class="table table-dark">
    <tr>
        <th>STT</th>
        <th>Id</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Point</th>
        <th>Rank</th>
        <th>ClassId</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="student" items="${studentList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${student.getId()}</td>
            <td>${student.getName()}</td>
            <c:if test="${student.isGender()}">
                <td>Male</td>
            </c:if>
            <c:if test="${!student.isGender()}">
                <td>Female</td>
            </c:if>
            <td>${student.getPoint()}</td>
            <c:choose>
                <c:when test="${student.getPoint()>=8}">
                    <td>Giỏi</td>
                </c:when>
                <c:when test="${student.getPoint()>=7}">
                    <td>Khá</td>
                </c:when>
                <c:when test="${student.getPoint()>=5}">
                    <td>Trung Bình</td>
                </c:when>
                <c:otherwise>
                    <td>Yếu</td>
                </c:otherwise>
            </c:choose>

            <td><c:out value="${student.getClassId()}"></c:out></td>
            <td>
                <button type="button" onclick="showInfoDelete('${student.getId()}','${student.getName()}')"
                        class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
</table>
<p>${myDate}</p>
<p><fmt:formatDate value="${myDate}" pattern="dd/MM/yyyy"></fmt:formatDate></p>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/student?action=delete" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden type="text" id="idDelete" name="idDelete">
                    <span>Bạn có muốn xó sinh viên : </span><span id="nameDelete" style="color: red"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-primary">Yes</button>
                </div>
            </form>

        </div>
    </div>
</div>
<script>
    function showInfoDelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>
</body>
</html>
