package com.example.webapp.Entities;

public class Shop {
    private Customer[] customers = new Customer[5];


    private static Shop shop;


    private Shop() {

    }

    public static Shop instance() {

        if (shop == null) {
            shop = new Shop();
        }
        return shop;
    }

    int len = getCustomers().length;


    public Customer[] getCustomers() {
        return customers;
    }

    public void setCustomers(Customer[] customers) {
        this.customers = customers;
    }

    public Customer[] initialUser() {

        customers[0] = new Customer("user", "A123456a@");
        return customers;
    }

    public String[] initialOrderDetail(String[] userOrder) {
        Order order = new Order();
        order.setCartItems(userOrder);
        return order.getCartItems();
    }

    public Customer[] addCustomer(String name, String password) {

        Customer newCustomer = new Customer(name, password);
        getCustomers()[len - 1] = newCustomer;
        return getCustomers();
    }


    public boolean isUsernameExists(Customer[] customers, String name, String password) {
        if (customers == null) {
            return false;
        }

        for (int i = 0; i < customers.length; i++) {

            if (customers[i] != null && customers[i].getName().equals(name) && customers[i].getPassword().equals(password)) {
                System.out.println("there is such customer");
                return true;
            }
        }

        return false;
    }

}
