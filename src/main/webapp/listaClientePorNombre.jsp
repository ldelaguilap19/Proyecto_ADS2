<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />

<title>Lista Cliente</title>
</head>
<body>


	<div class="container">
		<h1>Lista Cliente por nombre</h1>


		<form action="registraAlumno" id="id_form">
			<input type="hidden" name="metodo" value="registra">
			<div class="form-group">
				<label class="control-label" for="id_filtro">Nombres</label> 
				<input	class="form-control" type="text" id="id_filtro" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtro</button>
			</div>
		</form>
		<div class="row">
			<table id="id_table" class="table">
				<thead>
					<tr>
						<th>Código</th>
						<th>Nombre</th>
						<th>DNI</th>
						<th>Categoría</th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>

		</div>
	</div>


	<script type="text/javascript">
		$("#id_btn_filtro").click(function() {
			var vfiltro = $("#id_filtro").val();
			$("#id_table").empty();
			$.getJSON("listaClientePorNombre", {"filtro":vfiltro}, function(data) {
				$.each(data, function(index, item){
					$("#id_table").append("<tr><td>" + item.idCliente +  "</td><td>" + item.nombre +  "</td><td>" + item.dni +  "</td><td>" + item.categoria.nombre +  "</td></tr>");	
				});
				
			});
		});
	</script>

</body>
</html>




