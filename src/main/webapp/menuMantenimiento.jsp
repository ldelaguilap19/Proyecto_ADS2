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

<title>MENÚ</title>
</head>
<body>


	<div class="container">
		<h1>MENÚ</h1>

		<div class="row" style="margin-top: 5%">
			
			<div class="col-md-1"  style="width: 60%">
				<button type="button" class="btn btn-primary"  data-toggle='modal' data-target="#id_div_modal_registra" >REGISTRAR REQUERIMIENTO (MOD. DEL PAC)</button>
			</div>	
			<div class="col-md-1"  style="width: 60%">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">BUZÓN DE TRÁMITES</button>
			</div>	
			<div class="col-md-1"  style="width: 60%">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">CONSULTA DE TRÁMITE DOCUMENTARIO</button>
			</div>	
		</div>



		
		<!-- INICIO MODAL DE REGISTRO -->
		<div class="modal fade" id="id_div_modal_registra">
			<div class="modal-dialog" style="width: 60%" style="heigth:80%"  >
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span>REGISTRAR REQUERIMIENTO (MOD. DEL PAC)</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_registra">
			                   			<input type="hidden" name="metodo" value="inserta">
			                   			<div class="panel-body">
			                   			<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_categoria">Tipo de documento</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_reg_categoria" name="categoria">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">N° de Expediente</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Asunto</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">N° de Folios</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Área usuaria</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>  
		                                      <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre de Responsable</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>	
		                                      <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Cargo de Responsable</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                      </div>	
		                                     <label class="col-lg-3 control-label" for="id_reg_categoria">Derivar a (Dependencia)</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_reg_categoria" name="categoria">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
												 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_registra" class="btn btn-primary btn-sm">Registra</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_reg_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancela</button>
		                                        </div>
		                                    </div>   
			                             </div>
			                             </form>
			                        </div>
			                   </div>
			              </div>
					</div>
				</div>
			</div>
		</div>	 
		<!-- FIN MODAL DE REGISTRO -->
		
		<!-- INICIO MODAL DE ACTUALIZA -->
		<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza de Cliente</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="actualiza">
			                   			<input type="hidden" name="idCliente" id="idCliente">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_nombre">Nombre</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_dni">DNI</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_dni" name="dni" placeholder="Ingrese el DNI" type="text" maxlength="8"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_estado" name="estado">
														<option value=" ">[Seleccione]</option>
														<option value="1">Activo</option>
														<option value="0">Inactivo</option>
													</select>
		                                        </div>
		                                    </div> 	 
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_categoria">Categoría</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_categoria" name="categoria">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_actualiza" class="btn btn-primary btn-sm">Actualiza</button>
		                                        	
		                                        	<button type="button" style="width: 80px" id="id_btn_act_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancela</button>
		                                        	
		                                  
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-12" align="right">
		                                    	<button type="button" style="width: 80px" id="id_btn_actualiza" class="btn btn-primary btn-sm">Seleccionar archivo</button>
		                                    </div>
		                                       
			                             </div>
			                             </form>
			                        </div>
			                   </div>
			              </div>
					</div>
				</div>
			</div>
		</div>	
		<!-- FIN MODAL DE ACTUALIZA -->
		
	</div>


	<script type="text/javascript">
		$("#id_btn_filtro").click(function() {
			var vfiltro = $("#id_filtro").val();
			$.getJSON("crudCliente", {"metodo":"lista","filtro":vfiltro}, function(data) {
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
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "categoria.nombre",className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-info btn-sm" onClick="verFormularioActualiza(\'' + row.idCliente + '\',\'' +  row.nombre   + '\',\'' +  row.dni + '\',\'' +  row.estado + '\',\'' +  row.categoria.idCategoria +'\');">Editar</button>';  
						},className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-warning btn-sm" onClick="eliminacionLogica(\'' + row.idCliente +'\');" >E.Lógica</button>';
						},className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-danger btn-sm"  onClick="eliminacionFisica(\'' + row.idCliente +'\');" >E.Física</button>';
						},className:'text-center'},
					]                                     
			    });
		}
		
		function verFormularioActualiza(idCliente, nombre, dni, estado, categoria){
			console.log(">> verFormularioActualiza >> " + idCliente);
			$("#id_div_modal_actualiza").modal("show");
			$("#idCliente").val(idCliente);
			$("#id_act_nombre").val(nombre);
			$("#id_act_dni").val(dni);
			$("#id_act_estado").val(estado);
			$("#id_act_categoria").val(categoria);
		}
		
		$.getJSON("cargaCategoria",{}, function (data){
			$.each(data, function(index, item){
				$("#id_reg_categoria").append("<option value='"+ item.idCategoria +"'>"+ item.nombre+"</option>");
				$("#id_act_categoria").append("<option value='"+ item.idCategoria +"'>"+ item.nombre+"</option>");
			})
		});
		
		function eliminacionFisica(idCliente){	
			var array = [idCliente];
			mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica,null,array);
		}

		function accionEliminacionFisica(array){
			 $.ajax({
		          type: "POST",
		          url: "crudCliente", 
		          data: {"metodo":"eFisica", "idCliente":array[0]},
		          success: function(data){
		        	  mostrarMensaje(data.mensaje);
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		}
		
		$("#id_btn_registra").click(function() {
			var validator = $('#id_form_registra').data('bootstrapValidator');
		    validator.validate();
			
		    if (validator.isValid()) {
		        $.ajax({
			          type: "POST",
			          url: "crudCliente", 
			          data: $('#id_form_registra').serialize(),
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
			        	  agregarGrilla(data.datos);
			        	  validator.resetForm();
			        	  $('#id_div_modal_registra').modal("hide");
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
			    });
		    }
		});
		
		$("#id_btn_actualiza").click(function() {
			var validator = $('#id_form_actualiza').data('bootstrapValidator');
		    validator.validate();
			
		    if (validator.isValid()) {
		        $.ajax({
			          type: "POST",
			          url: "crudCliente", 
			          data: $('#id_form_actualiza').serialize(),
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
			        	  agregarGrilla(data.datos);
			        	  validator.resetForm();
			        	  $('#id_div_modal_actualiza').modal("hide");
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
			    });
		    }
		});
		
		
		function eliminacionLogica(idCliente){
			 $.ajax({
		          type: "POST",
		          url: "crudCliente", 
		          data: {"metodo":"eLogica", "idCliente":idCliente},
		          success: function(data){
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		}
		
		$(document).ready(function() {
		    $('#id_form_registra').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields:{
		        	nombre : {  
		        		selector: "#id_reg_nombre",
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
		        	dni : {
		        		selector: "#id_reg_dni",
		        		validators : {
		        			notEmpty: {
		                        message: 'El dni es requerido'
		                    },
		                    regexp: {
		                        regexp: /^[0-9]{8}$/,
		                        message: 'El dni tiene 8 dígitos'
		                    },
		        		}
		        	},
		        	categoria : {
		        		selector: "#id_reg_categoria",
		        		validators : {
		        			notEmpty: {
		                        message: 'La categoría es requerida'
		                    },
		        		}
		        	},        	
		        }
		    });
		});
		
		$(document).ready(function() {
		    $('#id_form_actualiza').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields:{
		        	nombre : {  
		        		selector: "#id_act_nombre",
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
		        	dni : {
		        		selector: "#id_act_dni",
		        		validators : {
		        			notEmpty: {
		                        message: 'El dni es requerido'
		                    },
		                    regexp: {
		                        regexp: /^[0-9]{8}$/,
		                        message: 'El dni tiene 8 dígitos'
		                    },
		        		}
		        	},
		        	estado : {
		        		selector: "#id_act_estado",
		        		validators : {
		        			notEmpty: {
		                        message: 'El estado es requerido'
		                    },
		        		}
		        	},     
		        	categoria : {
		        		selector: "#id_act_categoria",
		        		validators : {
		        			notEmpty: {
		                        message: 'La categoría es requerida'
		                    },
		        		}
		        	},        	
		        }
		    });
		});		
		
		function limpiarFormulario(){	
			$('#id_reg_nombre').val("");
			$('#id_reg_dni').val("");
			$('#id_reg_categoria').val(" ");
			$('#id_act_nombre').val("");
			$('#id_act_dni').val("");
			$('#id_act_categoria').val(" ");
			$('#id_act_estado').val(" ");
		}
	</script>

</body>
</html>




