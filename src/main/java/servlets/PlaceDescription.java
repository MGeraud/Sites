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

@WebServlet(urlPatterns = "/placeDescription")
public class PlaceDescription extends HttpServlet {

    public static final String VUE                          ="/WEB-INF/public/place.jsp";
    public static final String VUE_WITH_PARAMETERS          ="placeDescription?placeID=";
    public static final String ATT_GET_PLACE_DESCRIPTION    = "create_place_form";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        Place place = (Place) session.getAttribute("place");
        GetPlaceDescription getPlaceDescription = new GetPlaceDescription();
        getPlaceDescription.addComment(request);

        session.setAttribute(ATT_GET_PLACE_DESCRIPTION , getPlaceDescription);
        response.sendRedirect(VUE_WITH_PARAMETERS + place.getPlaceId());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        GetPlaceDescription getPlaceDescription = new GetPlaceDescription();
        getPlaceDescription.getPlaceWithAllAttributes(request);

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }
}
