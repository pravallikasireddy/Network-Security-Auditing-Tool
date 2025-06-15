<%@ page import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");
    if(username == null) {
        response.sendRedirect("MemberLogin.jsp");
        return;
    }
    String message = "";
    if(request.getParameter("update") != null) {
        String gender = request.getParameter("gender");
        String contactno = request.getParameter("contactno");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/audit", "root", "your_password");
            PreparedStatement ps = con.prepareStatement("UPDATE members SET gender=?, contactno=?, email=?, address=? WHERE username=?");
            ps.setString(1, gender);
            ps.setString(2, contactno);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setString(5, username);
            int i = ps.executeUpdate();
            if(i > 0) {
                message = "Details updated successfully.";
            }
            con.close();
        } catch(Exception e) {
            message = "Error: " + e.getMessage();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Details - Network Security Auditing</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="header">
    <h1>Update Your Details</h1>
</div>
<div class="content">
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/audit", "root", "your_password");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM members WHERE username=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
%>
<form method="post" action="">
    <label>Gender:</label>
    <input type="text" name="gender" value="<%= rs.getString("gender") %>" required />
    <label>Contact No:</label>
    <input type="tel" name="contactno" value="<%= rs.getString("contactno") %>" required />
    <label>Email:</label>
    <input type="email" name="email" value="<%= rs.getString("email") %>" required />
    <label>Address:</label>
    <input type="text" name="address" value="<%= rs.getString("address") %>" required />
    <input type="submit" name="update" value="Update" />
</form>
<%
        }
        con.close();
    } catch(Exception e) {
%>
<p>Error fetching details.</p>
<%
    }
%>
<p style="color:green;"><%= message %></p>
<p><a href="HomePage.jsp">Back to Home</a></p>
</div>
</body>
</html>