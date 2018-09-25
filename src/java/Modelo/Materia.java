/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author juan
 */
public class Materia {


    
    private String codigo;
    private String nombre;
    private String descripsion;
    private String Int_horario;
    private String N_creditos;
    private String profesor;

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

    public String getDescripsion() {
        return descripsion;
    }

    public void setDescripsion(String descripsion) {
        this.descripsion = descripsion;
    }

    public String getInt_horario() {
        return Int_horario;
    }

    public void setInt_horario(String Int_horario) {
        this.Int_horario = Int_horario;
    }

    public String getN_creditos() {
        return N_creditos;
    }

    public void setN_creditos(String N_creditos) {
        this.N_creditos = N_creditos;
    }
        /**
     * @return the profesor
     */
    public String getProfesor() {
        return profesor;
    }

    /**
     * @param profesor the profesor to set
     */
    public void setProfesor(String profesor) {
        this.profesor = profesor;
    }
    
}
