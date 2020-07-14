package servlets;

import controller.IdentificationForm;
import entities.Climber;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Identification" ,urlPatterns = "/login")
public class Identification extends HttpServlet {
    public static final String ATT_CLIMBER              = "climber";
    public static final String ATT_REGISTRED_SESSION    ="sessionUtilisateur";
    public static final String ATT_FORM                 = "form";
    public static final String VUE                      = "/WEB-INF/public/login.jsp";
    public static final String VUE2                     = "/WEB-INF/public/index.jsp";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /* traitement du formulaire d'identification d'utilisateur*/
        IdentificationForm form = new IdentificationForm();
        Climber climber = form.createRegistredClimber(request);

        /* mise en session du grimpeur si reconnu via formulaire d'identification , sinon envoi de null en session*/
        HttpSession session = request.getSession();

        if (form.getErrors().isEmpty() && climber!= null) {
            session.setAttribute(ATT_REGISTRED_SESSION , climber);
        } else {
            session.setAttribute(ATT_REGISTRED_SESSION , null);
        }
        /* mise en scope request form et climber pour pouvoir récupérer la map d'erreur et préremplir champs */
        request.setAttribute(ATT_FORM,form);
        request.setAttribute(ATT_CLIMBER,climber);

        this.getServletContext().getRequestDispatcher(VUE2).forward(request,response);

    }


}
