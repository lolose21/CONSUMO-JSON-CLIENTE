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
          <h1>Tabla Jugadores</h1>
          <button type="button" id="botonjugadores">
              MOSTRAR JUGADORES
          </button>
          <table border="1" id="tabla">
              <thead>
                  <tr>
                      <th>NUMERO</th>
                      <th> NOMBRE</th>
                      <th>POSICION</th>
                      <th>EDAD</th>
                      <th>IMAJEN</th>
                  </tr>
              </thead>
              <tbody>
                  
              </tbody>
          </table>
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        $(document).ready(function() {
            //creamos el la funcion del boton
            $("#botonjugadores").click(function() {
                $.ajax({
                    url: "documents/jugadores.json",
                    type:"GET",
                    success: function(data) {
                        //si leemos un Array[] . el primer valor del 
                        //$.each es el indice/posicion y el segundo valor
                        //es el objeto que recorremos, con todas sus propiedades
                        //las propiedades son dinamicas , se accede a ellas directamente
                        //escribiendo su valor
                        var html = "";
                             $.each(data.jugadores , function(posicion , jugador ) {
                            html +="<tr>";
                            html += "<td>" + jugador.numero + "</td>";
                            html += "<td>" + jugador.nombre + "</td>";
                            html += "<td>";
                            html += jugador.posicion;
                            html += "</td>";
                            html += "<td>"  + jugador.edad + "</td>";
                            html += "<td>";
                            html += "<img src='" + jugador.imagen + "' style='width:300px;height:200px'/>";
                            html += "</td>";
                            html +="</tr>";
                        });
                        $("#tabla tbody").html(html);
                    }
                });
            });
        });
    </script>
    </body>
</html>
