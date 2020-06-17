package servlets;

import controller.CreateSectorForm;
import entities.Sector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/create_sector")
public class CreateSector extends HttpServlet {

    public static final String ATT_SECTOR          = "sectors";
    public static final String VUE                = "create_route";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        CreateSectorForm createSectorForm = new CreateSectorForm();
        Sector sectors = createSectorForm.createSector(request);

        request.setAttribute(ATT_SECTOR , sectors);

        response.sendRedirect(VUE);

    }
}