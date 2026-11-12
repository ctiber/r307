package app;

import entities.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

public class Demo {
    public static void main(String[] args) {

        // The code below can be defined as a template in IDEA
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        EntityManager em = emf.createEntityManager();
        EntityTransaction transaction = em.getTransaction();

        try {
            transaction.begin();
            User user = new User();
            user.setId(1l);
            user.setName("Chou Tiber");
            em.persist(user);
            User u = em.find(User.class,1l);
            System.out.println("Fetched user's name: "+u.getName());
            transaction.commit();
        }
        finally {
            if(transaction.isActive()) {
                transaction.rollback();
            }
            em.close();
            emf.close();
        }
    }
}
