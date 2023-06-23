package model;

import java.time.LocalDate;

public class Household {
    private String id;
    private String name;
    private int quantity;
    private String dateOfRegistration;
    private String address;

    public Household() {
    }

    public Household(String id, String name, int quantity, String dateOfRegistration, String address) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.dateOfRegistration = dateOfRegistration;
        this.address = address;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDateOfRegistration() {
        return dateOfRegistration;
    }

    public void setDateOfRegistration(String dateOfRegistration) {
        this.dateOfRegistration = dateOfRegistration;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
