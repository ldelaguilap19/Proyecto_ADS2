<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Registra Modalidad</title>
</head>
<body>


<div class="container">
<h1>Registra Modalidad</h1>

	<form id="id_form"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_num_hombres"># Hombres</label>
				<input class="form-control" type="number" id="id_num_hombres" name="numHombres" min="1" max="10" value="1">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_num_mujeres"># Mujeres</label>
				<input class="form-control" type="number" id="id_num_mujeres" name="numMujeres" min="1" max="10" value="1">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_edad_minima">Edad Mínima</label>
				<input class="form-control" type="number" id="id_edad_minima" name="edadMinima" min="18" max="50" value="18">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_edad_maxima">Edad Máxima</label>
				<input class="form-control" type="number" id="id_edad_maxima" name="edadMaxima" min="18" max="50" value="18">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_sede">Sede</label>
				<input class="form-control" type="text" id="id_sede" name="sede" placeholder="Ingrese la sede">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_deporte"> Deporte </label> <select
					class="form-control" id="id_deporte" name="deporte">
					<option value=" ">[Seleccione]</option>
				</select>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" id="id_btn_registra">Crea Modalidad</button>
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
        
        fields:{
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
        	numHombres : {
        		selector: "#id_num_hombres",
        		validators : {
        			notEmpty: {
                        message: 'El número de hombres es requerido'
                    },
        		}
        	},
        	numMujeres : {
        		selector: "#id_num_mujeres",
        		validators : {
        			notEmpty: {
                        message: 'El número de mujeres es requerido'
                    },
        		}
        	},
        	edadMaxima : {
        		selector: "#id_edad_maxima",
        		validators : {
        			notEmpty: {
                        message: 'La edad máxima es requerido'
                    },
        		}
        	},
        	edadMinima : {
        		selector: "#id_edad_minima",
        		validators : {
        			notEmpty: {
                        message: 'La edad mínima es requerido'
                    },
        		}
        	},
        	sede : {  
        		selector: "#id_sede",
        		validators : {
        			notEmpty: {
                        message: 'La sede es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'La sede tiene de 3 a 30 caracteres'
                    },
        		}
        	},
        	deporte : {
        		selector: "#id_deporte",
        		validators : {
        			notEmpty: {
                        message: 'El deporte es requerido'
                    },
        		}
        	},        	
        }
  
    });

});
</script>


<script type="text/javascript">
	$("#id_btn_registra").click(function(){
		var validator = $('#id_form').data('bootstrapValidator');
	    validator.validate();
		
	    if (validator.isValid()) {
	        $.ajax({
	          type: "POST",
	          url: "registraModalidad", 
	          data: $('#id_form').serialize(),
	          success: function(data){
	        	  mostrarMensaje(data.mensaje);
	        	  limpiarFormulario();
	        	  validator.resetForm();
	          },
	          error: function(){
	        	  mostrarMensaje(MSG_ERROR);
	          }
	        });
	        
	    }
	});

	$.getJSON("cargaDeporte", {}, function (data){
		$.each(data, function(index, item){
			$("#id_deporte").append("<option value=" +  item.idDeporte +" >" +  item.nombre + "</option>");
		});	
	});		

	
	function limpiarFormulario(){	
		$('#id_nombre').val('');
		$('#id_num_hombres').val('1');
		$('#id_num_mujeres').val('1');
		$('#id_edad_maxima').val('18');
		$('#id_edad_minima').val('18');
		$('#id_sede').val('');
		$('#id_deporte').val(' ');
	}
</script>
	
</body>
</html>




