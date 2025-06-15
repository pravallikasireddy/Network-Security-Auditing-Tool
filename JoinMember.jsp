<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Network Security Auditing</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="header">
    <h1>Register</h1>
</div>
<div class="content">
<%
    String message = "";
    if(request.getParameter("submit") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String contactno = request.getParameter("contactno");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/audit", "root", "your_password");
            PreparedStatement ps = con.prepareStatement("INSERT INTO members VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, gender);
            ps.setString(4, contactno);
            ps.setString(5, email);
            ps.setString(6, address);
            int i = ps.executeUpdate();
            if(i > 0) {
                message = "Registration successful!";
            }
            con.close();
        } catch(Exception e) {
            message = "Error: " + e.getMessage();
        }
    }
%>
<h2>Register</h2>
<form method="post" action="">
    <label>Username:</label>
    <input type="text" name="username" required />
    <label>Password:</label>
    <input type="password" name="password" required />
    <label>Gender:</label>
    <input type="text" name="gender" required />
    <label>Contact No:</label>
    <input type="tel" name="contactno" required />
    <label>Email:</label>
    <input type="email" name="email" required />
    <label>Address:</label>
    <input type="text" name="address" required />
    <input type="submit" name="submit" value="Register" />
</form>
<p style="color:green;"><%= message %></p>
<p><a href="index.html">Back to Home</a></p>
</div>
</body>
</html>