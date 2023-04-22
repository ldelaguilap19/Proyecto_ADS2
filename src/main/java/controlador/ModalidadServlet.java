package controlador;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.ModalidadDAO;
import entity.Deporte;
import entity.Modalidad;
import entity.Respuesta;
import fabricas.Fabrica;

@WebServlet("/registraModalidad")
public class ModalidadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String vnombre = req.getParameter("nombre");
			String vnumHombres = req.getParameter("numHombres");
			String vnumMujeres = req.getParameter("numMujeres");
			String vedadMinima = req.getParameter("edadMinima");
			String vedadMaxima = req.getParameter("edadMaxima");
			String vsede = req.getParameter("sede");
			String vdeporte = req.getParameter("deporte");
			
			
			Deporte objDeporte = new Deporte();
			objDeporte.setIdDeporte(Integer.parseInt(vdeporte));
			
			Modalidad objModalidad = new Modalidad();
			objModalidad.setNombre(vnombre);
			objModalidad.setNumHombres(Integer.parseInt(vnumHombres));
			objModalidad.setNumMujeres(Integer.parseInt(vnumMujeres));
			objModalidad.setEdadMaxima(Integer.parseInt(vedadMaxima));
			objModalidad.setEdadMinima(Integer.parseInt(vedadMinima));
			objModalidad.setSede(vsede);
			objModalidad.setDeporte(objDeporte);
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			ModalidadDAO dao = fabrica.getModalidad();
		
			int insertados = dao.insertaModalidad(objModalidad);
			
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
