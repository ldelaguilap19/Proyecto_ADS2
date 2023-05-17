package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;

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

@WebServlet("/crudEmpleado")
public class CrudEmpleadoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(CrudEmpleadoServlet.class.getName());


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">>> crudEmpleado >>> service");
		String vmetodo = req.getParameter("metodo");
		switch (vmetodo) {
		case "lista":
			lista(req, resp);
			break;
		case "inserta":
			inserta(req, resp);
			break;
		case "actualiza":
			actualiza(req, resp);
			break;
		case "eLogica":
			eliminacionLogica(req, resp);
			break;
		case "eFisica":
			eliminacionFisica(req, resp);
			break;
		}
	}
	protected void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">>> crudEmpleado >>> lista");
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EmpleadoDAO dao = fabrica.getEmpleado();
		
		String filtro = req.getParameter("filtro");
		List<Empleado> lista = dao.listaEmpleado(filtro + "%");
		
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		resp.setContentType("application/json;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		out.println(json);
	}
	
	protected void actualiza(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">>> crudEmpleado >>> actualiza");
		
		String vidEmpleado = req.getParameter("idEmpleado");
		String vnombre = req.getParameter("nombre");
		String vfecha = req.getParameter("fechaNacimiento");
		String vpais = req.getParameter("pais");
		String vestado = req.getParameter("estado");
		
		Pais objPais = new Pais();
		objPais.setIdPais(Integer.parseInt(vpais));
		
		Empleado objEmpleado = new Empleado();
		objEmpleado.setIdEmpleado(Integer.parseInt(vidEmpleado));
		objEmpleado.setNombres(vnombre);
		objEmpleado.setFechaNacimiento(Date.valueOf(vfecha));
		objEmpleado.setPais(objPais);
		objEmpleado.setEstado(Integer.parseInt(vestado));
		objEmpleado.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EmpleadoDAO dao = fabrica.getEmpleado();
	
		int insertados = dao.actualizaEmpleado(objEmpleado);
		List<Empleado> lista = dao.listaEmpleado("%");
		
		Respuesta objRespuesta = new Respuesta();
		if (insertados > 0) {
			objRespuesta.setMensaje("Actualización exitosa");
		}else {
			objRespuesta.setMensaje("Error al actualizar");
		}
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);
	}
	
	protected void inserta(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">>> crudEmpleado >>> inserta");
		
		String vnombre = req.getParameter("nombre");
		String vfecha = req.getParameter("fechaNacimiento");
		String vpais = req.getParameter("pais");

		Pais objPais = new Pais();
		objPais.setIdPais(Integer.parseInt(vpais));
		
		Empleado objEmpleado = new Empleado();
		objEmpleado.setNombres(vnombre);
		objEmpleado.setFechaNacimiento(Date.valueOf(vfecha));
		objEmpleado.setPais(objPais);
		objEmpleado.setEstado(1);
		objEmpleado.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EmpleadoDAO dao = fabrica.getEmpleado();
	
		int insertados = dao.insertaEmpleado(objEmpleado);
		List<Empleado> lista = dao.listaEmpleado("%");
		
		Respuesta objRespuesta = new Respuesta();
		if (insertados > 0) {
			objRespuesta.setMensaje("Registro exitoso");
		}else {
			objRespuesta.setMensaje("Error en el registro");
		}
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
	}
	protected void eliminacionLogica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">>> crudEmpleado >>> eliminacionLogica");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EmpleadoDAO dao = fabrica.getEmpleado();
	
		String idEmpleado = req.getParameter("idEmpleado");
		
		Empleado objEmpleado = dao.buscaEmpleado(Integer.parseInt(idEmpleado));
		int estadoNuevo = objEmpleado.getEstado() == 0 ? 1 : 0;
		objEmpleado.setEstado(estadoNuevo);
		
		dao.actualizaEmpleado(objEmpleado);
		List<Empleado> lista = dao.listaEmpleado("%");
		
		Respuesta objRespuesta = new Respuesta();
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
	}
	protected void eliminacionFisica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.info(">>> crudEmpleado >>> eliminacionFisica");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EmpleadoDAO dao = fabrica.getEmpleado();
	
		String idEmpleado = req.getParameter("idEmpleado");
		
		int eliminados = dao.eliminaEmpleado(Integer.parseInt(idEmpleado));
		List<Empleado> lista = dao.listaEmpleado("%");
		
		Respuesta objRespuesta = new Respuesta();
		if (eliminados > 0) {
			objRespuesta.setMensaje("Eliminación exitosa");
		}else {
			objRespuesta.setMensaje("Error al eliminar");
		}
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
	}
	
}
