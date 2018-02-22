<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Warenkorbeintragen</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>

<%@ page import="iae.projekt.gearshop.*" %>
<%@ page import="java.sql.*" %>

<body>
<!-- Java -->

<%
    DBMysql db = null;
    try {
        db = new DBMysql();

        boolean verbunden = db.connect();

    } catch (SQLException e) {
        out.print("<br>Fehler: Verbindung mit der Datenbank ist Fehlgeschlagen!<br>");
    } catch (ClassNotFoundException e) {
        out.print("<br>Fehler: Der Mysql-Connector ist nicht korrekt eingebunden!<br>");
    } catch (Exception e) {
        out.print("<br>Fehler: Da ist etwas schief gegangen: " + e.getMessage() + "<br>");
    }


    String sql = "";
    try {
        String anrede = request.getParameter("registrierung_anrede");
        String titel = request.getParameter("registrierung_titel");
        String nachname = request.getParameter("registrierung_nachname");
        String vorname = request.getParameter("registrierung_vorname");
        String email = request.getParameter("registrierung_email");
        String passwort = request.getParameter("registrierung_passwort");
        String strasse = request.getParameter("registrierung_strasse");
        String hausnr = request.getParameter("registrierung_hausnr");
        String plz = request.getParameter("registrierung_plz");
        String ort = request.getParameter("registrierung_ort");
        String telefon = request.getParameter("registrierung_telefon");

      sql = db.RegistriereBenutzer(anrede, titel, nachname, vorname, email, passwort, strasse, hausnr, plz, ort, telefon);
    } catch (Exception e) {
        out.print("<br>" + sql + "<br>");
        out.print("<br>" + e.getMessage() + "<br>");
    }


    response.sendRedirect("http://gearshop.info/gearshop/?page=anmeldung");

    if (db != null) {
        db.disconnect();
    }
	out.println(sql);

%>
</body>
</html>
