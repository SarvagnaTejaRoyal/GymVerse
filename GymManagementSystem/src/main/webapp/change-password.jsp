
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session == null
            || session.getAttribute("userEmail") == null
            || !"member".equals(session.getAttribute("userRole"))) {

        response.sendRedirect("login.jsp?role=member");
        return;
    }

    boolean firstLogin = Boolean.TRUE.equals(
            session.getAttribute("mustChangePassword"));

    String errorMessage =
            (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

    <title>Change Password - GymVerse</title>

    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="navstyles.css">

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</head>

<body>

    <nav class="navbar">

        <div class="logo">
            <span>☕︎ GymVerse</span>
        </div>

        <ul class="nav-links">
            <li>
                <a href="LogoutServlet" class="nav-link">
                    <i class="fas fa-sign-out-alt"></i> LOGOUT
                </a>
            </li>
        </ul>

    </nav>

    <div class="container">

        <h2>
            <%= firstLogin
                    ? "Set Your New Password"
                    : "Change Password" %>
        </h2>

        <% if (firstLogin) { %>

            <p>
                You are using the default password.
                Please create a new password to continue
                to your dashboard.
            </p>

        <% } else { %>

            <p>
                Enter your current password and choose
                a new password.
            </p>

        <% } %>

        <% if (errorMessage != null) { %>

            <p style="color: #ff7777;">
                <%= errorMessage %>
            </p>

        <% } %>

        <form action="ChangePasswordServlet" method="post">

            <input
                type="password"
                name="currentPassword"
                placeholder="Current password"
                required>

            <input
                type="password"
                name="newPassword"
                placeholder="New password (at least 8 characters)"
                minlength="8"
                required>

            <input
                type="password"
                name="confirmPassword"
                placeholder="Confirm new password"
                minlength="8"
                required>

            <button type="submit">
                Update Password
            </button>

        </form>

    </div>

</body>
</html>
