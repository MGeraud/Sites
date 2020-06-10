package servlets;


import dao.PlaceDao;
import dao.SectorDao;
import entities.Place;
import entities.Region;
import entities.Sector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet( urlPatterns = "/create_route")
public class CreateRoute extends HttpServlet {

    public static final String ATT_SECTOR_FROM_PLACE    ="sectors";
    public static final String ATT_LISTE1_SELECTED_VALUE    = "liste1_selected_value";
    private PlaceDao placeDao;
    private SectorDao sectorDao;

    public void init() {
        sectorDao = new SectorDao();
        placeDao = new PlaceDao();
    }
    private static final String VUE                     ="/WEB-INF/registred/create_route.jsp";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
        * Récupération du site sélectionné pour ensuite récupérer la liste des secteurs de ce site
         *et pouvoir les afficher en liste déroulante via les attributs de requete
        */
        String liste1SelectedValue = request.getParameter("liste1");
        Long liste1Long = Long.parseLong(liste1SelectedValue);
        List<Sector> sectors = sectorDao.listSectorFromPlace(liste1Long);
        request.setAttribute(ATT_SECTOR_FROM_PLACE , sectors );
        request.setAttribute(ATT_LISTE1_SELECTED_VALUE, liste1Long);

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * récupération et mise en session de la liste des sites pour y accèder en liste déroulante
         */
        List<Place> places = placeDao.listAllPlaces();
        HttpSession session = request.getSession();
        session.setAttribute("places" , places);

        session.setAttribute("regions" , Region.getMapRegions());

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }
}
