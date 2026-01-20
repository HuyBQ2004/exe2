<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Xác Nhận Đơn Hàng | Sweet Love</title>
        
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        
        <style>
            :root {
                --primary-pink: #ff7eb3;
                --deep-pink: #e84393;
                --romantic-red: #ff4757;
                --soft-bg: #fff0f3;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: var(--soft-bg);
            }
            
            /* Left Column: Delivery Info */
            .card-form {
                background: white;
                border: none;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(232, 67, 147, 0.05);
                padding: 35px;
            }
            
            .form-label {
                font-weight: 600;
                color: #444;
                font-size: 0.9rem;
            }
            
            .form-control {
                padding: 12px 15px;
                border-radius: 12px;
                border: 1px solid #ffeef2;
                background-color: #fffbfc;
            }
            
            .form-control:focus {
                border-color: var(--primary-pink);
                box-shadow: 0 0 0 0.2rem rgba(255, 126, 179, 0.15);
                background-color: white;
            }
            
            .input-group-text {
                background-color: #fff0f3;
                border: 1px solid #ffeef2;
                border-radius: 12px 0 0 12px;
                color: var(--romantic-red);
            }
            
            /* Right Column: Order Summary */
            .card-summary {
                background: white;
                border: none;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(232, 67, 147, 0.1);
                overflow: hidden;
            }
            
            .summary-header {
                background: linear-gradient(to right, #2e1a21, #e84393);
                color: white;
                padding: 20px;
                text-align: center;
                font-weight: 700;
                letter-spacing: 1px;
                font-family: 'Poppins', sans-serif;
            }
            
            .order-item {
                display: flex;
                align-items: center;
                padding: 15px 20px;
                border-bottom: 1px solid #fff0f3;
            }
            
            .item-img {
                width: 65px;
                height: 65px;
                object-fit: cover;
                border-radius: 12px;
                margin-right: 15px;
                border: 1px solid #ffeef2;
            }
            
            .item-name {
                font-weight: 600;
                color: #444;
                margin-bottom: 0;
                font-size: 0.95rem;
            }
            
            .item-meta {
                font-size: 0.8rem;
                color: #999;
            }
            
            .item-total {
                font-weight: 700;
                color: var(--romantic-red);
                font-size: 0.9rem;
            }
            
            .total-section {
                background-color: #fffbfc;
                padding: 25px;
            }
            
            /* Buttons */
            .btn-confirm {
                background: linear-gradient(to right, var(--primary-pink), var(--deep-pink));
                color: white;
                border: none;
                padding: 15px;
                border-radius: 50px;
                font-weight: 700;
                width: 100%;
                text-transform: uppercase;
                letter-spacing: 1px;
                transition: all 0.3s;
                margin-top: 15px;
                box-shadow: 0 4px 15px rgba(232, 67, 147, 0.3);
            }
            
            .btn-confirm:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 20px rgba(232, 67, 147, 0.4);
                background: linear-gradient(to right, var(--deep-pink), var(--romantic-red));
                color: white;
            }
            
            /* Step Indicator */
            .step-indicator {
                color: #ccc;
                font-weight: 600;
                margin-bottom: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .step-indicator span { font-size: 0.9rem; }
            .step-indicator .active {
                color: var(--deep-pink);
            }
            .step-divider {
                width: 50px;
                height: 2px;
                background-color: #eee;
                margin: 0 15px;
            }
            .step-divider.active {
                background-color: var(--primary-pink);
            }

            h4 {
                font-family: 'Dancing Script', cursive;
                font-size: 2.2rem !important;
            }
        </style>
    </head>
    
    <body>
        <%@include file="components/navBarComponent.jsp" %>

        <section class="py-5">
            <div class="container" style="min-height: 80vh;">
                
                <div class="row justify-content-center mb-2">
                    <div class="col-md-8">
                        <div class="step-indicator">
                            <span class="text-success"><i class="fas fa-check-circle me-1"></i>Giỏ hàng</span>
                            <div class="step-divider active"></div>
                            <span class="active"><i class="fas fa-heart me-1"></i>Thanh toán</span>
                            <div class="step-divider"></div>
                            <span><i class="fas fa-gift me-1"></i>Hoàn tất</span>
                        </div>
                    </div>
                </div>

                <form action="checkout" method="POST">
                    <div class="row">
                        <div class="col-lg-7 mb-4">
                            <div class="card card-form shadow-sm">
                                <h4 class="mb-4 fw-bold" style="color: var(--deep-pink);">
                                    <i class="fas fa-paper-plane me-2"></i>Nơi nhận yêu thương
                                </h4>
                                
                                <div class="mb-4">
                                    <label for="name" class="form-label">Tên người nhận</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                                        <input type="text" class="form-control" id="name" name="name" required placeholder="Họ tên người nhận quà">
                                    </div>
                                </div>
                                
                                <div class="mb-4">
                                    <label for="phone" class="form-label">Số điện thoại liên hệ</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-phone-alt"></i></span>
                                        <input type="text" class="form-control" id="phone" name="phone" 
                                               pattern="^0[0-9]{9}" title="Vui lòng nhập đúng 10 chữ số bắt đầu bằng số 0" 
                                               required placeholder="Số điện thoại để Shipper gọi khi tới">
                                    </div>
                                </div>
                                
                                <div class="mb-4">
                                    <label for="address" class="form-label">Địa chỉ giao quà</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                                        <input type="text" class="form-control" id="address" name="address" required placeholder="Địa chỉ chi tiết nhận quà">
                                    </div>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="note" class="form-label">Lời nhắn / Ghi chú bí mật</label>
                                    <textarea name="note" id="note" class="form-control" rows="4" placeholder="Viết những lời chúc ngọt ngào hoặc ghi chú cho cửa hàng tại đây..."></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-5">
                            <div class="card card-summary shadow-sm">
                                <div class="summary-header text-uppercase">
                                    Tóm tắt món quà
                                </div>
                                
                                <div class="summary-body" style="max-height: 380px; overflow-y: auto; background-color: #fff;">
                                    <c:forEach items="${carts}" var="C">
                                        <div class="order-item">
                                            <img src="${C.value.product.imageUrl}" class="item-img" 
                                                 onerror="this.src='https://dummyimage.com/100x100/ffcdd2/e91e63.jpg&text=Gift'">
                                            
                                            <div class="item-details">
                                                <p class="item-name">${C.value.product.name}</p>
                                                <div class="item-meta">
                                                    SL: ${C.value.quantity} x ${C.value.product.price} đ
                                                </div>
                                            </div>
                                            
                                            <div class="item-total">
                                                ${C.value.product.price * C.value.quantity} đ
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <div class="total-section">
                                    <div class="d-flex justify-content-between mb-2">
                                        <span class="text-muted small">Tạm tính:</span>
                                        <span class="fw-bold small">${totalMoney} đ</span>
                                    </div>
                                    <div class="d-flex justify-content-between mb-3">
                                        <span class="text-muted small">Phí vận chuyển:</span>
                                        <span class="text-success fw-bold small">Miễn phí</span>
                                    </div>
                                    <hr style="border-color: #ffeef2;">
                                    <div class="d-flex justify-content-between align-items-center mb-1">
                                        <span class="fw-bold" style="color: #444;">TỔNG THANH TOÁN:</span>
                                        <span class="fw-bold fs-3" style="color: var(--romantic-red);">${totalMoney} đ</span>
                                    </div>
                                    
                                    <button type="submit" class="btn btn-confirm">
                                        <i class="fas fa-heart me-2"></i> Gửi Quà Ngay
                                    </button>
                                    
                                    <div class="text-center mt-3">
                                        <a href="carts" class="text-decoration-none text-muted small">
                                            <i class="fas fa-chevron-left me-1"></i> Chỉnh sửa lại giỏ hàng
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="mt-4 p-3 border-0 bg-white rounded-3 shadow-sm d-flex align-items-center" style="border-left: 5px solid #2ecc71 !important;">
                                <i class="fas fa-shield-alt text-success fs-3 me-3"></i>
                                <div class="small text-muted">
                                    <strong>Thanh toán an toàn:</strong> Thông tin của bạn được bảo mật tuyệt đối 100%.
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>

        <%@include file="components/footerComponent.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>