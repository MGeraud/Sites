package servlets;

import controller.CreatePlaceForm;
import controller.CreateRouteForm;
import dao.PlaceDao;
import dao.RouteDao;
import dao.UserDao;
import entities.Place;
import entities.Route;

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

    public static final String ATT_PLACE          = "place";
    public static final String ATT_ROUTE_TYPE     = "routeType";
    private RouteDao routedao;
    private PlaceDao placeDao;

    public void init() {
        routedao = new RouteDao();
        placeDao = new PlaceDao();
    }
    private static final String VUE                     ="/WEB-INF/registred/create_route.jsp";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String routeType = request.getParameter("routeType");
        CreateRouteForm createRouteForm = new CreateRouteForm(routedao);
        Route route = createRouteForm.createRoute(request);



        request.setAttribute(ATT_ROUTE_TYPE,routeType);

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Place> places = placeDao.listAllPlaces();
        HttpSession session = request.getSession();

        session.setAttribute("places" , places);

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }
}
