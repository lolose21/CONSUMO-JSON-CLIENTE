<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="includes/webhead.jsp"/>
        <title>PELICULAS</title>
    </head>
    <body>
        <jsp:include page="includes/webmenu.jsp"/>
    <main role="main" class="container">

        <div class="starter-template">
          <h1>PELICULAS</h1>
          <label>seleccione pelicula</label>
          <select id="selectpelicula" class="form-control"></select>
          <ul id="peliculas"></ul>
          <table border="1" class="table table-dark" id="datospelicula">
              <thead>
                  <tr>
                      <th>TITULO</th>
                      <th>ARGUMENTO</th>
                      <th>FECHA_ESTRENO</th>
                      <th>DIRECTOR</th>
                      <th>DURACION</th>
                      <th>YOUTUBE</th>
                      <th>GENERO</th>
                      <th>PAIS</th>
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
            cargarPelicula();
            $("#selectpelicula").change(function() {
                $.ajax({
                    url:"documents/cine.json",
                    type:"GET",
                    success: function(data) {
                        //si tenemos el dibujo en jquery con indices
                        //en algun control, podemos utilizarlos para encontrar
                        //el elemento deseado en el array de data.cine[]
                        //recuperamos una propiedad que no tiene valor
                        //como ,requiered , selected
                        //<input type = 'text' requiered/>
                        //.prop("propiedad")
                        var indice = $("#selectpelicula").prop("selectedIndex");
                        var pelicula = data.PELICULAS[indice];
                        var html = "";
                        html +=  "<tr>";
                        html += "<td>" + pelicula.Titulo + "</td>";
                        html += "<td>" + pelicula.Argumento + "</td>";
                        html += "<td>" + pelicula.Fecha_Estreno + "</td>";
                        html += "<td>" + pelicula.Director + "</td>";
                        html += "<td>" + pelicula.Duracion + "</td>";
                        html += "<td>";
                        html += "<iframe width='560' height='315' src='https://www.youtube.com/embed/" + pelicula.YouTube + "'title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>";
                        html += "</td>";
                         html += "<td>" + pelicula.Genero + "</td>";
                        html += "<td>" + pelicula.Pais + "</td>";
                        html += "</tr>";
                        $("#datospelicula tbody").html(html);
                    }
                });
            });
            $("#botonbuscar").click(function(){
                $.ajax({
                    url:"documents/cine.json",
                    type:"GET",
                    success:function (data){
                        var titulo =$("#cajatitulo").val();
                        var html ="";
                        $.each(data.PELICULAS, function(posicion, peli) {
                            if(peli.Titulo.includes(titulo)){
                                html += "<li>" + peli.Titulo + "</li>";
                                
                            }
                        });
                        
                        $("#peliculas").html(html);
                    }
                    
                });
            });
        });
        function cargarPelicula() {
            $.ajax({
                url:"documents/cine.json",
                type:"GET",
                success: function (data){
                    var html = "";
                    
                    $.each(data.PELICULAS , function(posicion , pelicula) {
                        
                        html += "<option value='" + pelicula.Titulo + "'>"
                        + pelicula.Titulo + "</option>";
                    });
                    $("#selectpelicula").html(html);
                }
                
            });
        }
    </script>
    </body>
</html>

