<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Warenkorbeintragen</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>

<body>
<%

    session.setAttribute("best", true);
    response.sendRedirect("http://gearshop.info/gearshop/?page=warenkorb");

%>
</body>
</html>
