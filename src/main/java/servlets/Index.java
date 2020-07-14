package servlets;

import entities.Region;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/index")
public class Index extends HttpServlet {
    private static final String VUE                     ="/WEB-INF/public/index.jsp";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /* mise en session de la map d'Enum des régions pour l'afficher en liste déroulante dans la jsp*/
        HttpSession session = request.getSession();
        session.setAttribute("regions" , Region.getMapRegions());
        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);

    }
}
