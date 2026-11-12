package com.votreprojet;

import com.votreprojet.dto.ClientDTO;
import com.votreprojet.service.ClientService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.Date;

public class Main {
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("banquePU");
        EntityManager em = emf.createEntityManager();

        ClientService clientService = new ClientService(em);

        // Exemple de creation d'un client
        ClientDTO clientDTO = new ClientDTO();
        clientDTO.setNomClient("Dupont");
        clientDTO.setPrenomClient("Jean");
        clientDTO.setAdClient("123 Rue de Paris");
        clientDTO.setDateNaissClient(new Date());
        clientDTO.setAgeClient(30);
        clientDTO.setNumAgent(1);

        ClientDTO createdClient = clientService.createClient(clientDTO);
        System.out.println("Client cree: " + createdClient.getNomClient());

        em.close();
        emf.close();
    }
}
