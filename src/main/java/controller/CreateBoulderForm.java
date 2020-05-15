package controller;

import dao.Dao;
import dao.SectorDao;
import entities.Boulder;
import entities.Sector;

import javax.servlet.http.HttpServletRequest;

public class CreateBoulderForm {
    private static final String CHAMP_SECTOR_ID             ="liste2";
    private static final String CHAMP_ROUTE_NAME            ="routeName";
    private static final String CHAMP_GRADE                 ="grade";
    private static final String CHAMP_ROUTE_DESCRIPTION     ="routeDescription";
    private static final String CHAMP_SIT_START             ="sitStart";
    private Dao dao ;
    private SectorDao sectorDao = new SectorDao();

    public CreateBoulderForm(Dao dao) {
        this.dao = dao;
    }

    /* récupération des valeurs du champ du formulaire */
    private static String getFormValue(HttpServletRequest request, String lineName) {
        String value = request.getParameter(lineName);
        if (value == null || value.trim().length() == 0) {
            return null;
        } else {
            return value;
        }
    }

    public void createBoulder(HttpServletRequest request) {

        Long sectorID = Long.parseLong(getFormValue(request , CHAMP_SECTOR_ID));
        Sector sector = sectorDao.searchSectorById(sectorID);
        String routeName =getFormValue(request,CHAMP_ROUTE_NAME);
        String grade = getFormValue(request,CHAMP_GRADE);
        String routeDescription = getFormValue(request,CHAMP_ROUTE_DESCRIPTION);

        boolean sitStart = getFormValue(request, CHAMP_SIT_START) != null ;
        Boulder boulder = new Boulder();
        boulder.setSitStart(sitStart);
        boulder.setRouteDescription(routeDescription);
        boulder.setRouteName(routeName);
        boulder.setGrade(grade);
        boulder.setSector(sector);

        dao.save(boulder);
    }
}
