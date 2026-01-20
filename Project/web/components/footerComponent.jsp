<%-- 
    Document   : footerComponent
    Refactored : Love Store Theme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    /* Footer Styling - Love Theme */
    .footer-love {
        background-color: #2e1a21; /* Màu nền tím đỏ sẫm sang trọng */
        color: #ffd1dc; /* Màu chữ hồng phấn nhạt */
        position: relative;
        z-index: 1;
    }
    
    .footer-love::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 5px;
        background: linear-gradient(to right, #ff7eb3, #ff4757); /* Viền màu phía trên */
    }
    
    .footer-love h5 {
        color: #ff4757; /* Màu tiêu đề đỏ lãng mạn */
        font-weight: 700;
        letter-spacing: 1px;
        font-family: 'Poppins', sans-serif;
    }
    
    .brand-font {
        font-family: 'Pacifico', cursive;
        font-size: 1.5rem;
    }
    
    .footer-love a {
        color: #cea2ac;
        text-decoration: none;
        transition: all 0.3s ease;
    }
    
    .footer-love a:hover {
        color: #ff7eb3;
        padding-left: 8px; /* Hiệu ứng trượt sang phải */
        text-shadow: 0 0 5px rgba(255, 126, 179, 0.5);
    }
    
    .social-btn {
        width: 45px;
        height: 45px;
        border-radius: 50%;
        background-color: rgba(255,255,255,0.05);
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 6px;
        transition: all 0.4s;
        border: 1px solid rgba(255,255,255,0.1);
    }
    
    .social-btn:hover {
        background-color: #ff4757;
        color: white !important;
        transform: translateY(-5px) rotate(360deg); /* Xoay nhẹ khi hover */
        border-color: #ff4757;
        box-shadow: 0 0 15px rgba(255, 71, 87, 0.6);
    }
    
    .brand-circle {
        width: 100px; 
        height: 100px; 
        background: white;
        color: #e84393;
        font-size: 2.5rem;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 4px solid #ffd1dc;
        transition: transform 0.5s;
    }
    
    .brand-circle:hover {
        transform: scale(1.1);
        color: #ff4757;
    }
    
    .contact-icon {
        width: 25px;
        text-align: center;
        color: #ff4757;
    }
</style>

<footer class="footer-love pt-5 pb-3">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0 text-center text-lg-left">
                <div class="d-flex justify-content-center justify-content-lg-start mb-4">
                    <div class="rounded-circle brand-circle shadow mx-auto mx-lg-0">
                        <i class="fas fa-gift"></i>
                    </div>
                </div>

                <p class="mb-2 text-white brand-font">L'amour</p>
                <p class="small" style="line-height: 1.6;">
                    "Trao gửi yêu thương - Lưu giữ khoảnh khắc".<br>
                    Nơi cảm xúc thăng hoa qua từng món quà ý nghĩa dành tặng người thương.
                </p>

                <div class="d-flex justify-content-center justify-content-lg-start mt-4">
                    <a class="social-btn text-white" href="#!"><i class="fab fa-facebook-f"></i></a>
                    <a class="social-btn text-white" href="#!"><i class="fab fa-instagram"></i></a>
                    <a class="social-btn text-white" href="#!"><i class="fab fa-pinterest-p"></i></a>
                    <a class="social-btn text-white" href="#!"><i class="fab fa-tiktok"></i></a>
                </div>
            </div>

            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase mb-4">Quà Tặng</h5>

                <ul class="list-unstyled">
                    <li class="mb-2">
                        <a href="#"><i class="fas fa-heart mr-2 small"></i>Bộ Sưu Tập Mới</a>
                    </li>
                    <li class="mb-2">
                        <a href="#"><i class="fas fa-heart mr-2 small"></i>Được Yêu Thích Nhất</a>
                    </li>
                    <li class="mb-2">
                        <a href="#"><i class="fas fa-heart mr-2 small"></i>Combo Tình Yêu</a>
                    </li>
                    <li class="mb-2">
                        <a href="#"><i class="fas fa-heart mr-2 small"></i>Hoa & Chocolate</a>
                    </li>
                    <li class="mb-2">
                        <a href="#"><i class="fas fa-heart mr-2 small"></i>Dịch Vụ Gói Quà</a>
                    </li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase mb-4">Chăm Sóc Khách Hàng</h5>

                <ul class="list-unstyled">
                    <li class="mb-2">
                        <a href="#"><i class="fas fa-user-secret mr-2 small"></i>Bảo mật thông tin</a>
                    </li>
                    <li class="mb-2">
                        <a href="#"><i class="fas fa-shipping-fast mr-2 small"></i>Giao quà bí mật</a>
                    </li>
                    <li class="mb-2">
                        <a href="#"><i class="fas fa-sync-alt mr-2 small"></i>Chính sách đổi trả</a>
                    </li>
                    <li class="mb-2">
                        <a href="#"><i class="far fa-question-circle mr-2 small"></i>Tư vấn quà tặng</a>
                    </li>
                    <li class="mb-2">
                        <a href="#"><i class="fas fa-hand-holding-heart mr-2 small"></i>Khách hàng thân thiết</a>
                    </li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase mb-4">Liên Hệ</h5>

                <ul class="list-unstyled">
                    <li class="mb-3">
                        <p class="mb-0"><i class="fas fa-map-marker-alt contact-icon mr-2"></i><strong>Store:</strong></p>
                        <p class="text-muted ml-4">Xã Hòa Lạc, Khu Công Nghệ Cao, TP Hà Nội</p>
                    </li>
                    <li class="mb-3">
                        <p class="mb-0"><i class="fas fa-phone-alt contact-icon mr-2"></i><strong>Hotline Tình Yêu:</strong></p>
                        <p class="text-muted ml-4">+84 866 375 436</p>
                    </li>
                    <li class="mb-3">
                        <p class="mb-0"><i class="fas fa-envelope-open-text contact-icon mr-2"></i><strong>Email:</strong></p>
                        <p class="text-muted ml-4">love@lamourgift.com</p>
                    </li>
                    <li>
                         <p class="mb-0"><i class="far fa-clock contact-icon mr-2"></i><strong>Giờ mở cửa:</strong></p>
                        <p class="text-muted ml-4">Cả Ngày</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="text-center p-3 mt-4" style="background-color: rgba(0, 0, 0, 0.3); border-top: 1px solid rgba(255,255,255,0.05);">
        © 2025 Copyright:
        <span class="text-white font-weight-bold brand-font" style="font-size: 1.1rem;">L'amour</span>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>