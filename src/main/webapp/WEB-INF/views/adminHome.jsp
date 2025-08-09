<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Municipal System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background: linear-gradient(45deg, #667eea, #764ba2);
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .stats-card {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
        }
        .stats-card .card-body {
            position: relative;
            overflow: hidden;
        }
        .stats-card .card-body::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-city me-2"></i>Municipal System
            </a>
            <div class="navbar-nav ms-auto">
                <span class="navbar-text me-3">
                    <i class="fas fa-crown me-2"></i>Welcome, ${currentUser.name}
                </span>
                <a class="nav-link" href="/logout">
                    <i class="fas fa-sign-out-alt me-2"></i>Logout
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <!-- Page Header -->
        <div class="row mb-4">
            <div class="col">
                <h2><i class="fas fa-tachometer-alt me-3"></i>Administrator Dashboard</h2>
                <p class="text-muted">Manage users and oversee system operations</p>
            </div>
        </div>

        <!-- Statistics Cards -->
        <div class="row mb-4">
            <div class="col-md-3 mb-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-users fa-3x mb-3"></i>
                        <h3>${totalUsers}</h3>
                        <p class="mb-0">Total Users</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-user fa-3x mb-3"></i>
                        <h3>${citizenCount}</h3>
                        <p class="mb-0">Citizens</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-briefcase fa-3x mb-3"></i>
                        <h3>${staffCount}</h3>
                        <p class="mb-0">Staff Members</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-crown fa-3x mb-3"></i>
                        <h3>${adminCount}</h3>
                        <p class="mb-0">Administrators</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- User Management Section -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">
                            <i class="fas fa-users-cog me-2"></i>User Management
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead class="table-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Role</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" items="${allUsers}">
                                        <tr>
                                            <td>${user.id}</td>
                                            <td>
                                                <i class="fas fa-user me-2 text-primary"></i>
                                                ${user.name}
                                            </td>
                                            <td>${user.email}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${user.role == 'ADMIN'}">
                                                        <span class="badge bg-danger">
                                                            <i class="fas fa-crown me-1"></i>Admin
                                                        </span>
                                                    </c:when>
                                                    <c:when test="${user.role == 'MUNICIPAL_STAFF'}">
                                                        <span class="badge bg-warning">
                                                            <i class="fas fa-briefcase me-1"></i>Staff
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-info">
                                                            <i class="fas fa-user me-1"></i>Citizen
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <button class="btn btn-sm btn-outline-primary me-1" 
                                                        title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="btn btn-sm btn-outline-warning me-1" 
                                                        title="Edit User">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <c:if test="${user.id != currentUser.id}">
                                                    <button class="btn btn-sm btn-outline-danger" 
                                                            title="Delete User">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="row mt-4">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-user-plus fa-3x text-primary mb-3"></i>
                        <h5>Add New User</h5>
                        <p class="text-muted">Create new user accounts</p>
                        <a href="/register" class="btn btn-primary">
                            <i class="fas fa-plus me-2"></i>Add User
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-chart-bar fa-3x text-success mb-3"></i>
                        <h5>System Reports</h5>
                        <p class="text-muted">View system analytics</p>
                        <button class="btn btn-success">
                            <i class="fas fa-chart-line me-2"></i>View Reports
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-cogs fa-3x text-warning mb-3"></i>
                        <h5>System Settings</h5>
                        <p class="text-muted">Configure system parameters</p>
                        <button class="btn btn-warning">
                            <i class="fas fa-cog me-2"></i>Settings
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add interactivity for user management
        document.addEventListener('DOMContentLoaded', function() {
            // Add click handlers for action buttons
            const editButtons = document.querySelectorAll('.btn-outline-warning');
            const deleteButtons = document.querySelectorAll('.btn-outline-danger');
            const viewButtons = document.querySelectorAll('.btn-outline-primary');
            
            editButtons.forEach(button => {
                button.addEventListener('click', function() {
                    alert('Edit functionality would be implemented here');
                });
            });
            
            deleteButtons.forEach(button => {
                button.addEventListener('click', function() {
                    if (confirm('Are you sure you want to delete this user?')) {
                        alert('Delete functionality would be implemented here');
                    }
                });
            });
            
            viewButtons.forEach(button => {
                button.addEventListener('click', function() {
                    alert('View details functionality would be implemented here');
                });
            });
        });
    </script>
</body>
</html>