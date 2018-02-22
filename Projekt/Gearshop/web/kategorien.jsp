<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<title>Kategorien</title>
	<script src="script.js"></script>
	<script src="JS/jquery-3.2.1.min.js"></script>
</head>



<body>
<%
	session.setAttribute("SeitenTitel", "Kategorien"); 
%>
<div id="kategorie">
	<div id="kategorie_div_liste">
		<ul id="kategorie_liste">
			<li>
				<a href="warenauflistung.jsp?kat=1&s=1" id=navLinkArbeitsspeicherHref onclick="kategorienToWarenauflistung();return false;">
					<div class="kategorie_link">
						<img src="Bilder/Arbeitsspeicher.jpg" alt="404: Arbeitsspeicher" class="kategorie_bild">
						<p class="kategorie_p">Arbeitsspeicher</p>
					</div>
				</a>
			</li>

			<li>
				<a href="warenauflistung.jsp?kat=2&s=1" id=navLinkGrafikkartenHref onclick="kategorienToWarenauflistung();return false;">
					<div class="kategorie_link">
						<img src="Bilder/Grafikkarten.jpg" alt="404: Grafikkarten" class="kategorie_bild">
						<p class="kategorie_p">Grafikkarten</p>
					</div>
				</a>
			</li>

			<li>
				<a href="warenauflistung.jsp?kat=3&s=1" id=navLinkMainboardsHref onclick="kategorienToWarenauflistung();return false;">
					<div class="kategorie_link">
						<img src="Bilder/Mainboards.jpg" alt="404: Mainboards" class="kategorie_bild">
						<p class="kategorie_p">Mainboards</p>
					</div>
				</a>
			</li>

			<li>
				<a href="warenauflistung.jsp?kat=4&s=1" id=navLinkProzessorenHref onclick="kategorienToWarenauflistung();return false;">
					<div class="kategorie_link">
						<img src="Bilder/Prozessoren.jpg" alt="404: Prozessoren" class="kategorie_bild">
						<p class="kategorie_p">Prozessoren</p>
					</div>
				</a>
			</li>
		</ul>
	</div>
</div>


</body>
</html>