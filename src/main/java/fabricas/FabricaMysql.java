package fabricas;

import dao.CategoriaDAO;
import dao.ClienteDAO;
import dao.EmpleadoDAO;
import dao.PaisDAO;
import dao.ProveedorDAO;
import dao.TipoDAO;
import dao.impl.MySqlCategoriaDAO;
import dao.impl.MySqlClienteDAO;
import dao.impl.MySqlEmpleadoDAO;
import dao.impl.MySqlPaisDAO;
import dao.impl.MySqlProveedorDAO;
import dao.impl.MySqlTipoDAO;

public class FabricaMysql extends Fabrica {

	@Override
	public CategoriaDAO getCategoria() {
		return new MySqlCategoriaDAO();
	}

	@Override
	public ClienteDAO getCliente() {
		return new MySqlClienteDAO();
	}

	@Override
	public TipoDAO getTipo() {
		return new MySqlTipoDAO();
	}

	@Override
	public ProveedorDAO getProveedor() {
		return new MySqlProveedorDAO();
	}

	@Override
	public PaisDAO getPais() {
		return new MySqlPaisDAO();
	}

	@Override
	public EmpleadoDAO getEmpleado() {
		return new MySqlEmpleadoDAO();
	}

	
}
