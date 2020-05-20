package servlets;

import controller.UpdateTopoAvailabilityForm;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/book_topo")
public class BookTopo extends HttpServlet {

    public static final String VUE                = "topo_list";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UpdateTopoAvailabilityForm updateTopoAvailability = new UpdateTopoAvailabilityForm();
        updateTopoAvailability.bookTopo(request);

        response.sendRedirect(VUE);
    }


}
