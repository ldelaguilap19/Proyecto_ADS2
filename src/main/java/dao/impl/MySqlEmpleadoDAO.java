package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Logger;

import dao.EmpleadoDAO;
import entity.Empleado;
import util.MySqlDBConexion;

public class MySqlEmpleadoDAO implements EmpleadoDAO{


	private static Logger log = Logger.getLogger(MySqlEmpleadoDAO.class.getName());
	
	public int insertaEmpleado(Empleado  obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into empleado values(null,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombres());
			pstm.setDate(2, obj.getFechaNacimiento());
			pstm.setInt(3, obj.getEstado());
			pstm.setTimestamp(4, obj.getFechaRegistro());
			pstm.setInt(5, obj.getPais().getIdPais());
			
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
