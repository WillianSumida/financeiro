package org.financeiro.controle;

import javax.persistence.RollbackException;

import org.financeiro.modelo.User;
import org.financeiro.repositorio.UserRepositorio;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CadastroUsuarioControle {
	
	private UserRepositorio repositorio;

	@Autowired
	public CadastroUsuarioControle(UserRepositorio repositorio) {
		this.repositorio = repositorio;
	}

	@RequestMapping("cadastroForm")
	public String cadastroForm() {
		return "cadastrarUsuario";
	}
	
	@Transactional
	@RequestMapping(value = "cadastrar", method=RequestMethod.POST)
	public String cadastrar(User usuario) {
		repositorio.cadastrar(usuario);
		return "login";
	}
	
	

}
