package model;

import java.time.LocalDate;

public class Customer {
    private int id;
    private String fullName;
    private LocalDate birthday;
    private Boolean gender;
    private String identifyNumber;
    private String phone;
    private String email;
    private String address;
    private int customerTypeId;
    private CustomerType customerType;

    public Customer() {
    }

    public Customer(int id, String fullName, LocalDate birthday, Boolean gender, String identifyNumber, String phone, String email, String address, int customerTypeId, CustomerType customerType) {
        this.id = id;
        this.fullName = fullName;
        this.birthday = birthday;
        this.gender = gender;
        this.identifyNumber = identifyNumber;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.customerTypeId = customerTypeId;
        this.customerType = customerType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getIdentifyNumber() {
        return identifyNumber;
    }

    public void setIdentifyNumber(String identifyNumber) {
        this.identifyNumber = identifyNumber;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCustomerTypeId() {
        return customerTypeId;
    }

    public void setCustomerTypeId(int customerTypeId) {
        this.customerTypeId = customerTypeId;
    }

    public CustomerType getCustomerType() {
        return customerType;
    }

    public void setCustomerType(CustomerType customerType) {
        this.customerType = customerType;
    }
}
