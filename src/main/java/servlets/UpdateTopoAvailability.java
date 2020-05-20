package servlets;

import controller.UpdateTopoAvailabilityForm;
import entities.Place;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/updateTopoAvailability")
public class UpdateTopoAvailability extends HttpServlet {

    private static final String VUE                     ="profil_topo";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UpdateTopoAvailabilityForm updateTopoAvailability = new UpdateTopoAvailabilityForm();
        updateTopoAvailability.updateTopo(request);

        response.sendRedirect(VUE);
    }
}
