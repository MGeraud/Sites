package controller;

import dao.ClimberDao;
import dao.Dao;
import dao.DaoFactory;
import entities.FoundRoute;
import entities.Topo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Traitement de la recherche de voies multicritères
 */
public class FindRouteForm {
    /* noms des champs définis dans la jsp */
    private final static String CHAMP_BY_PLACE          ="byPlace";
    private final static String CHAMP_BY_ROUTE_TYPE     ="byRouteType";
    private final static String CHAMP_BY_RATE           ="byRate";
    private final static String CHAMP_COUNTAIN_TEXT     ="coutainText";

    /*instanciation des différents Dao via la factory */
    private Dao<FoundRoute> dao = DaoFactory.getRouteDao();

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
     * méthode retournant une liste FoundRoute (objet ayant pour attribut les critères de recherches prédéfinis)
     * recherche en base de données par la méthode findByMultiParameters
     */
    public List<FoundRoute> getFoundRoute (HttpServletRequest request) {

        String byPlace = getFormValue(request,CHAMP_BY_PLACE);
        String byRouteType = getFormValue(request, CHAMP_BY_ROUTE_TYPE);
        String byRate = getFormValue(request,CHAMP_BY_RATE);
        String countainText = getFormValue(request,CHAMP_COUNTAIN_TEXT);

        List<FoundRoute> foundRoutes = dao.findByMultiParameters( byPlace , byRouteType , byRate , countainText );

        return foundRoutes;
    }

}

