package org.financeiro.controle;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.financeiro.modelo.User;
import org.financeiro.repositorio.LancamentoRepositorio;
import org.financeiro.repositorio.UserRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AutenticadorControle {
	
	private UserRepositorio userRepositorio;
	private LancamentoRepositorio repositorioLan;
	

	@Autowired
	public AutenticadorControle(UserRepositorio userRepositorio, LancamentoRepositorio repositorioLan) {
		this.userRepositorio = userRepositorio;
		this.repositorioLan = repositorioLan;
	}
	
	@RequestMapping("login")
	public String loginForm(HttpServletRequest request, HttpServletResponse response, Model model) {
		String status = request.getParameter("status");
		
		System.out.println("=============================");
		System.out.println(status);
		
		
		if(status != null) {
			model.addAttribute("status", true);
		}
		else {
			model.addAttribute("status", false);
		}
		
		return "login";
	}
	
	@RequestMapping("dashboard")
	public String Dashboard(Model model, HttpServletRequest request) {
		String login = getCookieValue("cookie", "unknown", request);
		
		model.addAttribute("login" , login);
		model.addAttribute("lancamentos", repositorioLan.getAllLancamentos(userRepositorio.getUsuario(login)));
		model.addAttribute("total" , repositorioLan.getTotal(repositorioLan.getAllLancamentos(userRepositorio.getUsuario(login))));
		
		return "dashboard";
	}
	
	@RequestMapping(value = "autenticar", method = RequestMethod.POST)
	public String autenticar(User usuario, HttpSession sessao, HttpServletResponse response, Model model) {
		if(userRepositorio.autenticar(usuario)) {
			Cookie cookie = new Cookie("cookie",usuario.getLogin());
	        cookie.setMaxAge(60*60*1); 
	        response.addCookie(cookie);
			return "redirect:dashboard";
		}
		return "redirect:login?status=error";
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		Cookie cookie = getCookie("cookie", request);
		cookie.setMaxAge(-1);
		return "redirect:login";
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
	
	public static Cookie getCookie(String cookieName, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
	    for(int i=0; i<cookies.length; i++) {
	      Cookie cookie = cookies[i];
	      if (cookieName.equals(cookie.getName()))
	        return(cookie);
	    }
	    return(null);
	  }
}
