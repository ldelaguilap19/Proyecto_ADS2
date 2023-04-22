package entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Modalidad {

	private int idModalidad;
	private String nombre;
	private int numHombres;
	private int numMujeres;
	private int edadMinima;
	private int edadMaxima;
	private String sede;
	private Deporte deporte;
	
}
