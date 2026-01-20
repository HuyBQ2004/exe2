<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thống Kê Doanh Thu | Admin Sweet Love</title>
        
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        
        <style>
            :root {
                --primary-pink: #ff7eb3;
                --deep-pink: #e84393;
                --romantic-red: #ff4757;
                --admin-dark: #2e1a21;
                --soft-bg: #fff0f3;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: var(--soft-bg);
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0;
            }
            
            .card-dashboard {
                border: none;
                border-radius: 30px;
                box-shadow: 0 20px 50px rgba(46, 26, 33, 0.15);
                overflow: hidden;
                width: 100%;
                max-width: 850px;
                background: white;
            }
            
            .card-header {
                background: linear-gradient(135deg, var(--admin-dark), var(--deep-pink));
                color: white;
                padding: 30px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border: none;
            }
            
            /* Thẻ thống kê con */
            .stat-card {
                border-radius: 20px;
                padding: 30px;
                color: white;
                position: relative;
                overflow: hidden;
                transition: all 0.4s ease;
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: center;
                border: none;
            }
            
            .stat-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 30px rgba(232, 67, 147, 0.3);
            }
            
            /* Màu nền cho các thẻ */
            .bg-orders {
                background: linear-gradient(45deg, #6c5ce7, #a29bfe); /* Tím mộng mơ */
            }
            
            .bg-revenue {
                background: linear-gradient(45deg, var(--deep-pink), var(--primary-pink)); /* Hồng ngọt ngào */
            }
            
            /* Icon nền mờ */
            .stat-icon-bg {
                position: absolute;
                right: -10px;
                bottom: -10px;
                font-size: 6rem;
                opacity: 0.15;
                color: white;
                transform: rotate(-15deg);
            }
            
            .stat-title {
                font-size: 0.85rem;
                text-transform: uppercase;
                letter-spacing: 2px;
                font-weight: 600;
                opacity: 0.9;
                margin-bottom: 10px;
            }
            
            .stat-value {
                font-size: 2.8rem;
                font-weight: 800;
                line-height: 1;
            }
            
            .stat-unit {
                font-size: 1.2rem;
                font-weight: 400;
                margin-left: 5px;
                opacity: 0.8;
            }

            .date-badge {
                background-color: rgba(255,255,255,0.2);
                padding: 6px 16px;
                border-radius: 50px;
                font-size: 0.8rem;
                backdrop-filter: blur(5px);
                display: inline-block;
            }

            .btn-home {
                background: rgba(255,255,255,0.2);
                border: 1px solid rgba(255,255,255,0.3);
                color: white;
                border-radius: 50px;
                padding: 8px 20px;
                font-weight: 500;
                transition: 0.3s;
            }
            .btn-home:hover {
                background: white;
                color: var(--deep-pink);
            }

            .footer-text {
                margin-top: 40px;
                color: #b2bec3;
                font-size: 0.85rem;
            }
        </style>
        
        <script>
            function back() {
                window.location.href = "home";
            }
        </script>
    </head>
    <body>
        
        <div class="container d-flex justify-content-center">
            <div class="card card-dashboard">
                <div class="card-header">
                    <div>
                        <h4 class="mb-1"><i class="fas fa-chart-pie me-2"></i>Báo Cáo Tình Yêu</h4>
                        <div class="small opacity-75">
                            <i class="far fa-clock me-1"></i> Số liệu cập nhật: <span id="currentDate"></span>
                        </div>
                    </div>
                    <button class="btn btn-home btn-sm" onclick="back()">
                        <i class="fas fa-reply me-1"></i> Quay lại
                    </button>
                </div>
                
                <div class="card-body p-4 p-md-5">
                    <div class="row g-4">
                        
                        <div class="col-md-6">
                            <div class="stat-card bg-orders shadow-sm">
                                <i class="fas fa-heart stat-icon-bg"></i>
                                <div class="stat-title">Quà đã gửi đi</div>
                                <div class="stat-value">
                                    ${totalOrders}
                                    <span class="stat-unit">Đơn</span>
                                </div>
                                <div class="mt-3">
                                    <span class="date-badge"><i class="fas fa-shipping-fast me-2"></i>Đang vận chuyển</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="stat-card bg-revenue shadow-sm">
                                <i class="fas fa-coins stat-icon-bg"></i>
                                <div class="stat-title">Doanh thu ngọt ngào</div>
                                <div class="stat-value">
                                    <fmt:formatNumber value="${totalSales}" type="currency" currencySymbol="" maxFractionDigits="0"/> 
                                    <span class="stat-unit">đ</span>
                                </div>
                                <div class="mt-3">
                                    <span class="date-badge"><i class="fas fa-chart-line me-2"></i>Tăng trưởng tốt</span>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    
                    <div class="footer-text text-center">
                        <p class="mb-0">
                            Sweet Love Store Dashboard • Version 2.0<br>
                            &copy; 2026 Quản trị viên hệ thống quà tặng
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Tự động hiển thị ngày hiện tại cho chuyên nghiệp
            const now = new Date();
            const options = { day: '2-digit', month: '2-digit', year: 'numeric' };
            document.getElementById('currentDate').innerText = now.toLocaleDateString('vi-VN', options);
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>