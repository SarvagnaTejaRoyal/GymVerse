<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.Member" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>View Members</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="navstyles.css" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

  <nav class="navbar">
    <div class="logo">
      <span>☕︎ GymVerse</span>
    </div>

    <ul class="nav-links">
      <li><a href="admin-dashboard.jsp" class="nav-link"><i class="fas fa-user"></i> ADD MEMBER</a></li>
      <li><a href="ViewMembersServlet" class="nav-link active"><i class="fas fa-users"></i> VIEW MEMBERS</a></li>
      <li><a href="LogoutServlet" class="nav-link"><i class="fas fa-sign-out-alt"></i> LOGOUT</a></li>
    </ul>
  </nav>

  <div class="container">
    <h2>📋 All Members</h2>
<div class="container table-container">
<table class="member-table">
  <tr>
    <th class="col-id">ID</th>
    <th class="col-name">Name</th>
    <th class="col-email">Email</th>
    <th class="col-phone">Phone</th>
    <th class="col-fee">Fee Package</th>
    <th class="col-date">Due Date</th>
    <th class="col-actions">Actions</th>
  </tr>

  <%
    List<Member> members = (List<Member>) request.getAttribute("members");

    if (members != null) {
      for (Member m : members) {
  %>

  <tr>
    <td><%= m.getId() %></td>
    <td><%= m.getName() %></td>
    <td><%= m.getEmail() %></td>
    <td><%= m.getPhone() %></td>
    <td><%= m.getFeePackage() %></td>
    <td><%= m.getDueDate() %></td>

    <td>
      <a href="EditMemberServlet?id=<%= m.getId() %>" class="edit-btn">Edit</a>

      <a href="payment.jsp?id=<%= m.getId() %>" class="payment-btn">Payment</a>
      <a href="DeleteMemberServlet?id=<%= m.getId() %>"
         class="delete-btn"
         onclick="return confirm('Are you sure you want to delete this member?')">
         Delete
      </a>
    </td>
  </tr>

  <%
      }
    }
  %>
</table>
</div>
    <a href="admin-dashboard.jsp" class="buy-btn">Back to Admin Dashboard</a>
  </div>

</body>
</html>