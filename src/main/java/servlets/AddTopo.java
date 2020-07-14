package servlets;

import controller.CreateTopoForm;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/registred/addTopo")
public class AddTopo extends HttpServlet {
    public static final String VUE                = "profil_topo";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        /* traitement de la requete */
        CreateTopoForm createTopoForm= new CreateTopoForm();
        createTopoForm.createTopo(request);

        HttpSession session = request.getSession();
        /* récupération en session de createTopoForm pour avoir accès à sa Maps d'erreurs depuis la jsp*/
        session.setAttribute("create_topo_form" ,createTopoForm);
        response.sendRedirect(VUE);
    }
}
