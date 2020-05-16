package controller;

import dao.Dao;
import dao.DaoFactory;
import dao.SectorDao;
import entities.MultiPitch;
import entities.Sector;

import javax.servlet.http.HttpServletRequest;
/**
 * Traitement du formulaire de création d'une nouvelle grande voie appartenant à un secteur déterminé par liste déroulante
 * Appel a SectorDao pour récupérer le secteur auquel notre grande voie sera liée
 * Appel a MultiPitchDao pour mettre en base de données la nouvelle grande voie
 */
public class CreateMultiPitchForm {

    /* noms des champs définis dans la jsp */
    private static final String CHAMP_SECTOR_ID             ="liste2";
    private static final String CHAMP_ROUTE_NAME            ="routeName";
    private static final String CHAMP_GRADE                 ="grade";
    private static final String CHAMP_ROUTE_DESCRIPTION     ="routeDescription";
    private static final String CHAMP_NUMBER_OF_PITCH       ="numberOfPitch" ;

    /*instanciation des différents Dao via la factory */
    private Dao<MultiPitch> dao = DaoFactory.getMultipitchDao();
    private SectorDao sectorDao = new SectorDao();

    /** récupération des valeurs du champ du formulaire */
    private static String getFormValue(HttpServletRequest request, String lineName) {
        String value = request.getParameter(lineName);
        if (value == null || value.trim().length() == 0) {
            return null;
        } else {
            return value;
        }
    }

    /**
     * récupération des valeurs des champs pour les attribuer à l'entité multiPitch avant de la sauvegarder en bdd
     */
    public void createMultiPitch(HttpServletRequest request) {

        Long sectorID = Long.parseLong(getFormValue(request , CHAMP_SECTOR_ID));
        Sector sector = sectorDao.searchSectorById(sectorID);
        String routeName =getFormValue(request,CHAMP_ROUTE_NAME);
        String grade = getFormValue(request,CHAMP_GRADE);
        String routeDescription = getFormValue(request,CHAMP_ROUTE_DESCRIPTION);
        int numberOfPitch = Integer.parseInt(getFormValue(request,CHAMP_NUMBER_OF_PITCH));
        
        MultiPitch multiPitch = new MultiPitch();
        multiPitch.setNumberOfPitch(numberOfPitch);
        multiPitch.setRouteDescription(routeDescription);
        multiPitch.setRouteName(routeName);
        multiPitch.setGrade(grade);
        multiPitch.setSector(sector);

        dao.save(multiPitch);
    }
}
