<%@page import="Modelo.*" %>
<%@page import="java.util.ArrayList"%>
 <%
    Estudiante e = ProviderDB.getEstudiante((String)request.getParameter("ced")); 
 %>
    
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>Modificar estudiante</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="../../css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
    </style>
    
    
    <div class= "navbar navbar-inverse navbar-fixed-down" >
      <div class="navbar-inner">
        <div class="container">
             <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
         
          </button>

          <a class="brand" href="#" style="color:#EB4A52"></a>
          <div class="nav-collapse collapse">
            <ul class="nav">                
                  <li><a href="../../principal.jsp" style="color:#A8BBFB">Inicio</a></li>  
                    <li class="dropdown">

                <a href="#" style="color:#A8BBFB" class="dropdown-toggle" data-toggle="dropdown">Profesor <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="../modulos/profesor/crear_profesor.jsp"><i class="icon-plus"></i>Crear Profesor</a></li>
                    <li><a href="../modulos/profesor/listado_profesor.jsp"><i class="icon-list"></i>Listado de Profesores</a></li>
                    <li><a href="..modulos/profesor/listado_asignar_materia_estudiante.jsp"><i class="icon-list"></i>Listado de Asignar</a></li> 
                    <li class="divider"></li>
               
                </ul>
              </li>

               <li class="dropdown">

                <a href="#" style="color:#A8BBFB" class="dropdown-toggle" data-toggle="dropdown">Materias <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="../modulos/materia/crear_materia.jsp"><i class="icon-plus"></i>Crear Materia</a></li>
                    <li><a href="../modulos/materia/listado_materia.jsp"><i class="icon-list"></i>Listado de Materias</a></li>   
                    <li class="divider"></li>
                     </ul>
              </li>
                <li class="dropdown">
                <a href="#" style="color:#A8BBFB" class="dropdown-toggle" data-toggle="dropdown">Alumno <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="crear_estudiante.jsp"><i class="icon-plus"></i>Crear Alumno</a></li>
                    <li><a href="listado_estudiante.jsp"><i class="icon-list"></i>Listado de Alumno</a></li>
                  <li><a href="listado_asignar_materia_estudiante.jsp"><i class="icon-list"></i>Listado de Asignar</a></li>       
                    <li class="divider"></li>
                </ul>
              </li>
            </ul>
            <ul class="nav pull-right">
                <li class="dropdown">
              		<a href="#" style="color:#A8BBFB" class="dropdown-toggle" data-toggle="dropdown">
                    	Hola! <?php echo $_SESSION['user_name']; ?> <b class="caret"></b>
                    </a>
                	<ul class="dropdown-menu">
                            <li><a href="../usuarios/perfil.jsp">
                        <i class="icon-user"></i> Mi Perfil</a></li>
                      	<li class="divider"></li>
                      	<li><a href="../usuarios/cerrar_sesion.jsp">
                        <i class="icon-off"></i>Salir</a></li>
                    </ul>
                </li>
          	</ul>
          </div>
        </div>
      </div>
    </div>

    <link href="../../css/bootstrap-responsive.css" rel="stylesheet">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="../../img/distrital.png">
  </head>
  <!-- FACEBOOK COMENTARIOS -->
	<div id="fb-root"></div>
	<script>(function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/es_LA/all.js#xfbml=1";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>
    <!-- FIN CODIGO FACEBOOK -->
    

  <body>


    <div align="center">
    	<table width="90%">
          <tr>
            <td>
            	<table class="table table-bordered">
                  <tr class="well">
                    <td>
                    	<h1 align="center">Modificar Estudiante</h1>
           
                    </td>
                  </tr>
                </table>
                <table class="table table-bordered">
                  <tr>
                    <td>
                   	  <form name="form1" method="post" action="../../Controlador">
                                <div>
                <input type="hidden" name="accion" value="ModificarEstudiante" />
                             
                        <div align="center"><pre><strong>Informacion Basica</strong></pre></div>

                          <br></br>
                        <div class="row-fluid">
                          <div class="span6" align="center">
                          	<strong>Cedula</strong><br>
                               
                  
                                <input type="text" name="cedula" autocomplete="off" value="<%= e.getCodigo()%>" readonly ><br>
                     
                          </div>
                          <div class="span6" align="center">
                          	<strong>Nombre </strong><br>
                                <input type="text" name="nombre" class="input-xxlarge" autocomplete="off" required value="<%= e.getNombre()%>"><br>
                          </div>
                        </div>

                         </div>
                          <div class="span6" align="center">
                            <strong>Apellido</strong><br>
                            <input type="text" name="apellido"  autocomplete="off" required value="<%= e.getApellido()%>"><br>
                          </div>
                        </div>

                         </div>
                          <div class="span6" align="center">
                            <strong>Telefono</strong><br>
                            <input type="text" name="telefono"  autocomplete="off" required value="<%= e.getTelefono()%>"><br>
                          </div>
                        </div>
                       
                        

                          <br></br> <br></br><br></br> 
                          <div  align="center">
                          <button type="submit" class="btn btn-primary"><i class="icon-ok"></i> <strong>Aceptar</strong></button>
                          <button type="reset" class="btn"><i class="icon-remove"></i> <strong>Cancelar</strong></button>
                        </div>
                        </form>
                        
                       
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap-transition.js"></script>
    <script src="js/bootstrap-alert.js"></script>
    <script src="js/bootstrap-modal.js"></script>
    <script src="js/bootstrap-dropdown.js"></script>
    <script src="js/bootstrap-scrollspy.js"></script>
    <script src="js/bootstrap-tab.js"></script>
    <script src="js/bootstrap-tooltip.js"></script>
    <script src="js/bootstrap-popover.js"></script>
    <script src="js/bootstrap-button.js"></script>
    <script src="js/bootstrap-collapse.js"></script>
    <script src="js/bootstrap-carousel.js"></script>
    <script src="js/bootstrap-typeahead.js"></script>

  </body>
</html>