<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Registriert</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>

<%@ page import="iae.projekt.gearshop.*" %>
<%@ page import="java.sql.*" %>

<body>
<%
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
        out.print("<br>Fehler: Da ist etwas schief gegangen: " + e.getMessage() + "<br>");
    }


    String sql = "";
    
    try 
    {
    	int benID = Integer.parseInt(session.getAttribute("benID").toString());
    	int proID = Integer.parseInt(session.getAttribute("proID").toString());
    	int anzahl = Integer.parseInt(session.getAttribute("anzahl").toString());
    	double preis = Double.parseDouble(session.getAttribute("preis").toString());
    	String bezeichnung = session.getAttribute("bezeichnung").toString();
    	    
        sql = db.ProduktWarenkorbHinzufuegen(benID, proID, anzahl, preis, bezeichnung);
    } 
    catch (Exception e) 
    {
        out.print("<br>" + sql + "<br>");
        out.print("<br>" + e.getMessage() + "<br>");
    }

    
    response.sendRedirect("http://gearshop.info/gearshop/?page=warenkorb");

    if (db != null) 
    {
        db.disconnect();
    }
    
    out.print(sql);

%>


</body>
</html>