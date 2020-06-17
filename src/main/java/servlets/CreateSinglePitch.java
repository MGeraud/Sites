package servlets;

import controller.CreateSinglePitchForm;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/create_singlePitch")
public class CreateSinglePitch extends HttpServlet {
    public static final String VUE                = "create_route";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        CreateSinglePitchForm createSinglePitchForm= new CreateSinglePitchForm();
        createSinglePitchForm.createMultiPitch(request);
        response.sendRedirect(VUE);

    }
}
