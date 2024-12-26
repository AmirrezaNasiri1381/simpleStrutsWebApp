package com.example.webapp.action;

import com.example.webapp.Entities.Customer;
import com.example.webapp.Entities.Shop;
import com.example.webapp.forms.LoginForm;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginAction extends DispatchAction {
    public ActionForward unspecified(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        LoginForm loginForm = (LoginForm) form;
        loginForm.setUsername("Amirreza");
        loginForm.setPassword("Amirreza@1234");
        return mapping.findForward("show");
    }

    public ActionForward Login(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        LoginForm loginForm = (LoginForm) form;
        String userName = loginForm.getUsername();
        String password=loginForm.getPassword();
        boolean checkUser = checkUser(userName, password);
        if(checkUser) {
            return mapping.findForward("welcomePage");
        }else {
            return mapping.findForward("register");
        }
    }
    public boolean checkUser(String name ,String pass){
        Shop shop = Shop.instance();
        Customer[] customers = shop.initialUser();
        return shop.isUsernameExists(customers, name, pass);
    }
}
