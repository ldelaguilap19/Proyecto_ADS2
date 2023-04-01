<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>


<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />

<title>Intranet</title>
</head>
<body>
	<div class="container" style="margin-top: 5%">
		<h4>Registro Producto</h4>
	</div>

	<div class="container" style="margin-top: 1%">
		<form id="id_form" method="post">
			<div class="col-md-12" style="margin-top: 2%">
				<div class="row">

					<div class="form-group">
						<label class="control-label" for="id_nombre">Nombre</label> <input
							class="form-control" type="text" id="id_nombre" name="nombre"
							placeholder="Ingrese el nombre del producto" maxlength="40">

					</div>

					<div class="form-group">
						<label class="control-label" for="id_serie">serie</label> <input
							class="form-control" type="text" id="id_serie" name="serie"
							placeholder="Ingrese la serie del producto" maxlength="40">

					</div>

					<div class="form-group">
						<label class="control-label" for="id_precio">precio</label> <input
							class="form-control" type="text" id="id_precio" name="precio"
							placeholder="Ingrese el precio" maxlength="40">
					</div>

					<div class="form-group">
						<label class="control-label" for="id_stock">stock</label> <input
							class="form-control" type="text" id="id_stock" name="stock"
							placeholder="Ingrese el stock actual" maxlength="40">
					</div>

					<div class="form-group">
						<label class="control-label" for="id_marca">Marca</label> <select
							class="form-control" id="id_marca" name="marca.idMarca">
							<option value=" ">[Seleccione]</option>
						</select>
					</div>

					<div class="form-group">
						<label class="control-label" for="id_pais">Pais</label> <select
							class="form-control" id="id_pais" name="pais.idPais">
							<option value=" ">[Seleccione]</option>
						</select>
					</div>

				</div>
				<div class="row">
					<div class="form-group col-md-12" align="center">
						<button id="id_registrar" type="submit" class="btn btn-primary">Registra</button>
					</div>
				</div>
			</div>
		</form>

	</div>

	
	<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	nombre : {  
        		selector: "#id_nombre",
        		validators : {
        			notEmpty: {
                        message: 'El nombre es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'El nombre tiene de 3 a 30 caracteres'
                    },
        		}
        	},
        }   
    });

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#id_form').bootstrapValidator('validate');
    });
});
</script>
</body>
</html>