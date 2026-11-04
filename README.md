# ☕︎ GymVerse - Gym Management System

GymVerse is a comprehensive dynamic Java Web Application engineered using the MVC (Model-View-Controller) architecture pattern. It provides a streamlined, professional digital environment for fitness centers to efficiently onboard members, process packages, track payment histories, distribute static nutrition guides, and push real-time updates directly to automated subscriber terminals.

---

## 🚀 Key Features

### 👤 Administrator Features
*   **Member Management:** Seamlessly register new members by recording full names, contact emails, phone numbers, localized package terms, and specific dynamic due dates.
*   **Member Registry Dashboard:** Access a real-time data table listing all current members with complete administrative action hooks to edit profile details or execute deletions with cascading constraints.
*   **Payment Tracking:** Log incoming transaction entries by assigning specific figures, date fields, target billing cycles, and payment statuses (Paid/Pending) mapped to distinct user keys.
*   **Notice Board Distribution:** Broadcast structural alerts and management updates directly using integrated cloud databases.

### 🏋️ Member Workspace Features
*   **Subscription Details:** Personalized panels display upcoming membership renewal milestones alongside real-time calculated day-countdown indicators.
*   **Payment Ledger View:** View individual billing history blocks indicating exact transaction amounts, timestamps, and current structural standing.
*   **Diet & Supplement Guides:** Explore specific structured target visual cards containing categorized wellness strategies (e.g., Beginner, Muscle Gain, Fat Loss) paired with direct recommended supplement catalog checkouts.

---

## 🛠️ Technology Stack

*   **Backend Core:** Java Development Kit (JDK 8+), Java Servlets, JSP (JavaServer Pages)
*   **Database Management:** MySQL Server, JDBC (Java Database Connectivity)
*   **Real-time Infrastructure:** Firebase Web SDK, Firebase Realtime Database API
*   **Frontend Interface:** Modern HTML5, Responsive CSS3 Grid systems, FontAwesome Vector Icons
*   **IDE Context:** Eclipse IDE for Enterprise Java Developers

---

## 🗄️ Database Architecture & Schema

The system uses a structured database named `gym_management` containing tables linked via primary and foreign key constraints:

### 1. `users`
Maintains structural login criteria for role validation.
```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL
);
```
2. members
```
Tracks general profile attributes and target renewal deadlines.
CREATE TABLE members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL,
    fee_package VARCHAR(50) NOT NULL,
    due_date DATE NOT NULL
);
```
3. payments
```
Maintains records of specific transaction histories mapped directly to existing members via foreign key relationships.
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    next_due_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (member_id) REFERENCES members(id) ON DELETE CASCADE
);
```
💻 Project Structure
The project code follows a clean MVC pattern:
```
GymVerse/
│
├── src/
│   ├── controller/          # Java Servlets controlling data flow and routing
│   │   ├── AddMemberServlet.java
│   │   ├── AddPaymentServlet.java
│   │   ├── DeleteMemberServlet.java
│   │   ├── EditMemberServlet.java
│   │   ├── LoginServlet.java
│   │   ├── LogoutServlet.java
│   │   ├── MemberDashboardServlet.java
│   │   ├── UpdateMemberServlet.java
│   │   └── ViewMembersServlet.java
│   │
│   ├── dao/                 # Data Access Objects executing SQL Queries
│   │   ├── DBConnection.java
│   │   ├── MemberDAO.java
│   │   ├── PaymentDAO.java
│   │   └── UserDAO.java
│   │
│   └── model/               # Plain Old Java Objects (POJOs) representing data models
│       ├── Member.java
│       ├── Payment.java
│       └── User.java
│
├── WebContent/              # Frontend assets and JSP views[cite: 1, 2, 3]
│   ├── images/              # Visual static assets
│   ├── admin-dashboard.jsp
│   ├── admin-notifications.jsp
│   ├── diet.jsp
│   ├── edit-member.jsp
│   ├── firebase-config.js   # Administrative Firebase integration key configuration
│   ├── index.jsp
│   ├── login.jsp
│   ├── member-dashboard.jsp
│   ├── navstyles.css
│   ├── notifications.jsp
│   ├── payment.jsp
│   ├── style.css
│   ├── styling.css
│   └── view-members.jsp

```
🔧 Installation & Setup
1. Clone the Repository:
git clone [https://github.com/SarvagnaTejaRoyal/GymVerse.git](https://github.com/SarvagnaTejaRoyal/GymVerse.git)

2. Database Initialization:

Open your MySQL Workbench / Command Line client.

Execute the database schema setup scripts provided above.

Update database credentials inside src/dao/DBConnection.java if needed.

3. Project Import:

Open Eclipse IDE.

Navigate to File -> Import -> Existing Projects into Workspace.

Target the root directory of your cloned repository and complete the wizard.

4. Deployment:

Ensure an enterprise runtime application framework (e.g., Apache Tomcat 9.0+) is configured inside your local Eclipse workspace.

Right-click the project folder name -> select Run As -> click Run on Server
```
