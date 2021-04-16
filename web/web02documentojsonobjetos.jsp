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
          <h1>DOCUMENTOS JSON OBJETOS</h1>
          <button type="button" id="botonleerclientes">
              Leer Array clientes
          </button>
          <ul id="clientes">
              
          </ul>
        
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        $(document).ready(function() {
            //cremos la funcion del boton
            $("#botonleerclientes").click(function() {
                //lo lleremos con ajax
                $.ajax({
                    url: "documents/clientessimples.json",
                    type: "GET",
                    success: function(data) {
                        //si leemos un array [] . el primer valor del
                        //$.each es el indice/posicion y el segundo valor 
                        //es el objeto que recorremos , con todas sus propiedades
                        //las propiedades son dinamicas , se accede a ellas directamente
                        //escribiendo su valor
                        var html ="";
                        $.each(data.clientes, function(posicion ,  cliente) {
                            html += "<li>Posicion: " + posicion + 
                                    ", Cliente : " + cliente.nombre + "</li>";
                        });
                        $("#clientes").html(html);
                    }
                    
                });
            });
            
        });
    </script>
    </body>
</html>
