package servlets;

import controller.CreateSectorForm;
import entities.Sector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/registred/create_sector")
public class CreateSector extends HttpServlet {

    public static final String ATT_SECTOR          = "sectors";
    public static final String VUE                = "create_route";
    public static final String ATT_CREATE_SECTOR_FORM        = "create_sector_form";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /* traitement de la requete */
        CreateSectorForm createSectorForm = new CreateSectorForm();
        Sector sectors = createSectorForm.createSector(request);

        request.setAttribute(ATT_SECTOR , sectors);

        /*Mise en session createSectorForm pour pouvoir récupérer Map erreurs*/
        HttpSession session = request.getSession();
        session.setAttribute(ATT_CREATE_SECTOR_FORM , createSectorForm);

        response.sendRedirect(VUE);

    }
}