<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Network Security Auditing</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="header">
    <h1>Login</h1>
</div>
<div class="content">
<%
    String message = "";
    if(request.getParameter("login") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/audit", "root", "your_password");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM members WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                session.setAttribute("username", username);
                response.sendRedirect("MemberScreen.jsp");
            } else {
                message = "Invalid Credentials!";
            }
            con.close();
        } catch(Exception e) {
            message = "Error: " + e.getMessage();
        }
    }
%>
<h2>Login</h2>
<form method="post" action="">
    <label>Username:</label>
    <input type="text" name="username" required />
    <label>Password:</label>
    <input type="password" name="password" required />
    <input type="submit" name="login" value="Login" />
</form>
<p style="color:red;"><%= message %></p>
<p><a href="index.html">Back to Home</a></p>
</div>
</body>
</html>