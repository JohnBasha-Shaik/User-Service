<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Dashboard - Municipal System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background: linear-gradient(45deg, #28a745, #20c997);
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
            background: linear-gradient(45deg, #28a745, #20c997);
            color: white;
        }
        .task-card {
            border-left: 4px solid #28a745;
        }
        .priority-high {
            border-left-color: #dc3545 !important;
        }
        .priority-medium {
            border-left-color: #ffc107 !important;
        }
        .priority-low {
            border-left-color: #6c757d !important;
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
                    <i class="fas fa-briefcase me-2"></i>Welcome, ${currentUser.name}
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
                <h2><i class="fas fa-briefcase me-3"></i>Municipal Staff Dashboard</h2>
                <p class="text-muted">Manage citizen requests and municipal services</p>
            </div>
        </div>

        <!-- Statistics Cards -->
        <div class="row mb-4">
            <div class="col-md-3 mb-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-users fa-3x mb-3"></i>
                        <h3>${citizenCount}</h3>
                        <p class="mb-0">Registered Citizens</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-clipboard-list fa-3x mb-3"></i>
                        <h3>24</h3>
                        <p class="mb-0">Pending Requests</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-check-circle fa-3x mb-3"></i>
                        <h3>156</h3>
                        <p class="mb-0">Completed Tasks</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-exclamation-triangle fa-3x mb-3"></i>
                        <h3>7</h3>
                        <p class="mb-0">Urgent Issues</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Citizens List -->
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">
                            <i class="fas fa-users me-2"></i>Citizens Directory
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
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="citizen" items="${citizens}">
                                        <tr>
                                            <td>${citizen.id}</td>
                                            <td>
                                                <i class="fas fa-user me-2 text-primary"></i>
                                                ${citizen.name}
                                            </td>
                                            <td>${citizen.email}</td>
                                            <td>
                                                <span class="badge bg-success">Active</span>
                                            </td>
                                            <td>
                                                <button class="btn btn-sm btn-outline-primary me-1" 
                                                        title="View Profile">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="btn btn-sm btn-outline-success me-1" 
                                                        title="Contact Citizen">
                                                    <i class="fas fa-envelope"></i>
                                                </button>
                                                <button class="btn btn-sm btn-outline-info" 
                                                        title="View Requests">
                                                    <i class="fas fa-list"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Tasks -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">
                            <i class="fas fa-tasks me-2"></i>Recent Tasks
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="task-card card mb-3 priority-high">
                            <div class="card-body p-3">
                                <h6 class="mb-1">Water Line Repair</h6>
                                <p class="text-muted small mb-1">Main Street intersection</p>
                                <span class="badge bg-danger">High Priority</span>
                            </div>
                        </div>
                        
                        <div class="task-card card mb-3 priority-medium">
                            <div class="card-body p-3">
                                <h6 class="mb-1">Street Light Maintenance</h6>
                                <p class="text-muted small mb-1">Oak Avenue</p>
                                <span class="badge bg-warning">Medium Priority</span>
                            </div>
                        </div>
                        
                        <div class="task-card card mb-3 priority-low">
                            <div class="card-body p-3">
                                <h6 class="mb-1">Park Cleaning</h6>
                                <p class="text-muted small mb-1">Central Park</p>
                                <span class="badge bg-secondary">Low Priority</span>
                            </div>
                        </div>
                        
                        <div class="d-grid">
                            <button class="btn btn-success">
                                <i class="fas fa-plus me-2"></i>Add New Task
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Action Cards -->
        <div class="row mt-4">
            <div class="col-md-3 mb-3">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-clipboard-list fa-3x text-primary mb-3"></i>
                        <h5>Manage Requests</h5>
                        <p class="text-muted">Review citizen requests</p>
                        <button class="btn btn-primary">
                            <i class="fas fa-list me-2"></i>View Requests
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-tools fa-3x text-warning mb-3"></i>
                        <h5>Service Orders</h5>
                        <p class="text-muted">Create and track orders</p>
                        <button class="btn btn-warning">
                            <i class="fas fa-wrench me-2"></i>Manage Orders
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-map-marked-alt fa-3x text-info mb-3"></i>
                        <h5>Service Areas</h5>
                        <p class="text-muted">Manage service zones</p>
                        <button class="btn btn-info">
                            <i class="fas fa-map me-2"></i>View Map
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-chart-line fa-3x text-success mb-3"></i>
                        <h5>Performance</h5>
                        <p class="text-muted">View work statistics</p>
                        <button class="btn btn-success">
                            <i class="fas fa-chart-bar me-2"></i>View Stats
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add click handlers for citizen actions
            const viewButtons = document.querySelectorAll('.btn-outline-primary');
            const contactButtons = document.querySelectorAll('.btn-outline-success');
            const requestButtons = document.querySelectorAll('.btn-outline-info');
            
            viewButtons.forEach(button => {
                button.addEventListener('click', function() {
                    alert('Citizen profile view would be implemented here');
                });
            });
            
            contactButtons.forEach(button => {
                button.addEventListener('click', function() {
                    alert('Contact citizen functionality would be implemented here');
                });
            });
            
            requestButtons.forEach(button => {
                button.addEventListener('click', function() {
                    alert('View citizen requests functionality would be implemented here');
                });
            });
            
            // Task card interactions
            const taskCards = document.querySelectorAll('.task-card');
            taskCards.forEach(card => {
                card.addEventListener('click', function() {
                    alert('Task details would be shown here');
                });
            });
        });
    </script>
</body>
</html>