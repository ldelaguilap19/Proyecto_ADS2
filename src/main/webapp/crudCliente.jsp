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

<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>

<title>CRUD Cliente</title>
</head>
<body>


	<div class="container">
		<h1>CRUD Cliente</h1>

		<div class="row" style="margin-top: 5%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Nombres</label> 
			</div>	
			<div class="col-md-6">
				<input	class="form-control" type="text" id="id_filtro" placeholder="Ingrese el nombre">
			</div>	
			<div class="col-md-3">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtro</button>
			</div>	
		</div>


		<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#337ab7; color:white'>
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
			$.getJSON("listaClientePorNombre", {"filtro":vfiltro}, function(data) {
				agregarGrilla(data);
			});
		});
		
		function agregarGrilla(lista){
			 $('#id_table').DataTable().clear();
			 $('#id_table').DataTable().destroy();
			 $('#id_table').DataTable({
					data: lista,
					language: IDIOMA,
					searching: true,
					ordering: true,
					processing: true,
					pageLength: 10,
					lengthChange: false,
					info:true,
					scrollY: 305,
			        scroller: {
			            loadingIndicator: true
			        },
					columns:[
						{data: "idCliente",className:'text-center'},
						{data: "nombre",className:'text-center'},
						{data: "dni",className:'text-center'},
						{data: "categoria.nombre",className:'text-center'},
					]                                     
			    });
		}
	</script>

</body>
</html>




