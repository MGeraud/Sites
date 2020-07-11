package controller;

import dao.Dao;
import dao.DaoFactory;
import entities.Topo;

import javax.servlet.http.HttpServletRequest;

/**
 * Traitement de la demande de modification de disponibilité de topo
 * par propriétaire ou réservation
 */
public class UpdateTopoAvailabilityForm {

    /* nom des différents champs de boutons de modifications*/
    private static final String CHAMP_BOOK_TOPO = "book_topo";
    private static final String CHAMP_TOPOS = "topos";
    private static final String CHAMP_BOOKED_TOPO = "bookedTopo";

    /* instanciation de la dao via daoFactory*/
    private final Dao<Topo> climberDao = DaoFactory.getTopoDao();

    /**
     * méthode récupération des valeurs du champ du formulaire
     */
    private static String getFormValue(HttpServletRequest request, String lineName) {
        String value = request.getParameter(lineName);
        if (value == null || value.trim().length() == 0) {
            return null;
        } else {
            return value;
        }
    }

    /**
     * méthode de modification de la disponibilité du topo par son propriétaire
     * efface le message de demande de réservation rattaché si existante
     */
    public void updateTopo(HttpServletRequest request) {

        Long topoId = Long.parseLong(getFormValue(request, CHAMP_TOPOS));
        Topo topo = climberDao.findById(topoId);
        topo.setTopoAvailable(!topo.isTopoAvailable());
        climberDao.update(topo);
        request.removeAttribute(CHAMP_BOOK_TOPO);
    }

    /**
     * Modification du statut de demande de réservation de topo pour le passer en demande de réservation
     */
    public void bookTopo(HttpServletRequest request) {

        Long topoId = Long.parseLong(getFormValue(request, CHAMP_BOOK_TOPO));
        Topo topo = climberDao.findById(topoId);
        topo.setBooking(true);
        climberDao.update(topo);
    }

    /**
     * modification du statut de disponibilité et de demande de réservation quand accepte celle-ci
     */
    public void acceptBooking(HttpServletRequest request) {

        Long topoId = Long.parseLong(getFormValue(request, CHAMP_BOOKED_TOPO));
        Topo topo = climberDao.findById(topoId);
        topo.setBooking(false);
        topo.setTopoAvailable(false);
        climberDao.update(topo);
    }
}
