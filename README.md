# Municipal User Management System

A comprehensive Spring Boot application implementing user authentication, role-based access control, and JSP-based user interfaces for a municipal system.

## 🚀 Features

- **JWT-based Authentication**: Stateless authentication using JSON Web Tokens
- **Role-based Access Control**: Three user roles (Citizen, Municipal Staff, Admin)
- **Spring Security Integration**: Secure endpoints with method-level security
- **BCrypt Password Encryption**: Secure password storage
- **JSP Views**: Modern, responsive UI using Bootstrap 5
- **MySQL Database**: Persistent data storage with JPA/Hibernate
- **RESTful APIs**: Clean API endpoints for authentication
- **Session-less Architecture**: Stateless design for scalability

## 🏗️ Technology Stack

- **Backend**: Spring Boot 3.1.5, Spring Security, Spring Data JPA
- **Frontend**: JSP, Bootstrap 5, Font Awesome, JavaScript
- **Database**: MySQL 8.0
- **Authentication**: JWT (JSON Web Tokens)
- **Build Tool**: Maven
- **Java Version**: 17

## 📁 Project Structure

```
municipal-user-management/
├── pom.xml                                 # Maven dependencies
├── README.md                              # Project documentation
├── src/main/
│   ├── java/com/municipal/
│   │   ├── MunicipalApplication.java      # Main Spring Boot application
│   │   ├── config/
│   │   │   └── SecurityConfig.java        # Spring Security configuration
│   │   ├── controller/
│   │   │   ├── AuthController.java        # Authentication endpoints
│   │   │   └── DashboardController.java   # Role-based dashboard controllers
│   │   ├── entity/
│   │   │   ├── User.java                  # User entity with JPA annotations
│   │   │   └── Role.java                  # Role enum (CITIZEN, MUNICIPAL_STAFF, ADMIN)
│   │   ├── repository/
│   │   │   └── UserRepository.java        # JPA repository interface
│   │   ├── security/
│   │   │   └── JwtAuthenticationFilter.java # JWT filter for request authentication
│   │   ├── service/
│   │   │   └── UserService.java           # User business logic and UserDetailsService
│   │   └── util/
│   │       └── JwtUtil.java               # JWT token generation and validation
│   ├── resources/
│   │   └── application.properties         # Application configuration
│   └── webapp/WEB-INF/views/
│       ├── login.jsp                      # Login page
│       ├── register.jsp                   # Registration page
│       ├── adminHome.jsp                  # Admin dashboard
│       ├── staffHome.jsp                  # Municipal staff dashboard
│       └── citizenHome.jsp                # Citizen dashboard
```

## ⚙️ Setup Instructions

### Prerequisites

1. **Java 17** or higher
2. **Maven 3.6** or higher
3. **MySQL 8.0** or higher
4. **Git** (for cloning the repository)

### Database Setup

1. **Install MySQL** and create a database:
```sql
CREATE DATABASE municipal_db;
```

2. **Create a MySQL user** (optional):
```sql
CREATE USER 'municipal_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON municipal_db.* TO 'municipal_user'@'localhost';
FLUSH PRIVILEGES;
```

3. **Update database configuration** in `src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/municipal_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true
spring.datasource.username=your_username
spring.datasource.password=your_password
```

### Application Setup

1. **Clone the repository**:
```bash
git clone <repository-url>
cd municipal-user-management
```

2. **Install dependencies**:
```bash
mvn clean install
```

3. **Run the application**:
```bash
mvn spring-boot:run
```

4. **Access the application**:
   - Open your browser and navigate to: `http://localhost:8080`
   - The application will automatically create the database tables on first run

## 🔐 User Roles & Access Control

### Role Hierarchy

1. **CITIZEN**: Basic user with access to municipal services
   - Can view citizen dashboard
   - Can submit service requests
   - Can track request status

2. **MUNICIPAL_STAFF**: Staff members managing citizen requests
   - All CITIZEN permissions
   - Can view staff dashboard
   - Can manage citizen requests
   - Can view citizen directory

3. **ADMIN**: System administrators with full access
   - All MUNICIPAL_STAFF permissions
   - Can view admin dashboard
   - Can manage all users
   - Can view system statistics
   - Can access all areas of the system

