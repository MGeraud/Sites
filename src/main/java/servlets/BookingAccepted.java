package servlets;

import controller.UpdateTopoAvailabilityForm;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/registred/bookingAccepted")
public class BookingAccepted extends HttpServlet {
    public static final String VUE                = "profil_topo";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /* traitement de la requete */
        UpdateTopoAvailabilityForm updateTopoAvailability = new UpdateTopoAvailabilityForm();
        updateTopoAvailability.acceptBooking(request);

        response.sendRedirect(VUE);
    }
}
