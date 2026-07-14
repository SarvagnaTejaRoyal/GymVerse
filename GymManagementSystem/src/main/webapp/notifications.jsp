<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Notifications</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="navstyles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  
</head>

<body>

  <nav class="navbar">
    <div class="logo"><span>☕ GymVerse</span></div>

    <ul class="nav-links">
      <li><a href="MemberDashboardServlet" class="nav-link"><i class="fas fa-user"></i> MEMBER DASHBOARD</a></li>
      <li><a href="diet.jsp" class="nav-link"><i class="fas fa-carrot"></i> DIET PLANS</a></li>
      <li><a href="supplements.jsp" class="nav-link"><i class="fas fa-capsules"></i> SUPPLEMENTS</a></li>
      <li><a href="notifications.jsp" class="nav-link active"><i class="fas fa-bell"></i> NOTIFICATIONS</a></li>
      <li><a href="LogoutServlet" class="nav-link"><i class="fas fa-sign-out-alt"></i> LOGOUT</a></li>
    </ul>
  </nav>

  <div class="container">
    <h2>📢 Gym Notifications</h2>

    <div class="notification-card">
      <h3>💳 Fee Reminder</h3>
      <p>Please pay your gym fee before the due date to avoid interruption.</p>
    </div>

    <div class="notification-card">
      <h3>⏰ Updated Timings</h3>
      <p>The gym is open from 5:00 AM to 10:00 PM (Mon–Sat).</p>
    </div>

    <div class="notification-card">
      <h3>🥗 Diet Plans Available</h3>
      <p>New diet plans are now available in the Diet section.</p>
    </div>

    <div class="notification-card">
      <h3>📌 General Notice</h3>
      <p>Please carry your ID card while entering the gym.</p>
    </div>

  </div>

</body>
</html>
</html>