<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Email geändert</title>
</head>

<%@ page import="iae.projekt.gearshop.*" %>
<%@ page import="java.sql.*" %>

<body>

<%
    DBMysql db = null;

    int benutzerID = Integer.parseInt(session.getAttribute("benID").toString());
    String email = null;


    try {
        db = new DBMysql();

        boolean verbunden = db.connect();

    } catch (SQLException e) {
        out.print("<br>Fehler: Verbindung mit der Datenbank ist Fehlgeschlagen!<br>");
    } catch (ClassNotFoundException e) {
        out.print("<br>Fehler: Der Mysql-Connector ist nicht korrekt eingebunden!<br>");
    } catch (Exception e) {
        out.print("<br>Fehler: Da ist etwas schief gegangen: "+e.getMessage()+"<br>");
    }


    String sql = "";

    try {
        email = request.getParameter("kundenkonto_email");
        sql = db.AendereEmail(benutzerID, email);
    } catch (Exception e) {
        out.print("<br>" + sql + "<br>");
        out.print("<br>" + e.getMessage() + "<br>");
    }


    response.sendRedirect("http://gearshop.info/gearshop/?page=kundenkonto");

    if (db != null) {
        db.disconnect();
    }

%>

</body>
</html>
