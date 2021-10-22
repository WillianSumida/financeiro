package org.financeiro.repositorio;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.financeiro.modelo.Lancamento;
import org.financeiro.modelo.User;
import org.springframework.stereotype.Repository;

@Repository
public class LancamentoRepositorio {
	@PersistenceContext
	private EntityManager manager;
	
	public Lancamento insert(Lancamento lancamento) {
		manager.persist(lancamento);
		return lancamento;
	}
	
	public void delete(int lancamento) {
		Lancamento objeto = manager.find(Lancamento.class, lancamento);
		manager.remove(objeto);
	}
	
	public void update(Lancamento newObjeto) {
		//Lancamento oldObjeto = manager.find(Lancamento.class, newObjeto.getId());
		System.out.println("////////////////////////");
		System.out.println(newObjeto);
		manager.merge(newObjeto);
		
	}
	
	public List<Lancamento> getAllLancamentos(User user) {
		TypedQuery<Lancamento> query = manager.createQuery("select c from Lancamento c where user_login = ?1 ", Lancamento.class);
		query.setParameter(1, user.getLogin());
		return query.getResultList();
	}
	
	public List<Lancamento> getLancamentoTipo(String tipo, User user) {
		TypedQuery<Lancamento> query = manager.createQuery("select c from Lancamento c where tipo = ?1 and user_login = ?2", Lancamento.class);
		query.setParameter(1, tipo).setParameter(2, user.getLogin());
		return query.getResultList();
	}
	
	public List<Lancamento> getLancamentoData(String mes, String ano, User user) {
		String inicio = ano+"-"+mes+"-01";
		String fim = ano+"-"+mes+"-31";
		
		TypedQuery<Lancamento> query = manager.createQuery("select c from Lancamento c where data between ?1 AND ?2 AND  user_login=?3", Lancamento.class);
		query.setParameter(1, inicio).setParameter(2,fim).setParameter(3, user.getLogin());
		return query.getResultList();
	}
	
	
	public float getTotal(List<Lancamento> lista) {
		float total = 0;
		
		for (Lancamento objeto : lista) {
			total+=objeto.getValor();
		}
		
		return  total;
	}
}
