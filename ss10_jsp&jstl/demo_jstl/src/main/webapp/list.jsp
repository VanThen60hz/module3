
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<c:import url="header.jsp"></c:import>
<body>
<c:import url="navbar.jsp"></c:import>
<h1>Trang danh sách sinh viên</h1>
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
           <td><button class="btn btn-danger">Delete</button></td>
       </tr>
   </c:forEach>
</table>
<p>${myDate}</p>
<p><fmt:formatDate value="${myDate}" pattern="dd/MM/yyyy"></fmt:formatDate></p>
</body>
</html>
