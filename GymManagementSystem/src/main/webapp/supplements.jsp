<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Supplement Store</title>
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
      <li><a href="diet.jsp" class="nav-link"><i class="fas fa-carrot"> </i> DIET PLANS</a></li>
      <li><a href="supplements.jsp" class="nav-link active"><i class="fas fa-capsules"></i> SUPPLEMENTS</a></li>
      <li><a href="notifications.jsp" class="nav-link"><i class="fas fa-bell"></i> NOTIFICATIONS</a></li>
      <li><a href="LogoutServlet" class="nav-link"><i class="fas fa-sign-out-alt"></i> LOGOUT</a></li>
    </ul>
  </nav>

  <div class="container">
    <h1>💊 Recommended Supplements</h1>
    <div style="display: flex; flex-wrap: wrap; justify-content: center; gap: 20px; margin-top: 30px;">

      <!-- Card 1 -->
    <div class="cards" style="width: 250px;">
      <img src="images/nitrotech-whey.jpg" alt="NitroTech Whey Gold" class="product-img">
      <h3>NitroTech Whey Gold</h3>
      <p>30g protein per scoop • 1kg</p>
      <p><strong>₹3,199</strong></p>
      <a href="https://www.amazon.in/dp/B01M0HPXMX" target="_blank" class="buy-btn">Buy Now</a>
    </div>

    <!-- Card 2 -->
    <div class="cards" style="width: 250px;">
      <img src="images/bigmuscles-creatine.jpg" alt="BigMuscles Raw Creatine" class="product-img">
      <h3>BigMuscles Raw Creatine</h3>
      <p>Lab-tested • 250g</p>
      <p><strong>₹649</strong></p>
      <a href="https://www.amazon.in/dp/B07BNS8JMX" target="_blank" class="buy-btn">Buy Now</a>
    </div>

    <!-- Card 3 -->
    <div class="cards" style="width: 250px;">
     <img src="images/gnc-fishoil.jpg" alt="GNC Fish Oil Omega-3" class="product-img">
     <h3>GNC Fish Oil Omega‑3</h3>
     <p>60 softgels • heart support</p>
     <p><strong>₹899</strong></p>
     <a href="https://www.amazon.in/dp/B08FBS68Y8" target="_blank" class="buy-btn">Buy Now</a>
    </div>

      <!-- Card 4 -->
    <div class="cards" style="width: 250px;">
      <img src="images/fastup-bcaa.jpg" alt="Fast&Up BCAA Recovery" class="product-img">
      <h3>Fast&Up BCAA Recovery</h3>
      <p>Intra workout • 400g</p>
      <p><strong>₹1,199</strong></p>
      <a href="https://www.amazon.in/dp/B0758D6FZ6" target="_blank" class="buy-btn">Buy Now</a>
    </div>

     <!-- Card 5-->
    <div class="cards" style="width: 250px;">
      <img src="images/myprotein-multivitamin.jpg" alt="MyProtein Multivitamin Tabs" class="product-img">
      <h3>MyProtein Multivitamin Tabs</h3>
      <p>120 tablets • daily dose</p>
      <p><strong>₹999</strong></p>
      <a href="https://www.myprotein.co.in/sports-nutrition/alpha-men-multivitamin-tablets/10530421.html" target="_blank" class="buy-btn">Buy Now</a>
    </div>

    </div>
  </div>

</body>
</html>