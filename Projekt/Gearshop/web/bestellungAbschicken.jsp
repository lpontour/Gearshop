<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Bestellen</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>

<%@ page import="iae.projekt.gearshop.*" %>
<%@ page import="java.sql.*" %>

<body>

<%
	DBMysql db = null;
	int benID = Integer.parseInt(session.getAttribute("benID").toString());
	String adresse = "";
	String anrede = "";
	String titel = "";
	String nachname = "";
    String vorname = "";
    String strasse = "";
    String hausnr = "";
    String plz = "";
    String ort = "";
    String zahlung = "";
    int prodID = 1;
    String bezeichnung = "";
    double preis = 0.0;
    double preis_ohne_MWS = 0.0;
    double MWS = 0.19;
    double summeMWS = 0.0;
    double preis_mit_MWS = 0.0;
    int anzahl = 1;
    double versand = 0.0;
    int rechnung = 0;


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
    adresse = request.getParameter("Adressen");
	
    try
    {
	    sql ="SELECT `Rechnung-Nr` FROM `Rechnungen` ";
	    db.rs = db.openQuery(sql);
    }
    catch (Exception e)
    {
        out.print("<br>" + sql + "<br>");
        out.print("<br>" + e.getMessage() + "<br>");
    }
	
	if(db.rs.last())
	{
		rechnung = db.rs.getInt(1)+1;
	}
	db.rs.beforeFirst();
	

    if (adresse.equals("adressestandard"))
    {
        sql = db.DatenBenutzer(benID);
        db.rs = db.openQuery(sql);
        
        while (db.rs.next())
        {
            anrede = db.rs.getString(1);
            titel = db.rs.getString(2);
            nachname = db.rs.getString(3);
            vorname = db.rs.getString(4);
            strasse = db.rs.getString(5);
            hausnr = db.rs.getString(6);
            plz = db.rs.getString(7);
            ort = db.rs.getString(8);
        }
    }
    else if ( adresse.equals("adresseneu"))
    {
        vorname = request.getParameter("andere_Adresse_Vorname");
        nachname = request.getParameter("andere_Adresse_Nachname");
        strasse = request.getParameter("andere_Adresse_Strasse");
        hausnr = request.getParameter("andere_Adresse_Nummer");
        plz = request.getParameter("andere_Adresse_Postleitzahl");
        ort = request.getParameter("andere_Adresse_Ort");
    }

    zahlung = request.getParameter("Zahlungsart");

    if (zahlung.equals("Paypal"))
    {
        versand = 4.99;
    }
    else if (zahlung.equals("Sofortueberweisung"))
    {
        versand = 4.99;
    }
    else if (zahlung.equals("Selbstabholer"))
    {
        versand = 0.0;
    }


    out.print(titel);
    out.print(anrede);
    out.print(vorname);
    out.print(nachname);
    out.print(strasse);
    out.print(hausnr);
    out.print(plz);
    out.print(ort);
    out.print(zahlung);
    out.print(versand);



    preis_ohne_MWS = Double.parseDouble(session.getAttribute("ends").toString());

    summeMWS = (preis_ohne_MWS * MWS);
    preis_mit_MWS = (preis_ohne_MWS + summeMWS);


    sql = db.DatenProdukt(benID);
    db.rs = db.openQuery(sql);

    try {
        while (db.rs.next()) {
            prodID = db.rs.getInt(1);
            bezeichnung = db.rs.getString(2);
            preis = db.rs.getDouble(3);
            db.updateQuery("INSERT INTO `Rechnungen`(`Rechnung-Nr`,`Benutzer-ID`,`Anrede`, `Titel`, `Nachname`, `Vorname`, `Strasse`, `Haus-Nr`, `PLZ`, `Ort`, `Produkt-ID`, `Bezeichnung`, `Preis`, `Anzahl`, `Zahlung`, `Versand`,`Endsumme(ohne_MWS)`,`Summe_MWS`, `Endsumme(MWS)`) VALUES('"+rechnung+"','"+benID+"','"+anrede+"','"+titel+"','"+nachname+"','"+vorname+"','"+strasse+"','"+hausnr+"','"+plz+"','"+ort+"','"+prodID+"','"+bezeichnung+"','"+preis+"','"+anzahl+"','"+zahlung+"','"+versand+"','"+preis_ohne_MWS+"','"+summeMWS+"','"+preis_mit_MWS+"')");

        }
    } catch (Exception e)
    {
        out.print("<br>" + sql + "<br>");
        out.print("<br>" + e.getMessage() + "<br>");
    }

	db.updateQuery("DELETE FROM `Warenkoerbe` WHERE `Benutzer-ID` ="+ benID);
    session.setAttribute("rech", true);
    session.setAttribute("best",false);



    if (db!=null) 
    {
        db.disconnect();
    }

    response.sendRedirect("http://gearshop.info/gearshop/?page=haupt");

%>


</body>
</html>