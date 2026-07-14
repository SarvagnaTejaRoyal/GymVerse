<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Diet Plans</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="navstyles.css" />
  <link rel="stylesheet" href="styling.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  
</head>

<body>

  <nav class="navbar">
    <div class="logo"><span>☕︎ GymVerse</span></div>

    <ul class="nav-links">
      <li><a href="MemberDashboardServlet" class="nav-link"><i class="fas fa-user"></i> MEMBER DASHBOARD</a></li>
      <li><a href="diet.jsp" class="nav-link active"><i class="fas fa-carrot"></i> DIET PLANS</a></li>
      <li><a href="supplements.jsp" class="nav-link"><i class="fas fa-capsules"></i> SUPPLEMENTS</a></li>
      <li><a href="notifications.jsp" class="nav-link"><i class="fas fa-bell"></i> NOTIFICATIONS</a></li>
      <li><a href="LogoutServlet" class="nav-link"><i class="fas fa-sign-out-alt"></i> LOGOUT</a></li>
    </ul>
  </nav>

  <div class="container">
    <h2>🥗 Diet & Nutrition Plans</h2>

    <div class="grid">

   <div class="card-container">
      <!-- Beginner -->
      <div class="diet-card" style="background-image: url('images/beginer.jpg');">
        <div class="diet-overlay">
          <h3>🌱 Beginner Plan</h3>
          <p>🥣 <strong>Breakfast:</strong> Poha + Boiled Egg + Fruit</p>
          <p>🍛 <strong>Lunch:</strong> Dal + Brown Rice + Veg Curry</p>
          <p>🍽️ <strong>Dinner:</strong> Moong Soup + 2 Chapatis + Salad</p>
        </div>
      </div>

      <!-- Muscle Gain -->
      <div class="diet-card" style="background-image: url('images/muscle.jpg');">
        <div class="diet-overlay">
          <h3>💪 Muscle Gain Plan</h3>
          <p>🥣 <strong>Breakfast:</strong> 6 Egg Whites + Oats + Banana</p>
          <p>🍛 <strong>Lunch:</strong> Chicken + Quinoa + Avocado</p>
          <p>🍽️ <strong>Dinner:</strong> Grilled Salmon + Broccoli</p>
        </div>
      </div>

      <!-- Fat Loss -->
      <div class="diet-card" style="background-image: url('images/fatloss.jpg');">
        <div class="diet-overlay">
          <h3>🔥 Fat Loss Plan</h3>
          <p>🥣 <strong>Breakfast:</strong> Black Coffee + Eggs + Apple</p>
          <p>🍛 <strong>Lunch:</strong> Grilled Tofu + Veggies</p>
          <p>🍽️ <strong>Dinner:</strong> Zucchini Noodles + Soup</p>
        </div>
      </div>
	</div>
    </div>
  </div>

</body>
</html>