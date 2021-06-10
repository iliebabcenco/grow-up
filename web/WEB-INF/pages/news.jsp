<%@page import="domain.Article"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>News Page</title>
    </head>
    <body>
        <%@include file="common/header.jspf"%>

        <div class="about-div news-section">
            <hr>
            <% List<Article> listaDeArticole = (List<Article>) request.getAttribute("listaDeArticole");
            %>
            <% for (int i = (listaDeArticole.size() - 1); i >= 0; i--) {
            %>

            <h1><%=listaDeArticole.get(i).getTitle()%></h1>
            <%=listaDeArticole.get(i).getContent()%>
            <hr>
            <%
                }
            %>

            <h1> 6 întrebări de control: La ce să atragi atenția când vrei să iei un credit</h1>
            <img class="news-img" src="images/6-ntrebri-1.png">
            <h5>15 June 2020 23:41</h5> 
            <p>Ai nevoie de bani și parcă te-ar bate un gând să iei un credit? 
                Creditul e o soluție comodă și rapidă, e adevărat. 
                Și totuși, sunt atâtea companii de creditare, atâtea reclame, că nici nu mai știi ce să alegi. 
                În același timp, creditul e și o responsabilitate. 
                Îți propunem, mai jos, o listă de întrebări, pe care să ți le pui înainte de a lua un credit, 
                ca să te asiguri că procedezi corect și iei cea mai bună decizie. Important e să respecți ordinea 
                întrebărilor întocmai. Hai să începem. </p>
            <h4>Cât de necesar și urgent este acest credit?</h4> 
            <p>Încearcă să gândești pe termen lung. Care e situația ta financiară la moment? Ai un job stabil? 
                Dacă este vorba despre o investiție absolut necesară, cum ar fi, de exemplu, o reparație urgentă, 
                achiziționarea unui produs necesar pentru muncă, de exemplu, un laptop care ți-a permite să fii mai productiv etc., 
                calculează din start, care va fi venitul tău luna viitoare, ce cheltuieli mai ai pe lângă asta, și 
                gândește-te la toate planurile pe care le-ai avut până acum și care s-ar putea schimba. </p>
            <h4>Vei putea rambursa suma în termenele stabilite? </h4> <p>Citește cu atenție contractul. 
                Se pot schimba condițiile pe parcurs sau nu? Poți rambursa creditul și la bancă, și la Poștă? 
                E posibil să o faci online? Ia în calcul cât de comode sunt modalitățile de rambursare, 
                dar și sezonul în care te decizi să iei creditul. Iarna se cheltuiește mai mult pe întreținere, 
                sisteme de încălzire, haine. Vara mai ai chef de un concediu sau odihnă la mare. 
                Gândește în perspectivă și analizează puterea ta de rambursare a creditului în acele condiții. </p>
            <h4>Care sunt condițiile de rambursare?</h4> <p>Se poate întâmpla, de exemplu, să întârzii cu rambursarea. 
                Să intervină niște schimbări, niște situații neprevăzute sau cheltuieli legate de niște necesități primare, 
                pe care pur și simplu nu le poți ignora. Aici avem în vedere cheltuieli legate de starea de sănătate, d
                e exemplu, sau altă investiție urgentă. Ce faci în așa caz? Citește atent contractul, 
                dacă ai posibilitatea de a prelungi rambursarea la condiții cât mai avantajoase pentru tine. </p>
            <h4>Cât de complicată e procedura de acordare a creditului?</h4> <p> Analizează câte drumuri ai de făcut și cât timp îți va lua. 
                Ce ar fi să poți face toată procedura online? De la depunerea cererii și până la acordarea creditului direct pe card. 
                În plus, dacă-i vorba de credit la nevoie, atunci și cu răspuns imediat să fie – în 15-30 de minute, doar cu buletinul. 
                Caută toate companiile de creditare, dar și băncile pe Google, citește atent prezentarea de pe site și rețelele sociale.
                Informează-te și fă alegerea corectă. </p>
            <h4>Care sunt penalitățile?</h4> <p>
                În situația în care e nevoie urgentă de bani, de multe ori graba chiar strică treaba. 
                Înarmează-te cu răbdare și citește toate condițiile din contract. 
                Există vreun comision ascuns? Citește printre rânduri, chiar și textul scris foarte mărunt. 
                Ține minte: atunci când e vorba de bani, nu e cazul să sari peste alineate. 
                E în interesul tău să fii cât mai concentrat la text, să pui întrebări și să analizezi. </p>
            <h4>Cât de credibilă e compania de creditare? </h4> <p>Companii de creditare sunt multe. 
                Toate își creează o imagine atractivă și reclamă interesantă. 
                Din păcate, multele chiar exagerează la acest capitol și prezintă o ofertă de creditare cu numai jumătate din adevăr. 
                Am mai spus că una dintre soluții este să citești cu atenție contractul. 
                Altă soluție, și mai bună, este să cauți testimoniale pe Internet. 
                În prezent, aceste informații sunt chiar foarte accesibile. 
                Caută recenzii pe Facebook, pe Instagram, pe Google. Caută cuvintele și reacțiile reale ale oamenilor reali. </p>
            <p>
                Și acum, ca să-ți amintim cât de buni suntem noi în creditare (chiar suntem), amintim aici câteva dintre avantajele de creditare la Grow Up
                :</p>
            <ul>
                <li>poți lua primul credit gratuit: cât iei, atât întorci; primești creditul direct pe cardul bancar;</li>
                <li>poți „trimite creditul în vacanță” pe 15 sau 30 zile, atunci când nu îl poți rambursa la timp; </li>
                <li>poți face toată procedura online: de la depunerea cererii – până la primirea banilor;</li>
                <li>primești răspuns rapid privind acordarea creditului (în 10-15 minute); </li>
                <li>dacă nu ai card, poți primi banii la sucursalele Victoriabank sau chiar cea mai apropiată filială Poșta Moldovei; </li>
                <li>nu ai nevoie de prea multe acte și formalități, în afară de buletin;</li>
                <li>poți returna creditul simplu: online, sucursalele Victoriabank, la Poștă, prin cabinetul personal sau prin terminalele QiWi, RunPay, Paynet, Bpay; </li>
                <li>primești reduceri la creditele repetate și te bucuri de avantajele sistemului nostru de loialitate. </li>
            </ul>
            Pentru orice întrebări, îți stăm la dispoziție aici și acum. Scrie-ne pe chat sau sună.
            <hr>
        </div>
        <%@include file="common/footer.jspf"%>
    </body>
</html>
