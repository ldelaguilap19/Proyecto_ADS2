package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Alumno;
import model.AlumnoModel;

@WebServlet("/registraAlumno")
public class AlumnoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String vnombre = req.getParameter("nombre");
			String vdni = req.getParameter("dni");
			String vfecha = req.getParameter("fecha");
			String vcorreo = req.getParameter("correo");
		
			Alumno obj = new Alumno();
			obj.setNombre(vnombre);
			obj.setDni(vdni);
			obj.setFechaNacimiento(Date.valueOf(vfecha));
			obj.setCorreo(vcorreo);
			
			AlumnoModel alumnoModel = new AlumnoModel();
			alumnoModel.insertaAlumno(obj);
			
			resp.sendRedirect("registraAlumno.jsp");
			
	}

}