### Security Configuration

- **Public Endpoints**: `/`, `/login`, `/register`, `/auth/**`
- **Role-based Endpoints**:
  - `/admin/**` - Requires ADMIN role
  - `/staff/**` - Requires MUNICIPAL_STAFF or ADMIN role
  - `/citizen/**` - Requires CITIZEN, MUNICIPAL_STAFF, or ADMIN role

## 🔑 Authentication Flow

1. **Registration**: Users register with name, email, password, and role
2. **Login**: Users authenticate with email and password
3. **JWT Generation**: Upon successful authentication, a JWT token is generated
4. **Token Storage**: Token is stored in browser's localStorage
5. **Request Authentication**: Token is sent in Authorization header for protected requests
6. **Role-based Redirection**: Users are redirected to appropriate dashboards based on their role

## 📊 API Endpoints

### Authentication APIs

- **POST** `/auth/login` - User login
  ```json
  {
    "email": "user@example.com",
    "password": "password"
  }
  ```

- **POST** `/auth/register` - User registration
  ```json
  {
    "name": "John Doe",
    "email": "john@example.com",
    "password": "password",
    "role": "CITIZEN"
  }
  ```

### Dashboard Endpoints

- **GET** `/` - Home page (redirects based on role)
- **GET** `/login` - Login page
- **GET** `/register` - Registration page
- **GET** `/admin/dashboard` - Admin dashboard (ADMIN only)
- **GET** `/staff/dashboard` - Staff dashboard (MUNICIPAL_STAFF, ADMIN)
- **GET** `/citizen/dashboard` - Citizen dashboard (all roles)

## 🛡️ Security Features

1. **Password Encryption**: BCrypt with strong hashing
2. **JWT Security**: Signed tokens with expiration
3. **Method Security**: `@PreAuthorize` annotations on controller methods
4. **Session Management**: Stateless session policy
5. **CORS Protection**: Configured for frontend-backend communication
6. **Input Validation**: Bean validation on entities and DTOs

## 🎨 Frontend Features

1. **Responsive Design**: Bootstrap 5 with mobile-first approach
2. **Modern UI**: Clean, professional interface with Font Awesome icons
3. **Interactive Elements**: JavaScript-enhanced user experience
4. **Role-specific Dashboards**: Customized views for each user role
5. **Real-time Feedback**: Ajax-based form submissions with user feedback

## 🔧 Configuration

### JWT Configuration
```properties
app.jwt.secret=your-secret-key
app.jwt.expiration=86400000  # 24 hours
```

### Database Configuration
```properties
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect
```

### JSP Configuration
```properties
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
```

## 🚀 Running in Production

1. **Change JWT Secret**: Use a strong, unique secret key
2. **Database Security**: Use secure database credentials
3. **HTTPS**: Enable SSL/TLS for production deployment
4. **Logging**: Configure appropriate logging levels
5. **Profile Configuration**: Use production profiles

## 🧪 Testing

### Manual Testing

1. **Start the application**
2. **Register users** with different roles
3. **Login** and verify role-based redirection
4. **Test protected endpoints** with different user roles
5. **Verify JWT functionality** using browser developer tools

### Sample Test Users

After running the application, register test users:

```
Admin User:
- Name: Admin User
- Email: admin@municipal.com
- Password: admin123
- Role: ADMIN

Staff User:
- Name: Staff Member
- Email: staff@municipal.com
- Password: staff123
- Role: MUNICIPAL_STAFF

Citizen User:
- Name: John Citizen
- Email: citizen@municipal.com
- Password: citizen123
- Role: CITIZEN
```

## 📝 Development Notes

1. **Database Tables**: Automatically created by Hibernate
2. **JWT Tokens**: Stored in browser localStorage
3. **Password Security**: All passwords are BCrypt encrypted
4. **Session Management**: Stateless authentication
5. **Error Handling**: Basic error handling implemented

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Check the application logs for error details
- Verify database connectivity and configuration

---

**Note**: This is a demonstration application. For production use, implement additional security measures, error handling, and testing.