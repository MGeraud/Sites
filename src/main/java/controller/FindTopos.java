package controller;

import dao.ClimberDao;
import dao.DaoFactory;
import entities.Topo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class FindTopos {

    private final static String CHAMP_TOPO_NAME         ="topo_name";
    private final static String CHAMP_TOPO_PLACE        ="topo_place";
    private ClimberDao<Topo> dao = DaoFactory.getTopoDao();

    /**  méthode récupération des valeurs du champ du formulaire */
    private static String getFormValue(HttpServletRequest request, String lineName) {
        String value = request.getParameter(lineName);
        if (value == null || value.trim().length() == 0) {
            return null;
        } else {
            return value;
        }
    }

    public List<Topo> getSelectedTopos (HttpServletRequest request) {
        String topoName = getFormValue(request,CHAMP_TOPO_NAME);
        String topoPlace = getFormValue(request,CHAMP_TOPO_PLACE);
        List<Topo> topos = dao.findBy2Parameters(topoName,topoPlace);

        return topos;
    }

}
