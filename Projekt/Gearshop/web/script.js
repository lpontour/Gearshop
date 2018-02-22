function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function SideLoad()
{
    $("#Nav").load("nav.jsp");
    $("#Header").load("header.jsp");
    $("#Adds").load("aside.jsp");
    $("#Footer").load("footer.html");
	
	
	var page = getParameterByName("page", window.location.href);
	if (page=="haupt")
		{
			$("#Index").load("haupt.jsp");
		}
	if (page=="anmeldung")
		{
			$("#Index").load("anmeldung.jsp");
		}
	if (page=="registrierung")
		{
			$("#Index").load("registrierung.jsp");
		}
	if (page=="kategorien")
		{
			$("#Index").load("kategorien.jsp");
		}
    if (page=="warenkorb")
    {
        $("#Index").load("warenkorb.jsp");
    }
    if (page=="kundenkonto")
    {
        $("#Index").load("kundenkonto.jsp");
    }
	if (page=="kontakt")
		{
			$("#Index").load("kontakt.jsp");
		}
	if (page=="impressum")
		{
			$("#Index").load("impressum.jsp");
		}
	if (page=="anfahrt")
		{
			$("#Index").load("anfahrt.jsp");
		}
	if (page=="team")
		{
			$("#Index").load("team.jsp");
        }
    if (window.location.href=="http://gearshop.info/gearshop/")
	{
			$("#Index").load("haupt.jsp");
	}
}



function IndexLoad()
{
    $(document).ready(function()
    {
        $('a').click(function(e)
        {
            e.preventDefault();
            
            $("#Index").load($(this).attr('href'));
            
			if($(this).attr('href')=="haupt.jsp")
				{
					$('title').html("Gearshop-Hauptseite");
					window.history.pushState(null, null, '?page=haupt');
				}
			if($(this).attr('href')=="anmeldung.jsp")
				{
					$('title').html("Gearshop-Anmeldung");
					window.history.pushState(null, null, '?page=anmeldung');
				}
			if($(this).attr('href')=="registrierung.jsp")
				{
					$('title').html("Gearshop-Registrierung");
					window.history.pushState(null, null, '?page=registrierung');
				}
			if($(this).attr('href')=="kategorien.jsp")
				{
					$('title').html("Gearshop-Kategorien");
					window.history.pushState(null, null, '?page=kategorien');
				}
            if($(this).attr('href')=="warenkorb.jsp")
            {
                $('title').html("Gearshop-Warenkorb");
                window.history.pushState(null, null, '?page=warenkorb');
            }
            if($(this).attr('href')=="kundenkonto.jsp")
            {
                $('title').html("Gearshop-Kundenkonto");
                window.history.pushState(null, null, '?page=kundenkonto');
            }
            if($(this).attr('href')=="kontakt.jsp")
				{
					$('title').html("Gearshop-Kontakt");
					window.history.pushState(null, null, '?page=kontakt');
				}
			if($(this).attr('href')=="impressum.jsp")
				{
					$('title').html("Gearshop-Impressum");
					window.history.pushState(null, null, '?page=impressum');
				}
			if($(this).attr('href')=="anfahrt.jsp")
				{	
					$('title').html("Gearshop-Anfahrt");
					window.history.pushState(null, null, '?page=anfahrt');
				}
			if($(this).attr('href')=="team.jsp")
				{	
					$('title').html("Gearshop-Team");
					window.history.pushState(null, null, '?page=team');
				}
				$("#Header").load("header.jsp");
       });	
    });	
}

function kategorienToWarenauflistung()
{
   $(document).ready(function()
    {
        $('a').click(function(e)
        {
            e.preventDefault();
			var katID = getParameterByName("kat", $(this).attr('href'));
			window.history.pushState(null, null, '?page=warenliste&kat=' + katID+'&s=1');
            $("#Index").load($(this).attr('href'));			
		});
	});
}
function WarenauflistungToProdukt()
{
   $(document).ready(function()
    {
        $('a').click(function(e)
        {
            e.preventDefault();
			var proID = getParameterByName("proID", $(this).attr('href'));
			window.history.pushState(null, null, '?page=produkt&proID=' + proID);
            $("#Index").load($(this).attr('href'));			
		});
	});
}
function warenauflistungToWarenauflistung()
{
   $(document).ready(function()
    {
        $('a').click(function(e)
        {
            e.preventDefault();
			var katID = getParameterByName("kat", $(this).attr('href'));
			var seite = getParameterByName("s", $(this).attr('href'));
			window.history.pushState(null, null, '?page=warenliste&kat=' + katID + '&s=' + seite);
            $("#Index").load($(this).attr('href'));			
		});
	});
}

/*Anmeldung*/
function Anmelden()
{
    formAnmeldung = document.forms["anmeldung_formular"];

    if (AnmeldungPlausibel() == true)
    {
        formAnmeldung.submit();
    }
}

function AnmeldungPlausibel()
{
    formAnmeldung = document.forms["anmeldung_formular"];
    email = formAnmeldung.elements["anmeldung_email"];
    passwort = formAnmeldung.elements["anmeldung_passwort"];

    if (email.value != "" && passwort.value != "")
    {
        return true;
    }

    else
    {
        alert ("Bitte fülle alle Felder, um dich anzumelden!");
        return false;
    }
}


/*Registrierung*/
function Registrieren()
{
    formRegistrierung = document.forms["registrierung_formular"];

    if (RegistrierungPlausibel() == true && RegistrierungPasswortGleich() == true)
    {
        alert("Registrierung erfolgreich!");
        formRegistrierung.submit();
    }
	else
	{
		alert("Registrierung fehlgeschlagen!");
	}

}

