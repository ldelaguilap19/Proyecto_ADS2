package dao;

import java.util.List;

import entity.Cliente;

public interface ClienteDAO {

	public abstract int insertaCliente(Cliente obj);
	public abstract List<Cliente> listaCliente(String filtro);
	
}
