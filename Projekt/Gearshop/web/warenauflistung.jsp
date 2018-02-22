<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Waren</title>
    <script src="script.js"></script>
    <script src="JS/jquery-3.2.1.min.js"></script>
</head>

<%@ page import="iae.projekt.gearshop.*" %>
<%@ page import="java.sql.*" %>



<body>
<div id="waren">
<%
    int katId = Integer.parseInt(request.getParameter("kat"));
    DBMysql db = null;
    int tfCount= 0;
	int proCount =0;
	int pages=0;
	int curPage=Integer.parseInt(request.getParameter("s"));
    try {
        db = new DBMysql();

        boolean verbunden = db.connect();

    } catch (SQLException e) {
        out.print("<br>Fehler: Verbindung mit der Datenbank ist Fehlgeschlagen!<br>");
    } catch (ClassNotFoundException e) {
        out.print("<br>Fehler: Der Mysql-Connector ist nicht korrekt eingebunden!<br>");
    } catch (Exception e) {
        out.print("<br>Fehler: Da ist etwas schief gegangen: "+e.getMessage()+"<br>");
    }
    db.rs = db.openQuery("SELECT  `Produkt-ID` ,  `Kategorie-ID` ,  `Bezeichnung` ,  `Preis` ,  `Bild` FROM  `Produkte` " +
            "WHERE  `Kategorie-ID` = " + katId );
			
	 

		db.rs.beforeFirst();  
		db.rs.last();  
		proCount = db.rs.getRow();
		db.rs.beforeFirst();
		

			int w =0;
			w=(curPage-1)*4;
			for(int i=1;i<=w;i++)
			{
				db.rs.next();
			}	

		
	while (db.rs.next()&&tfCount!=4) {
    String bezeichnung = db.rs.getString(3);
    int produktID = db.rs.getInt(1);
	pages=proCount/4;
%>
<a href="produkt.jsp?proID=<% out.println(produktID); %>" onclick="WarenauflistungToProdukt();return false;">
	<div class="waren_item">
		<div class="waren_bild"><img src="bild.jsp?prod=<% out.println(produktID); %>" alt=""></div>
		<div class="warenText"><% out.println(bezeichnung);%></div>
	</div>
</a>
<%
        tfCount++;
    }
    db.disconnect();
%>


<div id="waren_seiten">
<% 
	if(curPage!=1)
	{
%>
    <a id="wahren_erste" href="warenauflistung.jsp?page=warenliste&kat=<%out.println(katId);%>&s=1" onclick="warenauflistungToWarenauflistung();return false;"> Erste</a>
<%
	}
for(int i=1;i<=pages;i++)
{
%>
    <a href="warenauflistung.jsp?page=warenliste&kat=<%out.println(katId);%>&s=<%out.println(i);%>" onclick="warenauflistungToWarenauflistung();return false;"><%out.println(i);%></a>
<%	
}
%>
<% 	if(curPage!=pages)
	{
%>
    <a id="wahren_letzte" href="warenauflistung.jsp?page=warenliste&kat=<%out.println(katId);%>&s=<%out.println(pages);%>" onclick="warenauflistungToWarenauflistung();return false;">Letzte</a>
<%
	}
%>
</div>
</div>
</body>
</html>