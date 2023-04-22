package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Logger;

import dao.ModalidadDAO;
import entity.Modalidad;
import util.MySqlDBConexion;

public class MySqlModalidaDAO implements ModalidadDAO{


	private static Logger log = Logger.getLogger(MySqlModalidaDAO.class.getName());
	
	public int insertaModalidad(Modalidad  obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into modalidad values(null,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setInt(2, obj.getNumHombres());
			pstm.setInt(3, obj.getNumMujeres());
			pstm.setInt(4, obj.getEdadMaxima());
			pstm.setInt(5, obj.getEdadMinima());
			pstm.setString(6, obj.getSede());
			pstm.setInt(7, obj.getDeporte().getIdDeporte());
			
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
