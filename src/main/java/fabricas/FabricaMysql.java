package fabricas;

import dao.CategoriaDAO;
import dao.ClienteDAO;
import dao.impl.MySqlCategoriaDAO;
import dao.impl.MySqlClienteDAO;

public class FabricaMysql extends Fabrica {

	@Override
	public CategoriaDAO getCategoria() {
		return new MySqlCategoriaDAO();
	}

	@Override
	public ClienteDAO getCliente() {
		return new MySqlClienteDAO();
	}

	
}
