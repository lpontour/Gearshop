<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Warenkorb</title>
</head>

<%@ page import="iae.projekt.gearshop.*" %>
<%@ page import="java.sql.*" %>

<body>
<%

    int benID = Integer.parseInt(session.getAttribute("benID").toString());

    DBMysql db = null;

    try
    {
        db = new DBMysql();
        boolean verbunden = db.connect();
    }
    catch (SQLException e)
    {
        out.print("<br>Fehler: Verbindung mit der Datenbank ist Fehlgeschlagen!<br>");
    }
    catch (ClassNotFoundException e)
    {
        out.print("<br>Fehler: Der Mysql-Connector ist nicht korrekt eingebunden!<br>");
    }
    catch (Exception e)
    {
        out.print("<br>Fehler: Da ist etwas schief gegangen: "+e.getMessage()+"<br>");
    }

    db.updateQuery("DELETE FROM `Warenkoerbe` WHERE `Benutzer-ID` ="+ benID);

    if (db!=null)
    {
        db.disconnect();
    }

    response.sendRedirect("http://gearshop.info/gearshop/?page=warenkorb");

%>
</body>
</html>
