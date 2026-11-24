
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;

public class UserDAO {

    public User login(String email, String password, String role) {

        User user = null;

        try {
            Connection con = DBConnection.getConnection();

            if (con == null) {
                return null;
            }

            String sql = "SELECT * FROM users WHERE email=? AND role=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, role);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String storedPassword = rs.getString("password");

                if (PasswordUtilDAO.verifyPassword(password, storedPassword)) {

                    user = new User();

                    user.setId(rs.getInt("id"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(storedPassword);
                    user.setRole(rs.getString("role"));
                    user.setMustChangePassword(
                            rs.getBoolean("must_change_password"));

                    // Upgrade old plain-text passwords after successful login.
                    if (!storedPassword.startsWith("PBKDF2$")) {

                        String updateSql =
                                "UPDATE users SET password=? WHERE id=?";

                        PreparedStatement update =
                                con.prepareStatement(updateSql);

                        update.setString(
                                1, PasswordUtilDAO.hashPassword(password));

                        update.setInt(2, user.getId());

                        update.executeUpdate();
                        update.close();
                    }
                }
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean changePassword(
            String email, String currentPassword, String newPassword) {

        try {
            Connection con = DBConnection.getConnection();

            if (con == null) {
                return false;
            }

            String checkSql =
                    "SELECT id, password FROM users " +
                    "WHERE email=? AND role='member'";

            PreparedStatement check = con.prepareStatement(checkSql);
            check.setString(1, email);

            ResultSet rs = check.executeQuery();

            if (!rs.next()) {
                rs.close();
                check.close();
                con.close();
                return false;
            }

            int userId = rs.getInt("id");
            String storedPassword = rs.getString("password");

            rs.close();
            check.close();

            if (!PasswordUtilDAO.verifyPassword(
                    currentPassword, storedPassword)) {

                con.close();
                return false;
            }

            String updateSql =
                    "UPDATE users SET password=?, " +
                    "must_change_password=0 WHERE id=?";

            PreparedStatement update = con.prepareStatement(updateSql);

            update.setString(
                    1, PasswordUtilDAO.hashPassword(newPassword));

            update.setInt(2, userId);

            boolean changed = update.executeUpdate() > 0;

            update.close();
            con.close();

            return changed;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
