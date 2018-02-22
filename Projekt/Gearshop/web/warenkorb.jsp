<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Warenkorb</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>

<%@ page import="iae.projekt.gearshop.*" %>
<%@ page import="java.sql.*" %>

<body>


<%


    int benID = 0;
    Boolean ange = false;
    Boolean best = false;
	double endsumme = 0.0;

    try
    {
        ange = Boolean.parseBoolean(session.getAttribute("ange").toString());
        best = Boolean.parseBoolean(session.getAttribute("best").toString());
    }
    catch(Exception e)
    {
    }

    if (ange == true && best == false)
    {
    	    try
    	    {
    		    benID = Integer.parseInt(session.getAttribute("benID").toString());
    	    }
    	    catch(Exception e)
    	    {}
    	

        
            DBMysql db = null;

            try
            {
                db = new DBMysql();
                boolean verbunden = db.connect();
            }
            catch (SQLException e)
            {
                System.out.print("<br>Fehler: Verbindung mit der Datenbank ist Fehlgeschlagen!<br>");
            }
            catch (ClassNotFoundException e)
            {
                System.out.print("<br>Fehler: Der Mysql-Connector ist nicht korrekt eingebunden!<br>");
            }
            catch (Exception e)
            {
                System.out.print("<br>Fehler: Da ist etwas schief gegangen: "+e.getMessage()+"<br>");
            }

            String sql = "";

            try
            {
                db.rs = db.openQuery("SELECT `Benutzer-ID`, `Produkt-ID`, `Bezeichnung`, `Anzahl`, `Preis` FROM `Warenkoerbe` WHERE `Benutzer-ID` =" + benID);
            }
            catch (Exception e)
            {
                System.out.print("<br>" + sql + "<br>");
                System.out.print("<br>" + e.getMessage() + "<br>");
            }

            session.setAttribute("SeitenTitel", "Warenkorb");


%>

        <div id="warenkorb">
            <form id="warenkorb_form" action="warenkorbWeiterleitung.jsp">
                <div id="warenkorb_warenliste">
                    <table id="warenkorb_warenliste_liste">

<%
            while (db.rs.next())
            {
	            int proID = db.rs.getInt(2);
	            String bezeichnung = db.rs.getString(3);
	            int anzahl = db.rs.getInt(4);
	            double preis = db.rs.getDouble(5);
	            endsumme= endsumme+ preis;
%>
                    <tr><th>Bild</th><th>Bezeichnung</th><th>Anzahl</th><th>Preis</th></tr>
                    <tr><td><img src="bild.jsp?prod=<% out.print(proID); %>" alt="404: Produktbild" id="produkt_bild"></td>
                    <td><% out.print(bezeichnung); %></td>
                    <td><form><label for="Anzahl"><input id="Anzahl" class="textfeld" name="Anzahl" value="<% out.print(anzahl); %>" disabled></label></form></td>
                    <td><% out.print(preis); %></td></tr>
<% 
}
%>            
			        </table>
                </div>
                <div id="warenkorb_untererTeil">
                    <hr />
                    <button type="submit" id="warenkorb_bestellButton">Bestellen</button>
                    <p id="p2"><b>Summe: <% out.print(endsumme); %>‚Ç¨</b></p>
                </div>
            </form>
            <form id="warenkorb_buttonform" action="warenkorbleeren.jsp">
                <button type="submit" id="warenkorb_lˆschenbutton">Warenkorb leeren</button>
            </form>
        </div>
<%
	        if (db!=null) 
            {
                db.disconnect();
            }

            session.setAttribute("ends",endsumme);
        }
        else if (ange == true && best == true)
        {
%>
        <div id="bestellvorgang">
            <form id="bestellvorgang_adressen_waehlen" method="post" action="bestellungAbschicken.jsp">
                <div id="bestellvorgang_adresse">
                    <fieldset>
                        <legend>Adresse</legend>
                        <input type="radio" value="adressestandard" id="Adresse_verwenden" checked="checked" name="Adressen">
                        <label for="Adresse_verwenden">Standartadresse verwenden</label>
                        <br>
                        <input type="radio" value="adresseneu" id="andere_Adresse" name="Adressen">
                        <label for="andere_Adresse">andere Adresse</label>
                        <br>
                        <label for="andere_Adresse_Vorname">Vorname:</label>
                        <br>
                        <input id="andere_Adresse_Vorname" style="vertical-align: top;" class="textfeld" name="andere_Adresse_Vorname">
                        <br>
                        <label for="andere_Adresse_Nachname">Nachname:</label>
                        <br>
                        <input id="andere_Adresse_Nachname" style="vertical-align: top;" class="textfeld" name="andere_Adresse_Nachname">
                        <br>
                        <label for="andere_Adresse_Strasse">Straﬂe:</label>
                        <br>
                        <input id="andere_Adresse_Strasse" style="vertical-align: top;" class="textfeld" name="andere_Adresse_Strasse">
                        <br>
                        <label for="andere_Adresse_Nummer">Hausnummer:</label>
                        <br>
                        <input id="andere_Adresse_Nummer" style="vertical-align: top;" class="textfeld" name="andere_Adresse_Nummer">
                        <br>
                        <label for="andere_Adresse_Postleitzahl">PLZ.:</label>
                        <br>
                        <input id="andere_Adresse_Postleitzahl" style="vertical-align: top;" class="textfeld" name="andere_Adresse_Postleitzahl">
                        <br>
                        <label for="andere_Adresse_Ort">Ort:</label>
                        <br>
                        <input id="andere_Adresse_Ort" style="vertical-align: top;" class="textfeld" name="andere_Adresse_Ort">
                        <br>
                    </fieldset>
                </div>

                <div id="bestellvorgang_zahlungsart">
        	        <fieldset>
                        <legend>Zahlungsarten</legend>
                        <input type="radio" value="Paypal" id="paypal" checked="checked" name="Zahlungsart">
                        <label for="paypal">Paypal</label>
                        <br>
                        <input type="radio" value="Sofortueberweisung" id="sofortueberweisung" name="Zahlungsart">
                        <label for="sofortueberweisung">Sofort&uuml;berweisung</label>
                        <br>
                        <input type="radio" value="Selbstabholer" id="selbstabholer_mit_barzahlung" name="Zahlungsart">
                        <label for="selbstabholer_mit_barzahlung">Selbstabholer mit Barzahlung</label>
                        <br>
                    </fieldset>
                </div>
                <button type="Submit" id="bestellvorgang_end_bestellung">Bestellen</button>
            </form>
	    </div>
<%

    }
    else if (ange == false)
    {
%>
    <h1>
        <br>
        <br>
        <%
            out.print("Du musst angemeldet sein, um deinen Warenkorb zu sehen!");
        %>
    </h1>
<%
    }

%>
</body>
</html>