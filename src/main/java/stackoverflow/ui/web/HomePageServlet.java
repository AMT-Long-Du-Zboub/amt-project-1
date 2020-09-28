package stackoverflow.ui.web;
import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="HomePageServlet", urlPatterns = "/")
public class HomePageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Initially, you simply forward the request to the correspond JSP.
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
