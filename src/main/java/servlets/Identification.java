package servlets;

import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Identification" ,urlPatterns = "/login")
public class Identification extends HttpServlet {

    public static final String VUE              = "/WEB-INF/login.jsp";
    public static final String VUE2             = "/inscription";

    private UserDao identificationDao;

    public void init() {
        identificationDao = new UserDao();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.getServletContext().getRequestDispatcher(VUE).forward(request,response);
    }
}
