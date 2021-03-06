/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import static Modelo.ProviderDB.insertar_Materia_Alumno;

/**
 *
 * @author juan
 */
public class Estudiante extends Usuario implements MateriaAlumno{
    
    private String codigo;
    private String nota;
    private String Materia;
   // private String Nom_materia;
    
    public Estudiante(){
    }
    
    public Estudiante(String codigo, String nombre, String apellido, String telefono){
        this.codigo = codigo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
    }
     public Estudiante(String codigo, String nombre, String apellido, String telefono, String materia, String nota){
        this.codigo = codigo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
        this.Materia = materia;
        this.nota = nota;
    }

  /*  public String getNom_materia() {
        return Nom_materia;
    }

    public void setNom_materia(String Nom_materia) {
        this.Nom_materia = Nom_materia;
    }*/

    public String getMateria() {
        return Materia;
    }

    public void setMateria(String Materia) {
        this.Materia = Materia;
    }

    public String getNota() {
        return nota;
    }

    public void setNota(String nota) {
        this.nota = nota;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    private String nombre;
    private String apellido;
    private String telefono;
    
    public String pageEliminate() {
        return "modulos/estudiante/listado_estudiante.jsp";
    }
    
    @Override
    public void asignarMateriaAlumno(Estudiante e) {
        insertar_Materia_Alumno(e);
    }
}
