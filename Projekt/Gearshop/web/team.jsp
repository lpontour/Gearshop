<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Das Team</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>


<body>
<%
	session.setAttribute("SeitenTitel", "Team"); 
%>
<div id="team">
    <a href="person_paulmann.html" onclick="IndexLoad();return false;"><div class="team_div">
        <img src="Bilder/lukas_paulmann_profielbild.jpg" alt="404: Portraitfoto" class="team_bild">
        <p>Lukas Paulmann</p>
    </div>
    </a>
    <a href="person_lachmann.html" onclick="IndexLoad();return false;"><div class="team_div">
        <img src="Bilder/dana.jpg" alt="404: Portraitfoto" class="team_bild">
        <p>Dana Lachmann</p>
    </div>
    </a>
    <a href="person_putilov.html" onclick="IndexLoad();return false;"><div class="team_div">
        <img src="Bilder/rp9.jpg" alt="404: Portraitfoto" class="team_bild">
        <p>Roman Putilov</p>
    </div>
    </a>
    <a href="person_paradies.html" onclick="IndexLoad();return false;"><div class="team_div">
        <img src="Bilder/hergen.jpg" alt="404: Portraitfoto" class="team_bild">
        <p>Hergen Paradies</p>
    </div>
    </a>
    <a href="person_andy.html" onclick="IndexLoad();return false;"><div class="team_div">
        <img src="Bilder/Andy.jpg" alt="404: Portraitfoto" class="team_bild">
        <p>Andy</p>
    </div>
    </a>
    <a href="person_tootsie.html" onclick="IndexLoad();return false;"><div class="team_div">
        <img src="Bilder/Tootsie.jpg" alt="404: Portraitfoto" class="team_bild">
        <p>Tootsie</p>
    </div>
    </a>

</div>
</body>
</html>