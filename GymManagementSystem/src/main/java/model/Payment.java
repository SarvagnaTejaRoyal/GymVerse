package model;

public class Payment {
    private int id;
    private int memberId;
    private double amount;
    private String paymentDate;
    private String nextDueDate;
    private String status;

    public Payment() {
    }

    public Payment(int id, int memberId, double amount, String paymentDate, String nextDueDate, String status) {
        this.id = id;
        this.memberId = memberId;
        this.amount = amount;
        this.paymentDate = paymentDate;
        this.nextDueDate = nextDueDate;
        this.status = status;
    }

    public Payment(int memberId, double amount, String paymentDate, String nextDueDate, String status) {
        this.memberId = memberId;
        this.amount = amount;
        this.paymentDate = paymentDate;
        this.nextDueDate = nextDueDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }


    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }


    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }


    public String getNextDueDate() {
        return nextDueDate;
    }

    public void setNextDueDate(String nextDueDate) {
        this.nextDueDate = nextDueDate;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}