package servlets;

import controller.CreatePlaceForm;
import dao.PlaceDao;
import entities.Place;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/registred/create_place")
public class CreatePlace extends HttpServlet {

    public static final String ATT_PLACE                    = "place";
    public static final String VUE                          = "create_route";
    public static final String ATT_CREATE_PLACE_FORM        = "create_place_form";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /* traitement de la requete */
        CreatePlaceForm createPlaceForm = new CreatePlaceForm();
        Place place = createPlaceForm.createPlace(request);

        request.setAttribute(ATT_PLACE , place);

        /* mise en session createPlaceForm pour acces Map d'erreur*/
        HttpSession session = request.getSession();
        session.setAttribute(ATT_CREATE_PLACE_FORM , createPlaceForm);

        response.sendRedirect(VUE);
    }
}
