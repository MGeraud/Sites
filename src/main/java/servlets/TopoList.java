package servlets;

import controller.FindTopos;
import dao.ClimberDao;
import dao.Dao;
import dao.DaoFactory;
import entities.Place;
import entities.Topo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/topo_list")
public class TopoList extends HttpServlet {
    private static final String VUE                     ="/WEB-INF/registred/topo_list.jsp";
    private static final String ATT_SELECTED_TOPOS      ="selected_topos";
    private final Dao<Topo> dao = DaoFactory.getTopoDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        FindTopos findTopos = new FindTopos();
        List<Topo> selectedTopos = findTopos.getSelectedTopos(request);
        request.setAttribute(ATT_SELECTED_TOPOS,selectedTopos);
        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);

}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * récupération et mise en session de la liste des topos pour y accèder en liste déroulante
         */
        List<Topo> topos = dao.findAll();
        HttpSession session = request.getSession();
        session.setAttribute("topos" , topos);

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }
}
