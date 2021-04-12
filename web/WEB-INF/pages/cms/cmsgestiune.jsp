
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
        <link rel="stylesheet" type="text/css" href="../styless.css">
        <title>Gestiune Page</title>
    </head>
    <body style="background-image: url(../images/bani.jpg); background-attachment: fixed;">
        <div id="cmsgestdiv" style="width: 85%; min-height: 600px;">
            <%@include file="common/cmsheader.jspf" %>
            <% List<Request> listaCererilor = (List<Request>) request.getAttribute("listaCererilor");
                Request cerereSelectata = (Request) request.getAttribute("cerereSelectata");
                
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



                    <%                        for (Request art : listaCererilor) {

                    %> 
                    <tr>
                        <td class="idTd"><%=art.getId()%> <% request.setAttribute("reqId", art.getId());%></td>
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
                            <a class="myBtn" href="cmsgestiune.jsp?reqId=<%=art.getId() %>">Edit</a>
                            <a  href="cmsRequestCRUDAllActions?reqId=<%=art.getId() %>&action=delete" style="color: buttonshadow">Delete</a></td>
                    </tr>     
                       
                        <% } %>
                </tbody>
            </table>


            <!-- Trigger/Open The Modal -->


            <!-- The Modal -->
            <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <h3 style="text-align: center;">Introduceți datele:</h3>
                  
                    <form action="cmsRequestCRUDAllActions" method="POST" style="align-content: center;">

                        <table style="padding: 5px; margin: 20px auto;">
                          <% for(int i = 0; i < listaCererilor.size(); i++){ 
                              Request req = new Request((Integer)request.getAttribute("reqId"));
                                if(listaCererilor.get(i).equals(req)){
                                    
                                
                          
                          
                          
                          %>
                            <tr>
                                <td>Numele: </td>
                                
                                <td><input id="modalName" type="text" name="name" lang="en" value="<%=req.getName() %>" size="20"/></td>
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
                                <%                            String param1 = "";
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
                                <td><input type="file" id="myfile" name="myfile" style="font-size: 10px;"></td>



                            </tr>
                            
                            <%      } 
                            
                                }

                            
                            
                            
                            %>
                            
                        </table>

                        <div style="text-align: center;">
                            <input class="btnsolicita" type="submit" name="action" value="Salvează">
                        </div>
                    </form>
                </div>

            </div>
                        

            <script>
                // Get the modal
                var ids = document.getElementsByClassName("idTd").innerHTML;
                                        
                
                var modal = document.getElementById("myModal");

                // Get the button that opens the modal
                var btn = document.getElementsByClassName("myBtn");

                // Get the <span> element that closes the modal
                var span = document.getElementsByClassName("close")[0];

                var name = '${listaCererilor.get(2).getName()}';
                
                var modalName = document.getElementById("modalName");

                for (i = 0; i < btn.length; i++) {
                    btn[i].onclick = function () {
                        modal.style.display = "block";
                        modalName.value = name;
                        
                    }
                }

                // When the user clicks the button, open the modal 
                btn.onclick = function () {
                    modal.style.display = "block";
                }

                // When the user clicks on <span> (x), close the modal
                span.onclick = function () {
                    modal.style.display = "none";
                }

                // When the user clicks anywhere outside of the modal, close it
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            </script>



        </div>









        <%@include file="common/footer.jspf"%>
    </body>
</html>
