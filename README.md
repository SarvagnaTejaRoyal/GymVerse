# GymVerse – Smart Gym Management System

GymVerse is a Java-based web application designed to simplify gym administration and member management. It provides separate Admin and Member interfaces for managing member records, tracking membership details, recording payments, and accessing fitness-related information.

The application follows an MVC-style architecture using Java Servlets, JSP, JDBC, and MySQL.

## Features

### Admin Module
- **Admin Login:** Role-based authentication for administrators.
- **Member Management:** Add, view, update, and delete member records.
- **Automatic Member Account Creation:** When an administrator adds a member, the application automatically creates a corresponding member login account.
- **Payment Management:** Record member payments, payment dates, next due dates, and payment status.
- **Member Records:** View registered members and their membership details.

### Member Module
- **Member Login:** Members can access their own dashboard using their registered email and password.
- **First-Time Password Change:** Newly created member accounts must change their initial password before accessing the dashboard.
- **Change Password:** Members can update their passwords later through the dashboard.
- **Membership Details:** View personal information, membership package, and due date.
- **Payment Status:** View the latest available payment information.
- **Diet Plans:** Access fitness and diet-related information.
- **Supplement Guide:** Browse the supplement information provided in the application.
- **Notifications:** View the notification content available in the application.

## Automatic Account Creation and Password Security

When an administrator registers a new member:

1. The member's details are inserted into the `members` table.
2. A corresponding login account is created in the `users` table.
3. The account is assigned the `member` role.
4. The initial password is `member123`.
5. The `must_change_password` flag is set to `TRUE`.
6. The member is redirected to the password-change page on their first login.

Passwords are stored using salted PBKDF2 hashing with `PBKDF2WithHmacSHA256`.

Member creation uses a database transaction so that the member profile and login account are created together.

**Important:** The default password is intended for this project setup. Members should change it immediately after their first login.

## Technology Stack

| Component | Technologies |
|---|---|
| Backend | Java |
| Web Technologies | JSP, Java Servlets |
| Frontend | HTML5, CSS3 |
| Database | MySQL |
| Database Connectivity | JDBC |
| Architecture | MVC-style architecture |
| IDE | Eclipse IDE |
| Server | Apache Tomcat |
| Version Control | Git and GitHub |

## Application Architecture

GymVerse follows an MVC-style structure:

- **Model:** Java classes representing application data, such as Member, User, and Payment.
- **View:** JSP pages responsible for displaying the user interface.
- **Controller:** Java Servlets that handle requests, process user actions, and coordinate application operations.
- **DAO (Data Access Object):** Classes that execute database operations using JDBC.
- **Database:** MySQL stores user accounts, member details, and payment records.

## Database

The application uses a MySQL database named:

`gym_management`

The main tables are:

| Table | Purpose |
|---|---|
| `users` | Stores login credentials, user roles, and first-login password-change status. |
| `members` | Stores member profile and membership information. |
| `payments` | Stores payment records, dates, amounts, and payment status. |

### Database Update for Password Management

If you already have the GymVerse database, run the following SQL script once before using the updated application:

`DATABASE_UPDATE_PASSWORD_FEATURE.sql`

This script:
- Increases the password column size to support hashed passwords.
- Adds the `must_change_password` column to the `users` table.

The SQL file is available in the project root directory.

## Project Structure

