<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <title>Admin Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="navstyles.css" />

</head>


<body>


  <nav class="navbar">
    <div class="logo">
      <span>☕︎ GymVerse</span>
    </div>

    <ul class="nav-links">
      <li><a href="admin-dashboard.jsp" class="nav-link active"><i class="fas fa-user"></i> ADD MEMBER</a></li>
      <li><a href="ViewMembersServlet" class="nav-link"><i class="fas fa-users"></i> VIEW MEMBERS</a></li>
      <li><a href="LogoutServlet" class="nav-link"><i class="fas fa-sign-out-alt"></i> LOGOUT</a></li>
    </ul>
  </nav>

  <div class="container">
    <h2>👤 Add New Member</h2>

    <form action="AddMemberServlet" method="post">

      <input type="text" name="name" placeholder="Full Name" required />

      <input type="email" name="email" placeholder="Email Address" required />

      <input type="text" name="phone" placeholder="Phone Number" required />

      <select name="feePackage" required>
        <option value="">-- Select Fee Package --</option>
		<option value="Rs.999/month">Rs.999 – 1 Month</option>
		<option value="Rs.2500/3 months">Rs.2500 – 3 Months</option>
		<option value="Rs.5500/6 months">Rs.5500 – 6 Months</option>
		<option value="Rs.10000/yearly">Rs.10000 – 1 Year</option>
      </select>

      <input type="date" name="dueDate" required />

      <div class="button-container">
        <button type="submit" id="submit">Add Member</button>
        <button type="reset" id="reset">Reset</button>
      </div>

    </form>
  </div>

</body>
</html>