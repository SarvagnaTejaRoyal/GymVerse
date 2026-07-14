package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Member;

public class MemberDAO {

    public boolean addMember(Member member) {
        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO members(name, email, phone, fee_package, due_date) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, member.getName());
            ps.setString(2, member.getEmail());
            ps.setString(3, member.getPhone());
            ps.setString(4, member.getFeePackage());
            ps.setString(5, member.getDueDate());

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

    public List<Member> getAllMembers() {
        List<Member> members = new ArrayList<Member>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM members";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Member member = new Member();

                member.setId(rs.getInt("id"));
                member.setName(rs.getString("name"));
                member.setEmail(rs.getString("email"));
                member.setPhone(rs.getString("phone"));
                member.setFeePackage(rs.getString("fee_package"));
                member.setDueDate(rs.getString("due_date"));

                members.add(member);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return members;
    }

    public Member getMemberById(int id) {
        Member member = null;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM members WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                member = new Member();

                member.setId(rs.getInt("id"));
                member.setName(rs.getString("name"));
                member.setEmail(rs.getString("email"));
                member.setPhone(rs.getString("phone"));
                member.setFeePackage(rs.getString("fee_package"));
                member.setDueDate(rs.getString("due_date"));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return member;
    }

    public boolean updateMember(Member member) {
        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "UPDATE members SET name=?, email=?, phone=?, fee_package=?, due_date=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, member.getName());
            ps.setString(2, member.getEmail());
            ps.setString(3, member.getPhone());
            ps.setString(4, member.getFeePackage());
            ps.setString(5, member.getDueDate());
            ps.setInt(6, member.getId());

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

    public boolean deleteMember(int id) {
        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM members WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

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

    public Member getMemberByEmail(String email) {
        Member member = null;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM members WHERE email=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                member = new Member();

                member.setId(rs.getInt("id"));
                member.setName(rs.getString("name"));
                member.setEmail(rs.getString("email"));
                member.setPhone(rs.getString("phone"));
                member.setFeePackage(rs.getString("fee_package"));
                member.setDueDate(rs.getString("due_date"));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return member;
    }
}