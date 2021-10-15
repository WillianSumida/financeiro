

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class TesteTabela {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("financeiro");
		EntityManager manager = factory.createEntityManager();
		
		//executa a operação
		
		manager.close();
		factory.close();

	}

}
