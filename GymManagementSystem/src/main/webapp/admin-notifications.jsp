<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Post Notifications</title>
  <meta charset="UTF-8">

  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="navstyles.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  
</head>

<body>

<nav class="navbar">
  <div class="logo"><span>☕︎ GymVerse</span></div>
    <ul class="nav-links">
      <li><a href="admin-dashboard.jsp" class="nav-link active"><i class="fas fa-user"></i> ADD MEMBER</a></li>
      <li><a href="ViewMembersServlet" class="nav-link"><i class="fas fa-users"></i> VIEW MEMBERS</a></li>
      <li><a href="admin-notifications.jsp" class="nav-link"><i class="fas fa-bell"></i> POST NOTIFICATION</a></li>
	  <li><a href="LogoutServlet" class="nav-link"><i class="fas fa-sign-out-alt"></i> LOGOUT</a></li>
    </ul>
</nav>

  <div class="container">
    <h2>📢 Post a Notification</h2>
    <form id="noticeForm">
      <input type="text" id="title" placeholder="Title" required />
      <textarea id="message" placeholder="Message" rows="4" required style="width: 80%; border-radius:8px;"></textarea>
      <button type="submit" id="PostNotification">Post Notification</button>
    </form>

    <h2 style="margin-top: 40px;">📬 All Notifications</h2>
    <ul id="noticeList" class="list"></ul>
  </div>

  <!-- Firebase -->
  <script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js"></script>
  <script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-database.js"></script>
  <script src="https://www.gstatic.com/firebasejs/8.10.0/firebase-firestore.js"></script>

  <script src="firebase-config.js"></script>

  <script>
    const db = firebase.database();
    const noticeForm = document.getElementById("noticeForm");
    const noticeList = document.getElementById("noticeList");

    noticeForm.addEventListener("submit", (e) => {
      e.preventDefault();
      const title = document.getElementById("title").value;
      const message = document.getElementById("message").value;

      db.ref("notifications").push({ title, message, time: Date.now() });
      noticeForm.reset();
    });

    db.ref("notifications").on("value", (snapshot) => {
      noticeList.innerHTML = "";
      snapshot.forEach((child) => {
        const n = child.val();
        const date = new Date(n.time).toLocaleString();
        noticeList.innerHTML += `
          <li class="card">
            <strong>${n.title}</strong><br>
            ${n.message}<br>
            <small>🕒 ${date}</small>
            <button class="delete-btn" onclick="deleteNotification('${child.key}')">🗑 Delete</button>
          </li>`;
      });
    });

    function deleteNotification(id) {
      db.ref("notifications/" + id).remove();
    }

  </script>
  </body>
</html>