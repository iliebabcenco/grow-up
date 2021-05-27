<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.List"%>
<%@page import="domain.Request"%>
<%@page import="domain.Request"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//db.onlinewebfonts.com/c/1273d9cc8e74f85a3e5dd1b732aa2b4c?family=Avenir+Next+Cyr" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="../styless.css">
        <title>Gestiune Page</title>
    </head>
    <body style="background-image: url(../images/bani.jpg); background-attachment: fixed;">
        <div id="cmsgestdiv" style="width: 85%; min-height: 600px;">
            <%@include file="common/cmsheader.jspf" %>
            <% List<Request> listaCererilor = (List<Request>) request.getAttribute("listaCererilor");
            %>
            <h2 style="text-align: center; margin: 2%;">Lista solicitărilor</h2>
            <table border="1" cellspacing="1" cellpadding="1" style="margin: 2%;">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Numele</th>
                        <th>Prenumele</th>
                        <th>IDNP</th>
                        <th>Data nașterii</th>
                        <th>Buletin de identitate</th>
                        <th>Domiciliul</th>
                        <th>Suma solicitată</th>
                        <th>Termenul solicitat</th>
                        <th>E-mail</th>
                        <th>Telefon mobil</th>
                        <th>Venitul mediu lunar</th>
                        <th>Buletin de identitate</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Request art : listaCererilor) {

                    %> 
                    <tr>
                        <td class="idTd"><%=art.getId()%></td>
                        <td id="tdName"><%=art.getName()%></td>
                        <td><%=art.getSurename()%> </td>
                        <td><%=art.getIdnp()%></td>
                        <td><%=art.getBirthday()%></td>
                        <td><%=art.getCard_id()%></td>
                        <td><%=art.getResidence()%></td>
                        <td><%=art.getSum()%></td>
                        <td><%=art.getTerm()%></td>
                        <td><%=art.getMail()%></td>
                        <td><%=art.getPhone()%></td>
                        <td><%=art.getIncome()%></td>
                        <td>
                            <%
                                if (art.getFileName() != null) {
                                    try (FileOutputStream fos = new FileOutputStream(request.getServletContext().getRealPath("/") + "userfiles/" + art.getFileName())) {
                                        fos.write(art.getFileData());
                                    }
                            %> <a href="../userfiles/<%=art.getFileName()%>"><%=art.getFileName()%> </a> 
                            <%
                                }
                            %>
                        </td>
                        <td>
                            <input class="myBtn" style="color: buttonshadow; border: none; background-color: white;" value="Edit" type="button">
                        </td>
                        <td>
                            <a class="myBtn" href="cmsaddeditrequest?reqId=<%=art.getId()%>&action=saveOrUpdate">Edit</a>
                            <a  href="cmsRequestCRUDAllActions?reqId=<%=art.getId()%>&action=delete" style="color: buttonshadow">Delete</a></td>
                    </tr>     
                    <% }%>
                </tbody>
            </table>
        </div>

    </body>
</html>
