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
	
	public List<Lancamento> getAllLancamentos(User user) {
		TypedQuery<Lancamento> query = manager.createQuery("select c from Lancamento c where user_login = ?1 ", Lancamento.class);
		query.setParameter(1, user.getLogin());
		return query.getResultList();
	}
	
	public List<Lancamento> getLancamentoTipo(String tipo) {
		TypedQuery<Lancamento> query = manager.createQuery("select c from Lancamento c where tipo = ?1 ", Lancamento.class);
		query.setParameter(1, tipo);
		return query.getResultList();
	}
	
	public List<Lancamento> getLancamentoData(String data) {
		TypedQuery<Lancamento> query = manager.createQuery("select c from Lancamento c where data = ?1 ", Lancamento.class);
		query.setParameter(1, data);
		return query.getResultList();
	}
}
