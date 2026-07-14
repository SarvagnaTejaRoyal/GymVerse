<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String role = request.getParameter("role");
  if (role == null) {
      role = "member";
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <link rel="stylesheet" href="style.css" />
</head>

<body>

  <div class="container">
    <h2>
      <%= role.equals("admin") ? "Admin Login" : "Member Login" %>
    </h2>

    <form action="LoginServlet" method="post">
      <input type="email" name="email" placeholder="Email Address" required />

      <input type="password" name="password" placeholder="Password" required />

      <input type="hidden" name="role" value="<%= role %>" />

      <button type="submit">Login</button>
    </form>

    <p class="error-msg">
      <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>
    </p>

    <p class="back-home" style="margin-top: 20px;">
      Back to <a href="index.jsp"><b>Home</b></a>
    </p>
  </div>

</body>
</html>