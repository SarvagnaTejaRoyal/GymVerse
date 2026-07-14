package model;

public class Member {
    private int id;
    private String name;
    private String email;
    private String phone;
    private String feePackage;
    private String dueDate;

    public Member() {
    }

    public Member(int id, String name, String email, String phone, String feePackage, String dueDate) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.feePackage = feePackage;
        this.dueDate = dueDate;
    }

    public Member(String name, String email, String phone, String feePackage, String dueDate) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.feePackage = feePackage;
        this.dueDate = dueDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    

    public String getFeePackage() {
        return feePackage;
    }

    public void setFeePackage(String feePackage) {
        this.feePackage = feePackage;
    }
    

    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }
}