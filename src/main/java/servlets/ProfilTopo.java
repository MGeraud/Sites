package servlets;

import dao.Dao;
import dao.DaoFactory;
import entities.Climber;
import entities.Topo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/profil_topo")
public class ProfilTopo extends HttpServlet {

    private static final String VUE                     ="/WEB-INF/registred/profil_topo.jsp";
    public static final String ATT_REGISTRED_SESSION    ="sessionUtilisateur";

    private final Dao<Topo> topoDao = DaoFactory.getTopoDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * récupération et mise en session de la liste des topos de l'utilisateur connecté
         */
        HttpSession session = request.getSession();
        Climber climber = (Climber) session.getAttribute(ATT_REGISTRED_SESSION);
        String email = climber.getEmail();
        List<Topo> topos = topoDao.findByString(email);
        request.setAttribute("topos" , topos);

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }
}
