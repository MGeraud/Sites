package controller;

import dao.PlaceDao;
import entities.Place;
import entities.Region;

import javax.servlet.http.HttpServletRequest;

/**
 * Traitement du formulaire de création d'un nouveau site
 * Appel a PlaceDao pour mettre en base de données le nouveau site
 */
public class CreatePlaceForm {

    /* noms des champs définis dans la jsp */
    private static final String CHAMP_PLACE_NAME            ="placeName";
    private static final String CHAMP_PLACE_REGION            ="placeRegion";
    private static final String CHAMP_PLACE_DESCRIPTION     ="placeDescription";

    private PlaceDao placeDao;
    public CreatePlaceForm (PlaceDao placeDao){this.placeDao = placeDao;}

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
     * récupération des valeurs des champs pour les attribuer à l'entité Place avant de la sauvegarder en bdd
     */
    public Place createPlace (HttpServletRequest request) {

        String placeName = getFormValue(request,CHAMP_PLACE_NAME);
        String placeRegion = getFormValue(request,CHAMP_PLACE_REGION);
        String placeDescription = getFormValue(request,CHAMP_PLACE_DESCRIPTION);
        Place place = new Place();

        place.setPlaceName(placeName);
        place.setRegion(Region.valueOf(placeRegion));
        place.setPlaceDescription(placeDescription);

        placeDao.createPlace(place);

        return place;
    }
}
