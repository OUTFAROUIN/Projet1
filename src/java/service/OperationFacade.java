/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Operation;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author outah
 */
@Stateless
public class OperationFacade extends AbstractFacade<Operation> {

    @PersistenceContext(unitName = "Projet1PU")
    private EntityManager em;

    @EJB
    CompteFacade compteFacade;

    public int save(Operation operation) {
        Double solde = operation.getCompte().getSolde();
        if (operation.getType() == 1) {
            operation.getCompte().setSolde(solde + operation.getMontant());
            compteFacade.edit(operation.getCompte());
            create(operation);
            return 1;
        } else if (operation.getType() == 2) {
            if (solde > operation.getMontant()) {
                return -1;
            } else {
                operation.getCompte().setSolde(solde - operation.getMontant());
                compteFacade.edit(operation.getCompte());
                create(operation);
                return 2;
            }
        }
        return -2;
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OperationFacade() {
        super(Operation.class);
    }

}
