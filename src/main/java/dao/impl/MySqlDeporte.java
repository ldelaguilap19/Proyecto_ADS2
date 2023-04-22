package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.DeporteDAO;
import entity.Deporte;
import util.MySqlDBConexion;

public class MySqlDeporte implements DeporteDAO{

	private static Logger log = Logger.getLogger(MySqlDeporte.class.getName());
	
	public List<Deporte> listaDeporte() {
		List<Deporte> lista = new ArrayList<Deporte>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select * from deporte";
			pstm = conn.prepareStatement(sql);
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Deporte obj = null;
			while(rs.next()) {
				obj = new Deporte();
				obj.setIdDeporte(rs.getInt(1));
				obj.setNombre(rs.getString(2));
				lista.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return lista;
	}
}
