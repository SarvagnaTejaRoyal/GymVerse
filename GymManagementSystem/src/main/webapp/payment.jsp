	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String memberId = request.getParameter("id");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Payment Details</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="navstyles.css" />
</head>

<body>

  <nav class="navbar">
    <div class="logo"><span>☕︎ GymVerse</span></div>
  </nav>

  <div class="container">
    <h2>💳 Add / Update Payment</h2>

    <form action="AddPaymentServlet" method="post">

      <input type="hidden" name="memberId" value="<%= memberId %>" />

      <input type="number" name="amount" placeholder="Payment Amount" required />

      <input type="date" name="paymentDate" required />

      <input type="date" name="nextDueDate" required />

      <select name="status" required>
        <option value="">-- Select Payment Status --</option>
        <option value="Paid">Paid</option>
        <option value="Pending">Pending</option>
      </select>

      <div class="button-container">
        <button type="submit" id="submit">Save Payment</button>
        <button type="reset" id="reset">Reset</button>
      </div>

    </form>

    <br>
    <a href="ViewMembersServlet" class="buy-btn">Back to Members</a>
  </div>

</body>
</html>