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

<title>Lista Empleado</title>
</head>
<body>


	<div class="container">
		<h1>Lista Empleado</h1>
		<div class="row" style="margin-top: 5%">
			<div class="col-md-4">
				<label class="control-label" for="id_nombre">Nombre</label>
			</div>
			<div class="col-md-5">
				<input class="form-control" type="text" id="id_nombre" >
			</div>
		</div>
		
		<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
				<label class="control-label" for="id_pais">Pa�s</label>
			</div>
			<div class="col-md-5">
				<select class="form-control" id="id_pais">
					<option value="-1">[Seleccione]</option>
				</select>
			</div>
		</div>
		<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
				<label class="control-label" for="id_estado">Estado</label>
			</div>
			<div class="col-md-5">
				<input type="checkbox" class="custom-control-input" id="id_estado" checked="checked" />
			</div>
		</div>
		<div class="row" style="margin-top: 1%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Fecha Nacimiento</label> 
			</div>	
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<input	class="form-control" type="date" id="id_fecha_inicio">
			</div>
			<div class="col-md-1"></div>	
			<div class="col-md-2">
				<input	class="form-control" type="date" id="id_fecha_fin">
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtro</button>
			</div>	
		</div>


		<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#337ab7; color:white'>
					<tr>
						<th>C�digo</th>
						<th>Nombres</th>
						<th>Fecha Nacimiento</th>
						<th>Fecha Registro</th>
						<th>Estado</th>
						<th>Pa�s</th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>

		</div>
	</div>


	<script type="text/javascript">
	
	$.getJSON("cargaPais", {}, function (data){
		$.each(data, function(index, item){
			$("#id_pais").append("<option value=" +  item.idPais +" >" +  item.nombre+ "</option>");
						
		});	
	});	
	
		$("#id_btn_filtro").click(function() {
			var vnombre = $("#id_nombre").val();
			var vpais = $("#id_pais").val();
			var vestado = $("#id_estado").is(':checked') ? 1 : 0 ;
			var vfecIni = $("#id_fecha_inicio").val();
			var vfecFin = $("#id_fecha_fin").val();
			
			console.log(">> vnombre >>" + vnombre);
			console.log(">> vpais >>" + vpais);
			console.log(">> vestado >>" + vestado);
			console.log(">> vfecIni >> " + vfecIni);
			console.log(">> vfecFin >> " + vfecFin);
			
			$.getJSON("listaRevistaComplejo", {"nombre":vnombre,"pais":vpais, "estado": vestado, "fechaInicio":vfecIni, "fechaFin":vfecFin}, function(data) {
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
						{data: "idEmpleado",className:'text-center'},
						{data: "nombres",className:'text-center'},
						{data: "formateadoFecNac",className:'text-center'},
						{data: "fechaRegistro",className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "pais.nombre",className:'text-center'},
					]                                     
			    });
		}
	</script>

</body>
</html>




