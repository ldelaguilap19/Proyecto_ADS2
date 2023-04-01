package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Logger;
import entidad.Jugador;
import util.MySqlDBConexion;

public class JugadorModel {


	private static Logger log = Logger.getLogger(JugadorModel.class.getName());
	
	public int insertaJugador(Jugador obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into jugador values(null,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setString(2, obj.getAlias());
			pstm.setString(3, obj.getPais());
			pstm.setString(4, obj.getJuego());
			pstm.setInt(5, obj.getExperiencia());
			
			log.info(">>>> " + pstm);

			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return salida;
	}
	
}
