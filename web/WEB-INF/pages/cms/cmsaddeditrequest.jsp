<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="domain.Request"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../styless.css">
        <link href="//db.onlinewebfonts.com/c/1273d9cc8e74f85a3e5dd1b732aa2b4c?family=Avenir+Next+Cyr" rel="stylesheet" type="text/css"/>
        <title>Changing Page</title>
    </head>
    <body style="background-image: url(../images/bani.jpg); background-attachment: fixed;">

        <%@include file="common/cmsheader.jspf" %>
        <div id="registeringdiv" style="padding-bottom: 0.5%; padding-top: 0.5%;">
            <% Request req = (Request) request.getAttribute("selectedRequest");
                String date = new SimpleDateFormat("yyyy-MM-dd").format(req.getBirthday());
            %>
            <form action="../cms/save-request" method="POST" onsubmit="return validateForm()" >
                <h3 style="text-align: center;">Introduceți datele:</h3>
                <table style="padding: 5px; margin: 20px auto;">
                    <tr>
                        <td>Numele: </td>
                        <td>
                            <input type="hidden" name="reqId" value="<%= req.getId()%>"/>
                            <input type="text" name="name" lang="en" value="<%= req.getName()%>" size="20"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Prenumele: </td>
                        <td><input type="text" name="surename" value="<%= req.getSurename()%>" size="20"/></td>
                    </tr>
                    <tr>
                        <td>IDNP: </td>
                        <td><input type="text" name="idnp" value="<%= req.getIdnp()%>" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Data nasterii: </td>
                        <td><input type="date" name="dataNasterii" value="<%= date%>" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Buletin de identitate: </td>
                        <td><input type="text" name="buliden" value="<%= req.getCard_id()%>" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Domiciliu: </td>
                        <td><input type="text" name="domiciliu" value="<%= req.getResidence()%>" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Suma(MDL): </td>

                        <td><input id="sumaregistr" type="text" name="suma" value="<%= req.getSum()%>" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Termen(luni): </td>
                        <td><input id="termregistr" type="text" name="term" value="<%= req.getTerm()%>" size="20"/></td>
                    </tr>
                    <tr>
                        <td style="text-align: left">E-mail: </td>
                        <td><input type="email" name="e-mail" value="<%= req.getMail()%>" size="20" placeholder="name@xxx.xxx"/></td>
                    </tr>
                    <tr>
                        <td style="text-align: left">Telefon mobil: </td>
                        <td><input type="tel" name="phone" value="<%= req.getPhone()%>" size="20" pattern="0[6-7]{1}[0-9]{7}" placeholder="06xxxxxxx, 07xxxxxxx"/></td>
                    </tr>
                    <tr>
                        <td style="text-align: left">Venitul mediu lunar (MDL): </td>
                        <td>
                            <label class="containervenituri">1000-3000
                                <input type="radio" name="radio" value="1000-3000" accept=""
                                       <% if (req.getIncome().equals("1000-3000")) {
                                               out.print("checked=\"checked\"");
                                           }
                                       %>>
                                <span class="checkmark"></span>
                            </label>
                            <label class="containervenituri">3001-7000
                                <input type="radio" name="radio" value="3001-7000"
                                       <% if (req.getIncome().equals("3001-7000")) {
                                               out.print("checked=\"checked\"");
                                           }
                                       %>>
                                <span class="checkmark"></span>
                            </label>
                            <label class="containervenituri">7001-10000
                                <input type="radio" name="radio" value="7001-10000"<% if (req.getIncome().equals("7001-10000")) {
                                        out.print("checked=\"checked\"");
                                    }
                                       %>>
                                <span class="checkmark"></span>
                            </label>
                            <label class="containervenituri">10000+
                                <input type="radio" name="radio" value="10000+" 
                                       <% if (req.getIncome().equals("10000+")) {
                                               out.print("checked=\"checked\"");
                                           }
                                       %>>
                                <span class="checkmark"></span>
                            </label>
                        </td>
                    </tr>

                </table>
                <div style="text-align: center;">
                    <input class="btnsolicita" onclick="clickedButton()" type="submit" name="action" value="Save"/>
                    <a class="btnsolicita" href="cmsgestiuneserv" style="text-align: center; padding: 1rem;">Înapoi</a>
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

            <script src="../../../jsscript.js"></script>
    </body>
</html>
