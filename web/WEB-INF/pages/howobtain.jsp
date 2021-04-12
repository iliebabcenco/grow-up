<%-- 
    Document   : howobtain
    Created on : Aug 29, 2020, 8:00:13 AM
    Author     : AveZomer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="jsscript.js"></script>
        <title>How To Obtain</title>
    </head>
    <body>
        <%@include file="common/header.jspf"%>

        <div id="promohowobtain">
            <div id="howobtain">
                <h1>Cum obțin un credit rapid de la Grow Up? </h1>
                Obținerea de credit online este un mod eficient de a face față cheltuielilor care apar brusc. 
                Poți obține un împrumut de la Grow Up online: accesând site-ul nostru folosind telefonul, laptopul sau tableta, fără a părăsi casa sau locul de muncă sau dacă îți este mai comod, te apropii la unul din oficiile noastre, avem în Chișinău, Rîșcani și Bălți, adresele exacte le găsiți aici. 
                Acordăm credite pe tot teritoriul Moldovei, iar banii îi poți primi rapid  pe card sau în numerar. 
                <h3>Pentru a putea examina cererea de un credit online e nevoie:</h3>
                <ul>
                    <li>Să ai vârsta minimă de 18 ani (nu este obligatoriu să fii angajat oficial);</li>
                    <li>Să ai buletin de identitate valabil; Să ai număr de telefon activ;</li>
                    <li>Să ai un card activ în lei, eliberat de orice bancă din Republica Moldova (în cazul în care vrei să primești banii pe card);</li>
                    <li>Să ai o istorie creditară pozitivă și să ne comunici date veridice;</li>
                    <li>Să ai capacitatea financiară de a onora în termen obligațiile contractuale.  </li>
                    <li>Să ai un card activ în lei, eliberat de orice bancă din Republica Moldova (în cazul în care vrei să primești banii pe card). </li>

                </ul>
                Grow Up e modern și obții împrumutul dorit 100% online, urmând câțiva pași:
                <h3>Alegi suma dorită și perioada</h3> 
                <p>Alegi suma dorită și perioada cu ajutorul calculatorului. 
                    La Grow Up suma maximă pe care o poți obține e de 100 000 lei.</p>
                <h3>Completezi cererea online</h3> <p>Completezi formularul cu datele personale. Îți ia până la 10 minute, e simplu și comod. D
                    acă dorești să primești banii pe card, atunci introduci și datele cardului tău.</p>
                <h3>Primești confirmarea și semnezi contractul</h3> <p>Procesăm rapid cererea ta, primești confirmarea prin sms – durează 7 minute. 
                    Apoi semnezi contractul online printr-un cod unic transmis la fel prin sms.</p> 
                <h3>Primești banii</h3> <p>Primești banii direct pe card (de regulă durează până la 60 minute). 
                    Sau ridici banii în numerar(poți lua banii după 5 minute de la semnarea contractului online).</p> 
            </div>
            <div id="calculator">
                <div id="slidecontainer">
                    <form method="POST" action="registrationserv">
                        <h1 style="margin-left: 15%;">Calculator sumă</h1>
                        <p>Alege suma <input type="text" id="mySumField" name="mySumField" value="50000 MDL" onchange="updateRangeInput(this.value);"></p>

                        <input id="mySumRange" type="range" step="1000" min="1000" max="100000" value="50000" class="slider" onchange="updateTextInput(this.value);">

                        <div id="minMaxSumDiv"><p style="float: left;">min 1000 MDL</p> <p style="float: right; margin-right: 50px;">max 100000 MDL</p></div>

                        <div style="clear: both;"></div>
                        <p>Alege termenul <input type="text" value="12 luni" id="myTermField" name="myTermField" onchange="updateRangeTermInput(this.value);"></p>

                        <input type="range" min="1" max="60" value="12" class="slider" id="myTermRange" onchange="updateTextTermInput(this.value);">
                        <div id="minMaxTermDiv"><p style="float: left;">1 lună</p> <p style="float: right; margin-right: 50px;">60 luni</p></div>
                        <div style="clear: both;"></div>
                        <div style="float: left; margin-top: 15px; margin-bottom: 10px;">
                            <p>Suma solicitată: <span id="solicitareSum"> 0 MDL</span></p><br>
                            <p>Plata lunară: <span id="rambursareSum"> 0 MDL</span></p><br>
                            <p>Costul total: <span id="solicitareCost"> 0 MDL</span></p><br>	
                            <p>Spre rambursare: <span id="solicitareRambursare"> 0 MDL</span></p><br>
                        </div>
                        <div style="clear: both;"></div>
                        <input class="btnsolicita" type="submit" name="action" value="Solicită acum" style="margin-left: 30%;">
<!--                        <div id="btnSolicita"><a href="registrationserv">Solicită acum</a></div>-->
                        
                    </form>
                </div>
            </div>
        </div>
        <%@include file="common/footer.jspf"%>
    </body>
</html>
