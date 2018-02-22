<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>aside</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>

<%@ page import="java.util.Random"%>

<%
	Random rand = new Random();	
	int werbungsID = rand.nextInt(5) + 1;

	try 
	{
    	session.setAttribute("werbungsID", werbungsID);
	} 
	catch (Exception e)
	{
    	out.print(e.getMessage());
	}
%>

<body>
    <div id="aside">
		<img src="asideLaden.jsp?werbungsbild=<% out.print(werbungsID); %>" alt="404: Asidebild" id="aside_bild" height= "100%" width = "100%">
    </div>
</body>
</html>