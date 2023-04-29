package dao;

import java.sql.Date;
import java.util.List;

import entity.Empleado;

public interface EmpleadoDAO {

	public abstract int insertaEmpleado(Empleado obj);
	public abstract List<Empleado> listaPorFecha(Date fecInicio, Date fecFin);
	
}
