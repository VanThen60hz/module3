<%--
  Created by IntelliJ IDEA.
  User: Văn Thén
  Date: 12/06/2023
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<c:import url="../header.jsp"></c:import>
<body>
<p class="text-center">
    <a href="/users" class="btn btn-info ms-1 text-ce">Back to user list</a>
</p>

<form action="/users?action=create" method="post">
    <fieldset>
        <legend class="text-center">User information:</legend>

        <table class="table table-bordered d-flex justify-content-center">
            <tr>
                <td>Id</td>
                <td class="w-100">
                    <c:if test = "${message != null}">
                        <p style="color: red"><c:out value="${message}"></c:out></p>
                    </c:if>
                    <input type="text" name="id" id="id">
                </td>
            </tr>
            <tr>
                <td>Name</td>
                <td class="w-100"><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>User Email</td>
                <td class="w-100"><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td class="w-100"><input type="text" name="country" id="country"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Create user"></td>
            </tr>
        </table>
        </table>
    </fieldset>
</form>

</body>
</html>
