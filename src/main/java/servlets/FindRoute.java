package servlets;

import controller.FindRouteForm;
import Utils.FoundRoute;
import entities.Region;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/findRouteForm")
public class FindRoute extends HttpServlet {

    public static final String ATT_FOUND_ROUTES     = "foundRoutes";

    public static final String VUE                  = "/WEB-INF/public/findRouteForm.jsp";
    public static final String VUE_FOUND_ROUTE      = "found_route";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        FindRouteForm findRouteForm = new FindRouteForm();
        List<FoundRoute> foundRoutes = findRouteForm.getFoundRoute(request);
        HttpSession session = request.getSession();
        session.setAttribute(ATT_FOUND_ROUTES , foundRoutes);
        response.sendRedirect(VUE_FOUND_ROUTE);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        session.setAttribute("regions" , Region.getMapRegions());

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);

    }
}
