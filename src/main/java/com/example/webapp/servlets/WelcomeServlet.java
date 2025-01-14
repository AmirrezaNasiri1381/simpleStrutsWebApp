package com.example.webapp.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class WelcomeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Welcome.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("test");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Welcome.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }

}
