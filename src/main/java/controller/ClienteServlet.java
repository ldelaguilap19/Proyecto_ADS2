package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import entity.Categoria;
import entity.Cliente;
import entity.Respuesta;
import model.ClienteModel;

@WebServlet("/registraCliente")
public class ClienteServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String vnombre = req.getParameter("nombre");
		String vdni = req.getParameter("dni");
		String vcategoria = req.getParameter("categoria");
		
		Categoria objCategoria = new Categoria();
		objCategoria.setIdCategoria(Integer.parseInt(vcategoria));
		
		Cliente objCliente = new Cliente();
		objCliente.setNombre(vnombre);
		objCliente.setDni(vdni);
		objCliente.setCategoria(objCategoria);
		
		ClienteModel clienteModel = new ClienteModel();
		int s = clienteModel.insertaCliente(objCliente);
		Respuesta objRespuesta = new Respuesta(); 
		
		if (s > 0) {
			objRespuesta.setMensaje("Registro exitoso");
		}else {
			objRespuesta.setMensaje("Error al registrar");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);

		resp.setContentType("application/json;charset=UTF-8");

		PrintWriter	 out = resp.getWriter();
		out.println(json);
		
		
	}

}
