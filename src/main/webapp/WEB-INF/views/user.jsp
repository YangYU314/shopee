<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 10/10/18
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
user success!
<%=request.getSession().getAttribute("username")%>
</body>
</html>
