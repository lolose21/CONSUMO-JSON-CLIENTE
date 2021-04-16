
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="includes/webhead.jsp"/>
        <title>Plantilla</title>
    </head>
    <body>
        <jsp:include page="includes/webmenu.jsp"/>
    <main role="main" class="container">

        <div class="starter-template">
          <h1>Api Coches Json</h1>
        <select id="selectcoches" class="form-control"></select>
        <table id="tablacoches" class="table table-dark" border="1">
            <thead>
                <tr>
                    <th>IDCOCHE</th>
                    <th>MARCA </th>
                    <th> MODELO </th>
                    <th> CONDUCTOR </th>
                    <th> IMAGEN </th>
                    <th>DETALLES</th>
                </tr>
            </thead>
            <tbody>
                
            </tbody>
        </table>
        
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        var url = "http://localhost:8084/ApiCochesJson/";
        $(document).ready(function() {
            cargarCoches();
            $("#selectcoches").change(function() {
                 var id = $("#selectcoches").val();
                   var request = "api/coches/" + id;
                  
                $.ajax({
                    url: url + request ,
                    type:"GET",
                    dataType:"json",
                    success:function (data){
                        console.log(data);
                        var html = "";
                        html += "<tr>";
                        html += "<td>" + data.idcoche + "</td>";
                        html += "<td>" + data.marca + "</td>";
                        html += "<td>" + data.modelo + "</td>";
                        html += "<td>" + data.conductor + "</td>";
                        html += "<td>";
                        html += "<img src='" + data.imagen + "'style='width:300px;height:200px'/>";
                        html += "</td>";
                        html += "<td>";
                        html += "<button type='button'> DETALLES </button>";
                        html += "</td>";
                        html += "</tr>";
                        console.log("despues tr");
                        console.log(data.modelo);
                        $("#tablacoches tbody").html(html);
                    }
                    
                });
                
            });
            
        });
        function cargarCoches() {
            var request = "api/coches";
            $.ajax({
                url: url + request ,
                type: "GET",
                dataType:"json",
                success: function(data) {
                    var html = "";
                    $.each(data , function(pos , coches) {
                        html += "<option value='" + coches.idcoche + "'>";
                        html += coches.marca + "</option>";
                        
                    });
                    $("#selectcoches").html(html);
                }
                
            });
        }
    </script>
    </body>
</html>
