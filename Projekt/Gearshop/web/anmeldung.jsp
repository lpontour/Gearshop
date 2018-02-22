<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Anmeldung</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>

<body>

<%
    Boolean error = false;

    try
    {
        error = Boolean.parseBoolean(session.getAttribute("error").toString());
    }
    catch (Exception e)
    {
        error = false;
    }
    
    session.setAttribute("SeitenTitel", "Anmeldung");
%>

    <div id=anmeldung>
        <div id=anmeldung_anmeldung>
            <form name="anmeldung_formular" method="post" action="angemeldet.jsp">
                <fieldset>

                    <legend>Anmeldung</legend>

                    <label for="anmeldung_email">E-Mail:</label> <br>
                    <input type="text"  name="anmeldung_email" id="anmeldung_email"> <br>

                    <label for="anmeldung_passwort">Passwort:</label> <br>
                    <input type="password"  name="anmeldung_passwort" id="anmeldung_passwort"> <br>

                    <button type="button" id="anmeldung_anmelden" onclick="Anmelden()">Anmelden</button>

                </fieldset>

            </form>

            <%
                if (error == true)
                {
            %>
                    <h3>Anmeldung fehlgeschlagen! </h3>
                    <h3>Versuche es erneut.<h3/>
            <%
                }
            %>

        </div>
        <div id=anmeldung_registrierung>
            <p1>
                Melde dich an, um mit dem Shoppen loszulegen! <br>
                Wenn du noch keinen Account besitzt, dann <a href="registrierung.html" onclick="IndexLoad();return false;">
                registriere</a> dich jetzt bei uns.
            </p1>
            
        </div>
        <div id=anmeldung_kontakt>
            <p1>
                Hast du dein Passwort vergessen? <br>
                Dann nimm <a href="kontakt.jsp" onclick="IndexLoad();return false;">Kontakt</a> mit unserem Kundensupport auf. <br>
                Dieser ist 24 Stunden erreichbar und hilft dir bei Fragen und Problemen gerne weiter.
            </p1>

        </div>

    </div>

</body>
</html>