package servlets;

import dao.PlaceDao;
import entities.Place;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/create_sector")
public class CreateSector extends HttpServlet {
    public static final String VUE                = "/WEB-INF/registred/create_route.jsp";
    private PlaceDao placeDao;
    public void init(){placeDao = new PlaceDao();}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Place> places = placeDao.listAllPlaces();
        HttpSession session = request.getSession();

        session.setAttribute("places" , places);
        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
