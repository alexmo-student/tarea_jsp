<%-- 
    Document   : index
    Created on : 28/09/2025, 10:29:26 p. m.
    Author     : alexhiginio05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Sangre"%>
<%@page import="modelo.Estudiante"%>
<%@page import="java.util.HashMap"%> 
<%@page import="javax.swing.table.DefaultTableModel"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    </head>
    <body>
        
  <div class="container">
  <h2 class="text-center">Formulario Estudiante</h2>
  
  <button  type="button" class=" btn btn-primary txt-center " data-toggle="modal" data-target="#modal_estudiante" onclick="limpiar()">Nuevo Formulario</button>

  <div class="modal" id="modal_estudiante">
    <div class="modal-dialog">
      <div class="modal-content">

        <!-- Modal body -->
        <div class="modal-body">
                <h1 class="text-center">Formulario Estudiantes</h1>
        <div class="container">
        <form action ="sr_estudiante" method="post" class="row g-3 needs-validation" novalidate>
            
                 <label for="lbl_id">Id:</label>
                <input type="number"  name="txt_id" id="txt_id" class="form-control"  value="0" readonly>

                <div class="col-md-6">
            <label for="lbl_carne" class="form-label">Carné</label>
            <input type="text" class="form-control" id="txt_carne" placeholder="Ej: E001" pattern="[E]{1}[0-9]{3}" required>
                </div> 
            <div class="col-md-6">
            <label for="lbl_nombres" class="form-label" >Nombres</label>
              <input type="text" class="form-control" id="txt_nombres" name="btn_nombres" placeholder="Ej: Nombre 1 Nombre 2" required >
  </div> 
              <div class="col-md-6">
              <label for="lbl_apellidos" class="form-label" >Apellidos</label>
              <input type="text" class="form-control" id="txt_apellidos" name="btn_apellidos" placeholder="Ej: apellidos 1 apellidos 2" required >
               </div>
            <div class="col-md-6">
             <label for="lbl_direccion" class="form-label" >Direccion</label>
              <input type="text" class="form-control" id="txt_direccion" name="btn_direccion" placeholder="Ej: casa calle ave." required >
                 </div>
            <div class="col-md-6">
              <label for="lbl_telefono" class="form-label" >Telefono</label>
              <input type="number" class="form-control" id="txt_telefono" name="btn_telefono" placeholder="Ej: 55134852" required >
              </div>
                       <div class="col-md-6">
              <label for="lbl_ce" class="form-label" >Correo Electronico</label>
              <input type="text" class="form-control" id="txt_ce" name="btn_fn" placeholder="Ej: ejemple@gmail.com" required >
                 </div>
            <div class="col-md-6">
              <label for="lbl_fn" class="form-label" >Fecha Nacimiento</label>
              <input type="date" class="form-control" id="txt_fn" name="btn_fn" required >
                 </div>
            <div class="col-md-6">
                <label for="lbl_sangre">Tipo de Puesto:</label>
                <select name="drop_sangre"  id="drop_sangre"class="form-control" >
                    
    <% 
               Sangre puesto = new Sangre();
               HashMap<String,String> drop = puesto.leer();
               for(String i: drop.keySet()){
                   out.println("<option value='"+ i +"'>"+ drop.get(i)+"</option>");
                   }
               %>

            </select> 
             </div>
            
           <div class="col-md-12">
               <br>
                 <button class="btn btn-secondary btn-lg"  name="btn_agregar" id="btn_agregar" value="agregar"  ><i class="bi bi-pencil-fill"></i>Agregar</button>
          
           <button  class="btn btn-success btn-lg" id="btn_actualizar" name="btn_actualizar" value="actualizar"><i class="bi bi-pencil-fill"></i> Actualizar</button>
           <button  class="btn btn-danger btn-lg" id="btn_borrar" name="btn_borrar" value="borrar"><i class="bi bi-trash3-fill"  onclick="javascript:if(!confirm('¿Deseas eliminar?'))return false "></i> Borrar</button>
             <button type="button" class="btn btn-info btn-lg" data-dismiss="modal"><i class="bi bi-trash3-fill"></i>Close</button>  
           </div> 
        </form>
        </div>
        </div>
        
      </div>
    </div>
  </div>
  
</div>

    <table class="table">
    <thead> 
      <tr>
        
        <th>Carné</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
         <th>Correo Electronico</th>
        <th>Nacimiento</th>
        <th>Sangre</th>
        
      </tr>
    </thead>
    
        <tbody id="tbl_estudiantes">
 <% 

Estudiante estudiante = new Estudiante();
DefaultTableModel tabla = new DefaultTableModel();
tabla = estudiante.leer();

for (int t=0; t<tabla.getRowCount();t++){
out.println("<tr data-id="+tabla.getValueAt(t,0)+" data-id_s="+tabla.getValueAt(t,8)+"  >");
out.println("<td>"+tabla.getValueAt(t,1)+"</td>");
out.println("<td>"+tabla.getValueAt(t,2)+"</td>");
out.println("<td>"+tabla.getValueAt(t,3)+"</td>");
out.println("<td>"+tabla.getValueAt(t,4)+"</td>");
out.println("<td>"+tabla.getValueAt(t,5)+"</td>");
out.println("<td>"+tabla.getValueAt(t,6)+"</td>");
out.println("<td>"+tabla.getValueAt(t,7)+"</td>");
out.println("<td>"+tabla.getValueAt(t,8)+"</td>");




out.println("</tr>");
     }


 %>     
  </tbody>
    </table>
        
                <script>
            // Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()
            
        </script>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
   
    <script type="text/javascript">
    function limpiar(){
         $("#txt_id").val(0);
        $("#txt_carne").val('');
        $("#txt_nombres").val('');
        $("#txt_apellidos").val('');
        $("#txt_direccion").val('');
        $("#txt_ce").val('');
        $("#txt_telefono").val('');
        $("#txt_fn").val('');
         $("#drop_sangre").val(1);
        
        
    }
    
    $('#tbl_estudiantes').on('click','tr td',function(evt){
     var target, id,carne,nombres,apellidos,direccion,correo,telefono,nacimiento,id_tipo_sangre;
     target = $ (event.target);
     id= target.parent().data('id');
     id_tipo_sangre= target.parent().data('id_tipo_sangre');
    
      carne = target.parent("tr").find("td").eq(0).html();
      nombres= target.parent("tr").find("td").eq(1).html();
      apellidos = target.parent("tr").find("td").eq(2).html();
      direccion = target.parent("tr").find("td").eq(3).html();
      correo = target.parent("tr").find("td").eq(4).html();
      telefono = target.parent("tr").find("td").eq(5).html();
      nacimiento = target.parent("tr").find("td").eq(6).html();
      id_tipo_sangre = target.parent("tr").find("td").eq(7).html();
       
        $("#txt_id").val(id);
        $("#txt_carne").val(carne);
        $("#txt_nombres").val(nombres);
        $("#txt_apellidos").val(apellidos);
        $("#txt_direccion").val(direccion);
        $("#txt_ce").val(correo);
        $("#txt_telefono").val(telefono);
        $("#txt_fn").val(nacimiento);
         $("#drop_sangre").val(id_tipo_sangre);
         $("#modal_estudiante").modal('show');
         
    });
    </script>

    </body>
</html>
