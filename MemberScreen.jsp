<%@ page import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");
    if(username == null) {
        response.sendRedirect("MemberLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Account - Network Security Auditing</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="header">
    <h1>Welcome, <%= username %></h1>
</div>
<div class="menu">
    <a href="HomePage.jsp">Home</a>
    <a href="UpdateMemberDetails.jsp">Update Details</a>
    <a href="AuditNetwork.jsp">Audit Network</a>
    <a href="logout.jsp">Logout</a>
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
    <p>Username: <%= rs.getString("username") %></p>
    <p>Gender: <%= rs.getString("gender") %></p>
    <p>Contact No: <%= rs.getString("contactno") %></p>
    <p>Email: <%= rs.getString("email") %></p>
    <p>Address: <%= rs.getString("address") %></p>
<%
        }
        con.close();
    } catch(Exception e) {
%>
    <p>Error fetching details.</p>
<%
    }
%>
</div>
</body>
</html>