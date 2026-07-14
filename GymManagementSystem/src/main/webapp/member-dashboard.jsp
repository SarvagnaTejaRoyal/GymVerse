<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Member" %>
<%@ page import="model.Payment" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>

<%
  Member member = (Member) request.getAttribute("member");
  Payment payment = (Payment) request.getAttribute("payment");

  long daysLeft = 0;

  if (payment != null && payment.getNextDueDate() != null) {
      LocalDate dueDate = LocalDate.parse(payment.getNextDueDate());
      LocalDate today = LocalDate.now();
      daysLeft = ChronoUnit.DAYS.between(today, dueDate);
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Member Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="navstyles.css" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  
</head>

<body>

  <nav class="navbar">
    <div class="logo"><span>☕︎ GymVerse</span></div>

    <ul class="nav-links">
      <li><a href="MemberDashboardServlet" class="nav-link active"><i class="fas fa-user"></i> MEMBER DASHBOARD</a></li>
      <li><a href="diet.jsp" class="nav-link"><i class="fas fa-carrot"></i> DIET PLANS</a></li>
      <li><a href="supplements.jsp" class="nav-link"><i class="fas fa-capsules"></i> SUPPLEMENTS</a></li>
      <li><a href="notifications.jsp" class="nav-link"><i class="fas fa-bell"></i> NOTIFICATIONS</a></li>
      <li><a href="LogoutServlet" class="nav-link"><i class="fas fa-sign-out-alt"></i> LOGOUT</a></li>
    </ul>
  </nav>

  <div class="container">
    <h2>📅 Your Gym Details</h2>

    <% if (member != null) { %>

      <div class="card">
        <h3><%= member.getName() %></h3>
        <p>Email: <%= member.getEmail() %></p>
        <p>Phone: <%= member.getPhone() %></p>
        <p>Fee Package: <%= member.getFeePackage() %></p>
        <p>Due Date: <%= member.getDueDate() %></p>
      </div>

    <% } else { %>

      <div class="card">
        <p>No member details found.</p>
      </div>

    <% } %>

    <h2>💳 Payment Status</h2>

    <% if (payment != null) { %>

      <div class="card">
        <p>Amount Paid: ₹<%= payment.getAmount() %></p>
        <p>Payment Date: <%= payment.getPaymentDate() %></p>
        <p>Next Due Date: <%= payment.getNextDueDate() %></p>
        <p>Status: <%= payment.getStatus() %></p>

        <% if (daysLeft > 0) { %>
          <p style="color: lightgreen;">⏳ <%= daysLeft %> day(s) left</p>
        <% } else { %>
          <p style="color: red;">⚠️ Payment Due!</p>
        <% } %>
      </div>

    <% } else { %>

      <div class="card">
        <p>No payment details available.</p>
      </div>

    <% } %>

  </div>

</body>
</html>