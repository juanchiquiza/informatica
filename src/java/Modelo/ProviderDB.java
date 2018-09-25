package Modelo;

import java.sql.*;
import java.util.ArrayList;
public class  ProviderDB {

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
    
    //Estudiante
    public boolean insertarEstudiante(Estudiante e){
      try {
            ProviderDB cc = new ProviderDB();
            Connection cn= cc.conexion();
    
            PreparedStatement pst = cn.prepareStatement("INSERT INTO estudiante(codigo_est,nombre_est,apellido_est,telefono) VALUES (?,?,?,?)");
            pst.setString(1, e.getCodigo());
            pst.setString(2, e.getNombre());
            pst.setString(3, e.getApellido());
            pst.setString(4, e.getTelefono());
          
            pst.executeUpdate();
            PreparedStatement pst1 = cn.prepareStatement("INSERT INTO username(id,usu,con,correo,fecha,tipo) VALUES (?,?,?,?,?,?)");
            pst1.setInt(1, Integer.parseInt(e.getCodigo()));
            pst1.setString(2, e.getCodigo());
            pst1.setString(3, e.getCodigo());
            pst1.setString(4, "");
            pst1.setDate(5, java.sql.Date.valueOf("2013-09-04"));
            pst1.setString(6, "E");
            pst1.executeUpdate();
           
        } catch (Exception es) {
            System.out.print(es.getMessage());
        }
      
      return true;
     } 
     public boolean insertar_Materia_Alumno(Estudiante e){
      try {
            ProviderDB cc = new ProviderDB();
            Connection cn= cc.conexion();
    
            PreparedStatement pst = cn.prepareStatement("INSERT INTO materia_estudiante(cod_materi,codigo_es,nota) VALUES (?,?,?)");
            pst.setString(1, e.getNom_materia());
            pst.setString(2, e.getCodigo());
            pst.setString(3, e.getNota());
                     
            pst.executeUpdate();
           
        } catch (Exception es) {
            System.out.print(es.getMessage());
        }
      
      return true;
     } 
     
