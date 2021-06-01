<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Main Page Grow Up</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="styless.css">
        <link href="https://fonts.cdnfonts.com/css/avenir-next-cyr" rel="stylesheet">
       
        <script type="text/javascript" src="jsscript.js"></script>
    <body>
        <div id="mainContent">
            <%@include file="common/header.jspf" %>
            <div id="promo">
                <div id="active">
                    <p style="margin-left: 15px">20 de ani de succes! <br>
                        Echipa Grow Up
                    </p>
                </div>
                <div id="slidecontainer">
                    <form method="POST" action="registering.html">
                        <h1 style="margin-left: 20%;">Calculator sumă</h1>
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
                    </form>
                </div>

            </div>
            <div style="clear: both;"></div>

            <div id="content1">

                <h2>Vezi care sunt șansele să obții un </h2>
                <h1>credit online!</h1>
                <div id="goNext"><a href="registering.html" style="margin: 0px;">Să începem!</a></div>
                <h1>Alege Grow Up și ai doar de câștigat</h1>

            </div>
            <div id="content2">
                <div id="content2right">

                    <h2><img src="images/fem.png">Ești client nou?</h2>
                    <ol>
                        <li>Primul credit este GRATUIT. Obții până la 15000 lei, pentru o perioadă maximă de 60 zile.</li>
                        <hr>
                        <li>Împrumut urgent online, simplu de obținut. Îți confirmăm rapid acordarea creditului prin SMS, în doar 7 minute de la aplicare.</li><hr>
                        <li>Optează pentru bani rapid, online. Aprobăm online 7 din 10 cereri de credit, fără gaj.</li><hr>
                        <li>Tu alegi unde îți transferăm banii: pe cardul tău bancar sau în numerar.</li>
                    </ol>
                </div>
                <div id="content2left">

                    <h2><img src="images/masc.png">Ești client fidel?</h2>
                    <ol>
                        <li>Reduceri la următoarele credite. Pentru următorul împrumut, folosește promocodul din SMS pentru o dobândă cu reducere.</li>
                        <hr>
                        <li>Știi ce presupune un credit bun? Achitarea dobânzii exact pentru perioada cât ai folosit creditul. Transparent, avantajos, comod!</li>
                        <hr>
                        <li>Alege împrumuturi online fără acte. Aprobăm 9 din 10 cereri, automat și fără multe întrebări.</li>
                        <hr>
                        <li>Ce poate fi mai simplu decât formularul nostru de credit online? Doar alegi suma și perioada, răspuns primești imediat.</li>

                    </ol>
                </div>

            </div>
            <div id="content3">
                <h3>1. Despre compania Grow Up</h3> 
                Grow Up – te ajută atunci când ai nevoie de bani rapid. 
                Grow Up oferă credite online în Moldova, într-un mod simplu și avantajos, 
                doar completezi un formular online și în scurt timp ai banii pe card. 
                Creditele online rapide sunt împrumuturi concepute pentru a transfera rapid banii în contul tău. 
                Aceste credite sunt ideale pentru o necesitate de urgență sau când ai nevoie brusc de numerar. 
                Scopul nostru este să oferim credite online, în mod competitiv, sigur, transparent și în timp rapid. 
                Grow Up te ajută rapid când ai nevoie de bani aici și acum. Noi îți economisim timpul 
                și acordăm împrumutul dorit, fără birocrație, drumuri la oficiile noastre și alte complicații. 
                Scopul nostru e să schimbăm piața financiară din Moldova în una transparentă, simplă și comodă. 
                <h3>2. Motivele pentru care clienții aleg Grow Up</h3> 
                <ul style="list-style-type: none;">
                    <li>2.1. E avantajos Dobânda se achită doar pe perioada folosirii împrumutului. O recalculăm și avem grijă să 
                        nu plătești în plus. Exemplu: Ai luat credit pe termen de 30 zile, 
                        dar îl întorci în 15 zile. În acest caz, achiți dobânda doar pentru 15 zile.</li>
                    <li>2.2. E 100% online Completezi formularul online, primești confirmarea prin SMS și semnezi contractul online. </li>
                    <li>2.3. Acordăm credite oriunde Acordăm easy credit md pe tot teritoriul Republicii Moldova. 
                        Banii îi poți primi pe card sau în numerar la sucursalele Moldindconbank și oficiile Poșta Moldovei.</li>
                    <li>2.4. Activăm conform legii Cu noi, totul este legal și corect. </li>
                </ul>
                <h3>3. Cum poți depune cererea pentru un credit online? </h3>
                Pentru a beneficia de un credit online e nevoie: Să ai vârsta minimă de 18 ani (nu este obligatoriu să fii angajat oficial); Să ai buletin de identitate valabil; Să ai număr de telefon activ; Să ai un card activ în lei, eliberat de orice bancă din Republica Moldova (în cazul în care vrei să primești banii pe card); Să ai o istorie creditară pozitivă și să ne comunici date veridice; Să ai capacitatea financiară de a onora în termen obligațiile contractuale. 
                <h3>4. Cum rambursezi creditul la Grow Up? </h3>
                Procesul de rambursare e foarte simplu, rapid și comod. Alege oricare din opțiunile de rambursare: Terminalele Qiwi, RunPay, BPay, comision pentru procesarea plății 1,5%; Terminalele Paynet, amplasate în oficiile Grow Up, comision pentru procesarea plății 0%; Offline – sucursalele Victoriabank, comision pentru procesarea plății 10 lei sau oficiile Poșta Moldovei, comision pentru procesarea plății 6 lei; Oficiile Grow Up, comision pentru procesarea plății 0%; Cabinetul personal – achitând cu cardul, comision pentru procesarea plății 1%; Online – prin oplata.md, comision pentru procesarea plății 1%. 
                <h3>5. Confidențialitatea și securitatea datelor</h3>
                În general, utilizăm informații cu caracter personal pentru evaluarea, personalizarea și îmbunătățirea serviciilor pe care le prestăm clienților noștri. Întreprindem măsuri rezonabile pentru a proteja informațiile tale personale de la: Abuz; Acces, modificare sau dezvăluire neautorizată. Pașii de precauție pe care îi luăm pentru protejarea informațiilor de caracter personal includ: Adoptăm măsuri pentru protejarea sistemelor și rețelelor noastre informatice pentru stocarea, procesarea și transmiterea informațiilor personale; Adoptăm măsuri procedurale pentru limitarea accesului la informații personale de către personalul nostru; Revizuirea practicilor noastre de colectare, stocare și prelucrare a informațiilor; Cât și alte măsuri de securitate pe care le considerăm rezonabile și adecvate. Împrumută cât ai nevoie din sursa ta de încredere – Grow Up!
            </div>
        </div>

        <%@include file="common/footer.jspf" %>

    </body>
</html>
