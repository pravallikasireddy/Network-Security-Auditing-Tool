<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Network Audit</title>
    <link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="header">
    <h1>Network Security Scan</h1>
</div>
<div class="menu">
    <a href="HomePage.jsp">Home</a>
</div>
<div class="content">
<%
    String ipRange = request.getParameter("ipRange");
    String scanResult = "";
    if(ipRange != null && !ipRange.isEmpty()) {
        // Example: Simulate network scan
        scanResult = "Scanning network range: " + ipRange + "<br/>";
        // Placeholder for real scan logic
        scanResult += "Open ports found: 22, 80, 443<br/>";
        scanResult += "No vulnerabilities detected.";
    }
%>
<h2>Perform Network Scan</h2>
<form method="get" action="">
    <label>IP Range (e.g., 192.168.1.1-255):</label>
    <input type="text" name="ipRange" required />
    <input type="submit" value="Scan" />
</form>
<div style="margin-top:20px;">
    <h3>Scan Results:</h3>
    <p><%= scanResult %></p>
</div>
</div>
</body>
</html>