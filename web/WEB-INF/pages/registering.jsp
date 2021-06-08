
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="styless.css">
        <link rel="stylesheet" type="text/css" href="resp.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <title>Registering Page</title>

    </head>
    <body class="money-body">

        <div class="registeringdiv">

            <form action="executeregisteringserv" method="POST" onsubmit="return validateForm()" enctype="multipart/form-data" >
                <h3>Enter data:</h3>
                <table>
                    <tr>
                        <td>Name: </td>
                        <td><input type="text" class="form-control" name="name" lang="en" value="" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Surename: </td>
                        <td><input type="text" class="form-control" name="surename" value="" size="20"/></td>
                    </tr>
                    <tr>
                        <td>P.C.: </td>
                        <td><input type="text" class="form-control" name="idnp" value="" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Birhtday: </td>
                        <td><input type="date" class="form-control" name="dataNasterii" value="" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Passport: </td>
                        <td><input type="text" class="form-control" name="buliden" value="" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Residency: </td>
                        <td><input type="text" class="form-control" name="domiciliu" value="" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Sum(MDL): </td>
                        <%
                            String param1 = "";
                            if (request.getParameter("mySumField") != null) {
                                param1 = request.getParameter("mySumField");
                            }
                        %>
                        <td><input id="sumaregistr" class="form-control" type="text" name="suma" value="<%= param1%>" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Term(months): </td>
                        <%
                            String param2 = "";
                            if (request.getParameter("myTermField") != null) {
                                param2 = request.getParameter("myTermField");
                            }
                        %>
                        <td><input id="termregistr" class="form-control" type="text" name="term" value="<%= param2%>" size="20"/></td>
                    </tr>
                    <tr>
                        <td>E-mail: </td>
                        <td><input type="email" name="e-mail" class="form-control" value="" size="20" placeholder="name@xxx.xxx"/></td>
                    </tr>
                    <tr>
                        <td>Phone: </td>
                        <td><input type="tel" name="phone" class="form-control" value="" size="20" pattern="0[6-7]{1}[0-9]{7}" placeholder="06xxxxxxx, 07xxxxxxx"/></td>
                    </tr>
                    <tr>
                        <td>Average income (MDL): </td>
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
                        <td><label for="myfile">Upload passport<br> scan:</label></td>
                        <td ><input type="file" id="myfile" name="myfile"></td>
                    </tr>
                </table>
                <input class="btnsolicita reg-btn" onclick="clickedButton()" type="submit" name="action" value="Request">
                <a href="homeserv" class="btnsolicita aback" value="Back">Back</a>
            </form>
            <h3 id="alerting">
                <%  String str = (String) request.getAttribute("message");
                    if (str == null) {
                        str = "";
                    }
                %>
                <%=str%>
            </h3>


        </div>



        <%@include file="common/footer.jspf"%>
        <script src="jsscript.js"></script>
    </body>
</html>
