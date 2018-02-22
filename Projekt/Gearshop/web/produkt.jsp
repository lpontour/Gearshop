<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Produkt</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>

<%@ page import="iae.projekt.gearshop.*" %>
<%@ page import="java.sql.*" %>

<body>
<div id="produkt">
<form id="produktInWarenkorb_formular" method="post" action="produktInWarenkorbEintragen.jsp">

<%

	int benID = 1;

	try
	{
		benID = Integer.parseInt(session.getAttribute("benID").toString());
	}
	catch(Exception e)
	{}
	
    int proID = Integer.parseInt(request.getParameter("proID"));
    int anzahl = 1;
    double preis = 0.0;
    
    DBMysql db = null;
	String bezeichnung = "";
	String beschreibung ="";

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

    String sql = "";

    try 
    {
            db.rs = db.openQuery("SELECT  `Produkt-ID`, `Kategorie-ID`, `Bezeichnung`, `Beschreibung`, `Preis`, `Bild` FROM  `Produkte` " +
            "WHERE  `Produkt-ID` = " + proID );
    } 
    catch (Exception e) 
    {
        out.print("<br>" + sql + "<br>");
        out.print("<br>" + e.getMessage() + "<br>");
    }

	if(db.rs.next())
	{
		bezeichnung = db.rs.getString(3);
		beschreibung = db.rs.getString(4);
		preis = db.rs.getDouble(5);
	}	
    
    try 
    {
        session.setAttribute("benID", benID);
        session.setAttribute("proID", proID);
        session.setAttribute("anzahl", anzahl);
        session.setAttribute("preis", preis);
        session.setAttribute("bezeichnung", bezeichnung);
    } 
    catch (Exception e)
    {
        out.print(e.getMessage());
    }
	
    if (db!=null) 
    {
        db.disconnect();
    }

%>
    <div id="produkt_div_bild"><img src="bild.jsp?prod=<% out.print(proID); %>" alt="404: Produktbild" id="produkt_bild"></div>
    <div id="produkt_div_rechts">
        <p id="produkt_name"><% out.print(bezeichnung); %></p>
        <p id="produkt_preis">Preis: <% out.print(preis);%>€</p>
        <button type="submit" id="produkt_warenkorb">In den Warenkorb</button>
    </div>
    <div id="produkt_div_unten">
        <p id="produkt_beschreibung"><% out.print(beschreibung); %> </p>
    </div>
    </form>
</div>
</body>
</html>