<%--<?php 
	session_start();
	include_once "Modulos/php_conexion.php";
	include_once "Modulos/class_buscar.php";
	include_once "Modulos/funciones.php";
	
	$oUsuario=new Consultar_Usuario($_SESSION['cod_user']);
$Nombre=$oUsuario->consultar('nom').' '.$oUsuario->consultar('ape');
?>  --%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>Principal</title>
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
                    <li><a href="listado_profesor.jsp"><i class="icon-list"></i>Listado de Profesores</a></li>
                    <li><a href="listado_Asignar_materia_profesor.jsp"><i class="icon-list"></i>Listado de Asignar Materias</a></li> 
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
                  <li><a href="crear_estudiante.jsp"><i class="icon-plus"></i>Crear Alumno</a></li>
                    <li><a href="listado_estudiante.jsp"><i class="icon-list"></i>Listado de Alumno</a></li>
                  <li><a href="listado_Asignar_materia_estudiante.jsp"><i class="icon-list"></i>Listado de Asignar</a></li>       
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
                            <%--<li><a href="perfil.php">
                      <i class="icon-user"></i> Mi Perfil</a></li>  --%> 
                      	<li class="divider"></li>
                      	<li><a href="cerrar_sesion.jsp">
                        <i class="icon-off"></i> Salir</a></li>
                    </ul>
                </li>
          	</ul>
          </div>
        </div>
      </div>
    </div>

    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/img/bebe.jpg">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/img/bebe.jpg">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/img/bebe.jpg">
                    <link rel="apple-touch-icon-precomposed" href="/img/bebe.jpg">
                                 
                                   <link rel="shortcut icon" href="img/udec.jpg">
  </head>
  <!-- FACEBOOK COMENTARIOS--> 
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

  <%--  <?php include_once "menu/m_principal.php"; ?>--%>
	
    <DIV align="center">
       
        <h1 class="text-info">Universidad de Cundinamarca </h1><br>
        <center><img src="img/udec.jpg" width="200" height="150"></center><br>
        <br></br><br></br>
        <h1> Bienvenido al Sistema <%String sec1 = (String)session.getAttribute ("abre_sesion");
                        out.println(" "+sec1);%> </h1><br>
        <!--
		<!--<strong class="text-info"> * * *  ?>  * * *  </strong>
    <strong class="text-info"> * * * <?php echo usuario($_SESSION['tipo_user']); ?>  * * *  </strong>-->
    </DIV>
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
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
