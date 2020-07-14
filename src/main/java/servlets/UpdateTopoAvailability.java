package servlets;

import controller.UpdateTopoAvailabilityForm;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/registred/updateTopoAvailability")
public class UpdateTopoAvailability extends HttpServlet {

    private static final String VUE                     ="profil_topo";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /* Traitement de la modification de statut de disponibilité de topo*/
        UpdateTopoAvailabilityForm updateTopoAvailability = new UpdateTopoAvailabilityForm();
        updateTopoAvailability.updateTopo(request);

        response.sendRedirect(VUE);
    }
}
