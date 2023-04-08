package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Logger;

import entity.Cliente;
import util.MySqlDBConexion;

public class ClienteModel {


	private static Logger log = Logger.getLogger(ClienteModel.class.getName());
	
	public int insertaCliente(Cliente  obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into Cliente values(null,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setString(2, obj.getDni());
			pstm.setInt(3, obj.getCategoria().getIdCategoria());
			
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
