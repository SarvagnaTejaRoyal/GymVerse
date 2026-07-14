<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Member" %>

<%
  Member member = (Member) request.getAttribute("member");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Edit Member</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="navstyles.css" />
</head>

<body>

  <nav class="navbar">
    <div class="logo"><span>☕︎ GymVerse</span></div>

  </nav>

  <div class="container">
    <h2>✏️ Edit Member</h2>

    <form action="UpdateMemberServlet" method="post">

      <input type="hidden" name="id" value="<%= member.getId() %>" />

      <input type="text" name="name" value="<%= member.getName() %>" required />

      <input type="email" name="email" value="<%= member.getEmail() %>" required />

      <input type="text" name="phone" value="<%= member.getPhone() %>" required />

      <select name="feePackage" required>
        <option value="Rs.999/month" <%= member.getFeePackage().equals("Rs.999/month") ? "selected" : "" %>>
          Rs.999 – 1 Month
        </option>

        <option value="Rs.2500/3 months" <%= member.getFeePackage().equals("Rs.2500/3 months") ? "selected" : "" %>>
          Rs.2500 – 3 Months
        </option>

        <option value="Rs.5500/6 months" <%= member.getFeePackage().equals("Rs.5500/6 months") ? "selected" : "" %>>
          Rs.5500 – 6 Months
        </option>

        <option value="Rs.10000/yearly" <%= member.getFeePackage().equals("Rs.10000/yearly") ? "selected" : "" %>>
          Rs.10000 – 1 Year
        </option>
      </select>

      <input type="date" name="dueDate" value="<%= member.getDueDate() %>" required />

      <div class="button-container">
        <button type="submit" id="submit">Update</button>
        <button type="reset" id="reset">Reset</button>
      </div>

    </form>

    <br>
    <a href="ViewMembersServlet" class="buy-btn">Back to Members</a>
  </div>

</body>
</html>