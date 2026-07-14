<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Gym Management System</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="navstyles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</head>

<body class="home">



  <nav class="navbar">
    <div class="logo">
      <span>☕︎ GymVerse</span>
    </div>

    <ul class="nav-links">
      <li><a href="index.jsp" class="active nav-link"><i class="fas fa-home"></i> HOME</a></li>
      <li><a href="login.jsp?role=admin" class="nav-link"><i class="fas fa-user-shield"></i> ADMIN</a></li>
      <li><a href="login.jsp?role=member" class="nav-link"><i class="fas fa-user"></i> MEMBERS</a></li>
    </ul>
  </nav>

  <section class="hero-section">
    <div class="hero-content">
      <h1 class="headline">Welcome to <span class="highlight">GymVerse</span></h1>
      <p class="tagline">Where Strength Meets Smart Management</p>

      <p class="intro">
        Transform your fitness center with <strong>GymVerse</strong> —
        a smart platform to manage members, payments, due dates, diet plans,
        supplements and notifications.
      </p>

      <ul class="features-list">
        <li>Member Management</li>
        <li>Payment & Due Date Tracking</li>
        <li>Admin and Member Login</li>
        <li>Diet Plans and Supplements</li>
        <li>Notification Updates</li>
      </ul>
    </div>
  </section>

</body>
</html>