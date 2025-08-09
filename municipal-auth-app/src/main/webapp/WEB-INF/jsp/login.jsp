<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <style>
        body { font-family: Arial, sans-serif; background: #f7f7f7; }
        .container { max-width: 420px; margin: 60px auto; background: #fff; padding: 24px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        h2 { margin-top: 0; }
        label { display:block; margin: 12px 0 6px; }
        input[type=email], input[type=password] { width:100%; padding:10px; border:1px solid #ccc; border-radius:4px; }
        button { margin-top: 16px; width:100%; padding:10px; border:0; border-radius:4px; background:#2563eb; color:#fff; font-weight:bold; cursor:pointer; }
        .alt { text-align:center; margin-top: 12px; }
        .msg { margin-top: 8px; color: #dc2626; }
        .success { color: #16a34a; }
    </style>
</head>
<body>
<div class="container">
    <h2>Login</h2>
    <c:if test="${not empty error}">
        <div class="msg">${error}</div>
    </c:if>
    <c:if test="${not empty success}">
        <div class="msg success">${success}</div>
    </c:if>
    <form method="post" action="${pageContext.request.contextPath}/auth/login">
        <label for="email">Email</label>
        <input id="email" name="email" type="email" required />

        <label for="password">Password</label>
        <input id="password" name="password" type="password" required />

        <button type="submit">Login</button>
    </form>
    <div class="alt">
        No account? <a href="${pageContext.request.contextPath}/auth/register">Register</a>
    </div>
</div>
</body>
</html>