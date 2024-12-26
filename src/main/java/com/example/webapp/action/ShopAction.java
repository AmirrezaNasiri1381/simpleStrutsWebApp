package com.example.webapp.action;

import com.example.webapp.Entities.Shop;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShopAction extends DispatchAction {
    public ActionForward unspecified(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return mapping.findForward("Show");
    }
    public ActionForward showOrderCart(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Shop shop = Shop.instance();
        String cart = request.getParameter("cart");
        if (cart != null && !cart.isEmpty()) {
  //  تبدیل رشته به آرایه و قرار دادن ارایه توی ارایه ایی کلاس order
            String[] cartItems = shop.initialOrderDetail(cart.split(","));
            request.setAttribute("cartItems", cartItems);
        } else {
            request.setAttribute("cartItems", new String[0]);
        }
        return mapping.findForward("Shop");
    }

}

