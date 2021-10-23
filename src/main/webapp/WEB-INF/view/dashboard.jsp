
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CashFlow</title>

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

<c:if test="${status}">
	<script>swal("Falha ao entrar", "Login ou senha incorretos", "warning");</script>
</c:if>




	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<a class="navbar-brand">Seja bem vindo (a), ${login}</a>
	     <span class="navbar-text ml-auto">
	       <div class="align-items-center">
           		<a href=logout><span class='material-icons'>exit_to_app</span></a>
           </div>
           
         </span>
	</nav>
	
	
	<div class="container">
		<div class="row justify-content-center mt-5">
			<button type="submit" class="btn btn-primary mr-5" data-toggle="modal" data-target="#listarLancamentoTipo">
			  LISTAR TIPO
			</button>
			
			<a href="dashboard"><button type="button" class="btn btn-primary mr-5">
			  VER TUDO
			</button>
			</a>
			
			<button type="submit" class="btn btn-primary mr-5" data-toggle="modal" data-target="#listarLancamentoData">
			  LISTAR DATA
			</button>
		</div>
	
	
	
  		<div class="row">	
			<!-- VALOR TOTAL DA EXIBIICAO ATUAL -->
			<div class="col-sm d-flex align-items-center justify-content-center">
			
			<div class="col-sm">
				<div class="container text-center mt-5-4">
					<br><h2>Gastos</h2>
					<div class="row justify-content-center">
					<h3>Gasto total: R$ ${total}</h3>
					</div>
				</div>
			</div>
  		
  		
  		
  		
  		
  		
  			<div class="col-sm">
		         <!-- CONTAINER CENTRAL DA TABLE -->
		        <div class="container text-center">
				<br><h1>Lancamentos</h1>
				<div class="row justify-content-center">
		    		<div class="col-auto">
		    			<button type="button"class="btn btn-success col-md-12" data-toggle="modal" data-target="#insertLancamento">
						  Novo Lancamento
						</button>
						<table class="table table-striped table-responsive">
							<thead>
								 <!--  <tr>
									<th class="text-center" scope="col" colspan="6">Lancamentos</th>
								</tr> 
								<tr>-->
				                	<th scope="col"></th>
									<th scope="col">Tipo</th>
									<th scope="col">Valor</th>
									<th scope="col">Data</th>
									<th scope="col">Observacao</th>
									<th scope="col">Excluir</th>
									<th scope="col">Alterar</th>
				                </tr>
							</thead>
							<tbody>
								<c:forEach var="lancamento" items="${lancamentos}" varStatus="contador">
									<tr>
									<th class='align-middle' scope='row'>${contador.count}</th>
									<td class='align-middle'>${lancamento.tipo}</td>
									<td class='align-middle'>${lancamento.valor}</td>
									<td class='align-middle'>${lancamento.data}</td>
									<td class='align-middle'>${lancamento.observacao}</td>
									<td class='align-middle'><button type='button'
										class='btn btn-default' data-toggle='modal'
										data-target='#lancamentoDelete${lancamento.id}'>
										<span class='material-icons'>clear</span>
									</button></td>
									<td class='align-middle'><button type='button'
										class='btn btn-default' data-toggle='modal'
										data-target='#lancamentoUpdate${lancamento.id}'>
										<span class='material-icons'>settings</span>
									</button></td>
									</tr>
									
									
									
								 <!-- MODAL EXCLUIR LANCAMENTO -->
									<div class="modal fade" id="lancamentoDelete${lancamento.id}" tabindex="-1" role="dialog" aria-labelledby="deleteLancamento" aria-hidden="true">
								   		<div class="modal-dialog" role="document">
									         <div class="modal-content">
									             <div class="modal-header">
									                 <h5 class="modal-title" id="deleteLancamento">Excluir Lancamento</h5>
									                 <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
									                 <span aria-hidden="true">&times;</span>
									                 </button>
									             </div>
									             <div class="modal-body">
									                 <!--Form lancamento -->
									                     <div class="form-group">
									                         <label for="tipo">tipo</label>
									                         <input type="text" class="form-control" id="tipo" name="tipo" value="${lancamento.tipo}" readonly>
									                     </div>
									                     <div class="form-group">
									                         <label for="valor">Valor</label>
									                         <input type="number" class="form-control" id="valor" name="valor" value="${lancamento.valor}" readonly>
									                     </div>
									                     <div class="form-group">
									                         <label for="data">data</label>
									                         <input type="date" class="form-control" id="data" name="data" placeholder="data" value="${lancamento.data}" readonly>
									                     </div>
									                     <div class="form-group">
									                         <label for="observacao">observacao</label>
									                         <input type="text" class="form-control" id="observacao" name="observacao" value="${lancamento.observacao}" readonly>
									                     </div>
									
									             </div>
									             <div class="modal-footer">
									                     <button type="reset" id="Cancelar" class="btn btn-secondary">Limpar</button>
									                     <a href=excluirLancamento?lancamento=${lancamento.id}><button type="button" class="btn btn-primary">Excluir lancamento</button></a>
									             </div>
									         </div>
								           </div>
								         </div>
									
									
									
									
									<!-- MODAL UPDATE LANCAMENTO -->
									<div class="modal fade" id="lancamentoUpdate${lancamento.id}" tabindex="-1" role="dialog" aria-labelledby="updateLancamento" aria-hidden="true">
								   		<div class="modal-dialog" role="document">
									         <div class="modal-content">
									             <div class="modal-header">
									                 <h5 class="modal-title" id="updateLancamento">Alterar Lancamento</h5>
									                 <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
									                 <span aria-hidden="true">&times;</span>
									                 </button>
									             </div>
									             <div class="modal-body">
									             <form class="signup" method=post action=alterarLancamento>
									                 <!--Form lancamento -->
									                 	<div class="form-group">
									                         <input type="hidden" class="form-control" id="id" name="id" value="${lancamento.id}">
									                     </div>
									                 
									                     <div class="input-group mb-3">
															  <div class="input-group-prepend">
															    <label class="input-group-text" for="inputGroupSelect01">Tipo de lancamento</label>
															  </div>
															  <select name="tipo" class="custom-select" id="inputGroupSelect01">
															  <c:choose>
															    <c:when test="${lancamento.tipo=='credito'}">
															        <option value="credito" selected>credito</option>
															    	<option value="debito">debito</option>
															    </c:when>    
															    <c:otherwise>
															       <option value="credito">credito</option>
															       <option value="debito" selected>debito</option>
															    </c:otherwise>
															  </c:choose>
															  
															  
															  
															    
															  </select>
														 </div>
									                     <div class="form-group">
									                         <label for="valor">Valor</label>
									                         <input type="number" class="form-control" id="valor" name="valor" value="${lancamento.valor}">
									                     </div>
									                     <div class="form-group">
									                         <label for="data">data</label>
									                         <input type="date" class="form-control" id="data" name="data" placeholder="data" value="${lancamento.data}">
									                     </div>
									                     <div class="form-group">
									                         <label for="observacao">observacao</label>
									                         <input type="text" class="form-control" id="observacao" name="observacao" value="${lancamento.observacao}">
									                     </div>
									
									             </div>
									             <div class="modal-footer">
									                     <button type="reset" id="Cancelar" class="btn btn-secondary">Limpar</button>
									                     <button type="submit" class="btn btn-primary">Alterar lancamento</button>
									             	</form>
									             </div>
									         </div>
								           </div>
								         </div>
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	<!-- MODAL INSERIR LANCAMENTO -->
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
	                     <div class="input-group mb-3">
							  <div class="input-group-prepend">
							    <label class="input-group-text" for="inputGroupSelect01">Tipo de lancamento</label>
							  </div>
							  <select name="tipo" class="custom-select" id="inputGroupSelect01">
							    <option selected>Escolha...</option>
							    <option value="credito">credito</option>
							    <option value="debito">debito</option>
							  </select>
						 </div>
	                     <div class="form-group">
	                         <label for="valor">Valor</label>
	                         <input type="number" class="form-control" id="valor" name="valor" placeholder="valor" step=".01" required>
	                     </div>
	                     <div class="form-group">
	                         <label for="data">data</label>
	                         <input type="date" class="form-control" id="data" name="data" placeholder="data" required>
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
	                     <div class="input-group mb-3">
							  <div class="input-group-prepend">
							    <label class="input-group-text" for="inputGroupSelect01">Tipo de lancamento</label>
							  </div>
							  <select name="tipo" class="custom-select" id="inputGroupSelect01">
							    <option selected>Escolha...</option>
							    <option value="credito">credito</option>
							    <option value="debito">debito</option>
							  </select>
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
         
         
         
         
         
          <!-- MODAL LISTAR DATA LANCAMENTO -->
         <div class="modal fade" id="listarLancamentoData" tabindex="-1" role="dialog" aria-labelledby="listarLancamentoData" aria-hidden="true">
   			<div class="modal-dialog" role="document">
	         <div class="modal-content">
	             <div class="modal-header">
	                 <h5 class="modal-title" id="listarLancamentoData">Listar data lancamento</h5>
	                 <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	                 <span aria-hidden="true">&times;</span>
	                 </button>
	             </div>
	             <div class="modal-body">
	                 <!--Form Animal -->
	                 <form class="signup" method=post action=listarLancamentoData>
	                     <div class="input-group mb-3">
							  <div class="input-group-prepend">
							    <label class="input-group-text" for="inputGroupSelect01">Mes</label>
							  </div>
							  <select name="mes" class="custom-select" id="inputGroupSelect01">
							    <option selected>Escolha...</option>
							    <option value="01">JAN</option>
							    <option value="02">FEV</option>
							    <option value="03">MAR</option>
							    <option value="04">ABR</option>
							    <option value="05">MAI</option>
							    <option value="06">JUN</option>
							    <option value="07">JUL</option>
							    <option value="08">AGO</option>
							    <option value="09">SET</option>
							    <option value="10">OUT</option>
							    <option value="11">NOV</option>
							    <option value="12">DEZ</option>
							  </select>
						 </div>	
						 <div class="form-group">
	                         <label for="ano">Ano</label>
	                         <input type="number" class="form-control" id="ano" name="ano" min="1900" max="2099" step="1"  required>
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
	
	
	
</body>
</html>