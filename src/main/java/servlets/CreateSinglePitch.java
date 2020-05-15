package servlets;

import controller.CreateSinglePitchForm;
import dao.Dao;
import dao.SinglePitchDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/create_singlePitch")
public class CreateSinglePitch extends HttpServlet {
    public static final String VUE                = "create_route";
    private Dao dao;

    public void init(){dao = new SinglePitchDao();}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CreateSinglePitchForm createSinglePitchForm= new CreateSinglePitchForm(dao);
        createSinglePitchForm.createMultiPitch(request);
        response.sendRedirect(VUE);

    }
}
