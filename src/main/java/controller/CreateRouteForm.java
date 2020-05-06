package controller;

import dao.RouteDao;
import entities.*;

import javax.servlet.http.HttpServletRequest;

public class CreateRouteForm {

    private final static String CHAMP_NEW_PLACE             ="newPlace";
    private static final String CHAMP_PLACE_NAME            ="placeName";
    private static final String CHAMP_PLACE_DESCRIPTION     ="placeDescription";
    private static final String CHAMP_SECTOR_NAME           ="sectorName";
    private static final String CHAMP_SECTOR_DESCRIPTION    ="sectorDescription";
    private static final String CHAMP_ROUTE_TYPE            ="routeType";
    private static final String CHAMP_ROUTE_NAME            ="routeName";
    private static final String CHAMP_GRADE                 ="grade";
    private static final String CHAMP_ROUTE_DESCRIPTION     ="routeDescription";
    private static final String CHAMP_SIT_START             ="sitStart";
    private static final String CHAMP_SPIT                  ="spit";
    private static final String CHAMP_ROUTE_LENGTH          ="routeLength";
    private static final String CHAMP_NUMBER_OF_PITCH       ="numberOfPitch";

    private RouteDao routeDao;

    public CreateRouteForm (RouteDao routeDao){ this.routeDao = routeDao;}

    /* récupération des valeurs du champ du formulaire */
    private static String getFormValue (HttpServletRequest request, String lineName) {
        String value = request.getParameter(lineName);
        if (value == null || value.trim().length() == 0 ) {
            return null;
        } else {
            return value;
        }
    }

    public Route createRoute (HttpServletRequest request) {
        boolean sitStart = getFormValue(request, CHAMP_SIT_START) != null;
        Place place = new Place();
        Sector sector = new Sector();
        Route route;

        String placeName = getFormValue(request,CHAMP_PLACE_NAME);
        String placeDescription = getFormValue(request,CHAMP_PLACE_DESCRIPTION);
        String sectorName = getFormValue(request,CHAMP_SECTOR_NAME);
        String sectorDescription = getFormValue(request,CHAMP_SECTOR_DESCRIPTION);
        String routeType = getFormValue(request,CHAMP_ROUTE_TYPE);
        

        String routeName =getFormValue(request,CHAMP_ROUTE_NAME);
        String grade = getFormValue(request,CHAMP_GRADE);
        String routeDescription = getFormValue(request,CHAMP_ROUTE_DESCRIPTION);
        place.setPlaceName(placeName);
        place.setPlaceDescription(placeDescription);
        sector.setSectorName(sectorName);
        sector.setSectorDescription(sectorDescription);
        sector.setPlace(place);

        switch (routeType) {
            case "boulder" :
                
                route = new Boulder();


                break;
            case "singlePitch" :
                int routeLength = Integer.parseInt(getFormValue(request,CHAMP_ROUTE_LENGTH));
                int spit = Integer.parseInt(getFormValue(request,CHAMP_SPIT));
                route = new SinglePitch();

                break;
            case "multiPitch" :
                int numberOfPitch = Integer.parseInt(getFormValue(request,CHAMP_NUMBER_OF_PITCH));
                route = new MultiPitch();


                break;

            default:
                throw new IllegalStateException("Unexpected value: " + routeType);
        }
        routeDao.createRoute(place,sector,route);


        return route;
    }

}
