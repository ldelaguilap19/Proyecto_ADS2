package entity;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Proveedor {

	private int idProveedor;
	private String nombre;
	private String dni;
	private Timestamp fechaRegistro;
	private Tipo tipo;
	
}
