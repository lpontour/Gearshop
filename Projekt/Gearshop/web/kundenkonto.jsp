<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Kundenkonto</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>

<%@ page import="iae.projekt.gearshop.*" %>
<%@ page import="java.sql.*" %>

<body>

<%
    Boolean ange = false;

    try
    {
        ange = Boolean.parseBoolean(session.getAttribute("ange").toString());
    }
    catch(Exception e)
    {
        ange = false;
    }


if (ange == true )
{
    DBMysql db = null;
    int benutzerID = Integer.parseInt(session.getAttribute("benID").toString());
    String strasse = "";
    String hausnr = "";
    String plz = "";
    String ort = "";
    String email = "";
    String telefon = "";
    String passwort = "";
    String pw = "";

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

    db.rs = db.openQuery("SELECT `Strasse` , `Haus-Nr` , `PLZ` , `Ort` , `E-Mail` , `Telefon`, `Passwort` FROM  `Benutzer` WHERE  `Benutzer-ID` = " + benutzerID);
    session.setAttribute("SeitenTitel", "Kundenkonto");
%>

    <div id="kundenkonto">

        <div id="kundenkonto_formular_adresse">
            <form id="kundenkonto_formular_adresse_aendern" method="post" action="adresseAendern.jsp">

            <fieldset>

                <legend>Standardadresse</legend>

                <%
                    while (db.rs.next()){
                        strasse = db.rs.getString(1);
                        hausnr = db.rs.getString(2);
                        plz = db.rs.getString(3);
                        ort = db.rs.getString(4);
                        email = db.rs.getString(5);
                        telefon = db.rs.getString(6);
                        passwort = db.rs.getString(7);
                        session.setAttribute(pw,passwort);
                    }
                    out.println(strasse);
                    out.println(hausnr);
                %>
                <br>
                <%
                    out.println(plz);
                    out.println(ort);
                %>
                <br>
                <br>
                <label for="kundenkonto_strasse">Straße:</label> <br>
                <input type="text" class="textfeld" name="kundenkonto_strasse" id="kundenkonto_strasse"> <br>

                <label for="kundenkonto_hausnr">Hausnummer:</label> <br>
                <input type="text" class="textfeld" name="kundenkonto_hausnr" id="kundenkonto_hausnr"> <br>

                <label for="kundenkonto_plz">PLZ:</label> <br>
                <input type="text" class="textfeld" name="kundenkonto_plz" id="kundenkonto_plz"> <br>

                <label for="kundenkonto_ort">Ort:</label> <br>
                <input type="text" class="textfeld" name="kundenkonto_ort" id="kundenkonto_ort"> <br>

                <button type="button" id="ändern_adresse" onclick="AdresseAendern()">Ändern</button>

            </fieldset>
            </form>
        </div>


        <div id="kundenkonto_formular_email">
            <form id="kundenkonto_formular_email_aendern" method="post" action="emailAendern.jsp">
                <fieldset>

                    <legend>E-Mail</legend>

                    <%
                        out.println(email);
                    %>
                    <br>
                    <br>
                    <label for="kundenkonto_email">E-Mail:</label> <br>
                    <input type="text" class="textfeld" name="kundenkonto_email" id="kundenkonto_email"> <br>

                    <button type="button" id="ändern_email" onclick="EmailAendern()">Ändern</button>

                </fieldset>
            </form>
        </div>


        <div id="kundenkonto_formular_passwort">
            <form id="kundenkonto_formular_passwort_aendern" method="post" action="passwortAendern.jsp">
                <fieldset>

                    <legend>Passwort</legend>

                    <label for="kundenkonto_passwort_neu">Neues Passwort:</label> <br>
                    <input type="password" class="textfeld" name="kundenkonto_passwort_neu" id="kundenkonto_passwort_neu"> <br>

                    <label for="kundenkonto_passwort_wdh">Neues Passwort wiederholen:</label> <br>
                    <input type="password" class="textfeld" name="kundenkonto_passwort_wdh" id="kundenkonto_passwort_wdh"> <br>


                    <button type="button" id="ändern_passwort" onclick="PasswortAendern()">Ändern</button>

                </fieldset>
            </form>
        </div>


        <div id="kundenkonto_formular_telefon">
            <form id="kundenkonto_formular_telefon_aendern" method="post" action="telefonAendern.jsp">
                <fieldset>

                    <legend>Telefon</legend>

                    <%
                        out.println(telefon);

                        if (db != null)
                        {
                            db.disconnect();
                        }
                    %>
                    <br>
                    <br>
                    <label for="kundenkonto_telefon">Telefon:</label> <br>
                    <input type="text" class="textfeld" name="kundenkonto_telefon" id="kundenkonto_telefon"> <br>

                    <button type="button" id="ändern_telefon" onclick="TelefonAendern()">Ändern</button>

                </fieldset>
            </form>
        </div>

    </div>
<%
    }
    else
    {
%>
    <h1>
        <br>
        <br>
        <%
            out.print("Du musst angemeldet sein, um dein Kundenkonto zu sehen!");
        %>
    </h1>
<%
    }
%>
</body>
</html>