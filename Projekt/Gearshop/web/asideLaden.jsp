<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Aside</title>    
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>

<%@ page import="iae.projekt.gearshop.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>


<body>
<% 

	int werbungsID = Integer.parseInt(request.getParameter("werbungsbild"));
    DBMysql db = null;
    out.print(werbungsID);
    
    try 
    {
        db = new DBMysql();

        boolean verbunden = db.connect();

    } 
    catch (SQLException e) 
    {
        out.print("<br>Fehler: Verbindung mit der Datenbank ist Fehlgeschlagen!<br>");
    } 
    catch (ClassNotFoundException e) 
    {
        out.print("<br>Fehler: Der Mysql-Connector ist nicht korrekt eingebunden!<br>");
    } 
    catch (Exception e)
	{
        out.print("<br>Fehler: Da ist etwas schief gegangen: "+e.getMessage()+"<br>");
    }

Blob image = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs = null;

try 
{
	db.rs = db.openQuery("SELECT `Bild` FROM `Werbungen` WHERE `Werbung-ID` = " + werbungsID);

	if (db.rs.next()) 
	{

		image = db.rs.getBlob(1);

		imgData = image.getBytes(1,(int)image.length());

	} 
	else 
	{

		out.println("Display Blob Example");

		out.println("image not found for given id>");

		return;

	}

	// display the image

	response.setContentType("image/gif");

	OutputStream o = response.getOutputStream();

	o.write(imgData);

	o.flush();

	o.close();

} 
catch (Exception e) 
{

	out.println("Unable To Display image");

	out.println("Image Display Error=" + e.getMessage());

	return;

} 
finally 
{

	try 
	{


  		db.disconnect();

	} 
	catch (SQLException e) 
	{

		e.printStackTrace();

	}

}

%>
</body>
</html>