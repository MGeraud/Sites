package servlets;

import controller.CreateBoulderForm;
import controller.CreateMultiPitchForm;
import dao.BoulderDao;
import dao.Dao;
import dao.MultiPitchDao;
import entities.Boulder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/registred/create_multiPitch")
public class CreateMultiPitch extends HttpServlet {

    public static final String VUE                = "create_route";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        CreateMultiPitchForm createMultiPitchForm= new CreateMultiPitchForm();
        createMultiPitchForm.createMultiPitch(request);

        response.sendRedirect(VUE);
    }
}
