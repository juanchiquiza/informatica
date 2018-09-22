package Modelo;

import java.sql.*;
public class  conectar {

    Connection conectar=null;
  
    public Connection conexion(){
        
        String url = "jdbc:postgresql://localhost:5432/Maestro";
       
//String connectString = “jdbc:postgresql://localhost:5432/ejemplo/”; // llamamos nuestra bd 
String user = "postgres"; // usuario postgres 
String password = "postgres"; // no tiene password nuestra bd. 
        try {
            Class.forName("org.postgresql.Driver");
            
           //Class.forName("jdbc:postgresql://localhost:5432/postgres\");
            
          //  conectar=DriverManager.getConnection("jdbc:mysql://localhost/bodega","root","");
            conectar = DriverManager.getConnection( url,user,password);
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
        return conectar;
    }
}