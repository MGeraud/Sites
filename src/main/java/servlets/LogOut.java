package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/registred/logout")
public class LogOut extends HttpServlet {

    public static final String ATT_REGISTRED_SESSION        ="sessionUtilisateur";
    public static final String VUE                          ="index";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /* retirer l'utilisateur enregistré en session */
        HttpSession session = request.getSession();
        session.setAttribute(ATT_REGISTRED_SESSION , null);

        /* redirection vers la page d'accueil */
        response.sendRedirect(VUE);
    }
}
