package com.example.webapp.forms;

import org.apache.struts.action.ActionForm;

public class ShopForm extends ActionForm {
    private String[] cartData;
    private String cart;

    private String method;
    public String getCart() {
        return cart;
    }

    public void setCart(String cart) {
        this.cart = cart;
    }



    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String[] getCartData() {
        return cartData;
    }

    public void setCartData(String[] cartData) {
        this.cartData = cartData;
    }
}


