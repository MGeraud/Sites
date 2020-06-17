package servlets;

import controller.InscriptionForm;
import entities.Climber;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/inscription")
public class Inscription extends HttpServlet {
    public static final String ATT_CLIMBER          = "climber";
    public static final String ATT_FORM          = "form";
    public static final String VUE          = "/WEB-INF/inscription.jsp";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InscriptionForm form = new InscriptionForm();

        Climber climber = form.createClimber(request);

        request.setAttribute(ATT_FORM,form);
        request.setAttribute(ATT_CLIMBER,climber);

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }
}
