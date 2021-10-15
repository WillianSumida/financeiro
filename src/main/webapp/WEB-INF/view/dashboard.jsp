
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Financeiro</title>

<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Hind:400,700"
	rel="stylesheet">

<!--Icons-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<a class="navbar-brand">Seja bem vindo (a), ${sessionScope.usuario.login}</a>
	     <span class="navbar-text ml-auto">
	       <div class="align-items-center">
           		<a href=logout><span class='material-icons'>exit_to_app</span></a>
           </div>
           
         </span>
	</nav>
	
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#insertLancamento">
	  Inserir
	</button>
	
	
	<button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#listarLancamentoTipo">
	  Listar tipo
	</button>
	
	<a href="dashboard"><button type="button" class="btn btn-primary">
	  ver tudo
	</button>
	</a>
	
	<div class="modal fade" id="insertLancamento" tabindex="-1" role="dialog" aria-labelledby="insertLancamento" aria-hidden="true">
   		<div class="modal-dialog" role="document">
	         <div class="modal-content">
	             <div class="modal-header">
	                 <h5 class="modal-title" id="inserirLancamento">Cadastrar Lancamento</h5>
	                 <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	                 <span aria-hidden="true">&times;</span>
	                 </button>
	             </div>
	             <div class="modal-body">
	                 <!--Form Animal -->
	                 <form class="signup" method=post action=cadastrarLancamento>
	                     <div class="form-group">
	                         <label for="id">Id</label>
	                         <input type="number" class="form-control" id="id" name="id" placeholder="Id">
	                     </div>
	                     <div class="form-group">
	                         <label for="tipo">Tipo</label>
	                         <input type="text" class="form-control" id="tipo" name="tipo" placeholder="tipo">
	                     </div>
	                     <div class="form-group">
	                         <label for="valor">Valor</label>
	                         <input type="text" class="form-control" id="valor" name="valor" placeholder="valor">
	                     </div>
	                     <div class="form-group">
	                         <label for="data">data</label>
	                         <input type="text" class="form-control" id="data" name="data" placeholder="data">
	                     </div>
	                     <div class="form-group">
	                         <label for="observacao">observacao</label>
	                         <input type="text" class="form-control" id="observacao" name="observacao" placeholder="observacao">
	                     </div>
	
	             </div>
	             <div class="modal-footer">
	                     <button type="reset" id="Cancelar" class="btn btn-secondary">Limpar</button>
	                     <button type="submit" class="btn btn-primary">Cadastrar lancamento</button>
	                 </form>
	             </div>
	         </div>
           </div>
         </div>
         
         
         <!-- MODAL LISTAR TIPO LANCAMENTO -->
         <div class="modal fade" id="listarLancamentoTipo" tabindex="-1" role="dialog" aria-labelledby="listarLancamentoTipo" aria-hidden="true">
   		<div class="modal-dialog" role="document">
	         <div class="modal-content">
	             <div class="modal-header">
	                 <h5 class="modal-title" id="listarTipoLancamento">Listar tipo lancamento</h5>
	                 <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	                 <span aria-hidden="true">&times;</span>
	                 </button>
	             </div>
	             <div class="modal-body">
	                 <!--Form Animal -->
	                 <form class="signup" method=post action=listarLancamento>
	                     <div class="form-group">
	                         <label for="tipo">Tipo</label>
	                         <input type="text" class="form-control" id="tipo" name="tipo" placeholder="tipo">
	                     </div>	
	             </div>
	             <div class="modal-footer">
	                     <button type="reset" id="Cancelar" class="btn btn-secondary">Limpar</button>
	                     <button type="submit" class="btn btn-primary">Listar tipo lancamento</button>
	                 </form>
	             </div>
	         </div>
           </div>
         </div>
         
         
         
        <div class="container text-center">
		<br><h1>Lancamentos</h1>
		<div class="row justify-content-center">
    		<div class="col-auto">
				<table class="table table-striped table-responsive">
					<thead>
						<tr>
							<th class="text-center" scope="col" colspan="6">Lancamentos</th>
						</tr>
						<tr>
		                	<th scope="col">Id</th>
							<th scope="col">Tipo</th>
							<th scope="col">Valor</th>
							<th scope="col">Data</th>
							<th scope="col">Observacao</th>
							<th scope="col">Excluir</th>
		                </tr>
					</thead>
					<tbody>
						<c:forEach var="lancamento" items="${lancamentos}">
							<tr>
							<th class='align-middle' scope='row'>${lancamento.id}</th>
							<td class='align-middle'>${lancamento.tipo}</td>
							<td class='align-middle'>${lancamento.valor}</td>
							<td class='align-middle'>${lancamento.data}</td>
							<td class='align-middle'>${lancamento.observacao}</td>
							<td class='align-middle'><a href=excluirLancamento?lancamento=${lancamento.id}><button type='button' class='btn btn-default'><span class='material-icons'>clear</span></button></td></a>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
	</div>
	
	
	
	
	
</body>
</html>