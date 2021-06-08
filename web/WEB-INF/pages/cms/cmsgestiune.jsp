<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.List"%>
<%@page import="domain.Request"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link href="//db.onlinewebfonts.com/c/1273d9cc8e74f85a3e5dd1b732aa2b4c?family=Avenir+Next+Cyr" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="../styless.css">
        <title>Gestiune Page</title>
    </head>
    <body class="money-body">
        <%@include file="common/cmsheader.jspf" %>
        <div class="about-div cmsrequestsdiv">
            
            <% List<Request> listaCererilor = (List<Request>) request.getAttribute("listaCererilor");
            %>
            <h2>Lista solicitărilor</h2>
            <table class='table table-striped table-hover' border="1" cellspacing="1" cellpadding="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Surename</th>
                        <th>P.C.</th>
                        <th>Birthay</th>
                        <th>Passport</th>
                        <th>Residency</th>
                        <th>Summ</th>
                        <th>Term</th>
                        <th>E-mail</th>
                        <th>Phone</th>
                        <th>Income</th>
                        <th>Documents</th>
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
                            <a class="btn btn-success" href="edit-request?reqId=<%=art.getId()%>&action=edit">Edit</a>
                        </td>
                        <td>
                            
                            <a class="btn btn-danger" href="delete-request?reqId=<%=art.getId()%>&action=delete">Delete</a></td>
                    </tr>     
                    <% }%>
                </tbody>
            </table>
        </div>

    </body>
</html>
