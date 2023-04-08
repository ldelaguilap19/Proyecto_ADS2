package entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Cliente {

	private int idCliente;
	private String nombre;
	private String dni;
	private Categoria categoria;

	
}
