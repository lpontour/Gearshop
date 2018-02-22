<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Adresse geändert</title>
</head>

<%@ page import="iae.projekt.gearshop.*" %>
<%@ page import="java.sql.*" %>

<body>
<%
    DBMysql db = null;

    int benutzerID = Integer.parseInt(session.getAttribute("benID").toString());
    String strasse = null;
    String hausnr = null;
    String plz = null;
    String ort = null;

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
        strasse = request.getParameter("kundenkonto_strasse");
        hausnr = request.getParameter("kundenkonto_hausnr");
        plz = request.getParameter("kundenkonto_plz");
        ort = request.getParameter("kundenkonto_ort");
        sql = db.AendereAdresse(benutzerID, strasse, hausnr, plz, ort);
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
