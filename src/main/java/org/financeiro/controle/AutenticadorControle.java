package org.financeiro.controle;

import javax.servlet.http.HttpSession;

import org.financeiro.modelo.User;
import org.financeiro.repositorio.LancamentoRepositorio;
import org.financeiro.repositorio.UserRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AutenticadorControle {
	
	private UserRepositorio repositorio;
	private LancamentoRepositorio repositorioLan;
	

	@Autowired
	public AutenticadorControle(UserRepositorio repositorio, LancamentoRepositorio repositorioLan) {
		this.repositorio = repositorio;
		this.repositorioLan = repositorioLan;
	}
	
	@RequestMapping("login")
	public String loginForm() {
		return "login";
	}
	
	@RequestMapping("dashboard")
	public String Dashboard(Model model, HttpSession sessao) {
		User usuario = (User) sessao.getAttribute("usuario");

		model.addAttribute("lancamentos", repositorioLan.getAllLancamentos(usuario));
		return "dashboard";
	}
	
	
	
	@RequestMapping(value = "autenticar", method = RequestMethod.POST)
	public String autenticar(User usuario, HttpSession sessao) {
		if(repositorio.autenticar(usuario)) {
			
			User user = repositorio.getUsuario(usuario.getLogin());
			sessao.setAttribute("usuario", user);

				return "redirect:dashboard";
		}
		return "redirect:login";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession sessao) {
		sessao.removeAttribute("usuario");
		sessao.invalidate();
		return "redirect:login";
	}
}
