package java_classes;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class JoinMember {
    public static boolean registerMember(String username, String password, String gender, String contactno, String email, String address) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO members VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, gender);
            ps.setString(4, contactno);
            ps.setString(5, email);
            ps.setString(6, address);
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}