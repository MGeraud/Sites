package servlets;

import controller.CreateBoulderForm;
import controller.CreateSectorForm;
import dao.BoulderDao;
import dao.Dao;
import dao.SectorDao;
import entities.Boulder;
import entities.Sector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/create_boulder")
public class CreateBoulder extends HttpServlet {
    public static final String VUE                = "create_route";
    private BoulderDao dao;
    public void init(){dao = new BoulderDao();}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CreateBoulderForm  createBoulderForm= new CreateBoulderForm(dao);
        createBoulderForm.createBoulder(request);

        response.sendRedirect(VUE);
    }
}
