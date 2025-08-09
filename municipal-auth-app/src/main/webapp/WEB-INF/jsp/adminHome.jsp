<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <style>
        body { font-family: Arial, sans-serif; background: #f7f7f7; }
        .container { max-width: 760px; margin: 40px auto; background: #fff; padding: 24px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        a.btn { display:inline-block; padding: 8px 12px; background:#ef4444; color:#fff; text-decoration:none; border-radius:4px; }
    </style>
</head>
<body>
<div class="container">
    <h2>Admin Dashboard</h2>
    <p>Welcome, ${username}!</p>
    <p>You have access to admin-specific features.</p>
    <a class="btn" href="${pageContext.request.contextPath}/auth/logout">Logout</a>
</div>
</body>
</html>