package java_classes;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UpdateMemberDetails {
    public static boolean updateDetails(String username, String gender, String contactno, String email, String address) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("UPDATE members SET gender=?, contactno=?, email=?, address=? WHERE username=?");
            ps.setString(1, gender);
            ps.setString(2, contactno);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setString(5, username);
            int i = ps.executeUpdate();
            return i > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}