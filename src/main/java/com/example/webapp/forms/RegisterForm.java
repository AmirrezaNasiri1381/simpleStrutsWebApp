package com.example.webapp.forms;

import org.apache.struts.action.ActionForm;

public class RegisterForm extends ActionForm {
    private String username;
    private String password;
    private  String method;

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
