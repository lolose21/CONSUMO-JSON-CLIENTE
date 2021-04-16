<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="includes/webhead.jsp"/>
        <title>CRUD DEPARTAMENTOS</title>
    </head>
    <body>
        <jsp:include page="includes/webmenu.jsp"/>
    <main role="main" class="container">

        <div class="starter-template">
          <h1>CRUD DEPARTAMENTOS</h1>
          <label>
              id departamento;
          </label>
          <input type="text" id="cajanumero" class="form-control"/><br/>
           <label>
              NOMBRE;
          </label>
          <input type="text" id="cajanombre" class="form-control"/><br/>
           <label>
              localidad;
          </label>
          <input type="text" id="cajalocalidad" class="form-control"/><br/>
          <button type="button" id="botoninsertar" class="btn btn-info">
              Insertar departamento
          </button>
          <button type="button" id="botonmodificar" class="btn btn-primary">
              Modificar departamento
          </button>
          <button type="button" id="botoneliminar" class="btn btn-danger">
              Eliminar departamento
          </button>
          <table border="1" id="tabladepartamentos">
              <thead>
                  <tr>
                      <th>DEPARTAMENTO </th>
                      <th>NOMBRE</th>
                      <th>LOCALIDAD</th>
                  </tr>
              </thead>
              <tbody>
                  
              </tbody>
          </table>
        
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        var url = "https://apicochescrudisma.azurewebsites.net/";
        $(document).ready(function() {
            cargarDepartamentos();
            $("#botoninsertar").click(function() {
                console.log("antes de recuperar caja" );
                var request = "api/departamentos/post";
                var num = $("#cajanumero").val();
                var nom = $("#cajanombre").val();
                var loc = $("#cajalocalidad").val();
                //los datos que sean numericos en el servicio
                //debemos convertirlos a numero en jquery
                var id = parseInt(num);
                //el sevicio necesita un objeto json
                //con las mismas propiedades que el get
                //creamos un nuevo objeto en jquery
                var departamento = new Object();
                //las propiedades json son dinamicas (inventadas)
                //deben llamarse igual que el json del get
                
                departamento.idDepartamento = id;
                departamento.nombre = nom;
                departamento.localidad = loc;
                console.log(departamento.idDepartamento + "antes de recuperar");
                //convertimos el objeto jquery a formato json
                var json = JSON.stringify(departamento);
                //hacemos la llamada
                //type:post
                //si enviamos informacion (json) debemos enviarla con 
                //el valor del KEY data
                //debemos indicar el tipo de formato que estamos enviando
                //con la key contentType
                console.log("antes ajax" + departamento.idDepartamento);
                $.ajax({
                    url : url + request,
                    type:"POST",
                    data: json,
                    contentType:"application/json",
                    success: function(){
                        cargarDepartamentos();
                        console.log(departamento.idDepartamento + "ultimo");
                        
                    }
                    
                });
            });
            $("#botonmodificar").click(function() {
                modificarDepartamento();
            });
            $("#botoneliminar").click(function() {
                var id = $("#cajanumero").val();
                var request ="api/departamentos/delete/" + id;
                $.ajax({
                    url: url + request ,
                    type:"DELETE",
                    success:function (){
                        cargarDepartamentos();
                   
                        
                    }
                    
                });
            });
        });
        function modificarDepartamento() {
            var request = "api/departamentos/put";
            var num = $("#cajanumero").val();
            var nom = $("#cajanombre").val();
            var loc = $("#cajalocalidad").val();
            var id = parseInt(num);
            var departamento = new Object();
            departamento.idDepartamento = id;
            departamento.nombre = nom;
            departamento.localidad = loc;
            var datosjson = JSON.stringify(departamento);
            $.ajax({
                url: url + request,
                type:"PUT",
                data: datosjson ,
                contentType: "application/json",
                success: function() {
                    cargarDepartamentos();
                   
                }
                
            });
        }
        
        function cargarDepartamentos() {
            var request = "api/departamentos";
            $.ajax({
                url: url + request,
                type: "GET",
                dataType:"json",
                success : function(data) {
                    var html = "";
                    $.each(data , function(pos , dept) {
                        html += "<tr>";
                        html += "<td>" + dept.idDepartamento + "</td>";
                        html += "<td>" + dept.nombre + "</td>";
                        html += "<td>" + dept.localidad + "</td>";
                        html += "</tr>";
                    });
                     $("#tabladepartamentos tbody").html(html);
                }
               
            });
        }
    </script>
    </body>
</html>
