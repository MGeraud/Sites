package servlets;

import controller.InscriptionForm;
import entities.Climber;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/inscription")
public class Inscription extends HttpServlet {
    public static final String ATT_CLIMBER                  = "climber";
    public static final String ATT_FORM                     = "form";
    public static final String ATT_REGISTRED_SESSION        ="sessionUtilisateur";

    public static final String VUE          = "/WEB-INF/public/inscription.jsp";
    public static final String VUE2          = "index";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        InscriptionForm form = new InscriptionForm();
        Climber climber = form.createClimber(request);
        HttpSession session = request.getSession();

        /*
        Test : si erreurs lors de l'inscription, mise en requetes de l'objet form pour récupérer les motifs et les afficher
        Si aucune erreur alors redirection vers la page d'accueil avec nouvel utilisateur enregistré
         */
        if (form.getErrors().isEmpty() && climber!= null) {
            session.setAttribute(ATT_REGISTRED_SESSION , climber);
            response.sendRedirect(VUE2);

        } else {
            session.setAttribute(ATT_REGISTRED_SESSION , null);
            request.setAttribute(ATT_CLIMBER,climber);
            request.setAttribute(ATT_FORM,form);

            this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }
}
