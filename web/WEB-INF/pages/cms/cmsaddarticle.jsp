

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

        <title>Articles Page</title>


    </head>
    <body style="background-image: url(../images/bani.jpg); background-attachment: fixed;">

        <div id="cmsaddarticle" style="width: 50%; height: auto; padding-bottom: 2%; padding-left: 2%; padding-right: 2%;  ">

            <%@include file="common/cmsheader.jspf" %>
            <%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
            <%
                List<Article> listaDeArticole = (List<Article>) request.getAttribute("listaDeArticole");
                Article artSelectat = (Article) request.getAttribute("articolSelectat");
            %>

            <h2 style="text-align: center; margin: 2%;">Lista articolelor</h2>
            <table border="1" cellspacing="1" cellpadding="1" style="margin: 2%;">
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
                        <td><%=art.getId()%> <% request.setAttribute("reqId", art.getId());%></td>
                        <td><%=art.getTitle()%></td>
                        <td>
                            <a href="cmsArticleCRUDAllActions?artId=<%=art.getId()%>&action=edit" style="color: buttonshadow">Edit</a></td>
                        <td>
                            <a href="cmsArticleCRUDAllActions?artId=<%=art.getId()%>&action=delete" style="color: buttonshadow">Delete</a></td>
                    </tr>     
                    <%                        }

                    %>        

                </tbody>
            </table>
            <form action="cmsArticleCRUDAllActions" method="POST" style="align-content: center;">
                <p style="display: none;">
                    <label for="idtext">ID:</label>
                    <br>
                    <input type="text" name="idtext" value="<%=artSelectat.getId()%>" style="width: 99%;"/>
                </p>
                <p>
                    <label for="titletext">Introduceți titlul articolului:</label>
                    <br>
                    <input type="text" name="titletext" value="<%=artSelectat.getTitle()%>" style="width: 99%;"/>
                </p>
                <p>
                    <label for="editor1">Adaugă articolul aici:</label>
                    <textarea cols="80" id="editor1" name="editor1" rows="10" ><%=artSelectat.getContent()%></textarea>
                </p>
                <ckeditor:replace replace="editor1" basePath="../ckeditor/"/>

                <div style="text-align: center;">
                    <input class="btnsolicita" type="submit" name="action" value="Adaugă/Modifică" />
                    <input class="btnsolicita" type="reset" name="reset" value="Resetează" />
                </div>
            </form>

        </div>

    </body>
</html>
