package servlets;

import antlr.collections.List;
import controller.GetPlaceDescription;
import entities.Route;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/placeDescription")
public class PlaceDescription extends HttpServlet {

    public static final String VUE          ="/WEB-INF/place.jsp";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GetPlaceDescription getPlaceDescription = new GetPlaceDescription();
        getPlaceDescription.addComment(request);

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        GetPlaceDescription getPlaceDescription = new GetPlaceDescription();
        getPlaceDescription.getPlaceWithAllAttributes(request);

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }
}
