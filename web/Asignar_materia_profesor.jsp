<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Modelo.*" %>
<%@page import="java.util.ArrayList"%>
 <%
    Profesor p = ProfesorRegistroBD.getProfesor((String)request.getParameter("ced")); 
     
  %>
    
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>Crear Pofesor</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">
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
                 <li><a href="Principal.jsp" style="color:#A8BBFB">Inicio</a></li>  
                    <li class="dropdown">

                <a href="#" style="color:#A8BBFB" class="dropdown-toggle" data-toggle="dropdown">Profesor <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="crear_profesor.jsp"><i class="icon-plus"></i>Crear Profesor</a></li>
                    <li><a href="Modulos/profesor/listado_profesor.php"><i class="icon-list"></i>Listado de Profesores</a></li>
                    <li><a href="Modulos/profesor/listado_profesorMate.php"><i class="icon-list"></i>Listado de Asignar</a></li> 
                    <li class="divider"></li>
               
                </ul>
              </li>

               <li class="dropdown">

                <a href="#" style="color:#A8BBFB" class="dropdown-toggle" data-toggle="dropdown">Materias <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="Modulos/materia/crear_materia.php"><i class="icon-plus"></i>Crear Materia</a></li>
                    <li><a href="Modulos/materia/listado_materia.php"><i class="icon-list"></i>Listado de Materias</a></li>   
                    <li class="divider"></li>
                     </ul>
              </li>
                <li class="dropdown">
                <a href="#" style="color:#A8BBFB" class="dropdown-toggle" data-toggle="dropdown">Alumno <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="Modulos/alumno/crear_alumno.php"><i class="icon-plus"></i>Crear Alumno</a></li>
                    <li><a href="Modulos/alumno/listado_alumno.php"><i class="icon-list"></i>Listado de Alumno</a></li>
                  <li><a href="Modulos/alumno/listado_asignarMate.php"><i class="icon-list"></i>Listado de Asignar</a></li>       
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
	                    <li><a href="perfil.php">
                      <i class="icon-user"></i> Mi Perfil</a></li>
                      	<li class="divider"></li>
                      	<li><a href="php_cerrar.php">
                        <i class="icon-off"></i> Salir</a></li>
                    </ul>
                </li>
          	</ul>
          </div>
        </div>
      </div>
    </div>

    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
	<link rel="shortcut icon" href="img/udec.jpg">
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
                    	<h1 align="center">Crear Profesor</h1>
           
                    </td>
                  </tr>
                </table>
                <table class="table table-bordered">
                  <tr>
                    <td>
                   	  <form name="form1" method="post" action="Controlador">
                                <div>
                <input type="hidden" name="accion" value="Asignar_materia_profesor" />
                             
                        <div align="center"><pre><strong>Informacion Basica</strong></pre></div>

                          <br></br>
                        <div class="row-fluid">
                          <div class="span6" align="center">
                          	<strong>Cedula</strong><br>
                               
                  
                                <input type="text" name="cedula" autocomplete="off" value="<%= p.getCedula()%>"  readonly><br>
                     
                          </div>
                          <div class="span6" align="center">
                          	<strong>Nombre </strong><br>
                                <input type="text" name="nombre" class="input-xxlarge" autocomplete="off" required value="<%= p.getNombre()%>"><br>
                          </div>
                        </div>

                         </div>
                          <div class="span6" align="center">
                            <strong>Apellido</strong><br>
                            <input type="text" name="apellido"  autocomplete="off" required value="<%= p.getApellido()%>"><br>
                          </div>
                        </div>

                         </div>
                          <div class="span6" align="center">
                            <strong>Telefono</strong><br>
                            <input type="text" name="telefono"  autocomplete="off" required value="<%= p.getTelefono()%>"><br>
                          </div>
                        </div>
                        
                   
                      <div class="row-fluid">
                          <div class="span6" align="center">
                            <strong>Materia</strong><br>
<%
                                conectar cc = new conectar();
        Connection cn= cc.conexion();
                               String sql="SELECT cod_materia,nom_materia FROM  materia ";
        
        
      
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
           
           
           
out.println("  <select name='materia'>"); 
while(rs.next()) { 

out.println("<option value="+rs.getString(1)+"> "+rs.getString(2)+" </option>"); 

}; // fin while 
out.println("</SELECT>");
                   
                       %>
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