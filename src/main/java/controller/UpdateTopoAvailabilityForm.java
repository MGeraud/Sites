package controller;

import dao.ClimberDao;
import dao.DaoFactory;
import entities.Topo;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;

public class UpdateTopoAvailabilityForm {

    private static final String CHAMP_BOOK_TOPO     ="book_topo";
    private static final String CHAMP_TOPOS             = "topos";
    private static final String CHAMP_BOOKED_TOPO     ="bookedTopo";

    private final ClimberDao<Topo> climberDao = DaoFactory.getTopoDao();

    /**  méthode récupération des valeurs du champ du formulaire */
    private static String getFormValue(HttpServletRequest request, String lineName) {
        String value = request.getParameter(lineName);
        if (value == null || value.trim().length() == 0) {
            return null;
        } else {
            return value;
        }
    }

    public void updateTopo(HttpServletRequest request) {

        Long  topoId = Long.parseLong(getFormValue(request,CHAMP_TOPOS));
        Topo topo = climberDao.findById(topoId);
        topo.setTopoAvailable(!topo.isTopoAvailable());
        climberDao.update(topo);
        request.removeAttribute(CHAMP_BOOK_TOPO);
    }

    public void bookTopo(HttpServletRequest request) {

        Long  topoId = Long.parseLong(getFormValue(request,CHAMP_BOOK_TOPO));
        Topo topo = climberDao.findById(topoId);
        if (topo.isTopoAvailable()) {
            topo.setBooking(true);
        } else { topo.setTopoAvailable(false);}
        climberDao.update(topo);
    }

    public void acceptBooking(HttpServletRequest request) {

        Long  topoId = Long.parseLong(getFormValue(request,CHAMP_BOOKED_TOPO));
        Topo topo = climberDao.findById(topoId);
        topo.setBooking(false);
        topo.setTopoAvailable(false);
        climberDao.update(topo);
    }
}
