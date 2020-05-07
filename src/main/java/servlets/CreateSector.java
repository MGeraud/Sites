package servlets;

import controller.CreatePlaceForm;
import controller.CreateSectorForm;
import dao.PlaceDao;
import dao.SectorDao;
import entities.Place;
import entities.Sector;

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

    public static final String ATT_SECTOR          = "sector";
    public static final String VUE                = "create_route";
    private SectorDao sectorDao;
    public void init(){sectorDao = new SectorDao();}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CreateSectorForm createSectorForm = new CreateSectorForm(sectorDao);
        Sector sector = createSectorForm.createSector(request);

        request.setAttribute(ATT_SECTOR , sector);

        response.sendRedirect(VUE);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }
}