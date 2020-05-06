package controller;

import dao.PlaceDao;
import dao.SectorDao;
import entities.Place;
import entities.Sector;

import javax.servlet.http.HttpServletRequest;

public class CreateSectorForm {

    private static final String CHAMP_SECTOR_NAME            ="sectorName";
    private static final String CHAMP_SECTOR_DESCRIPTION     ="sectorDescription";

    private SectorDao sectorDao;
    public CreateSectorForm (SectorDao sectorDao){this.sectorDao = sectorDao;}

    /* récupération des valeurs du champ du formulaire */
    private static String getFormValue (HttpServletRequest request, String lineName) {
        String value = request.getParameter(lineName);
        if (value == null || value.trim().length() == 0 ) {
            return null;
        } else {
            return value;
        }
    }

    public Sector createSector (HttpServletRequest request) {

        String sectorName = getFormValue(request,CHAMP_SECTOR_NAME);
        String sectorDescription = getFormValue(request,CHAMP_SECTOR_DESCRIPTION);
        Sector sector = new Sector();

        sector.setSectorName(sectorName);
        sector.setSectorDescription(sectorDescription);

        sectorDao.createSector(sector);

        return sector;
    }
}
