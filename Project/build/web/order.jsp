<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Quản Lý Đơn Hàng | Admin Sweet Love</title>
        
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
            }
            
            .card-manager {
                border: none;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(46, 26, 33, 0.1);
                overflow: hidden;
                background: white;
            }
            
            .card-header {
                /* Gradient màu tối sang trọng đặc trưng Admin Sweet Love */
                background: linear-gradient(135deg, var(--admin-dark), var(--deep-pink));
                color: white;
                padding: 25px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: none;
            }
            
            .table thead th {
                border-top: none;
                background-color: #fffbfc;
                color: var(--deep-pink);
                font-weight: 700;
                text-transform: uppercase;
                font-size: 0.8rem;
                padding: 18px 15px;
                letter-spacing: 0.5px;
            }
            
            .table tbody td {
                vertical-align: middle;
                padding: 18px 15px;
                font-size: 0.95rem;
                color: #444;
                border-bottom: 1px solid #fff0f3;
            }
            
            .price-text {
                color: var(--romantic-red);
                font-weight: 700;
            }
            
            .user-info {
                display: flex;
                align-items: center;
                font-weight: 600;
            }
            
            .user-icon {
                width: 32px;
                height: 32px;
                background-color: #ffeef2;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 12px;
                color: var(--deep-pink);
                font-size: 0.85rem;
                box-shadow: 0 2px 5px rgba(232, 67, 147, 0.1);
            }
            
            .btn-action {
                border-radius: 50px;
                font-size: 0.8rem;
                font-weight: 600;
                padding: 8px 16px;
                transition: all 0.3s;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                border: none;
                box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            }
            
            .btn-detail {
                background-color: #f1f2f6;
                color: #2d3436;
                margin-right: 8px;
            }
            .btn-detail:hover { background-color: #dfe6e9; transform: translateY(-2px); }

            .btn-ship {
                background: linear-gradient(to right, var(--primary-pink), var(--deep-pink));
                color: white;
            }
            .btn-ship:hover { 
                background: linear-gradient(to right, var(--deep-pink), var(--romantic-red));
                color: white; 
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(232, 67, 147, 0.3);
            }
            
            .note-text {
                font-style: italic;
                color: #999;
                font-size: 0.85rem;
                max-width: 180px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .badge-order-id {
                background-color: #2e1a21;
                color: white;
                padding: 4px 10px;
                border-radius: 6px;
                font-family: monospace;
            }

            .btn-home {
                background: rgba(255,255,255,0.2);
                border: 1px solid rgba(255,255,255,0.3);
                color: white;
                border-radius: 50px;
                padding: 6px 15px;
                transition: 0.3s;
            }
            .btn-home:hover { background: white; color: var(--admin-dark); }
        </style>

        <script>
            function back() {
                window.location.href = "home";
            }
            
            function confirmShip(id) {
                if(confirm("Xác nhận đã bắt đầu giao đơn hàng #" + id + " cho shipper?")) {
                    window.location.href = "shipping?orderId=" + id;
                }
            }
        </script>
    </head>
    
    <body>
        <div class="container mt-5 mb-5">
            <div class="card card-manager shadow-lg">
                
                <div class="card-header">
                    <div>
                        <h4 class="mb-1"><i class="fas fa-box-heart me-2"></i>Quản Lý Đơn Hàng</h4>
                        <p class="mb-0 small text-white-50">Sweet Love Delivery System</p>
                    </div>
                    <button class="btn btn-home btn-sm" onclick="back()">
                        <i class="fas fa-arrow-left me-1"></i> Trang Chủ
                    </button>
                </div>
                
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead>
                                <tr>
                                    <th class="ps-4">Mã Đơn</th>
                                    <th>Khách Hàng</th>
                                    <th>Tổng Giá Trị</th>
                                    <th>Thời Gian Đặt</th>
                                    <th>Ghi Chú Yêu Thương</th>
                                    <th class="text-center">Quản Lý</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${orders}" var="order">
                                    <tr>
                                        <td class="ps-4">
                                            <span class="badge-order-id">#${order.id}</span>
                                        </td>
                                        
                                        <td>
                                            <div class="user-info">
                                                <div class="user-icon"><i class="fas fa-heart"></i></div>
                                                <span>ID: ${order.accountId}</span>
                                            </div>
                                        </td>
                                        
                                        <td class="price-text">${order.totalPrice} đ</td>
                                        
                                        <td>
                                            <div class="small text-muted">
                                                <i class="far fa-clock me-1"></i>${order.createdDate}
                                            </div>
                                        </td>
                                        
                                        <td>
                                            <div class="note-text" title="${order.note}">
                                                ${order.note != null && order.note != '' ? order.note : '<span class="text-muted small">Không có lời nhắn</span>'}
                                            </div>
                                        </td>
                                        
                                        <td class="text-center">
                                            <a href="orderdetail?orderId=${order.id}" class="btn-action btn-detail" title="Xem chi tiết quà tặng">
                                                <i class="fas fa-eye me-1"></i> Xem
                                            </a>
                                            
                                            <button onclick="confirmShip(${order.id})" class="btn-action btn-ship" title="Giao quà">
                                                <i class="fas fa-shipping-fast me-1"></i> Giao
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="card-footer bg-white p-3 text-end" style="border-top: 1px solid #fff0f3;">
                    <small class="text-muted">Tổng số đơn hàng đang xử lý: <strong class="text-dark">${orders.size()}</strong></small>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>