package Controlador;

import Modelo.Estudiante;
import Modelo.ProviderDB;
import Modelo.Materia;
import Modelo.Profesor;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Controlador extends HttpServlet {

    //Para controlar peticiones del tipo GET
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    //Para controlar peticiones del tipo POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    //Un metodo que recibe todas las peticiones a si sea GET y POST
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //La accion se va a guardar en un caja de texto oculto que nos dira que accion
        //debemos hacer
        String accion = request.getParameter("accion");
        if (accion.equals("RegistrarProfesor")) {
            this.registrarProfesor(request, response);
       } else if (accion.equals("ConsultarProfesor")) {
           this.consultarProfesor(request, response);
       } else if (accion.equals("ModificarProfesor")) {
           this.modificarProfesor(request, response);
        } else if (accion.equals("EliminarProfesor")) {
            this.EliminarProfesor(request, response);
        } else if (accion.equals("RegistrarEstudiante")) {
            this.RegistrarEstudiante(request, response);
        }  else if (accion.equals("ConsultarEstudiante")) {
            this.consultarEstudiante(request, response);
        } else if (accion.equals("EliminarEstudiante")) {
            this.EliminarEstudiante(request, response);
        } else if (accion.equals("ModificarEstudiante")) {
            this.modificarEstudiante(request, response);
        } else if (accion.equals("RegistrarMateria")) {
            this.RegistrarMateria(request, response);
        }  else if (accion.equals("ConsultarMateria")) {
            this.ConsultarMateria(request, response);
        } else if (accion.equals("ModificarMateria")) {
            this.ModificarMateria(request, response);
        }else if (accion.equals("EliminarMateria")) {
            this.EliminarMateria(request, response);
        }else if (accion.equals("Asignar_materia_profesor")) {
            this.Asignar_materia_profesor(request, response);
        }else if (accion.equals("ConsultarMateriaProfesor")) {
            this.ConsultarMateriaProfesor(request, response);
        }else if (accion.equals("Asignar_materia_alumno")) {
            this.Asignar_materia_alumno(request, response);
        }else if (accion.equals("ConsultarMateriaEstudiante")) {
            this.ConsultarMateriaEstudiante(request, response);
        }
    }
    
    private void ConsultarMateriaEstudiante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          
           String buscar = request.getParameter("buscar");
           request.getSession().setAttribute("buscarMateriaEstudiante", buscar);
           response.sendRedirect("modulos/estudiante/listado_asignar_materia_estudiante.jsp");
    }
    
    private void Asignar_materia_alumno(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Estudiante et = new Estudiante();
        et.setCodigo(request.getParameter("cedula"));    
       // p.setNombre(request.getParameter("nombre")); 
        et.setNota(request.getParameter("nota")); 
        et.setMateria(request.getParameter("materia")); 
       // ProviderDB ets = new ProviderDB();
        //boolean rpta = ets.insertar_Materia_Alumno(et);
        et.asignarMateriaAlumno(et);
        response.sendRedirect("modulos/estudiante/asignar_materia_alumno.jsp?men=Se registro la materia al alumno de manera correcta");

    }
    
    private void ConsultarMateriaProfesor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          
           String buscar = request.getParameter("buscar");
           request.getSession().setAttribute("buscarMateriaProfesor", buscar);
           response.sendRedirect("modulos/profesor/listado_asignar_materia_profesor.jsp");
      }
    
    private void Asignar_materia_profesor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Profesor p = new Profesor();
        p.setCedula(request.getParameter("cedula"));    
       // p.setNombre(request.getParameter("nombre")); 
      //  p.setApellido(request.getParameter("apellido")); 
        p.setMateria(request.getParameter("materia")); 
        ProviderDB pro = new ProviderDB();
        boolean rpta = pro.insertar_Materia_Profesor(p);
        response.sendRedirect("modulos/profesor/listado_profesor.jsp?men=Se registro la materia al profesor de manera correcta");

    }
    
    
    private void EliminarMateria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Materia ma = new Materia();
        ma.setCodigo(request.getParameter("ced"));    
        ProviderDB mat = new ProviderDB();
        boolean rpta = mat.eliminarMateria(ma);
     
        response.sendRedirect(ma.pageEliminate() + "?men=Se elimino la materia de manera correcta");
    }
    private void ModificarMateria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Materia ma = new Materia();
        ma.setCodigo(request.getParameter("codigo"));    
        ma.setNombre(request.getParameter("nombre")); 
        ma.setDescripsion(request.getParameter("descripcion")); 
        ma.setN_creditos(request.getParameter("creditos"));
        ma.setInt_horario(request.getParameter("horario")); 
        ProviderDB mat = new ProviderDB();
        boolean rpta = mat.actualizaMateria(ma);
        response.sendRedirect("modulos/materia/crear_materia.jsp?men=Se modifico la materia de manera correcta");

    }
      private void ConsultarMateria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          
           String buscar = request.getParameter("buscar");
           request.getSession().setAttribute("buscarMateria", buscar);
           response.sendRedirect("modulos/materia/listado_materia.jsp");
      }
    private void RegistrarMateria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Materia ma = new Materia();
        ma.setCodigo(request.getParameter("codigo"));    
        ma.setNombre(request.getParameter("nombre")); 
        ma.setDescripsion(request.getParameter("descripcion")); 
        ma.setN_creditos(request.getParameter("creditos"));
        ma.setInt_horario(request.getParameter("horario")); 
        ProviderDB mat = new ProviderDB();
        boolean rpta = mat.insertarMateria(ma);
        response.sendRedirect("modulos/materia/crear_materia.jsp?men=Se registro la materia de manera correcta");

    }
    private void RegistrarEstudiante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Estudiante e = new Estudiante();
        e.setCodigo(request.getParameter("codigo"));    
        e.setNombre(request.getParameter("nombre")); 
        e.setApellido(request.getParameter("apellido")); 
        e.setTelefono(request.getParameter("telefono")); 
        ProviderDB est = new ProviderDB();
        boolean rpta = est.insertarEstudiante(e);
        response.sendRedirect("modulos/estudiante/crear_estudiante.jsp?men=Se registro el estudiante de manera correcta");

    }
    
    private void consultarEstudiante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          
           String buscar = request.getParameter("buscar");
           request.getSession().setAttribute("buscarEstudiante", buscar);
           response.sendRedirect("modulos/estudiante/listado_estudiante.jsp");
      }
    
     private void EliminarEstudiante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Estudiante e = new Estudiante();
       
        e.setCodigo(request.getParameter("ced"));    
       
        ProviderDB est = new ProviderDB();
        boolean rpta = est.eliminarEstudiante(e);
     
        response.sendRedirect(e.pageEliminate() + "?men=Se elimino el alumno de manera correcta");
    }
     
     private void modificarEstudiante(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Estudiante e = new Estudiante();
                //request.getParameter --> Sirve para obtener los valores de las cajas de texto
        e.setCodigo(request.getParameter("cedula"));    
        e.setNombre(request.getParameter("nombre")); 
        e.setApellido(request.getParameter("apellido")); 
        e.setTelefono(request.getParameter("telefono")); 
        ProviderDB est = new ProviderDB();
        boolean rpta = est.actualizaEstudiante(e);
        response.sendRedirect("modulos/estudiante/crear_estudiante.jsp?men=Se modifico el alumno de manera correcta");

    }
    
    //Metodo que sirve para registrar un producto 
    private void registrarProfesor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Profesor p = new Profesor();
        p.setCedula(request.getParameter("cedula"));    
        p.setNombre(request.getParameter("nombre")); 
        p.setApellido(request.getParameter("apellido")); 
        p.setTelefono(request.getParameter("telefono")); 
        ProviderDB pro = new ProviderDB();
        boolean rpta = pro.insertarProfesor(p);
        response.sendRedirect("modulos/profesor/crear_profesor.jsp?men=Se registro el profesor de manera correcta");

    }
    
      private void consultarProfesor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          
           String buscar = request.getParameter("buscar");
           request.getSession().setAttribute("buscarProfesor", buscar);
           response.sendRedirect("modulos/profesor/listado_profesor.jsp");
      }
      
      
       private void modificarProfesor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Profesor p = new Profesor();
                //request.getParameter --> Sirve para obtener los valores de las cajas de texto
        p.setCedula(request.getParameter("cedula"));    
        p.setNombre(request.getParameter("nombre")); 
        p.setApellido(request.getParameter("apellido")); 
        p.setTelefono(request.getParameter("telefono")); 
        ProviderDB pro = new ProviderDB();
        boolean rpta = pro.actualizaProfesor(p);
        response.sendRedirect("modulos/profesor/crear_profesor.jsp?men=Se modificoo el profesor de manera correcta");

    }
       
       private void EliminarProfesor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Profesor p = new Profesor();
       
        p.setCedula(request.getParameter("ced"));    
       
        ProviderDB pro = new ProviderDB();
        boolean rpta = pro.eliminarProfesor(p);
     
        response.sendRedirect("modulos/profesor/listado_profesor.jsp?men=Se elimino el profesor de manera correcta");
    }
}