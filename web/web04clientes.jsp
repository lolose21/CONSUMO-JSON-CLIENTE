<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="includes/webhead.jsp"/>
        <title>CLIENTES SELECT</title>
    </head>
    <body>
        <jsp:include page="includes/webmenu.jsp"/>
    <main role="main" class="container">

        <div class="starter-template">
          <h1>CLIENTES BUSQUEDA JSON</h1>
          <label>seleccione cliente;</label>
          <select id="selectcliente" class="form-control"></select>
          <div id="datoscliente"></div>
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        $(document).ready(function() {
            cargarCliente();
            $("#selectcliente").change(function() {
                $.ajax({
                    url: "documents/clientes.json",
                    type:"GET",
                    success:function (data){
                        //si tenemos el  dibujo en jquery con indices
                        //en algun control, podemos utilizarlos para encontrar
                        //el elemento deseado en el array de data.clientes[]
                        //recuperamos una propiedad que no tiene valor
                        //como ,requierd , selected
                        //<input type='text' requiered/>
                        //.prop("propiedad)
                        var indice = $("#selectcliente").prop("selectedIndex");
                        var cliente = data.clientes[indice];
                        var html ="";
                                html += "<h1 style='color:blue'>" + cliente.nombre + "</h1>";
                                html += "<a href='" + cliente.paginaweb + "'>"
                                + cliente.paginaweb + "</a>";
                                html += "<img src='" + cliente.imagencliente + "'"
                                + " style='width:250px;height:250px;'/>";
                        $("#datoscliente").html(html);
                    }
                });
            });
        });
        
        function cargarCliente() {
            $.ajax({
                url:"documents/clientes.json",
                type:"GET",
                success: function(data) {
                    var html = "";
                    $.each(data.clientes, function(posicion , cliente) {
                        html += "<option value='" + cliente.idcliente + "'>"
                        + cliente.nombre + "</option>";
    
                    });
                    $("#selectcliente").html(html);
                }
            });
        }      
    </script>
    </body>
</html>

