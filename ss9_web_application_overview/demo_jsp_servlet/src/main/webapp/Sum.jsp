<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 5/29/2023
  Time: 8:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int num1 = Integer.parseInt(request.getParameter("n1"));
    int num2 = Integer.parseInt(request.getParameter("n2"));
    int sum = num1+num2;
%>
<h1> Ket qua: <%=sum%></h1>
</body>
</html>
