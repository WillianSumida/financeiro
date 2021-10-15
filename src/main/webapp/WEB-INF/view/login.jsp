<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<form method=post action=autenticar>
Login:<input type=text name=login>
<br>
Senha:<input type=password name=senha>
<br>
<input type=submit value=Logar>
<a href="cadastroForm" >CADASTRAR</a>
</form>
</body>
</html>
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<style type=text/css>
		body {
    font-family: Arial, Helvetica, sans-serif;
    background-color: rgba(255, 1, 1, 0.1)
}

.card {
    border: none;
    border-radius: 0;
    width: 420px !important;
    margin: 0 auto
}

.signup {
    display: flex;
    flex-flow: column;
    justify-content: center;
    padding: 10px 50px
}

a {
    text-decoration: none !important
}

h5 {
    color: #ff0147;
    margin-bottom: 3px;
    font-weight: bold
}

small {
    color: rgba(0, 0, 0, 0.3)
}

input {
    width: 100%;
    display: block;
    margin-bottom: 7px
}

.form-control {
    border: 1px solid #dc354575;
    border-radius: 30px;
    background-color: rgba(0, 0, 0, .075);
    letter-spacing: 1px
}

.form-control:focus {
    border: 0.5px solid #dc354575;
    border-radius: 30px;
    box-shadow: none;
    background-color: rgba(0, 0, 0, .075);
    color: #000;
    letter-spacing: 1px
}

.btn {
    display: block;
    width: 100%;
    border-radius: 30px;
    border: none;
    background: linear-gradient(to right, rgba(249, 0, 104, 1) 0%, rgba(247, 117, 24, 1) 100%);
    background: -webkit-linear-gradient(left, rgba(249, 0, 104, 1) 0%, rgba(247, 117, 24, 1) 100%)
}

.text-left {
    color: rgba(0, 0, 0, 0.3);
    font-weight: 400
}

.text-right {
    color: #ff0147;
    font-weight: bold
}

span.text-center {
    color: rgba(0, 0, 0, 0.3)
}
	</style>
	
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
  		<a class="navbar-brand">Seja bem vindo (a)</a>

	</nav>
	
	<div class="container">
	    <div class="row">
	        <div class="col-md-6 mx-auto py-4 px-0">
	            <div class="card p-0">
	                <div class="card-title text-center">
	                    <h5 class="mt-5">Financeiro</h5> <small class="para">Logar</small>
	                </div>
	                <form class="signup" method=post action=autenticar>
	                    <div class="form-group"><input type="text" class="form-control" placeholder="Login" name="login"></div>
	                    <div class="form-group"><input type="password" class="form-control" placeholder="Senha" name="senha"></div> 
	                    <button type="submit" class="btn btn-primary">Entrar</button>
	                 	<a href="cadastroForm" ><button type="button" class="btn btn-primary mt-1">Cadastrar</button></a>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>
