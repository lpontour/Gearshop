<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Willkommen beim Gearshop!</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>


<body>

<%
    Boolean rech = false;

    try
    {
        rech = Boolean.parseBoolean(session.getAttribute("rech").toString());
    }
    catch (Exception e)
    {
        rech = false;
    }

    if (rech == false)
    {

%>

<div id="haupt">
	<%
		session.setAttribute("SeitenTitel", "Hauptseite");
	%>
    <div id="haupt_willkommen"><h2>Willkommen beim</h2></div>
    <div id="haupt_gearshop"><p id="p3">Gearshop</p></div>
    <div id="haupt_div_bild"><img src="Bilder/Gears_Black.png" alt="404: Logo not found!" id="haupt_bild"></div>
    <div id="haupt_links">
        <p class="haupt_links_p">We know how gears work!</p>
        <p class="haupt_links_p">Bereits hier gewesen? Hier geht es zur <a href="anmeldung.jsp" onclick="IndexLoad();return false;">Anmeldung</a>.</p>
        <p class="haupt_links_p">Neukunde? Hier geht es zur <a href="registrierung.html" onclick="IndexLoad();return false;">Registrierung</a>.</p>
        <p class="haupt_links_p">Warnung! Diese Seite hat keinerlei Funktion eines richtigen Shops!</p>
        <p class="haupt_links_p">Diese Seite dient nur zu Testzwecken. Es wird keinerlei Haftung übernommen!</p>
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
            out.print("Herzlichen Dank für die Bestellung! Deine Ware kommt niemals an! :)");
        %>
        </h1>
<%
        session.setAttribute("rech",false);
    }
%>
</body>
</html>
