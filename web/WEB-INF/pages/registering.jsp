

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="jsscript.js"></script>
        <link rel="stylesheet" type="text/css" href="styless.css">
        <title>Registering Page</title>

    </head>
    <body style="background-image: url(images/bani.jpg); background-attachment: fixed;">

        <div id="registeringdiv" style="padding-bottom: 0.5%; padding-top: 0.5%;">

            <form action="executeregisteringserv" method="POST" onsubmit="return validateForm()" enctype="multipart/form-data" >
                <h3 style="text-align: center;">Introduceți datele:</h3>
                <table style="padding: 5px; margin: 20px auto;">
                    <tr>
                        <td>Numele: </td>
                        <td><input type="text" name="name" lang="en" value="" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Prenumele: </td>
                        <td><input type="text" name="surename" value="" size="20"/></td>
                    </tr>
                    <tr>
                        <td>IDNP: </td>
                        <td><input type="text" name="idnp" value="" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Data nasterii: </td>
                        <td><input type="date" name="dataNasterii" value="" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Buletin de identitate: </td>
                        <td><input type="text" name="buliden" value="" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Domiciliu: </td>
                        <td><input type="text" name="domiciliu" value="" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Suma(MDL): </td>
                        <%
                            String param1 = "";
                            if (request.getParameter("mySumField") != null) {
                                param1 = request.getParameter("mySumField");
                            }

                        %>
                        <td><input id="sumaregistr" type="text" name="suma" value="<%= param1%>" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Termen(luni): </td>
                        <%
                            String param2 = "";
                            if (request.getParameter("myTermField") != null) {
                                param2 = request.getParameter("myTermField");
                            }

                        %>
                        <td><input id="termregistr" type="text" name="term" value="<%= param2%>" size="20"/></td>
                    </tr>
                    <tr>
                        <td style="text-align: left">E-mail: </td>
                        <td><input type="email" name="e-mail" value="" size="20" placeholder="name@xxx.xxx"/></td>
                    </tr>
                    <tr>
                        <td style="text-align: left">Telefon mobil: </td>
                        <td><input type="tel" name="phone" value="" size="20" pattern="0[6-7]{1}[0-9]{7}" placeholder="06xxxxxxx, 07xxxxxxx"/></td>
                    </tr>
                    <tr>
                        <td style="text-align: left">Venitul mediu lunar (MDL): </td>
                        <td>
                            <label class="containervenituri">1000-3000
                                <input type="radio" checked="checked" name="radio" value="1000-3000">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containervenituri">3001-7000
                                <input type="radio" name="radio" value="3001-7000">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containervenituri">7001-10000
                                <input type="radio" name="radio" value="7001-10000">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containervenituri">10000+
                                <input type="radio" name="radio" value="10000+" >
                                <span class="checkmark"></span>
                            </label>
                        </td>
                    </tr>
                    <tr>

                        <td><label for="myfile">Încarcă buletin <br>de identitate:</label></td>
                        <td ><input type="file" id="myfile" name="myfile" style="font-size: 10px;"></td>



                    </tr>
                </table>
                <div style="text-align: center;">
                    <input class="btnsolicita" onclick="clickedButton()" type="submit" name="action" value="Solicită">
                    <input class="btnsolicita" onclick="GoToHomePage()" name="actionback" value="Înapoi" style="text-align: center;"/>
                </div>
            </form>
            <h3 id="alerting" style="color:green; display: block; text-align: center;">


                <%  String str = (String) request.getAttribute("message");
                    if (str == null) {
                        str = "";
                    }
                %>
                <%=str%>
            </h3>


        </div>



        <%@include file="common/footer.jspf"%>
        <script src="../../jsscript.js"></script>
    </body>
</html>
