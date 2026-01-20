<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Gửi Trao Thành Công | Sweet Love</title>
        
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        
        <style>
            :root {
                --primary-pink: #ff7eb3;
                --deep-pink: #e84393;
                --romantic-red: #ff4757;
                --success-green: #00b894;
                --soft-bg: #fff0f3;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: var(--soft-bg);
                background-image: url("https://www.transparenttextures.com/patterns/hearts.png");
            }
            
            .card-success {
                border: none;
                border-radius: 30px;
                box-shadow: 0 15px 40px rgba(232, 67, 147, 0.1);
                overflow: hidden;
                background: white;
            }
            
            .success-header {
                padding: 50px 20px 30px;
                background-color: white;
                text-align: center;
            }
            
            .icon-circle {
                width: 90px;
                height: 90px;
                background-color: #e6fffb;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 25px;
                color: var(--success-green);
                font-size: 3.5rem;
                box-shadow: 0 10px 20px rgba(0, 184, 148, 0.15);
                animation: popIn 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            }
            
            @keyframes popIn {
                0% { transform: scale(0); opacity: 0; }
                100% { transform: scale(1); opacity: 1; }
            }
            
            .receipt-section {
                background-color: #fffbfc;
                border: 2px dashed #ffd1dc;
                border-radius: 20px;
                margin: 0 40px 30px;
                padding: 30px;
                position: relative;
            }

            /* Trang trí trái tim nhỏ ở các góc receipt */
            .receipt-section::before {
                content: '❤';
                position: absolute;
                top: -15px;
                left: 50%;
                transform: translateX(-50%);
                background: white;
                padding: 0 10px;
                color: var(--primary-pink);
            }
            
            .item-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
                padding-bottom: 15px;
                border-bottom: 1px solid #fce4ec;
            }
            
            .item-row:last-child {
                border-bottom: none;
                margin-bottom: 0;
                padding-bottom: 0;
            }
            
            .item-thumb {
                width: 60px;
                height: 60px;
                border-radius: 12px;
                object-fit: cover;
                margin-right: 15px;
                border: 2px solid white;
                box-shadow: 0 3px 10px rgba(0,0,0,0.05);
            }
            
            .total-row {
                background: linear-gradient(to right, #2e1a21, var(--deep-pink));
                color: white;
                padding: 25px 40px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 1.3rem;
                font-weight: 700;
            }
            
            .btn-home {
                background: linear-gradient(45deg, var(--primary-pink), var(--deep-pink));
                color: white;
                border: none;
                padding: 15px 40px;
                border-radius: 50px;
                font-weight: 600;
                transition: all 0.3s;
                text-decoration: none;
                display: inline-block;
                box-shadow: 0 6px 20px rgba(232, 67, 147, 0.3);
                text-transform: uppercase;
                letter-spacing: 1px;
            }
            
            .btn-home:hover {
                transform: translateY(-3px);
                color: white;
                box-shadow: 0 10px 25px rgba(232, 67, 147, 0.4);
                background: linear-gradient(45deg, var(--deep-pink), var(--romantic-red));
            }

            .love-quote {
                font-family: 'Dancing Script', cursive;
                color: var(--deep-pink);
                font-size: 1.4rem;
                margin-top: 10px;
            }
        </style>
    </head>
    
    <body>
        <%@include file="components/navBarComponent.jsp" %>

        <div class="container py-5" style="min-height: 80vh;">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-6">
                    <div class="card card-success shadow-lg">
                        
                        <div class="success-header">
                            <div class="icon-circle">
                                <i class="fas fa-heart"></i>
                            </div>
                            <h2 class="fw-bold mb-2" style="color: var(--deep-pink);">Đặt Hàng Thành Công!</h2>
                            <p class="text-muted mb-0">Cảm ơn bạn đã tin tưởng gửi gắm yêu thương tại <strong>Sweet Love</strong>.</p>
                            <div class="love-quote">"Món quà nhỏ - Tình yêu lớn"</div>
                        </div>

                        <div class="receipt-section">
                            <h6 class="fw-bold mb-4 text-center text-uppercase text-muted" style="letter-spacing: 3px;">
                                Chi Tiết Quà Tặng
                            </h6>
                            
                            <c:forEach items="${cartss}" var="C">
                                <div class="item-row">
                                    <div class="d-flex align-items-center">
                                        <img src="${C.value.product.imageUrl}" class="item-thumb" 
                                             onerror="this.src='https://dummyimage.com/100x100/ffcdd2/e91e63.jpg&text=Gift'">
                                        <div>
                                            <div class="fw-bold" style="color: #444;">${C.value.product.name}</div>
                                            <div class="small text-muted">Số lượng: ${C.value.quantity}</div>
                                        </div>
                                    </div>
                                    <div class="fw-bold" style="color: var(--romantic-red);">
                                        ${C.value.product.price * C.value.quantity} đ
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <div class="total-row">
                            <span style="font-size: 1rem; opacity: 0.9; font-weight: 400;">TỔNG GIÁ TRỊ:</span>
                            <span>${totalPrice} đ</span>
                        </div>
                        
                        <div class="text-center p-5">
                            <p class="mb-4 text-muted small">
                                Chúng tôi sẽ chuẩn bị món quà thật chỉn chu và liên hệ sớm nhất.<br>
                                Hotline hỗ trợ tình yêu: <b>0866 375 436</b>
                            </p>
                            <a href="home" class="btn-home">
                                <i class="fas fa-heart me-2"></i>Tiếp Tục Chọn Quà
                            </a><br><br>
                              <a href="https://huybq2004.github.io/cardlove/" class="btn-home">
                                <i class="fas fa-heart me-2">Thiệp Yêu Thương</i>
                            </a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/footerComponent.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>