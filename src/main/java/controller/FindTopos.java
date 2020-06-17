package controller;

import dao.ClimberDao;
import dao.Dao;
import dao.DaoFactory;
import entities.Topo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * traitement du formulaire de recherche de Topo à partir du résultat de 2 listes déroulantes
 * recherche par nom, lieu ou association des 2
 */
public class FindTopos {

    /* noms des champs définis dans la jsp */
    private final static String CHAMP_TOPO_NAME         ="topo_name";
    private final static String CHAMP_TOPO_PLACE        ="topo_place";

    /*instanciation des différents Dao via la factory */
    private Dao<Topo> dao = DaoFactory.getTopoDao();

    /**  méthode récupération des valeurs du champ du formulaire */
    private static String getFormValue(HttpServletRequest request, String lineName) {
        String value = request.getParameter(lineName);
        if (value == null || value.trim().length() == 0) {
            return null;
        } else {
            return value;
        }
    }

    /**
     * méthode retournant une liste de Topo à partir desvaleurs des 2 critères de liste déroulante de la jsp
     * recherche en base de données par la méthode findBy2Parameters
     */
    public List<Topo> getSelectedTopos (HttpServletRequest request) {
        String topoName = getFormValue(request,CHAMP_TOPO_NAME);
        String topoPlace = getFormValue(request,CHAMP_TOPO_PLACE);
        List<Topo> topos = dao.findBy2Parameters(topoName,topoPlace);

        return topos;
    }

}
