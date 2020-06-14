package controller;

import dao.Dao;
import dao.DaoFactory;
import dao.SectorDao;
import entities.Com;
import entities.Place;
import entities.Route;
import entities.Sector;
import org.hibernate.Hibernate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

/** Chargement en mémoire du site dont on veut la description avec ses secteurs, voies et commentaires
 * A partir de son Id récupérée dans la jsp index
 */
public class GetPlaceDescription {

    /* nom de champ à récupérer dans la jsp */
    private static final String CHAMP_PLACE_ID      = "placeID";

    /* nom des attributs de sessions à enregistrer */
    private static final String ATTRIBUT_PLACE                  ="place";
    private static final String ATTRIBUT_SECTORS                ="sectors";
    private static final String ATTRIBUT_COMS                   ="coms";

    private SectorDao dao = DaoFactory.getSectorDao();
    private Dao<Place> placeDao = DaoFactory.getPlaceDao();
    private Dao<Com> comDao = DaoFactory.getComDao();

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
     * enregistrement en session des différents éléments décrivants un site
     * ainsi que les commentaire lié à celui-ci
     */
    public void getPlaceWithAllAttributes (HttpServletRequest request) {

        Long placeId = Long.parseLong(getFormValue(request , CHAMP_PLACE_ID));
        List<Sector> sectors = dao.listSectorsFromPlaceWithRoutes(placeId);
        Place place = placeDao.findById(placeId);
        List<Com> coms = comDao.findByPlaceId(placeId);


        HttpSession session = request.getSession();
        session.setAttribute(ATTRIBUT_SECTORS, sectors);
        session.setAttribute(ATTRIBUT_PLACE , place);
        session.setAttribute(ATTRIBUT_COMS , coms);
    }


}