     public static ArrayList<Estudiante> obtenerEstudiante(String valor){
        
        ArrayList<Estudiante> listar = new ArrayList<Estudiante>();
        ProviderDB cc = new ProviderDB();
        Connection cn= cc.conexion();
        String sql = "";
        if(valor == null || valor.equals(""))
        {
            sql="SELECT * FROM estudiante";
        }
        else{
            sql="SELECT * FROM  estudiante WHERE codigo_est='"+valor+"'";
        }
        
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while(rs.next()){
                Estudiante estudiante = new Estudiante(rs.getString(1),rs.getString(2), rs.getString(3), rs.getString(2));
               /* estudiante.setCodigo(rs.getString(1)); 
                estudiante.setNombre(rs.getString(2));
                estudiante.setApellido(rs.getString(3));
                estudiante.setTelefono(rs.getString(4));*/
                listar.add(estudiante);              
            }           
        } catch (SQLException ex) {
           
        }
        return listar;
    }
     
     
      public static ArrayList<Estudiante> obtenerMateriaEstudiante(String valor){
        
        ArrayList<Estudiante> listar = new ArrayList<Estudiante>();
        ProviderDB cc = new ProviderDB();
        Connection cn= cc.conexion();
        String sql = "";
        if(valor == null || valor.equals(""))
        {
            sql="SELECT codigo_est,nombre_est,apellido_est,telefono,nom_materia,nota FROM materia_estudiante join materia on  materia_estudiante.cod_materi=materia.cod_materia join estudiante on  materia_estudiante.codigo_es = estudiante.codigo_est";
        }
        else{
            sql="SELECT codigo_est,nombre_est,apellido_est,telefono,nom_materia,nota FROM materia_estudiante join materia on  materia_estudiante.cod_materi=materia.cod_materia join estudiante on  materia_estudiante.codigo_es = estudiante.codigo_est where materia_estudiante.codigo_es ='"+valor+"'";
        }
        
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
           
           
            while(rs.next()){
                Estudiante estudiante = new Estudiante(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6));
               /* estudiante.setCodigo(rs.getString(1)); 
                estudiante.setNombre(rs.getString(2));
                estudiante.setApellido(rs.getString(3));
                estudiante.setTelefono(rs.getString(4));
                estudiante.setNom_materia(rs.getString(5));
                estudiante.setNota(rs.getString(6));*/
               
                listar.add(estudiante);              
            }           
        } catch (SQLException ex) {
           
        }
        return listar;
    }
      
       public boolean eliminarEstudiante(Estudiante e){
        try {
              ProviderDB cc = new ProviderDB();
              Connection cn= cc.conexion();
              PreparedStatement pst = cn.prepareStatement("DELETE FROM estudiante WHERE  codigo_est='"+e.getCodigo()+"'");
              pst.executeUpdate();

          } catch (Exception es) {

          }

        return true;
      }     
       
        public static Estudiante getEstudiante(String valor){
         
        Estudiante estudiante = new Estudiante();
        ProviderDB cc = new ProviderDB();
        Connection cn= cc.conexion();
        String sql = "";

        sql="SELECT * FROM  estudiante WHERE  codigo_est ='"+valor+"'";
        
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
           
           
            while(rs.next()){                
                estudiante.setCodigo(rs.getString(1)); 
                estudiante.setNombre(rs.getString(2));
                estudiante.setApellido(rs.getString(3));
                estudiante.setTelefono(rs.getString(4));                              
            }           
       } catch (SQLException ex) {
           
        }
        return estudiante;
    }
        
         public boolean actualizaEstudiante(Estudiante e){
      try {
            ProviderDB cc = new ProviderDB();
            Connection cn= cc.conexion();
    
            PreparedStatement pst = cn.prepareStatement("UPDATE estudiante SET nombre_est='"+ e.getNombre()+"',apellido_est='"+ e.getApellido()+"',telefono='"+ e.getTelefono()+"' WHERE codigo_est='"+ e.getCodigo()+"'");
        pst.executeUpdate();
           
        } catch (Exception es) {
           // System.out.print(e.getMessage());
        }
      
      return true;
    }
         
    //Materia
    public boolean insertarMateria(Materia ma){
      try {
            ProviderDB cc = new ProviderDB();
            Connection cn= cc.conexion();
    
            PreparedStatement pst = cn.prepareStatement("INSERT INTO materia(cod_materia, nom_materia, descripsion, intesisdad_horaria, n_creditos) VALUES (?,?,?,?,?)");
            pst.setString(1, ma.getCodigo());
            pst.setString(2, ma.getNombre());
            pst.setString(3, ma.getDescripsion());
            pst.setString(4, ma.getInt_horario());
            pst.setString(5, ma.getN_creditos());
          
            pst.executeUpdate();
           
        } catch (Exception es) {
            System.out.print(es.getMessage());
        }
      
      return true;
     } 
 
 
     
     
      public static ArrayList<Materia> obtenerMateria(String valor){
        
        ArrayList<Materia> listarm = new ArrayList<Materia>();
        ProviderDB cc = new ProviderDB();
        Connection cn= cc.conexion();
        String sql = "";
        if(valor == null || valor.equals(""))
        {
            sql="SELECT * FROM materia";
        }
        else{
            sql="SELECT * FROM  materia WHERE cod_materia='"+valor+"'";
        }
        
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
           
           
            while(rs.next()){
                Materia materia = new Materia();
                materia.setCodigo(rs.getString(1)); 
                materia.setNombre(rs.getString(2));
                materia.setDescripsion(rs.getString(3));
                materia.setInt_horario(rs.getString(4));
                materia.setN_creditos(rs.getString(5));
                listarm.add(materia);              
            }           
        } catch (SQLException ex) {
           
        }
        return listarm;
    }
      
       public boolean eliminarMateria(Materia ma){
        try {
              ProviderDB cc = new ProviderDB();
              Connection cn= cc.conexion();
               PreparedStatement pst = cn.prepareStatement("DELETE FROM materia WHERE  cod_materia='"+ma.getCodigo()+"'");
              pst.executeUpdate();

          } catch (Exception es) {

          }

        return true;
      }     
       
        public static Materia getMateria(String valor){
         
        Materia materia = new Materia();
        ProviderDB cc = new ProviderDB();
        Connection cn= cc.conexion();
        String sql = "";

        sql="SELECT * FROM  materia WHERE  cod_materia ='"+valor+"'";
        
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
           
           
            while(rs.next()){                
                materia.setCodigo(rs.getString(1)); 
                materia.setNombre(rs.getString(2));
                materia.setDescripsion(rs.getString(3));
                materia.setInt_horario(rs.getString(4));
                materia.setN_creditos(rs.getString(4));
            }           
       } catch (SQLException ex) {
           
        }
        return materia;
    }
        
         public boolean actualizaMateria(Materia ma){
      try {
            ProviderDB cc = new ProviderDB();
            Connection cn= cc.conexion();
    
          PreparedStatement pst = cn.prepareStatement("UPDATE materia SET nom_materia='"+ma.getNombre()+"',descripsion='"+ma.getDescripsion()+"',intesisdad_horaria='"+ma.getInt_horario()+"',n_creditos='"+ma.getN_creditos()+"' WHERE cod_materia='"+ma.getCodigo()+"'");
      pst.executeUpdate();
           
        } catch (Exception es) {
           // System.out.print(e.getMessage());
        }
      
      return true;
    }     
         
    //Profesor
     public boolean insertarProfesor(Profesor p){
      try {
             java.util.Date creacion = new java.util.Date();
        

            ProviderDB cc = new ProviderDB();
            Connection cn= cc.conexion();
    
            PreparedStatement pst = cn.prepareStatement("INSERT INTO profesores(cedula_prof,nombre_prof,apellido_prof,telefono) VALUES (?,?,?,?)");
            pst.setString(1,  p.getCedula());
            pst.setString(2, p.getNombre());
            pst.setString(3, p.getApellido());
            pst.setString(4, p.getTelefono());
          
            pst.executeUpdate();
            PreparedStatement pst1 = cn.prepareStatement("INSERT INTO username(id,usu,con,correo,fecha,tipo) VALUES (?,?,?,?,?,?)");
            pst1.setInt(1, Integer.parseInt(p.getCedula()));
            pst1.setString(2, p.getCedula());
            pst1.setString(3, p.getCedula());
            pst1.setString(4, "");
            pst1.setDate(5, java.sql.Date.valueOf("2013-09-04"));
            pst1.setString(6, "C");
            pst1.executeUpdate();
            
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
      
      return true;
    }    
    
     public boolean insertar_Materia_Profesor(Profesor ma){
      try {
            ProviderDB cc = new ProviderDB();
            Connection cn= cc.conexion();
    
            PreparedStatement pst = cn.prepareStatement("INSERT INTO materia_profesor(cod_materi,cedula_pro) VALUES (?,?)");
            pst.setString(1, ma.getMateria());
            pst.setString(2, ma.getCedula());
                    
            pst.executeUpdate();
           
        } catch (Exception es) {
            System.out.print(es.getMessage());
        }
      
      return true;
     } 
     
    public static ArrayList<Profesor> obtenerProfesor(String valor){
        
        ArrayList<Profesor> lista = new ArrayList<Profesor>();
        ProviderDB cc = new ProviderDB();
        Connection cn= cc.conexion();
        String sql = "";
        if(valor == null || valor.equals(""))
        {
            sql="SELECT * FROM profesores";
        }
        else{
            sql="SELECT * FROM  profesores WHERE cedula_prof='"+valor+"'";
        }
        
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
           
           
            while(rs.next()){
                Profesor profesor = new Profesor();
                profesor.setCedula(rs.getString(1)); 
                profesor.setNombre(rs.getString(2));
                profesor.setApellido(rs.getString(3));
                profesor.setTelefono(rs.getString(4));
                lista.add(profesor);              
            }           
        } catch (SQLException ex) {
           
        }
        return lista;
    }
    
     public static ArrayList<Profesor> obtenerMateriaProfesor(String valor){
        
        ArrayList<Profesor> lista = new ArrayList<Profesor>();
        ProviderDB cc = new ProviderDB();
        Connection cn= cc.conexion();
        String sql = "";
        if(valor == null || valor.equals(""))
        {
            sql=" SELECT cedula_prof,nombre_prof,apellido_prof,telefono,nom_materia FROM materia_profesor join profesores on materia_profesor.cedula_pro=profesores.cedula_prof join materia on  materia_profesor.cod_materi=materia.cod_materia";
        }
        else{
            sql="SELECT cedula_prof,nombre_prof,apellido_prof,telefono,nom_materia FROM materia_profesor join profesores on  materia_profesor.cedula_pro=profesores.cedula_prof join materia on  materia_profesor.cod_materi=materia.cod_materia where materia_profesor.cedula_pro='"+valor+"'";
        }
        
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
           
           
            while(rs.next()){
                Profesor profesor = new Profesor();
                profesor.setCedula(rs.getString(1)); 
                profesor.setNombre(rs.getString(2));
                profesor.setApellido(rs.getString(3));
                profesor.setTelefono(rs.getString(4));
                profesor.setNom_materia(rs.getString(5));
                lista.add(profesor);              
            }           
        } catch (SQLException ex) {
           
        }
        return lista;
    }
    
     public static Profesor getProfesor(String valor){
         
        Profesor profesor = new Profesor();
        ProviderDB cc = new ProviderDB();
        Connection cn= cc.conexion();
        String sql = "";

        sql="SELECT * FROM  profesores WHERE cedula_prof='"+valor+"'";
        
        try {
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
           
           
            while(rs.next()){                
                profesor.setCedula(rs.getString(1)); 
                profesor.setNombre(rs.getString(2));
                profesor.setApellido(rs.getString(3));
                profesor.setTelefono(rs.getString(4));                              
            }           
       } catch (SQLException ex) {
           
        }
        return profesor;
    }
    

        
         public boolean actualizaProfesor(Profesor p){
      try {
            ProviderDB cc = new ProviderDB();
            Connection cn= cc.conexion();
    
            PreparedStatement pst = cn.prepareStatement("UPDATE profesores SET nombre_prof='"+ p.getNombre()+"',apellido_prof='"+ p.getApellido()+"',telefono='"+ p.getTelefono()+"' WHERE cedula_prof='"+ p.getCedula()+"'");
        pst.executeUpdate();
           
        } catch (Exception e) {
           // System.out.print(e.getMessage());
        }
      
      return true;
    }     
         
         
    public boolean eliminarProfesor(Profesor p){
        try {
              ProviderDB cc = new ProviderDB();
              Connection cn= cc.conexion();
              PreparedStatement pst = cn.prepareStatement("DELETE FROM profesores WHERE  cedula_prof='"+p.getCedula()+"'");
              pst.executeUpdate();

          } catch (Exception e) {

          }

        return true;
    }     
}