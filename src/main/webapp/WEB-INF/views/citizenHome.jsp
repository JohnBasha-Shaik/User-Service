<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Citizen Dashboard - Municipal System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background: linear-gradient(45deg, #007bff, #0056b3);
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
            background: linear-gradient(45deg, #007bff, #0056b3);
            color: white;
        }
        .service-card {
            cursor: pointer;
            border: 2px solid transparent;
            transition: all 0.3s ease;
        }
        .service-card:hover {
            border-color: #007bff;
            transform: translateY(-5px);
        }
        .request-status {
            border-radius: 20px;
            padding: 5px 15px;
            font-size: 0.8rem;
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
                    <i class="fas fa-user me-2"></i>Welcome, ${currentUser.name}
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
                <h2><i class="fas fa-home me-3"></i>Citizen Dashboard</h2>
                <p class="text-muted">Access municipal services and track your requests</p>
            </div>
        </div>

        <!-- Quick Stats -->
        <div class="row mb-4">
            <div class="col-md-3 mb-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-file-alt fa-3x mb-3"></i>
                        <h3>5</h3>
                        <p class="mb-0">My Requests</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-clock fa-3x mb-3"></i>
                        <h3>2</h3>
                        <p class="mb-0">Pending</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-check-circle fa-3x mb-3"></i>
                        <h3>3</h3>
                        <p class="mb-0">Completed</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card stats-card">
                    <div class="card-body text-center">
                        <i class="fas fa-star fa-3x mb-3"></i>
                        <h3>4.8</h3>
                        <p class="mb-0">Avg Rating</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- Available Services -->
            <div class="col-md-8">
                <div class="card mb-4">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">
                            <i class="fas fa-concierge-bell me-2"></i>Available Services
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <div class="card service-card h-100">
                                    <div class="card-body text-center">
                                        <i class="fas fa-tools fa-3x text-warning mb-3"></i>
                                        <h6>Maintenance Request</h6>
                                        <p class="text-muted small">Report issues with public infrastructure</p>
                                        <button class="btn btn-outline-warning btn-sm">Request Service</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <div class="card service-card h-100">
                                    <div class="card-body text-center">
                                        <i class="fas fa-file-alt fa-3x text-success mb-3"></i>
                                        <h6>Document Request</h6>
                                        <p class="text-muted small">Request certificates and permits</p>
                                        <button class="btn btn-outline-success btn-sm">Get Document</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <div class="card service-card h-100">
                                    <div class="card-body text-center">
                                        <i class="fas fa-exclamation-triangle fa-3x text-danger mb-3"></i>
                                        <h6>Emergency Report</h6>
                                        <p class="text-muted small">Report urgent safety issues</p>
                                        <button class="btn btn-outline-danger btn-sm">Report Emergency</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <div class="card service-card h-100">
                                    <div class="card-body text-center">
                                        <i class="fas fa-comments fa-3x text-info mb-3"></i>
                                        <h6>Feedback & Suggestions</h6>
                                        <p class="text-muted small">Share your thoughts and ideas</p>
                                        <button class="btn btn-outline-info btn-sm">Give Feedback</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Requests -->
                <div class="card">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">
                            <i class="fas fa-history me-2"></i>My Recent Requests
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="list-group list-group-flush">
                            <div class="list-group-item border-0 px-0">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="mb-1">Street Light Repair</h6>
                                        <p class="text-muted small mb-1">Submitted on March 15, 2024</p>
                                        <small class="text-muted">Reference: SR-2024-001</small>
                                    </div>
                                    <span class="request-status bg-success text-white">Completed</span>
                                </div>
                            </div>
                            <div class="list-group-item border-0 px-0">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="mb-1">Pothole Repair Request</h6>
                                        <p class="text-muted small mb-1">Submitted on March 20, 2024</p>
                                        <small class="text-muted">Reference: SR-2024-002</small>
                                    </div>
                                    <span class="request-status bg-warning text-dark">In Progress</span>
                                </div>
                            </div>
                            <div class="list-group-item border-0 px-0">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="mb-1">Birth Certificate Request</h6>
                                        <p class="text-muted small mb-1">Submitted on March 22, 2024</p>
                                        <small class="text-muted">Reference: SR-2024-003</small>
                                    </div>
                                    <span class="request-status bg-primary text-white">Pending</span>
                                </div>
                            </div>
                        </div>
                        <div class="d-grid mt-3">
                            <button class="btn btn-outline-primary">
                                <i class="fas fa-list me-2"></i>View All Requests
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Actions & Notifications -->
            <div class="col-md-4">
                <!-- Quick Actions -->
                <div class="card mb-4">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">
                            <i class="fas fa-bolt me-2"></i>Quick Actions
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="d-grid gap-2">
                            <button class="btn btn-primary">
                                <i class="fas fa-plus me-2"></i>New Request
                            </button>
                            <button class="btn btn-outline-secondary">
                                <i class="fas fa-search me-2"></i>Track Request
                            </button>
                            <button class="btn btn-outline-secondary">
                                <i class="fas fa-download me-2"></i>Download Forms
                            </button>
                            <button class="btn btn-outline-secondary">
                                <i class="fas fa-phone me-2"></i>Contact Support
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Notifications -->
                <div class="card">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">
                            <i class="fas fa-bell me-2"></i>Notifications
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-info d-flex align-items-center" role="alert">
                            <i class="fas fa-info-circle me-2"></i>
                            <div>
                                <small>Your pothole repair request is now in progress.</small>
                            </div>
                        </div>
                        <div class="alert alert-success d-flex align-items-center" role="alert">
                            <i class="fas fa-check-circle me-2"></i>
                            <div>
                                <small>Street light repair has been completed.</small>
                            </div>
                        </div>
                        <div class="alert alert-warning d-flex align-items-center" role="alert">
                            <i class="fas fa-exclamation-triangle me-2"></i>
                            <div>
                                <small>Scheduled maintenance in your area tomorrow.</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Service card interactions
            const serviceCards = document.querySelectorAll('.service-card');
            serviceCards.forEach(card => {
                card.addEventListener('click', function() {
                    const serviceName = this.querySelector('h6').textContent;
                    alert(`${serviceName} functionality would be implemented here`);
                });
            });

            // Quick action buttons
            const quickActionButtons = document.querySelectorAll('.card .btn');
            quickActionButtons.forEach(button => {
                button.addEventListener('click', function(e) {
                    e.stopPropagation();
                    const action = this.textContent.trim();
                    alert(`${action} functionality would be implemented here`);
                });
            });

            // Request list items
            const requestItems = document.querySelectorAll('.list-group-item');
            requestItems.forEach(item => {
                item.addEventListener('click', function() {
                    const reference = this.querySelector('small').textContent;
                    alert(`Request details for ${reference} would be shown here`);
                });
            });
        });
    </script>
</body>
</html>