package servlets;

import entities.Region;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/found_route")
public class FoundRoute extends HttpServlet {
    private static final String VUE                     ="/WEB-INF/found_route.jsp";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        session.setAttribute("regions" , Region.getMapRegions());
        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);

    }
}