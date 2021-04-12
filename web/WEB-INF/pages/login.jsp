<%-- 
    Document   : login
    Created on : Aug 31, 2020, 9:07:34 PM
    Author     : AveZomer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styless.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="jsscript.js"></script>
        <title>Log In Page</title>
    </head>
    <body style="background-image: url(images/bani.jpg); background-attachment: fixed;">

        <div id="logindiv" style="padding-top: 1%; padding-bottom: 1%; width: 25%; height: auto; margin: 75px auto;">
            <div style="text-align: left; margin-left: 2%; margin-bottom: 2%;">
                
                <br>
                <h3 style="text-align: center; margin-top: 30px;">Introduceți datele:</h3>

            </div>
            <form action="executeLogin" method="POST">

                <table style="padding: 5px; margin: 20px auto;">
                    <tr>
                        <td style="padding-top: 10px;">Numele utilizatorului: </td>
                        <td style="padding-top: 10px;"><input type="text" name="username" value="" size="20" required/></td>
                    </tr>
                    <tr style="margin-top: 30px;">
                        <td style="padding-top: 10px;">Parola: </td>
                        <td style="padding-top: 10px;"><input type="password" name="password" value="" size="20" required/></td>
                    </tr>
                </table>
                <div style="text-align: center;">
                    <input id="btnlogin" type="submit" name="action" value="Log In"/>
                    <input class="btnback" onclick="GoToHomePage()" type="submit" name="actionback" value="Înapoi"/>
                </div>
            </form>
            <div style="text-align: center; margin-bottom: 7%;">
                <img src="images/masc.png" style="margin-top: 2%;">
                <img src="images/fem.png">
            </div>
            <h3 id="alerting" style="color:red; display: block; text-align: center;">


                <%  String str = (String) request.getAttribute("loginerror");
                    if (str == null) {
                        str = "";
                    }
                %>
                <%=str%>
            </h3>
        </div>

        <%@include file="common/footer.jspf"%>
    </body>
</html>