function RegistrierungPlausibel()
{
    formRegistrierung = document.forms["registrierung_formular"];
    email = formRegistrierung.elements["registrierung_email"];
    passwort = formRegistrierung.elements["registrierung_passwort"];
    passwortwdh = formRegistrierung.elements["registrierung_passwortwdh"];
    vorname = formRegistrierung.elements["registrierung_vorname"];
    nachname = formRegistrierung.elements["registrierung_nachname"];
    strasse = formRegistrierung.elements["registrierung_strasse"];
    hausnr = formRegistrierung.elements["registrierung_hausnr"];
    plz = formRegistrierung.elements["registrierung_plz"];
    ort = formRegistrierung.elements["registrierung_ort"];

    if (email.value != "" && passwort.value != "" && passwortwdh.value != "" && vorname.value != "" && nachname.value != "" &&
        strasse.value != "" && hausnr.value != "" && plz.value != "" && ort.value != "")
    {
        return true;
    }

    else
    {
        alert ("Bitte fülle alle Pflichtfelder, um dich zu registrieren!");
        return false;
    }
}

function RegistrierungPasswortGleich()
{
    formRegistrierung = document.forms["registrierung_formular"];
    passwort = formRegistrierung.elements["registrierung_passwort"];
    passwortwdh = formRegistrierung.elements["registrierung_passwortwdh"];

    if (passwort.value == passwortwdh.value)
    {
        return true;
    }
    else
    {
        alert("Bitte gebe das Passwort noch einmal richtig ein!");
        return false;
    }
}


    /*Kundenkonto*/

    function AdresseAendern()
    {
        formKundenkontoAdresse = document.forms["kundenkonto_formular_adresse_aendern"];

        if (KundenkontoAdressePlausibel() == true)
        {
            alert("Adresse wurde erfolgreich geändert!");
            formKundenkontoAdresse.submit();
        }
    }


    function KundenkontoAdressePlausibel() {
        formKundenkontoAdresse = document.forms["kundenkonto_formular_adresse_aendern"];
        strasse = formKundenkontoAdresse.elements["kundenkonto_strasse"];
        hausnr = formKundenkontoAdresse.elements["kundenkonto_hausnr"];
        plz = formKundenkontoAdresse.elements["kundenkonto_plz"];
        ort = formKundenkontoAdresse.elements["kundenkonto_ort"];

        if (strasse.value != "" && hausnr.value != "" && plz.value != "" && ort.value != "") {
            return true;
        }

        else {
            alert("Bitte fülle alle Felder, um deine aktuelle Adresse zu ändern!");
            return false;
        }

    }


    function EmailAendern() {
        formKundenkontoEmail = document.forms["kundenkonto_formular_email_aendern"];

        if (KundenkontoEmailPlausibel() == true) {
            alert("E-Mail-Adresse wurde erfolgreich geändert!");
            formKundenkontoEmail.submit();
        }
    }

    function KundenkontoEmailPlausibel() {
        formKundenkontoEmail = document.forms["kundenkonto_formular_email_aendern"];
        email = formKundenkontoEmail.elements["kundenkonto_email"];

        if (email.value != "") {
            return true;
        }

        else {
            alert("Bitte gib eine neue E-Mail-Adresse ein, um deine aktulle E-Mail zu ändern!");
            return false;
        }
    }


    function PasswortAendern() {
        formKundenkontoPasswort = document.forms["kundenkonto_formular_passwort_aendern"];


        if (KundenkontoPasswortPlausibel() == true && KundenkontoPasswortGleich() == true)
        {
            alert("Passwort wurde erfolgreich geändert!");
            formKundenkontoPasswort.submit();
        }
    }

    function KundenkontoPasswortPlausibel() {
        formKundenkontoPasswort = document.forms["kundenkonto_formular_passwort_aendern"];
        passwortneu = formKundenkontoPasswort.elements["kundenkonto_passwort_neu"];
        passwortwdh = formKundenkontoPasswort.elements["kundenkonto_passwort_wdh"];

        if (passwortneu.value != "" && passwortwdh.value != "") {
            return true;
        }

        else {
            alert("Bitte fülle alle Felder, um dein Passwort zu ändern!");
            return false;
        }
    }

    function KundenkontoPasswortGleich() {
        formKundenkontoPasswort = document.forms["kundenkonto_formular_passwort_aendern"];
        passwortneu = formKundenkontoPasswort.elements["kundenkonto_passwort_neu"];
        passwortwdh = formKundenkontoPasswort.elements["kundenkonto_passwort_wdh"];

        if (passwortneu.value == passwortwdh.value) {
            return true;
        }
        else{
            alert("Das neue Passwort und die Wiederholung stimmen nicht überein!");
            return false;
        }
    }



    function TelefonAendern() {
        formKundenkontoTelefon = document.forms["kundenkonto_formular_telefon_aendern"];

        if (KundenkontoTelefonPlausibel() == true) {
            alert("Telefonnummer wurde erfolgreich geändert!");
            formKundenkontoTelefon.submit();
        }
    }

    function KundenkontoTelefonPlausibel() {
        formKundenkontoTelefon = document.forms["kundenkonto_formular_telefon_aendern"];
        telefon = formKundenkontoTelefon.elements["kundenkonto_telefon"];

        if (telefon.value != "") {
            return true;
        }

        else {
            alert("Bitte gib eine neue Telefonnummer ein, um deine aktuelle Nummer zu ändern!");
            return false;
        }

}
