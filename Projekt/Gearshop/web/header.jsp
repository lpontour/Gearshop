<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Header</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>

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
	
	String titel = "Hauptseite";
	
	try
	{
		titel = session.getAttribute("SeitenTitel").toString();
	}
	catch(Exception e)
	{
		titel = "Hauptseite";
	}
%>

    <div id="header">
        
        <div id="header_logo">
            <img src="Bilder/Gears_Black.png" alt="404: Gears_Black.png">
        </div>

        <div id="header_shopname">
            <h1>Gearshop</h1><br>        
            <p id = p1><%out.print(titel);%></p>   
            <%
                if(ange == true)
                {
            		%>
           				<form id="header_abmelden" method="post" action="abmelden.jsp"><button type="submit" id="abmeldenbutton" >Abmelden</button></form>
           			<%
                }
            %>

        </div>
    </div>

</body>
</html>