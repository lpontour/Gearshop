package iae.projekt.gearshop;


import java.sql.*;



public class DBMysql
{
    // Siehe http://www.vogella.com/tutorials/MySQLJava/article.html
    // Serveradresse
    private String dbHost = "mysql1001.mochahost.com";
    private String dbUrl = "jdbc:mysql://mysql1001.mochahost.com/welog93_Gearshop";
    private String dbPort = "80";
    private String dbUser = "welog93_Dana";
    private String dbPassword = "lol123lo";


    // Die folgende Zeile legt fest, welcher JDBC-Datenbanktreiber
    // verwendet werden soll. Wir moechten uns mit MySQL verbinden:
    private String dbJDBCDriver = "com.mysql.jdbc.Driver";

    // Variablen zur Verwaltung der Datenbank und der Daten aus der
    // Datenbank
    private Connection con = null;
    public ResultSet rs = null;


    /**
     * Datenbankverbindung oeffnen
     */
    public boolean connect() throws ClassNotFoundException, SQLException {
        // Welchen JDBC-Driver moechten wir nutzen:
        Class.forName(dbJDBCDriver);

        // Verbindung zur DB herstellen
        con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        return !con.isClosed();
    }



    /**
    * Oeffnet eine SQl-Abfrage und gibt das Ergebnis in Form
    * eines ResultSets zurueck.
    */
    public ResultSet openQuery(String sqlStatement) throws SQLException {

        Statement statement = con.createStatement();

        rs = statement.executeQuery(sqlStatement);

        return rs;
    }


    /**
    * Sendet eine ?nderungsabfrage an den Server
    *
    * @param sqlStatement
    * @throws SQLException
    */
    public void updateQuery(String sqlStatement) throws SQLException {

        Statement statement = con.createStatement();

        statement.executeUpdate(sqlStatement);
    }


    /*Registrierung*/
    public String RegistriereBenutzer(String anrede, String titel ,String nachname, String vorname, String email, String passwort,
                                      String strasse, String hausnr, String plz, String ort, String telefon) throws SQLException
    {
        String sql = "INSERT INTO `Benutzer`( `Anrede`, `Titel`, `Nachname`, `Vorname`, `E-Mail`, `Passwort`, `Strasse`, `Haus-Nr`, `PLZ`, `Ort`, `Telefon`) VALUES ('" + anrede + "','" + titel +"','"+ nachname +"',' " + vorname + "','"+ email +"','" + passwort + "','" +strasse+ "','" + hausnr + "','" + plz + "','"+ ort +"','"+telefon+"')";
        updateQuery(sql);
        return sql;
    }


    /*Anmeldung*/
    public String AnmeldungBenutzer(String email) throws SQLException
    {
        String sql = "SELECT `Passwort`, `Benutzer-ID` FROM `Benutzer` WHERE `E-Mail` = '"+email+"'";
        return sql;
    }


    /*Kundenkonto*/
    public String AendereAdresse(int benutzerID, String strasse, String hausnr, String plz, String ort) throws SQLException
    {
        String sql = "UPDATE `Benutzer` SET `Strasse`='"+strasse+"', `Haus-Nr`='"+hausnr+"', `PLZ`='"+plz+"', `Ort`='"+ort+"' WHERE `Benutzer-ID` ="+benutzerID;
        updateQuery(sql);
        return sql;
    }


    public String AendereEmail(int benutzerID, String email) throws SQLException
    {
        String sql = "UPDATE `Benutzer` SET `E-Mail`='"+email+"' WHERE `Benutzer-ID` ="+benutzerID;
        updateQuery(sql);
        return sql;
    }


    public String AenderePasswort(int benutzerID, String passwort) throws SQLException
    {
        String sql = "UPDATE `Benutzer` SET `Passwort`='"+passwort+"' WHERE `Benutzer-ID` ="+benutzerID;
        updateQuery(sql);
        return sql;
    }


    public String AendereTelefon(int benutzerID, String telefon) throws SQLException
    {
        String sql = "UPDATE `Benutzer` SET `Telefon`='"+telefon+"' WHERE `Benutzer-ID` ="+benutzerID;
        updateQuery(sql);
        return sql;
    }



    /*Bestellvorgang*/

    public String DatenBenutzer(int benID) throws SQLException
    {
        String sql ="SELECT `Anrede`, `Titel`, `Nachname`, `Vorname`, `Strasse`, `Haus-Nr`, `PLZ`, `Ort` FROM `Benutzer` WHERE `Benutzer-ID` = '"+benID+"'";
        return sql;
    }

    public String DatenProdukt(int benID) throws SQLException
    {
        String sql ="SELECT `Produkt-ID`, `Bezeichnung`, `Preis` FROM `Warenkoerbe` WHERE `Benutzer-ID` = '"+benID+"'";
        return sql;
    }


    /*Produkt*/
    public String ProduktWarenkorbHinzufuegen(int benutzerID, int produktID,int anzahl, double preis, String bezeichnung) throws SQLException
    {
        String sql = "INSERT INTO `Warenkoerbe`(`Benutzer-ID`,`Produkt-ID`,`Anzahl`, `Preis`, `Bezeichnung`) VALUES ('" + benutzerID + "','" + produktID + "','" + anzahl + "','" + preis+ "','" + bezeichnung + "')";
        updateQuery(sql);
        return sql;
    }


    /**
    * Datenbankverbindung schliessen
    */

    public void disconnect() throws SQLException {
        // Die Datenbankverbindung soll wieder geschlossen werden:
        if (!(con == null))
            if (!con.isClosed())
                con.close();

    }







}





