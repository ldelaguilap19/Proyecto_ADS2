package entity;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Empleado {

	private int idEmpleado;
	private String nombres;
	private Date fechaNacimiento;
	private int estado;
	private Timestamp fechaRegistro;
	private Pais pais;
	private String formateadoFecNac;
	
	
	
	
}
