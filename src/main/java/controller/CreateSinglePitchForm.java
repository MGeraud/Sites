package controller;

import dao.Dao;
import dao.DaoFactory;
import dao.SectorDao;
import entities.Sector;
import entities.SinglePitch;
import javax.servlet.http.HttpServletRequest;

/**
 * Traitement du formulaire de création d'une nouvelle  voie appartenant à un secteur déterminé par liste déroulante
 * Appel a SectorDao pour récupérer le secteur auquel notre voie sera liée
 * Appel a SinglePitchDao pour mettre en base de données la nouvelle  voie
 */
public class CreateSinglePitchForm {

    /* noms des champs définis dans la jsp */
    private static final String CHAMP_SECTOR_ID             ="liste2";
    private static final String CHAMP_ROUTE_NAME            ="routeName";
    private static final String CHAMP_GRADE                 ="grade";
    private static final String CHAMP_ROUTE_DESCRIPTION     ="routeDescription";
    private static final String CHAMP_SPIT                  ="spit" ;
    private static final String CHAMP_ROUTE_LENGTH          ="routeLength" ;

    /*instanciation des différents Dao via la factory */
    private Dao<SinglePitch> dao = DaoFactory.getSinglePitchDao();
    private Dao<Sector> sectorDao = DaoFactory.getSectorDao();


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
     * récupération des valeurs des champs pour les attribuer à l'entité singlePitch avant de la sauvegarder en bdd
     */
    public void createMultiPitch(HttpServletRequest request) {

        Long sectorID = Long.parseLong(getFormValue(request , CHAMP_SECTOR_ID));
        Sector sector = sectorDao.findById(sectorID);
        String routeName =getFormValue(request,CHAMP_ROUTE_NAME);
        String grade = getFormValue(request,CHAMP_GRADE);
        String routeDescription = getFormValue(request,CHAMP_ROUTE_DESCRIPTION);
        int spit = Integer.parseInt(getFormValue(request,CHAMP_SPIT));
        int routeLength = Integer.parseInt(getFormValue(request,CHAMP_ROUTE_LENGTH));

        SinglePitch singlePitch = new SinglePitch();
        singlePitch.setSpit(spit);
        singlePitch.setRouteLength(routeLength);
        singlePitch.setRouteDescription(routeDescription);
        singlePitch.setRouteName(routeName);
        singlePitch.setGrade(grade);
        singlePitch.setSector(sector);
        singlePitch.setRouteType("Voie Sportive");

        dao.save(singlePitch);
    }
}
