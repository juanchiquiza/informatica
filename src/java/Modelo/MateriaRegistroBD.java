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
public class MateriaRegistroBD {
    
 public boolean insertarMateria(Materia ma){
      try {
            conectar cc = new conectar();
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
        conectar cc = new conectar();
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
              conectar cc = new conectar();
              Connection cn= cc.conexion();
               PreparedStatement pst = cn.prepareStatement("DELETE FROM materia WHERE  cod_materia='"+ma.getCodigo()+"'");
              pst.executeUpdate();

          } catch (Exception es) {

          }

        return true;
      }     
       
        public static Materia getMateria(String valor){
         
        Materia materia = new Materia();
        conectar cc = new conectar();
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
            conectar cc = new conectar();
            Connection cn= cc.conexion();
    
          PreparedStatement pst = cn.prepareStatement("UPDATE materia SET nom_materia='"+ma.getNombre()+"',descripsion='"+ma.getDescripsion()+"',intesisdad_horaria='"+ma.getInt_horario()+"',n_creditos='"+ma.getN_creditos()+"' WHERE cod_materia='"+ma.getCodigo()+"'");
      pst.executeUpdate();
           
        } catch (Exception es) {
           // System.out.print(e.getMessage());
        }
      
      return true;
    }     
         
}