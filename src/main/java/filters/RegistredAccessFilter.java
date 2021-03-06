package filters;

import entities.Climber;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Filtre de restriction dáccès aux pages réservées aux utilisateurs enregistré
 */
@WebFilter(filterName = "RegistredAccessFilter" , urlPatterns = "/registred/*")
public class RegistredAccessFilter implements Filter {


    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        /* Cast de ServletRequest et ServletResponse en HttpServlet... */
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        /* récupération de l'attribut session utlisiateur pour vérifier si utilisateur enregistré
        * si oui continu sur page demandée , si non renvoi vers page d'accueil*/
        HttpSession session = request.getSession();
        Climber climber = (Climber) session.getAttribute("sessionUtilisateur");

        if (climber != null) {
            chain.doFilter(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

}
