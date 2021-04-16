<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="includes/webhead.jsp"/>
        <title>DOCUMENTOS JSON SIMPLE</title>
    </head>
    <body>
        <jsp:include page="includes/webmenu.jsp"/>
    <main role="main" class="container">

        <div class="starter-template">
          <h1>DOCUMENTOS JSON SIMPLE</h1>
          <button type="button" id="botonleertareas">
              Leer tareas.json simple
          </button>
          <ul id="tareas">
              
          </ul>
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        $(document).ready(function() {
            $("#botonleertareas").click(function() {
                //estamos leyendo un objeto {} simple
                //por lo que recorremos todos los datos con each
                //mediante clave (key) y valor (value)
                 $.getJSON("documents/tareas.json" , function(data) {
                    var html = "";
                    $.each(data, function(key , value) {
                        html += "<li style='color:blue'>Key: " + key
                        + ", Value: " + value + "</li>";
                        
                    });
                    $("#tareas").html(html);
                });
            });
        });
    </script>
    </body>
</html>
