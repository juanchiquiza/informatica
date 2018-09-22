<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>Control de Entrada</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/distrital.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/distrital.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/distrital.png">
    <link rel="apple-touch-icon-precomposed" href="img/distrital.png">
    <link rel="shortcut icon" href="img/distrital.png">
  </head>
<br></br><br></br>

  <body>

    <div class="container">
	  <form name="form1" method="post" action="modulos/usuarios/loguear.jsp" class="form-signin">
      	<center><img src="img/distrital.png" width="250" height="200"></center><br>
       
        <input type="text" name="usu" class="input-block-level" placeholder="Documento" autocomplete="off" required>
        <input type="password" name="con" class="input-block-level" placeholder="Password" autocomplete="off" required>
        <div align="right"><button class="btn btn-large btn-primary" type="submit"><strong>Entrar</strong></button></div>		

      </form>

    </div> <!-- /container -->

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
