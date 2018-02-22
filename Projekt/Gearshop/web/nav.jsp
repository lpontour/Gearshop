<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head><meta http-equiv="Content-Type" content="text/html" charset="UTF-8">

<title>nav</title>
<script src="script.js"></script>
<script src="JS/jquery-3.2.1.min.js"></script>
</head>

<body>
<div id="nav">
	<ul>
		<li><a href="haupt.jsp" onclick="IndexLoad(); return false;"><div class="nav-link">Hauptseite</div></a></li>
		<li><a href="anmeldung.jsp" onclick="IndexLoad();return false;"><div class="nav-link">Anmelden</div></a></li>
		<li><a href="registrierung.jsp" onclick="IndexLoad();return false;"><div class="nav-link">Registrieren</div></a></li>
		<li><a href="kategorien.jsp" onclick="IndexLoad();return false;"><div class="nav-link">Kategorien</div></a></li>
		<li><a href="warenkorb.jsp" onclick="IndexLoad();return false;"><div class="nav-link">Warenkorb</div></a></li>
		<li><a href="kundenkonto.jsp" onclick="IndexLoad();return false;"><div class="nav-link">Kundenkonto</div></a></li>
		<li><a href="kontakt.jsp" onclick="IndexLoad();return false;"><div class="nav-link">Kontakt</div></a></li>
		<li><a href="impressum.jsp" onclick="IndexLoad();return false;"><div class="nav-link">Impressum</div></a></li>
		<li><a href="anfahrt.jsp" onclick="IndexLoad();return false;"><div class="nav-link">Anfahrt</div></a></li>
		<li><a href="team.jsp" onclick="IndexLoad();return false;"><div class="nav-link">Team</div></a></li>
	</ul>
	<form id="stylewechseln" method="post" action="stylewechseln.jsp"><button type="submit" id="nav_button" >Stil wechseln</button></form>
</div>
</body>
</html>