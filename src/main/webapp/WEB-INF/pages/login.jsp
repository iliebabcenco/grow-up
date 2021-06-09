<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="styless.css">
        <link rel="stylesheet" type="text/css" href="resp.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <title>Log In Page</title>
    </head>
    <body class="money-body">

        <div class="registeringdiv logindiv">
            

                <h3>Introduceți datele:</h3>

            
            <form action="executeLogin" method="POST">

                <table>
                    <tr>
                        <td>Numele utilizatorului: </td>
                        <td><input type="text" class="form-control" name="username" value="" size="20" required/></td>
                    </tr>
                    <tr>
                        <td>Parola: </td>
                        <td><input type="password" class="form-control" name="password" value="" size="20" required/></td>
                    </tr>
                </table>
                <div class="btns-div">
                    <input id="btnlogin" class="btnsolicita loginbtn" type="submit" name="action" value="Log In"/>
                    <a href="homeserv" class="btnsolicita aback loginbtn" value="Înapoi">Back</a>
                </div>
            </form>
            <div class="imgs-div">
                <img src="images/masc.png"">
                <img src="images/fem.png">
            </div>
            <h3 id="alerting">
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
