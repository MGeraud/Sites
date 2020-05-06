package controller;

import dao.PlaceDao;
import entities.Place;
import servlets.CreatePlace;

import javax.servlet.http.HttpServletRequest;

public class CreatePlaceForm {

    private static final String CHAMP_PLACE_NAME            ="placeName";
    private static final String CHAMP_PLACE_DESCRIPTION     ="placeDescription";

    private PlaceDao placeDao;
    public CreatePlaceForm (PlaceDao placeDao){this.placeDao = placeDao;}

    /* récupération des valeurs du champ du formulaire */
    private static String getFormValue (HttpServletRequest request, String lineName) {
        String value = request.getParameter(lineName);
        if (value == null || value.trim().length() == 0 ) {
            return null;
        } else {
            return value;
        }
    }

    public Place createPlace (HttpServletRequest request) {

        String placeName = getFormValue(request,CHAMP_PLACE_NAME);
        String placeDescription = getFormValue(request,CHAMP_PLACE_DESCRIPTION);
        Place place = new Place();

        place.setPlaceName(placeName);
        place.setPlaceDescription(placeDescription);

        placeDao.createPlace(place);

        return place;
    }
}
