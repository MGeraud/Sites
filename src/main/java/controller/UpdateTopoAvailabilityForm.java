package controller;

import dao.ClimberDao;
import dao.DaoFactory;
import entities.Topo;

import javax.servlet.http.HttpServletRequest;

public class UpdateTopoAvailabilityForm {

    private static final String CHAMP_TOPO_AVAILABLE            ="changeAvailable";
    private static final String CHAMP_TOPOS             = "topos";
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
        if (topo.isTopoAvailable()) {
            topo.setTopoAvailable(false);
        } else { topo.setTopoAvailable(true);}
        climberDao.update(topo);
    }
}
