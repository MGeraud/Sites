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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Place place = (Place) session.getAttribute("place");
        GetPlaceDescription getPlaceDescription = new GetPlaceDescription();
        getPlaceDescription.deleteComment(request);

        response.sendRedirect(VUE + place.getPlaceId());
    }
}
