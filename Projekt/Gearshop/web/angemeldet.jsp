<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Angemeldet</title>
</head>

<%@ page import="iae.projekt.gearshop.*" %>
<%@ page import="java.sql.*" %>

<body>

<%

    DBMysql db = null;
    Boolean angemeldet = false;
    String email = "";
    String passwort = "";
    String passwortdb = "";
    String benID = "";
    Boolean error = false;

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



    email = request.getParameter("anmeldung_email");
    passwort = request.getParameter("anmeldung_passwort");


    String sql = "";
    try {
        sql = db.AnmeldungBenutzer(email);
    } catch (Exception e) {
        out.print("<br>" + sql + "<br>");
        out.print("<br>" + e.getMessage() + "<br>");
    }

    db.rs = db.openQuery(sql);

    while (db.rs.next())
    {
        passwortdb = db.rs.getString(1);
        benID = db.rs.getString(2);
    }

    out.print(passwort);
    out.print(passwortdb);


    if (passwort.equals(passwortdb))
    {
        session.setAttribute("benID", benID);
        error = false;
        session.setAttribute("error", error);
        angemeldet = true;
        session.setAttribute("ange", angemeldet);
        response.sendRedirect("http://gearshop.info/gearshop/?page=haupt");

    }
    else
    {
        error = true;
        session.setAttribute("error", error);
        angemeldet = false;
        session.setAttribute("ange", angemeldet);
        response.sendRedirect("http://gearshop.info/gearshop/?page=anmeldung");
    }



    if (db!=null) {
        db.disconnect();
    }

%>


</body>
</html>
