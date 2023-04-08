<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>


<title>Carga Combo</title>
</head>
<body>
	<div class="container">
		<h1>Carga Combo</h1>

		<form id="idForm" action="">
			<div class="form-group">
				<label class="control-label" for="id_categoria"> Categoría </label> 
				<select	class="form-control" id="id_categoria" name="">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		$.getJSON("cargaCategoria", {}, function (data){
			$.each(data, function(index, item){
				$("#id_categoria").append("<option value=" +  item.idCategoria +" >" +  item.nombre+ "</option>");
			});	
		});			
	</script>



</body>
</html>









