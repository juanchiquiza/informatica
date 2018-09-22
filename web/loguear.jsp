
<%@page language="java" import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*" %> 
<%@ page language="java" import="Modelo.conectar" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String nickname1 = request.getParameter("usu");
String password1 = request.getParameter("con");
String nombre = null;
String usuario = null;
String contrasena = null;
 conectar cc = new conectar();
        Connection cn= cc.conexion();
try {
   
    Statement st = cn.createStatement();
    String sql = "SELECT usu, con FROM username where usu='"+nickname1+"' and con='"+password1+"'";
    ResultSet rs = st.executeQuery(sql);
 
    while(rs.next()) {
    usuario = rs.getString("usu"); //mostra o campo 2 da tabela
    contrasena = rs.getString("con");//mostra o campo 3 da tabela
    }
 
   // cn.close();
}
catch(Exception e) {
    out.println(e.toString());
}

 	if(nickname1.equals(usuario) && contrasena.equals(password1))   
 	{
	 
	 // abre a seccao para a pagina a ser redirecionado
	 session.setAttribute("abre_sesion", contrasena); // criar a sesscao com a chave=abre_secao e valor emaile(email   )
        //se o email e a senha estiverem coretos faca o codigo aseguir
         //direciona a pagina para princ.jsp
              String site = new String("Principal.jsp"); 
              response.setStatus(response.SC_MOVED_TEMPORARILY); 
               response.setHeader("Location", site); 
          }else{
        	 
        	 
        	  String volta_index = "index.jsp";
        	  response.setStatus(response.SC_MOVED_TEMPORARILY); 
                 // out.println("fuera de servicio");
        	  response.setHeader("Location", volta_index); 
                 //  out.println("fuera de servicio");
          }
 
%>
</body>
</html>