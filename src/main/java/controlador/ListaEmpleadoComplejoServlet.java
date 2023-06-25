package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import dao.EmpleadoDAO;
import entity.Empleado;
import fabricas.Fabrica;

@WebServlet("/listaEmpleadoComplejo")

public class ListaEmpleadoComplejoServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nombre = req.getParameter("nombre");
		String pais = req.getParameter("pais");
		String estado = req.getParameter("estado");
		String fechaInicio = req.getParameter("fechaInicio");
		String fechaFin = req.getParameter("fechaFin");
		
		if (fechaInicio.equals("")) fechaInicio = "1900-01-01";
		if (fechaFin.equals(""))    fechaFin = "2900-01-01";
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EmpleadoDAO dao = fabrica.getEmpleado();
		
		List<Empleado> lista = dao.listaEmpleadoComplejo(nombre+"%", 
				Integer.parseInt(pais), 
				Integer.parseInt(estado),
				Date.valueOf(fechaInicio),
				Date.valueOf(fechaFin));
		
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

}
