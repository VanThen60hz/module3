package model;

import java.time.LocalDate;

public class Member {
    private String CMND;
    private String name;
    private LocalDate localDate;

    public Member() {
    }

    public Member(String CMND, String name, LocalDate localDate) {
        this.CMND = CMND;
        this.name = name;
        this.localDate = localDate;
    }

    public String getCMND() {
        return CMND;
    }

    public void setCMND(String CMND) {
        this.CMND = CMND;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getLocalDate() {
        return localDate;
    }

    public void setLocalDate(LocalDate localDate) {
        this.localDate = localDate;
    }
}
