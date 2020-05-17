package servlets;

import controller.CreatePlaceForm;
import dao.PlaceDao;
import entities.Place;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/create_place")
public class CreatePlace extends HttpServlet {

    public static final String ATT_PLACE          = "place";
    public static final String VUE                = "create_route";
    private PlaceDao placeDao;
    public void init(){placeDao = new PlaceDao();}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CreatePlaceForm createPlaceForm = new CreatePlaceForm(placeDao);
        Place place = createPlaceForm.createPlace(request);

        request.setAttribute(ATT_PLACE , place);

        response.sendRedirect(VUE);
    }
}
