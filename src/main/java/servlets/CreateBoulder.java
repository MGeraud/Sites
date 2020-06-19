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

@WebServlet(urlPatterns = "/registred/create_boulder")
public class CreateBoulder extends HttpServlet {

    public static final String VUE                = "create_route";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        CreateBoulderForm  createBoulderForm= new CreateBoulderForm();
        createBoulderForm.createBoulder(request);

        response.sendRedirect(VUE);
    }
}
