package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.CategoriaDAO;
import entity.Categoria;
import util.MySqlDBConexion;

public class MySqlCategoriaDAO implements CategoriaDAO{

	private static Logger log = Logger.getLogger(MySqlCategoriaDAO.class.getName());
	
	public List<Categoria> listaCategoria() {
		List<Categoria> lista = new ArrayList<Categoria>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select * from categoria";
			pstm = conn.prepareStatement(sql);
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Categoria obj = null;
			while(rs.next()) {
				obj = new Categoria();
				obj.setIdCategoria(rs.getInt(1));
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
