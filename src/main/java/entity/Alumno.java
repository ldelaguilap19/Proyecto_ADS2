package entity;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Alumno {
	
	private int idAlumno;
	private String nombre;
	private String dni;
	private String correo;
	private Date fechaNacimiento;
	

}
