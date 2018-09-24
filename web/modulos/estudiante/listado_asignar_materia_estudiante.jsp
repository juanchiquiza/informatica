<%@page import="Modelo.*"%>
<%@page import="Modelo.Estudiante"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Profesor"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>Listado  de Materias a los estudiantes</title>
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
                  <li><a href="../profesor/crear_profesor.jsp"><i class="icon-plus"></i>Crear Profesor</a></li>
                    <li><a href="../profesor/listado_profesor.jsp"><i class="icon-list"></i>Listado de Profesores</a></li>
                    <li><a href="../profesor/listado_asignar_materia_profesor.jsp"><i class="icon-list"></i>Listado de Asignar</a></li> 
                    <li class="divider"></li>
               
                </ul>
              </li>

               <li class="dropdown">

                <a href="#" style="color:#A8BBFB" class="dropdown-toggle" data-toggle="dropdown">Materias <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="../materia/crear_materia.jsp"><i class="icon-plus"></i>Crear Materia</a></li>
                    <li><a href="../materia/listado_materia.jsp"><i class="icon-list"></i>Listado de Materias</a></li>   
                    <li class="divider"></li>
                     </ul>
              </li>
                <li class="dropdown">
                <a href="#" style="color:#A8BBFB" class="dropdown-toggle" data-toggle="dropdown">Alumno <b class="caret"></b></a>
                <ul class="dropdown-menu">
                   <li><a href="../estudiante/crear_estudiante.jsp"><i class="icon-plus"></i>Crear Alumno</a></li>
                    <li><a href="../estudiante/listado_estudiante.jsp"><i class="icon-list"></i>Listado de Alumno</a></li>
                  <li><a href="../estudiante/listado_asignar_materia_estudiante.jsp"><i class="icon-list"></i>Listado de Asignar</a></li>       
                   <li class="divider"></li>
                </ul>
              </li>
            </ul>
            <ul class="nav pull-right">
                <li class="dropdown">
              		<a href="#" style="color:#A8BBFB" class="dropdown-toggle" data-toggle="dropdown">
                    		Hola! <%String sec = (String)session.getAttribute ("abre_sesion");
                        out.println(" "+sec);%> <b class="caret"></b>
                    </a>
                	<ul class="dropdown-menu">
                            <li><a href="../usuarios/perfil.jsp">
                            <i class="icon-user"></i> Mi Perfil</a></li>  
                      	<li class="divider"></li>
                      	<li><a href="../usuarios/cerrar_sesion.jsp">
                        <i class="icon-off"></i> Salir</a></li>
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
                    	<h1 align="center">Listado  de Materias de los estudiantesna</h1>
                        <center>
                      	<form name="form3" method="get" action="../../Controlador" class="form-search">
                            <input type="hidden" name="accion" value="ConsultarMateriaEstudiante" />
                            <div class="input-prepend input-append">
                                <span class="add-on"><i class="icon-search"></i></span>
                                <input type="text" name="buscar" autocomplete="off" class="input-xxlarge search-query" 
                                autofocus placeholder="Buscar Profesor por Nombre">
                            </div>
                            <button type="submit" class="btn" name="buton"><strong>Buscar</strong></button>
                    	</form>
                        </center>
                    </td>
                  </tr>
                </table>
                <div align="right">
                	<a class="btn" href="crear_estudiante.jsp" title="Ingresar nuevo Profesor"><i class="icon-plus"></i> <strong>Crear nuevo Estudiante</strong></a>
                </div>
                <br>
                <table class="table table-bordered">
                  <tr class="well">
                    <td><strong>Codigo</strong></td>
                    <td><strong>Nombre </strong></td>
                    <td><strong>Apellido</strong></td>
                    <td><strong>telefono</strong></td>
                    <td><strong>Materia</strong></td>
                    <td><strong>Nota</strong></td>
                   
                  </tr>
                  <%    
                        String busca1 = (String)request.getSession().getAttribute("buscarMateriaEstudiante");
                        ArrayList<Estudiante> list = ProviderDB.obtenerMateriaEstudiante(busca1);
                        for (Estudiante est : list) {
                %>
                 <tr>
                    <td><%= est.getCodigo()%></td>
                    <td><%= est.getNombre()%></td>
                    <td><%= est.getApellido()%></td>
                    <td><%= est.getTelefono()%></td>
                    <td><%= est.getNom_materia()%></td>
                    <td><%= est.getNota()%></td>
                 
                       </tr>
                    <%
                            }
                    %>
                </table>
            </td>
          </tr>
        </table>
    </div>
                  
   <script src="../../js/jquery.js"></script>
    <script src="../../js/bootstrap-transition.js"></script>
    <script src="../../js/bootstrap-alert.js"></script>
    <script src="../../js/bootstrap-modal.js"></script>
    <script src="../../js/bootstrap-dropdown.js"></script>
    <script src="../../js/bootstrap-scrollspy.js"></script>
    <script src="../../js/bootstrap-tab.js"></script>
    <script src="../../js/bootstrap-tooltip.js"></script>
    <script src="../../js/bootstrap-popover.js"></script>
    <script src="../../js/bootstrap-button.js"></script>
    <script src="../../js/bootstrap-collapse.js"></script>
    <script src="../../js/bootstrap-carousel.js"></script>
    <script src="../../js/bootstrap-typeahead.js"></script>

  </body>
</html>