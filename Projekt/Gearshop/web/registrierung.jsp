<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Registrierung</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>


<body>
<%
	session.setAttribute("SeitenTitel", "Registrierung"); 
%>
<div id="registrierung">

        <form id="registrierung_formular" method="post" action="registriert.jsp">

        <div id="registrierung_account">
            <fieldset>

                <legend>Account</legend>

                <label for="registrierung_email">*E-Mail:</label> <br>
                <input type="text" class="textfeld" name="registrierung_email" id="registrierung_email"> <br>

                <label for="registrierung_passwort">*Passwort:</label> <br>
                <input type="password" class="textfeld" name="registrierung_passwort" id="registrierung_passwort"> <br>

                <label for="registrierung_passwortwdh">*Passwort wiederholen:</label> <br>
                <input type="password" class="textfeld" name="registrierung_passwortwdh" id="registrierung_passwortwdh"> <br>

            </fieldset>
        </div>

        <div id="registrierung_person">
            <fieldset>
                <legend>Person</legend>

                <span id="registrierung_anrede">*Anrede:</span> <br>
                <input type="radio" name="registrierung_anrede" id="registrierung_herr" value="Herr" checked = "checked">
                <label for="registrierung_herr">Herr</label>
                <input type="radio" name="registrierung_anrede" id="registrierung_frau" value="Frau">
                <label for="registrierung_frau">Frau</label> <br>

                <label for="registrierung_titel">Titel:</label> <br>
                 <input type="text" class="textfeld" name="registrierung_titel" id="registrierung_titel"> <br>

                <label for="registrierung_vorname">*Vorname:</label> <br>
                <input type="text" class="textfeld" name="registrierung_vorname" id="registrierung_vorname"> <br>

                <label for="registrierung_nachname">*Nachname:</label> <br>
                <input type="text" class="textfeld" name="registrierung_nachname" id="registrierung_nachname"> <br>

                <label for="registrierung_telefon">Telefonnummer:</label> <br>
                <input type="text" class="textfeld" name="registrierung_telefon" id="registrierung_telefon"> <br>

            </fieldset>
        </div>

        <div id="registrierung_adresse">
            <fieldset>

                <legend>Standardadresse</legend>

                <label for="registrierung_strasse">*Straße:</label> <br>
                <input type="text" class="textfeld" name="registrierung_strasse" id="registrierung_strasse"> <br>

                <label for="registrierung_hausnr">*Hausnummer:</label> <br>
                <input type="text" class="textfeld" name="registrierung_hausnr" id="registrierung_hausnr"> <br>

                <label for="registrierung_plz">*PLZ:</label> <br>
                <input type="text" class="textfeld" name="registrierung_plz" id="registrierung_plz"> <br>

                <label for="registrierung_ort">*Ort:</label> <br>
                <input type="text" class="textfeld" name="registrierung_ort" id="registrierung_ort"> <br>

            </fieldset>
        </div>

        <p id="registrierung_pflichtfeld">Die mit einem * markierten Felder sind Pflichtfelder!</p>

        <button type="button" id="registrierung_registrieren" onclick="Registrieren()">Registrieren</button>

    </form>
    </div>

</body>
</html>