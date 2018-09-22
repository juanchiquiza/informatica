/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author juan
 */
public class EstudianteRegistroBD {
    
     public boolean insertarEstudiante(Estudiante e){
      try {
            conectar cc = new conectar();
            Connection cn= cc.conexion();
    
            PreparedStatement pst = cn.prepareStatement("INSERT INTO estudiante(codigo_est,nombre_est,apellido_est,telefono) VALUES (?,?,?,?)");
            pst.setString(1, e.getCodigo());
            pst.setString(2, e.getNombre());
            pst.setString(3, e.getApellido());
            pst.setString(4, e.getTelefono());
          
            pst.executeUpdate();
           
        } catch (Exception es) {
            System.out.print(es.getMessage());
        }
      
      return true;
     } 
     public boolean insertar_Materia_Alumno(Estudiante e){
      try {
            conectar cc = new conectar();
            Connection cn= cc.conexion();
    
            PreparedStatement pst = cn.prepareStatement("INSERT INTO materia_estudiante(cod_materi,codigo_es,nota) VALUES (?,?,?)");
            pst.setString(1, e.getMateria());
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
        conectar cc = new conectar();
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
                Estudiante estudiante = new Estudiante();
                estudiante.setCodigo(rs.getString(1)); 
                estudiante.setNombre(rs.getString(2));
                estudiante.setApellido(rs.getString(3));
                estudiante.setTelefono(rs.getString(4));
                listar.add(estudiante);              
            }           
        } catch (SQLException ex) {
           
        }
        return listar;
    }
     
     
      public static ArrayList<Estudiante> obtenerMateriaEstudiante(String valor){
        
        ArrayList<Estudiante> listar = new ArrayList<Estudiante>();
        conectar cc = new conectar();
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
                Estudiante estudiante = new Estudiante();
                estudiante.setCodigo(rs.getString(1)); 
                estudiante.setNombre(rs.getString(2));
                estudiante.setApellido(rs.getString(3));
                estudiante.setTelefono(rs.getString(4));
                estudiante.setNom_materia(rs.getString(5));
                estudiante.setNota(rs.getString(6));
               
                listar.add(estudiante);              
            }           
        } catch (SQLException ex) {
           
        }
        return listar;
    }
      
       public boolean eliminarEstudiante(Estudiante e){
        try {
              conectar cc = new conectar();
              Connection cn= cc.conexion();
              PreparedStatement pst = cn.prepareStatement("DELETE FROM estudiante WHERE  codigo_est='"+e.getCodigo()+"'");
              pst.executeUpdate();

          } catch (Exception es) {

          }

        return true;
      }     
       
        public static Estudiante getEstudiante(String valor){
         
        Estudiante estudiante = new Estudiante();
        conectar cc = new conectar();
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
            conectar cc = new conectar();
            Connection cn= cc.conexion();
    
            PreparedStatement pst = cn.prepareStatement("UPDATE estudiante SET nombre_est='"+ e.getNombre()+"',apellido_est='"+ e.getApellido()+"',telefono='"+ e.getTelefono()+"' WHERE codigo_est='"+ e.getCodigo()+"'");
        pst.executeUpdate();
           
        } catch (Exception es) {
           // System.out.print(e.getMessage());
        }
      
      return true;
    }     
         
}
