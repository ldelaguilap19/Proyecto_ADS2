package dao;

import java.sql.Date;
import java.util.List;

import entity.Empleado;

public interface EmpleadoDAO {
	//consulta
	public abstract List<Empleado> listaPorFecha(Date fecInicio, Date fecFin);
	public abstract List<Empleado> listaEmpleadoComplejo(String nombre, int idPais, int estado,Date fecInicio, Date fecFin);
	
	//crud
	public abstract int insertaEmpleado(Empleado obj);
	public abstract List<Empleado> listaEmpleado(String filtro);
	public abstract int actualizaEmpleado(Empleado obj);
	public abstract int eliminaEmpleado(int idEmpleado);
	public abstract Empleado buscaEmpleado(int idEmpleado);
	
}
