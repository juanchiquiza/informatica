package Modelo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.table.DefaultTableModel;

// @autor Henry Joe Wong Uruqiza
// Archivo: ProductoBD.java
// Creado: 24FEBRERO2011 12:39:08 PM
public class ProfesorRegistroBD {
    //Metodo utilizado para insertar un Producto a nuestra Base de datos
     
    public boolean insertarProfesor(Profesor p){
      try {
             Date creacion = new Date();
        

            conectar cc = new conectar();
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
            conectar cc = new conectar();
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
        conectar cc = new conectar();
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
        conectar cc = new conectar();
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
        conectar cc = new conectar();
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
            conectar cc = new conectar();
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
              conectar cc = new conectar();
              Connection cn= cc.conexion();
              PreparedStatement pst = cn.prepareStatement("DELETE FROM profesores WHERE  cedula_prof='"+p.getCedula()+"'");
              pst.executeUpdate();

          } catch (Exception e) {

          }

        return true;
      }     
/*
    public static synchronized boolean insertarProducto(Producto varproducto) {
        Connection cn = null;
        CallableStatement cl = null;
        boolean rpta = false;
        try {
            //Nombre del procedimiento almacenado y como espera tres parametros
            //le ponemos 3 interrogantes
            String call = "{CALL spI_producto(?,?,?)}";
            //Obtenemos la conexion
            cn = Conexion.getConexion();
            //Decimos que vamos a crear una transaccion
            cn.setAutoCommit(false);
            //Preparamos la sentecia
            cl = cn.prepareCall(call);
            //Como el codigo se autogenera y es del tipo OUT en el procedimiento
            //almacenado le decimos que es OUT y el del tipo Integer en Java
            cl.registerOutParameter(1, Types.INTEGER);
            //El siguiente parametro del procedimiento almacenado es el nombre
            cl.setString(2, varproducto.getNombre());
            //Y por ultimo el precio 
            cl.setDouble(3, varproducto.getPrecio());
            //Ejecutamos la sentencia y si nos devuelve el valor de 1 es porque
            //registro de forma correcta los datos
            rpta = cl.executeUpdate() == 1 ? true : false;
            if (rpta) {
                //Confirmamos la transaccion
                cn.commit();
            } else {
                //Negamos la transaccion
                Conexion.deshacerCambios(cn);
            }
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (SQLException e) {
            e.printStackTrace();
            Conexion.deshacerCambios(cn);
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (Exception e) {
            e.printStackTrace();
            Conexion.deshacerCambios(cn);
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        }
        return rpta;
    }

    //Metodo utilizado para insertar un Producto a nuestra Base de datos
    public static synchronized boolean actualizarProducto(Producto varproducto) {
        Connection cn = null;
        CallableStatement cl = null;
        boolean rpta = false;
        try {
            //Nombre del procedimiento almacenado y como espera tres parametros
            //le ponemos 3 interrogantes
            String call = "{CALL spU_producto(?,?,?)}";
            //Obtenemos la conexion
            cn = Conexion.getConexion();
            //Decimos que vamos a crear una transaccion
            cn.setAutoCommit(false);
            //Preparamos la sentecia
            cl = cn.prepareCall(call);
            //El primer parametro del procedimiento almacenado es el codigo
            cl.setInt(1, varproducto.getCodigoProducto());
            //El siguiente parametro del procedimiento almacenado es el nombre
            cl.setString(2, varproducto.getNombre());
            //Y por ultimo el precio
            cl.setDouble(3, varproducto.getPrecio());
            //Ejecutamos la sentencia y si nos devuelve el valor de 1 es porque
            //registro de forma correcta los datos
            rpta = cl.executeUpdate() == 1 ? true : false;
            if (rpta) {
                //Confirmamos la transaccion
                cn.commit();
            } else {
                //Negamos la transaccion
                Conexion.deshacerCambios(cn);
            }
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (SQLException e) {
            e.printStackTrace();
            Conexion.deshacerCambios(cn);
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (Exception e) {
            e.printStackTrace();
            Conexion.deshacerCambios(cn);
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        }
        return rpta;
    }
    //Metodo utilizado para obtener todos los productos de nuestra base de datos

    public static synchronized ArrayList<Producto> obtenerProducto() {
        //El array que contendra todos nuestros productos
        ArrayList<Producto> lista = new ArrayList<Producto>();
        Connection cn = null;
        CallableStatement cl = null;
        ResultSet rs = null;
        try {
            //Nombre del procedimiento almacenado
            String call = "{CALL spF_producto_all()}";
            cn = Conexion.getConexion();
            cl = cn.prepareCall(call);
            //La sentencia lo almacenamos en un resulset
            rs = cl.executeQuery();
            //Consultamos si hay datos para recorrerlo
            //e insertarlo en nuestro array
            while (rs.next()) {
                Producto p = new Producto();
                //Obtenemos los valores de la consulta y creamos
                //nuestro objeto producto
                p.setCodigoProducto(rs.getInt("codigoProducto"));
                p.setNombre(rs.getString("nombre"));
                p.setPrecio(rs.getDouble("precio"));
                //Lo adicionamos a nuestra lista
                lista.add(p);
            }
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (SQLException e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (Exception e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        }
        return lista;
    }

    //Metodo utilizado para obtener todos los productos de nuestra base de datos
    public static synchronized Producto obtenerProducto(int codigo) {
        Producto p = new Producto();
        Connection cn = null;
        CallableStatement cl = null;
        ResultSet rs = null;
        try {
            //Nombre del procedimiento almacenado
            String call = "{CALL spF_producto_one(?)}";
            cn = Conexion.getConexion();
            cl = cn.prepareCall(call);
            cl.setInt(1, codigo);
            //La sentencia lo almacenamos en un resulset
            rs = cl.executeQuery();
            //Consultamos si hay datos para recorrerlo
            //e insertarlo en nuestro array
            while (rs.next()) {
                //Obtenemos los valores de la consulta y creamos
                //nuestro objeto producto
                p.setCodigoProducto(rs.getInt("codigoProducto"));
                p.setNombre(rs.getString("nombre"));
                p.setPrecio(rs.getDouble("precio"));
            }
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (SQLException e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        } catch (Exception e) {
            e.printStackTrace();
            Conexion.cerrarCall(cl);
            Conexion.cerrarConexion(cn);
        }
        return p;
    }*/
}
