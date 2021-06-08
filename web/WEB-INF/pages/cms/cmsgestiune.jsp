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
                        <th class="hidetd">P.C.</th>
                        <th class="hidetd">Phone</th>
                        <th class="hidetd">Documents</th>
                        <th>Show</th>
                        <th class="hidetd">Edit</th>
                        <th class="hidetd">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Request art : listaCererilor) {

                    %> 
                    <tr>
                        <td class="idTd"><%=art.getId()%></td>
                        <td id="tdName"><%=art.getName()%></td>
                        <td><%=art.getSurename()%> </td>
                        <td class="hidetd"><%=art.getIdnp()%></td>
                        <td class="hidetd"><%=art.getPhone()%></td>
                        <td class="hidetd">
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
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#showModal<%=art.getId()%>">
                                Show Request Details
                            </button>
                            <div class="modal fade" id="showModal<%=art.getId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Request info</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Name: <%=art.getName()%></p>
                                            <p>Surename: <%=art.getSurename()%> </p>
                                            <p>P.C.: <%=art.getIdnp()%></p>
                                            <p>Birthday: <%=art.getBirthday()%></p>
                                            <p>Passport: <%=art.getCard_id()%></p>
                                            <p>Residence: <%=art.getResidence()%></p>
                                            <p>Requested sum: <%=art.getSum()%></p>
                                            <p>Requested term<%=art.getTerm()%></p>
                                            <p>Email: <%=art.getMail()%></p>
                                            <p>Phone: <%=art.getPhone()%></p>
                                            <p>Average Income: <%=art.getIncome()%></p>
                                            <% if (art.getFileName() != null) { %>
                                            <p>Documents: <a href="../userfiles/<%=art.getFileName()%>"><%=art.getFileName()%> </a></p>
                                            <% } %>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <a class="btn btn-success" href="edit-request?reqId=<%=art.getId()%>&action=edit">Edit</a>
                                            <a class="btn btn-danger" href="delete-request?reqId=<%=art.getId()%>&action=delete">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td class="hidetd">
                            <a class="btn btn-success" href="edit-request?reqId=<%=art.getId()%>&action=edit">Edit</a>
                        </td>
                        <td class="hidetd">

                            <a class="btn btn-danger" href="delete-request?reqId=<%=art.getId()%>&action=delete">Delete</a>
                        </td>
                    </tr>     
                    <% }%>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    </body>
</html>
