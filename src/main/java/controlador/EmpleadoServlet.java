package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.EmpleadoDAO;
import entity.Empleado;
import entity.Pais;
import entity.Respuesta;
import fabricas.Fabrica;

@WebServlet("/registraEmpleado")
public class EmpleadoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String vnombre = req.getParameter("nombre");
			String vfecha = req.getParameter("fecha");
			String vpais = req.getParameter("pais");

			Pais objPais = new Pais();
			objPais.setIdPais(Integer.parseInt(vpais));
			
			Empleado objEmpleado = new Empleado();
			objEmpleado.setNombres(vnombre);
			objEmpleado.setFechaNacimiento(Date.valueOf(vfecha));
			objEmpleado.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
			objEmpleado.setEstado(1);
			objEmpleado.setPais(objPais);
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			EmpleadoDAO dao = fabrica.getEmpleado();
		
			int insertados = dao.insertaEmpleado(objEmpleado);
			
			
			Respuesta objRespuesta = new Respuesta();
			if (insertados > 0) {
				objRespuesta.setMensaje("Registro exitoso");
			}else {
				objRespuesta.setMensaje("Error en el registro");
			}
			
			Gson gson = new Gson();
			String json = gson.toJson(objRespuesta);
			
			resp.setContentType("application/json;charset=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println(json);
	}

}
