<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Main Page Grow Up</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="styless.css">
        <link href="https://fonts.cdnfonts.com/css/avenir-next-cyr" rel="stylesheet">
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <script type="text/javascript" src="jsscript.js"></script>
    <body>
        <div class="mainContent">
            <%@include file="common/header.jspf" %>
            <div class="promo">
                <div class="pano">
                    <p class="deviz">20 years of success! <br>
                        Grow Up Team
                    </p>
                </div>
                <div class="slidecontainer">
                    <form method="POST" action="registering.html">
                        <h1 class="calc-title">Loan calculator</h1>
                        <p class="calc-details-p">Choose sum <input type="text" id="mySumField" class="form-control" name="mySumField" value="50000 MDL" onchange="updateRangeInput(this.value);"></p>

                        <input id="mySumRange" type="range" step="1000" min="1000" max="100000" value="50000" class="slider" onchange="updateTextInput(this.value);">

                        <div class="minMaxDiv"><p>min 1000 MDL</p> <p>max 100000 MDL</p></div>

                        <p class="calc-details-p">Choose term <input type="text" value="12 luni" id="myTermField" class="form-control" name="myTermField" onchange="updateRangeTermInput(this.value);"></p>

                        <input type="range" min="1" max="60" value="12" class="slider" id="myTermRange" onchange="updateTextTermInput(this.value);">
                        <div class="minMaxDiv"><p>1 month</p> <p>60 months</p></div>
                        <div>
                            <p class="sum-par">Requested sum: <span id="solicitareSum"> 0 MDL</span></p>
                            <p class="sum-par">Monthly pay: <span id="rambursareSum"> 0 MDL</span></p>
                            <p class="sum-par">Total cost: <span id="solicitareCost"> 0 MDL</span></p>
                            <p class="sum-par">To refund: <span id="solicitareRambursare"> 0 MDL</span></p>
                        </div>

                        <input class="btnsolicita" type="submit" name="action" value="Request now!">
                    </form>
                </div>

            </div>

            <div class="ask-div">

                <h2>Check your chances to get a </h2>
                <h1>loan online!</h1>
                <div ><a class="btnsolicita" href="registering.html">Let's start!</a></div>
                <h1>Choose Grow Up and you will only have to win</h1>

            </div>
            <div class="bonus-div">
                <div class="bonus-part">

                    <h2><img src="images/fem.png">E??ti client nou?</h2>
                    <ol>
                        <li>Primul credit este GRATUIT. Ob??ii p??n?? la 15000 lei, pentru o perioad?? maxim?? de 60 zile.</li>
                        <hr>
                        <li>??mprumut urgent online, simplu de ob??inut. ????i confirm??m rapid acordarea creditului prin SMS, ??n doar 7 minute de la aplicare.</li><hr>
                        <li>Opteaz?? pentru bani rapid, online. Aprob??m online 7 din 10 cereri de credit, f??r?? gaj.</li><hr>
                        <li>Tu alegi unde ????i transfer??m banii: pe cardul t??u bancar sau ??n numerar.</li>
                    </ol>
                </div>
                <div class="bonus-part">

                    <h2><img src="images/masc.png">E??ti client fidel?</h2>
                    <ol>
                        <li>Reduceri la urm??toarele credite. Pentru urm??torul ??mprumut, folose??te promocodul din SMS pentru o dob??nd?? cu reducere.</li>
                        <hr>
                        <li>??tii ce presupune un credit bun? Achitarea dob??nzii exact pentru perioada c??t ai folosit creditul. Transparent, avantajos, comod!</li>
                        <hr>
                        <li>Alege ??mprumuturi online f??r?? acte. Aprob??m 9 din 10 cereri, automat ??i f??r?? multe ??ntreb??ri.</li>
                        <hr>
                        <li>Ce poate fi mai simplu dec??t formularul nostru de credit online? Doar alegi suma ??i perioada, r??spuns prime??ti imediat.</li>

                    </ol>
                </div>

            </div>
            <div class="about-div">
                <h3>1. Despre compania Grow Up</h3> 
                Grow Up ??? te ajut?? atunci c??nd ai nevoie de bani rapid. 
                Grow Up ofer?? credite online ??n Moldova, ??ntr-un mod simplu ??i avantajos, 
                doar completezi un formular online ??i ??n scurt timp ai banii pe card. 
                Creditele online rapide sunt ??mprumuturi concepute pentru a transfera rapid banii ??n contul t??u. 
                Aceste credite sunt ideale pentru o necesitate de urgen???? sau c??nd ai nevoie brusc de numerar. 
                Scopul nostru este s?? oferim credite online, ??n mod competitiv, sigur, transparent ??i ??n timp rapid. 
                Grow Up te ajut?? rapid c??nd ai nevoie de bani aici ??i acum. Noi ????i economisim timpul 
                ??i acord??m ??mprumutul dorit, f??r?? birocra??ie, drumuri la oficiile noastre ??i alte complica??ii. 
                Scopul nostru e s?? schimb??m pia??a financiar?? din Moldova ??n una transparent??, simpl?? ??i comod??. 
                <h3>2. Motivele pentru care clien??ii aleg Grow Up</h3> 
                <ul>
                    <li>2.1. E avantajos Dob??nda se achit?? doar pe perioada folosirii ??mprumutului. O recalcul??m ??i avem grij?? s?? 
                        nu pl??te??ti ??n plus. Exemplu: Ai luat credit pe termen de 30 zile, 
                        dar ??l ??ntorci ??n 15 zile. ??n acest caz, achi??i dob??nda doar pentru 15 zile.</li>
                    <li>2.2. E 100% online Completezi formularul online, prime??ti confirmarea prin SMS ??i semnezi contractul online. </li>
                    <li>2.3. Acord??m credite oriunde Acord??m easy credit md pe tot teritoriul Republicii Moldova. 
                        Banii ??i po??i primi pe card sau ??n numerar la sucursalele Moldindconbank ??i oficiile Po??ta Moldovei.</li>
                    <li>2.4. Activ??m conform legii Cu noi, totul este legal ??i corect. </li>
                </ul>
                <h3>3. Cum po??i depune cererea pentru un credit online? </h3>
                Pentru a beneficia de un credit online e nevoie: S?? ai v??rsta minim?? de 18 ani (nu este obligatoriu s?? fii angajat oficial); S?? ai buletin de identitate valabil; S?? ai num??r de telefon activ; S?? ai un card activ ??n lei, eliberat de orice banc?? din Republica Moldova (??n cazul ??n care vrei s?? prime??ti banii pe card); S?? ai o istorie creditar?? pozitiv?? ??i s?? ne comunici date veridice; S?? ai capacitatea financiar?? de a onora ??n termen obliga??iile contractuale. 
                <h3>4. Cum rambursezi creditul la Grow Up? </h3>
                Procesul de rambursare e foarte simplu, rapid ??i comod. Alege oricare din op??iunile de rambursare: Terminalele Qiwi, RunPay, BPay, comision pentru procesarea pl????ii 1,5%; Terminalele Paynet, amplasate ??n oficiile Grow Up, comision pentru procesarea pl????ii 0%; Offline ??? sucursalele Victoriabank, comision pentru procesarea pl????ii 10 lei sau oficiile Po??ta Moldovei, comision pentru procesarea pl????ii 6 lei; Oficiile Grow Up, comision pentru procesarea pl????ii 0%; Cabinetul personal ??? achit??nd cu cardul, comision pentru procesarea pl????ii 1%; Online ??? prin oplata.md, comision pentru procesarea pl????ii 1%. 
                <h3>5. Confiden??ialitatea ??i securitatea datelor</h3>
                ??n general, utiliz??m informa??ii cu caracter personal pentru evaluarea, personalizarea ??i ??mbun??t????irea serviciilor pe care le prest??m clien??ilor no??tri. ??ntreprindem m??suri rezonabile pentru a proteja informa??iile tale personale de la: Abuz; Acces, modificare sau dezv??luire neautorizat??. Pa??ii de precau??ie pe care ??i lu??m pentru protejarea informa??iilor de caracter personal includ: Adopt??m m??suri pentru protejarea sistemelor ??i re??elelor noastre informatice pentru stocarea, procesarea ??i transmiterea informa??iilor personale; Adopt??m m??suri procedurale pentru limitarea accesului la informa??ii personale de c??tre personalul nostru; Revizuirea practicilor noastre de colectare, stocare ??i prelucrare a informa??iilor; C??t ??i alte m??suri de securitate pe care le consider??m rezonabile ??i adecvate. ??mprumut?? c??t ai nevoie din sursa ta de ??ncredere ??? Grow Up!
            </div>
        </div>

        <%@include file="common/footer.jspf" %>

    </body>
</html>
