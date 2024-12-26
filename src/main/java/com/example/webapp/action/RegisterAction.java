package com.example.webapp.action;

import com.example.webapp.Entities.Customer;
import com.example.webapp.Entities.Shop;
import com.example.webapp.forms.RegisterForm;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterAction extends DispatchAction {
    public ActionForward unspecified(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        return mapping.findForward("register");
    }

  public ActionForward Register(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      RegisterForm registerForm = (RegisterForm) form;
      String username = registerForm.getUsername();
      String password = registerForm.getPassword();
      if(username!=null && password!=null) {
          boolean isExistUser = checkUser(username, password);
          ActionMessages messages = new ActionMessages();
          if (isExistUser) {
              //مشخص کردن پیغام کاربر موجود است
              request.setAttribute("isValid", "true");
              return mapping.findForward("register");
          } else {
              addUser(username, password);
              request.setAttribute("isNotValid", "true");
              //نشون دادن اینکه کاربر با موفقیت ثب نام شده
              return mapping.findForward("register");
          }
      }else {
          return mapping.findForward("register");
      }
  }

    public boolean checkUser(String name ,String pass){
        Shop shop = Shop.instance();
        Customer[] customers = shop.initialUser();
        return shop.isUsernameExists(customers, name, pass);
    }
    public void addUser(String name, String password){
        Shop shop = Shop.instance();
        Customer[] customers = shop.addCustomer(name, password);
    }
}
