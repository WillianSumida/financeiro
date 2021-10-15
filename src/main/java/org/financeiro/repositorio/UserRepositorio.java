package org.financeiro.repositorio;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.financeiro.modelo.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepositorio {
	@PersistenceContext
	private EntityManager manager;
	
	public void cadastrar(User usuario) {
		manager.persist(usuario);
	}
	
	public boolean autenticar(User usuario) {
		Query query = manager.createQuery("select u from User u where u.login = ?1 and u.senha = ?2");
		query.setParameter(1, usuario.getLogin()).setParameter(2, usuario.getSenha());
		try {
			query.getSingleResult();
			return true;
		} catch(NoResultException e) {
			return false;
		}
	}
	
	public User getUsuario(String login) {
		return manager.find(User.class, login);
	}
}