```text
GymVerse/
│
├── GymManagementSystem/
│   │
│   ├── src/
│   │   └── main/
│   │       │
│   │       ├── java/
│   │       │   ├── controller/
│   │       │   │   ├── AddMemberServlet.java
│   │       │   │   ├── AddPaymentServlet.java
│   │       │   │   ├── ChangePasswordServlet.java
│   │       │   │   ├── DeleteMemberServlet.java
│   │       │   │   ├── EditMemberServlet.java
│   │       │   │   ├── LoginServlet.java
│   │       │   │   ├── LogoutServlet.java
│   │       │   │   ├── MemberDashboardServlet.java
│   │       │   │   ├── UpdateMemberServlet.java
│   │       │   │   └── ViewMembersServlet.java
│   │       │   │
│   │       │   ├── dao/
│   │       │   │   ├── DBConnection.java
│   │       │   │   ├── MemberDAO.java
│   │       │   │   ├── PaymentDAO.java
│   │       │   │   ├── PasswordUtil.java
│   │       │   │   └── UserDAO.java
│   │       │   │
│   │       │   └── model/
│   │       │       ├── Member.java
│   │       │       ├── Payment.java
│   │       │       └── User.java
│   │       │
│   │       └── webapp/
│   │           ├── images/
│   │           ├── WEB-INF/
│   │           │   ├── lib/
│   │           │   └── web.xml
│   │           ├── admin-dashboard.jsp
│   │           ├── admin-notifications.jsp
│   │           ├── change-password.jsp
│   │           ├── diet.jsp
│   │           ├── edit-member.jsp
│   │           ├── index.jsp
│   │           ├── login.jsp
│   │           ├── member-dashboard.jsp
│   │           ├── navstyles.css
│   │           ├── notifications.jsp
│   │           ├── payment.jsp
│   │           ├── style.css
│   │           ├── styling.css
│   │           ├── supplements.jsp
│   │           └── view-members.jsp
│   │
│   ├── DATABASE_UPDATE_PASSWORD_FEATURE.sql
│   ├── README.md
│   └── .project
```

## Installation and Setup

### Prerequisites
- Java Development Kit (JDK 8 or compatible version)
- Eclipse IDE for Enterprise Java and Web Developers
- Apache Tomcat 9 or a compatible Servlet container
- MySQL Server
- MySQL Workbench (recommended)

### 1. Clone the Repository

```bash
git clone https://github.com/SarvagnaTejaRoyal/GymVerse.git
```

### 2. Create the Database

Create a MySQL database named:
```sql
CREATE DATABASE IF NOT EXISTS gym_management;
```

Create tables:
```sql
USE gym_management;

-- 1. MEMBERS TABLE
CREATE TABLE IF NOT EXISTS members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    fee_package VARCHAR(100),
    due_date DATE
) ENGINE=InnoDB;


-- 2. USERS TABLE
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL,
    must_change_password BOOLEAN NOT NULL DEFAULT FALSE
) ENGINE=InnoDB;


-- 3. PAYMENTS TABLE
CREATE TABLE IF NOT EXISTS payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    next_due_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_payments_member
        FOREIGN KEY (member_id)
        REFERENCES members(id)
        ON DELETE CASCADE
) ENGINE=InnoDB;
```
### 3. Configure Database Connection

Open:

`src/main/java/dao/DBConnection.java`

Update the database URL, username, and password according to your local MySQL configuration.

### 4. Import the Project into Eclipse

1. Open Eclipse.
2. Select **File → Import**.
3. Choose **Existing Projects into Workspace**.
4. Browse to the cloned repository.
5. Select the `GymManagementSystem` project.
6. Complete the import.

### 5. Configure Apache Tomcat

1. Configure Apache Tomcat in Eclipse.
2. Add the GymManagementSystem project to the server.
3. Start the server and run the application.

## Default Member Login

New member accounts created by the Admin use the following initial credentials:

| Field | Value |
|---|---|
| Email | Member's registered email |
| Initial Password | `member123` |
| Role | `member` |

Members are required to change the initial password before accessing their dashboard.

## Future Enhancements

- Integration with a live notification service.
- Improved payment reporting and analytics.
- Online membership renewal and payment integration.
- Enhanced dashboard visualizations.
- Deployment to a cloud hosting platform.

## Author

**GymVerse – Smart Gym Management System**

Developed using Java, JSP, Servlets, JDBC, and MySQL.

GitHub Repository:  
https://github.com/SarvagnaTejaRoyal/GymVerse
