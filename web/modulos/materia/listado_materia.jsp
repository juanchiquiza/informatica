<%@page import="Modelo.Materia"%>
<%@page import="Modelo.*"%>
<%@page import="Modelo.Estudiante"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Profesor"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>Listado  de Materias</title>
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
                  <li><a href="crear_materia.jsp"><i class="icon-plus"></i>Crear Materia</a></li>
                    <li><a href="listado_materia.jsp"><i class="icon-list"></i>Listado de Materias</a></li>   
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
                      	<li><a href="cerrar_sesion.jsp"><li><a href="../usuarios/cerrar_sesion.jsp">
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

    <?php include_once "../../menu/m_profesor.php"; ?>
	<div align="center">
    	<table width="90%">
          <tr>
            <td>
            	<table class="table table-bordered">
                  <tr class="well">
                    <td>
                    	<h1 align="center">Listado de Materias</h1>
                        <center>
                      	<form name="form3" method="get" action="../../Controlador" class="form-search">
                            <input type="hidden" name="accion" value="ConsultarMateria" />
                            <div class="input-prepend input-append">
                                <span class="add-on"><i class="icon-search"></i></span>
                                <input type="text" name="buscar" autocomplete="off" class="input-xxlarge search-query" 
                                autofocus placeholder="Buscar Estudiante por Nombre">
                            </div>
                            <button type="submit" class="btn" name="buton"><strong>Buscar</strong></button>
                    	</form>
                        </center>
                    </td>
                  </tr>
                </table>
                <div align="right">
                	<a class="btn" href="crear_materia.jsp" title="Ingresar nuevo estudiante"><i class="icon-plus"></i> <strong>Crear nuevo materia</strong></a>
                </div>
                <br>
                <table class="table table-bordered">
                  <tr class="well">
                    <td><strong>Codigo</strong></td>
                    <td><strong>Nombre </strong></td>
                    <td><strong>Descripsion</strong></td>
                    <td><strong>Intensidad Horaria</strong></td>
                    <td><strong>N de Creditos</strong></td>
                    <td><strong>Editar</strong></td>
                    <td><strong>Eliminar</strong></td>
                  <!--  <td><strong>Asignar</strong></td>  -->

                  </tr>
                  <%    
                            String buscarm = (String)request.getSession().getAttribute("buscarMateria");
                            ArrayList<Materia> listarm = ProviderDB.obtenerMateria(buscarm);
                            for (Materia ma : listarm) {
                %>
                 <tr>
                    <td><%= ma.getCodigo()%></td>
                    <td><%= ma.getNombre()%></td>
                    <td><%= ma.getDescripsion()%></td>
                    <td><%= ma.getInt_horario()%></td>
                    <td><%= ma.getN_creditos()%></td> 
                    <td>
                    	<center>
                            <a class="btn btn-mini" href="modificar_materia.jsp?ced=<%= ma.getCodigo()%>" title="Editar">
                                <i class="icon-edit"></i>
                            </a>
                        </center>
                    </td>

                    <td>
                        <center>
                            <a href="../../Controlador?ced=<%= ma.getCodigo()%>&accion=EliminarMateria" class="btn btn-mini" title="Eliminar">
                                <i class="icon-remove"></i>
                            </a>
                        </center>
                    </td>

                    <!-- <td>
                      <center>
                           <a class="btn btn-mini" href="crear_asignar.php?ced=<%= ma.getCodigo()%>" title="Editar">
                                <i class="icon-edit"></i>
                            </a>
                        </center>
                    </td>-->
                
                  <!-- <div id="r<?php echo $row['cedula_prof']; ?>" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
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