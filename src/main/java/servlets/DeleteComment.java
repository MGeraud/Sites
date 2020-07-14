package servlets;

import controller.GetPlaceDescription;
import entities.Place;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/deleteComment")
public class DeleteComment extends HttpServlet {
    private static final String VUE             = "placeDescription?placeID=";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        /*récupération de l'id du site pour pouvoir rediriger vers sa page une fois le commentaire effacé */
        Place place = (Place) session.getAttribute("place");

        /* traitement de la requete */
        GetPlaceDescription getPlaceDescription = new GetPlaceDescription();
        getPlaceDescription.deleteComment(request);

        /* redirection dynamique en fonction de l'id du site récupéré*/
        response.sendRedirect(VUE + place.getPlaceId());
    }
}
