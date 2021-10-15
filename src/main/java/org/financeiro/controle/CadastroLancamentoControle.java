package org.financeiro.controle;

import javax.servlet.http.HttpSession;

import org.financeiro.modelo.Lancamento;
import org.financeiro.modelo.User;
import org.financeiro.repositorio.LancamentoRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CadastroLancamentoControle {
	private LancamentoRepositorio repositorio;

	@Autowired
	public CadastroLancamentoControle(LancamentoRepositorio repositorio) {
		this.repositorio = repositorio;
	}
	
	@Transactional
	@RequestMapping(value = "cadastrarLancamento", method=RequestMethod.POST)
	public String cadastrar(Lancamento lancamento, HttpSession sessao, Model model) {
		User usuario = (User) sessao.getAttribute("usuario");
		lancamento.setUser(usuario);
		System.out.println("AQUI O LANCAMENTO");
		System.out.print(lancamento);
		repositorio.insert(lancamento);

		model.addAttribute("lancamentos", repositorio.getAllLancamentos(usuario));
		
	
		return "dashboard";
	}
	
	@Transactional
	@RequestMapping(value = "listarLancamento", method=RequestMethod.POST)
	public String listarTipoLancamento(String tipo, HttpSession sessao, Model model) {
		//System.out.println(tipo);
		model.addAttribute("lancamentos", repositorio.getLancamentoTipo(tipo));
		
		return "dashboard";
	}
	
	@Transactional
	@RequestMapping("excluirLancamento")
	public String removerLancamento(int lancamento, HttpSession sessao) {
		repositorio.delete(lancamento);
		return "redirect:dashboard";
		
	}
}
