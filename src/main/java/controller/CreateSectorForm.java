package controller;

import dao.Dao;
import dao.DaoFactory;
import entities.Place;
import entities.Sector;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Traitement du formulaire de création d'un nouveau site
 * Appel a PlaceDao pour mettre en base de données le nouveau site
 */
public class CreateSectorForm {

    /* noms des champs définis dans la jsp */
    private static final String CHAMP_SECTOR_NAME            ="sectorName";
    private static final String CHAMP_SECTOR_DESCRIPTION     ="sectorDescription";
    private static final String CHAMP_PLACE_ID               ="placeList";

    /*instanciation des différents Dao via la factory */
    private final Dao<Sector> sectorDao = DaoFactory.getSectorDao();
    private final Dao<Place> placeDao = DaoFactory.getPlaceDao();

    /* création Map pour stockage des différents messages d'erreurs*/
    private Map<String , String > errors = new HashMap<>();
    public Map<String, String> getErrors() {
        return errors;
    }

    /**  méthode récupération des valeurs du champ du formulaire */
    private static String getFormValue (HttpServletRequest request, String lineName) {
        String value = request.getParameter(lineName);
        if (value == null || value.trim().length() == 0 ) {
            return null;
        } else {
            return value;
        }
    }

    /**
     * récupération des valeurs des champs pour les attribuer à l'entité Sector avant de la sauvegarder en bdd
     * Utilisation de placeDao pour rechercher le site auquel sera lié le secteur via l'Id du site récupérée dans la liste déroulante
     */
    public Sector createSector (HttpServletRequest request) {

        Long placeID = Long.parseLong(getFormValue(request , CHAMP_PLACE_ID));
        Place place = placeDao.findById(placeID);
        String sectorName = getFormValue(request,CHAMP_SECTOR_NAME);
        String sectorDescription = getFormValue(request,CHAMP_SECTOR_DESCRIPTION);
        Sector sector = new Sector();

        sector.setSectorName(sectorName);
        sector.setSectorDescription(sectorDescription);
        sector.setPlace(place);
        sectorDao.save(sector);

        return sector;
    }
}
