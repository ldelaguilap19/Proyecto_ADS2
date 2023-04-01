package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Jugador;
import model.JugadorModel;

@WebServlet("/registraJugador")
public class JugadorServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String vnombre = req.getParameter("nombre");
			String valias = req.getParameter("alias");
			String vpais = req.getParameter("pais");
			String vjuego = req.getParameter("juego");
			String vexperiencia = req.getParameter("experiencia");
			
			Jugador obj = new Jugador();
			obj.setNombre(vnombre);
			obj.setAlias(valias);
			obj.setPais(vpais);
			obj.setJuego(vjuego);
			obj.setExperiencia(Integer.parseInt(vexperiencia));
				
			JugadorModel alumnoModel = new JugadorModel();
			alumnoModel.insertaJugador(obj);
			
			resp.sendRedirect("registraJugador.jsp");
			
	}

}
