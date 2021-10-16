package org.financeiro.controle;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.financeiro.modelo.Lancamento;
import org.financeiro.modelo.User;
import org.financeiro.repositorio.LancamentoRepositorio;
import org.financeiro.repositorio.UserRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CadastroLancamentoControle {
	private LancamentoRepositorio lancamentoRepositorio;
	private UserRepositorio userRepositorio;

	@Autowired
	public CadastroLancamentoControle(LancamentoRepositorio lancamentoRepositorio, UserRepositorio userRepositorio) {
		this.lancamentoRepositorio = lancamentoRepositorio;
		this.userRepositorio = userRepositorio;
	}
	
	
	@Transactional
	@RequestMapping(value = "cadastrarLancamento", method=RequestMethod.POST)
	public String cadastrar(Lancamento lancamento, Model model, HttpServletRequest request) {
		String login = getCookieValue("cookie", "unknown", request);
		
		System.out.println("--------------------------------");
		System.out.println(userRepositorio.getUsuario(login));
		
		lancamento.setUser(userRepositorio.getUsuario(login));
		lancamentoRepositorio.insert(lancamento);

		model.addAttribute("login" , login);
		model.addAttribute("lancamentos", lancamentoRepositorio.getAllLancamentos(userRepositorio.getUsuario(login)));
	
		return "dashboard";
	}

	@Transactional
	@RequestMapping(value = "listarLancamento", method=RequestMethod.POST)
	public String listarTipoLancamento(String tipo, Model model, HttpServletRequest request) {
		String login = getCookieValue("cookie", "unknown", request);
		model.addAttribute("login" , login);
		model.addAttribute("lancamentos", lancamentoRepositorio.getLancamentoTipo(tipo));
		
		return "dashboard";
	}
	
	@Transactional
	@RequestMapping("excluirLancamento")
	public String removerLancamento(int lancamento, HttpServletRequest request, Model model) {
		lancamentoRepositorio.delete(lancamento);
		String login = getCookieValue("cookie", "unknown", request);
		model.addAttribute("login" , login);
		return "redirect:dashboard";	
	}
	
	public static String getCookieValue(String cookieName,  String defaultValue, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
	    for(int i=0; i<cookies.length; i++) {
	      Cookie cookie = cookies[i];
	      if (cookieName.equals(cookie.getName()))
	        return(cookie.getValue());
	    }
	    return(defaultValue);
	  }
}
