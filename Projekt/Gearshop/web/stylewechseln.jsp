<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>stylewechseln</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>

<body>
<%
int stiltyp = 1;

try 
{
	stiltyp = Integer.parseInt(session.getAttribute("style").toString());
} 
catch (Exception e)
{
		stiltyp = 1;
}


if(stiltyp == 1)
{
	stiltyp = 2;
	try 
	{
	    session.setAttribute("style", stiltyp);
	} 
	catch (Exception e)
	{
	    out.print(e.getMessage());
	}
	response.sendRedirect("http://gearshop.info/gearshop/?page=haupt");
}
else if(stiltyp == 2)
{
	stiltyp = 3;
	try 
	{
	    session.setAttribute("style", stiltyp);
	} 
	catch (Exception e)
	{
	    out.print(e.getMessage());
	}
	response.sendRedirect("http://gearshop.info/gearshop/?page=haupt");
}
else if(stiltyp == 3)
{
	stiltyp = 4;
	try 
	{
	    session.setAttribute("style", stiltyp);
	} 
	catch (Exception e)
	{
	    out.print(e.getMessage());
	}
	response.sendRedirect("http://gearshop.info/gearshop/?page=haupt");
}
else if(stiltyp == 4)
{
	stiltyp = 1;
	try 
	{
	    session.setAttribute("style", stiltyp);
	} 
	catch (Exception e)
	{
	    out.print(e.getMessage());
	}
	response.sendRedirect("http://gearshop.info/gearshop/?page=haupt");
}
%>


</body>
</html>
