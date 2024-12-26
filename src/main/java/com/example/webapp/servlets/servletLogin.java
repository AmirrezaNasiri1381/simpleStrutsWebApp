package com.example.webapp.servlets;

import com.example.webapp.Entities.Customer;
import com.example.webapp.Entities.Shop;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class servletLogin extends HttpServlet{
//


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Shop shop = Shop.instance();
        String username = request.getParameter("name");
        String passWord = request.getParameter("Pass");
        Customer[] customers = shop.initialUser();
        boolean usernameExists = shop.isUsernameExists(customers, username,passWord);
        if (usernameExists) {
            request.setAttribute("result", "ورود");
        } else {
            Customer[] customers1 = shop.addCustomer(username, passWord);
            request.setAttribute("error", "لطفا ابتدا ثبت نام کنید.");

        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }
    }



    public void destroy() {
    }
}
