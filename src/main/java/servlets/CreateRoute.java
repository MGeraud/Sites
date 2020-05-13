package servlets;

import controller.CreatePlaceForm;
import controller.CreateRouteForm;
import dao.PlaceDao;
import dao.RouteDao;
import dao.SectorDao;
import dao.UserDao;
import entities.Place;
import entities.Route;
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
    public static final String ATT_ROUTE_TYPE     = "routeType";
    public static final String ATT_LISTE1_SELECTED_VALUE    = "liste1_selected_value";
    private RouteDao routedao;
    private PlaceDao placeDao;
    private SectorDao sectorDao;

    public void init() {
        sectorDao = new SectorDao();
        routedao = new RouteDao();
        placeDao = new PlaceDao();
    }
    private static final String VUE                     ="/WEB-INF/registred/create_route.jsp";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /*
        String routeType = request.getParameter("routeType");
        CreateRouteForm createRouteForm = new CreateRouteForm(routedao);
        Route route = createRouteForm.createRoute(request);
         request.setAttribute(ATT_ROUTE_TYPE,routeType);
         */
        String liste1SelectedValue = request.getParameter("liste1");
        Long liste1Long = Long.parseLong(liste1SelectedValue);
        List<Sector> sectors = sectorDao.listSectorFromPlace(liste1Long);
        request.setAttribute(ATT_SECTOR_FROM_PLACE , sectors );
        request.setAttribute(ATT_LISTE1_SELECTED_VALUE, liste1Long);

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Place> places = placeDao.listAllPlaces();

        HttpSession session = request.getSession();

        session.setAttribute("places" , places);

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }
}
