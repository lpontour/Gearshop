
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<link rel="icon" type="image/png" sizes="32x32" href="Bilder/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="Bilder/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="Bilder/favicon/favicon-16x16.png">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="Bilder/favicon/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">
    <title>Gearshop</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="script.js"></script>
	<script src="JS/jquery-3.2.1.min.js"></script>

<%
	try
	{
		if(Integer.parseInt(session.getAttribute("style").toString()) == 1)
		{
			%>
			<link href="CSS/style_lukas.css" type="text/css" rel="stylesheet" title="css_standart">
			<%	
		}
		else if(Integer.parseInt(session.getAttribute("style").toString()) == 2)
		{
			%>
			<link href="CSS/style_hergen.css" type="text/css" rel="stylesheet" title="css_nacht">
			<%
		}
		else if(Integer.parseInt(session.getAttribute("style").toString()) == 3)
		{
			%>
			<link href="CSS/style_dana.css" type="text/css" rel="stylesheet" title="css_girlie">
			<%
		}
		else if(Integer.parseInt(session.getAttribute("style").toString()) == 4)
		{
			%>
			<link href="CSS/style_roman.css" type="text/css" rel="stylesheet" title="css_joker">
			<%
		}
		else if(Integer.parseInt(session.getAttribute("style").toString()) != 1 && Integer.parseInt(session.getAttribute("style").toString()) != 2 && Integer.parseInt(session.getAttribute("style").toString()) != 3 && Integer.parseInt(session.getAttribute("style").toString()) != 4)
		{
			session.setAttribute("style", 1);
			%>
			<link href="CSS/style_lukas.css" type="text/css" rel="stylesheet" title="css_standart">
			<%
		}
	}
	catch (Exception e)
	{
		session.setAttribute("style", 1);
		%>
		<link href="CSS/style_lukas.css" type="text/css" rel="stylesheet" title="css_standart">
		<%
	}
%>
</head>

<body onload="SideLoad(); return false;">

       <div id="Header">
       </div>

        <div id="Nav">
        </div>

        <div id="Index">
            <p>Bitte benutze die Navigationsleiste zum Navigieren</p>
        </div>
				
        <div id="Adds">
        </div>

        <div id="Footer">
        </div>
</body>

</html>