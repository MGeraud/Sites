package servlets;

import controller.GetPlaceDescription;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/updatePlaceTag")
public class UpdatePlaceTag extends HttpServlet {
    private static final String VUE             = "/WEB-INF/public/place.jsp";


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GetPlaceDescription getPlaceDescription = new GetPlaceDescription();
        getPlaceDescription.updatePlaceTag(request);

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }
}
