package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Payment;

public class PaymentDAO {

    public boolean addPayment(Payment payment) {
        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO payments(member_id, amount, payment_date, next_due_date, status) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, payment.getMemberId());
            ps.setDouble(2, payment.getAmount());
            ps.setString(3, payment.getPaymentDate());
            ps.setString(4, payment.getNextDueDate());
            ps.setString(5, payment.getStatus());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public Payment getPaymentByMemberId(int memberId) {
        Payment payment = null;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM payments WHERE member_id=? ORDER BY id DESC LIMIT 1";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, memberId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                payment = new Payment();

                payment.setId(rs.getInt("id"));
                payment.setMemberId(rs.getInt("member_id"));
                payment.setAmount(rs.getDouble("amount"));
                payment.setPaymentDate(rs.getString("payment_date"));
                payment.setNextDueDate(rs.getString("next_due_date"));
                payment.setStatus(rs.getString("status"));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return payment;
    }
}