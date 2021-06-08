

<%@page import="domain.Article"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../styless.css">
        <script src="../ckeditor/ckeditor.js"></script>
        <link href="//db.onlinewebfonts.com/c/1273d9cc8e74f85a3e5dd1b732aa2b4c?family=Avenir+Next+Cyr" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <title>Articles Page</title>


    </head>
    <body class="money-body">
        <%@include file="common/cmsheader.jspf" %>
        <%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
        <div class="about-div articles-div">


            <%
                List<Article> listaDeArticole = (List<Article>) request.getAttribute("listaDeArticole");
                Article artSelectat = (Article) request.getAttribute("articolSelectat");
            %>

            <h2>Lista articolelor</h2>
            <table class='table table-striped table-hover' border="1" cellspacing="1" cellpadding="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Titlul</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Article art : listaDeArticole) {
                    %> 
                    <tr>
                        <td><%=art.getId()%></td>
                        <td><%=art.getTitle()%></td>
                        <td>
                            <a class="btn btn-success" href="news-actions?artId=<%=art.getId()%>&action=edit">Edit</a></td>
                        <td>
                            <a class="btn btn-danger" href="news-actions?artId=<%=art.getId()%>&action=delete">Delete</a></td>
                    </tr>     
                    <% }%>       


                </tbody>
            </table>
            <form action="news-actions" method="POST">
                <input class="id-field" type="text" name="idtext" value="<%=artSelectat.getId()%>"/>
                <p>
                    <label for="titletext">Introduceți titlul articolului:</label>
                    <input id="article-title" class="form-control" type="text" name="titletext" value="<%=artSelectat.getTitle()%>"/>
                </p>
                <p>
                    <label for="editor1">Adaugă articolul aici:</label>
                    <textarea cols="80" id="editor1" name="editor1" rows="10" ><%=artSelectat.getContent()%></textarea>
                </p>
                <ckeditor:replace replace="editor1" basePath="../ckeditor/"/>

                <div>
                    <input class="btnsolicita articlebtn" type="submit" name="action" value="Save" />
                </div>
            </form>

        </div>
        <script src="../articlescript.js"></script>
    </body>
</html>
