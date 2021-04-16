
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
          <h1>CUSTOMERS northwind</h1>
          <select id="selectcustomers" class="form-control"></select>
          <div id="datocustomer"></div>
        
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        var url = "https://northwind.netcore.io/";
        $(document).ready(function() {
            cargarCustomers();
            $("#selectcustomers").change(function() {
                var id = $("#selectcustomers").val();
                var request = "customers/" + id;
                $.ajax({
                    url : url + request,
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        var html = "<h1 style='color:blue'>"
                         + data.customer.contactName +  "</h1>";
                 html += "<h2 style='color:red'>" + data.customer.companyName + "</h2>";
                 html += "<h2 style='color:green'>" + data.customer.contactTitle + "</h2>";
                 $("#datocustomer").html(html);
                    }
                });
            });
        });
        function cargarCustomers() {
            var request = "customers";
            $.ajax({
                url: url + request , 
                type: "GET",
                dataType:"json",
                success: function(data) {
                    var html = "";
                    $.each(data.results, function(pos, customer) {
                        html += "<option value='" + customer.id + "'>";
                        html += customer.contactName + "</option>";
                    });
                    $("#selectcustomers").html(html);
                }
                
            });
        }
    </script>
    </body>
</html>
