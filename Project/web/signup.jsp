<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng Ký | L'amour</title>
        
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Pacifico&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        
        <style>
            :root {
                --primary-pink: #ff7eb3;
                --deep-pink: #e84393;
                --romantic-red: #ff4757;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: #fff0f3;
                height: 100vh;
                overflow: hidden;
            }
            
            .signup-container {
                height: 100vh;
            }
            
            /* Cột Hình ảnh (Bên phải) */
            .bg-image {
                /* Ảnh quà tặng/hoa */
                background: url('https://images.unsplash.com/photo-1513201099705-a9746e1e201f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80') no-repeat center center;
                background-size: cover;
                position: relative;
                height: 100%;
                border-left: 5px solid white; /* Đường viền ngăn cách */
            }
            
            .bg-overlay {
                position: absolute;
                top: 0; left: 0; right: 0; bottom: 0;
                background: linear-gradient(to top, rgba(46, 26, 33, 0.4), rgba(255, 126, 179, 0.6));
                display: flex;
                align-items: flex-end;
                justify-content: flex-end; /* Đẩy chữ sang phải */
                padding: 60px;
                text-align: right;
            }
            
            .quote-text {
                color: white;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            }

            .quote-text h2 {
                font-family: 'Dancing Script', cursive;
                font-size: 2.8rem;
            }
            
            /* Cột Form (Bên trái) */
            .signup-section {
                display: flex;
                flex-direction: column;
                justify-content: center;
                padding: 0 60px;
                height: 100%;
                background-color: white;
                overflow-y: auto;
                position: relative;
            }

            /* Họa tiết tim chìm bên trái */
            .signup-section::after {
                content: '\f004'; 
                font-family: "Font Awesome 5 Free";
                font-weight: 900;
                position: absolute;
                bottom: -30px;
                left: -30px;
                font-size: 15rem;
                color: rgba(255, 238, 242, 0.6);
                z-index: 0;
                transform: rotate(-15deg);
            }
            
            .form-content {
                position: relative;
                z-index: 1;
            }
            
            .brand-logo {
                font-family: 'Pacifico', cursive;
                background: linear-gradient(to right, var(--deep-pink), var(--romantic-red));
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                font-size: 2.2rem;
                margin-bottom: 20px;
                display: inline-block;
                text-decoration: none;
            }
            
            .form-floating > .form-control:focus ~ label {
                color: var(--deep-pink);
            }
            
            .form-control {
                border-radius: 15px;
                border: 1px solid #ffeef2;
                background-color: #fffbfc;
            }

            .form-control:focus {
                border-color: var(--primary-pink);
                box-shadow: 0 0 0 0.25rem rgba(255, 126, 179, 0.25);
                background-color: white;
            }
            
            .btn-signup {
                background: linear-gradient(to left, var(--primary-pink), var(--deep-pink));
                color: white;
                border: none;
                padding: 12px;
                font-weight: 600;
                border-radius: 50px;
                transition: all 0.3s;
                font-size: 1.1rem;
                box-shadow: 0 4px 15px rgba(232, 67, 147, 0.3);
            }
            
            .btn-signup:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(232, 67, 147, 0.4);
                background: linear-gradient(to left, var(--deep-pink), var(--romantic-red));
                color: white;
            }
            
            .link-text {
                color: var(--deep-pink);
                text-decoration: none;
                font-weight: 600;
                transition: color 0.3s;
            }
            
            .link-text:hover {
                color: var(--romantic-red);
                text-decoration: underline;
            }

            /* Responsive */
            @media (max-width: 991.98px) {
                body { overflow: auto; }
                .bg-image { display: none; }
                .signup-section { padding: 40px 20px; height: auto; min-height: 100vh; }
                .signup-section::after { display: none; }
            }
        </style>
    </head>
    <body>
        
        <div class="container-fluid signup-container">
            <div class="row h-100">
                
                <div class="col-lg-5 p-0">
                    <div class="signup-section">
                        <div class="form-content">
                            <div class="text-center text-lg-start">
                                <a href="home" class="brand-logo">
                                    <i class="fas fa-gift me-2" style="font-size: 1.8rem; -webkit-text-fill-color: #ff4757;"></i>L'amour
                                </a>
                                <h3 class="fw-bold mb-1" style="color: #444;">Đăng ký thành viên 💖</h3>
                                <p class="text-muted mb-4">Tham gia cùng chúng tôi để nhận những ưu đãi ngọt ngào.</p>
                            </div>
                            
                            <c:if test="${mess != null}">
                                <div class="alert alert-danger d-flex align-items-center mb-4 shadow-sm" style="border-radius: 15px; background-color: #fff5f5; border-color: #ffcdd2;" role="alert">
                                    <i class="fas fa-exclamation-circle me-2 text-danger"></i>
                                    <div>${mess}</div>
                                </div>
                            </c:if>

                            <form action="signup" method="post">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingUser" placeholder="Tên người dùng" 
                                           name="user" required>
                                    <label for="floatingUser">Tên người dùng</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="password" class="form-control" id="floatingPassword" placeholder="Mật khẩu" 
                                           name="pass" required>
                                    <label for="floatingPassword">Mật khẩu</label>
                                </div>
                                
                                <div class="form-floating mb-4">
                                    <input type="password" class="form-control" id="floatingRePass" placeholder="Nhập lại mật khẩu" 
                                           name="repass" required>
                                    <label for="floatingRePass">Xác nhận mật khẩu</label>
                                </div>
                                
                                <div class="d-grid gap-2 mb-4">
                                    <button class="btn btn-signup" type="submit">
                                        <i class="fas fa-user-plus me-2"></i>Tạo Tài Khoản
                                    </button>
                                </div>
                                
                                <div class="text-center">
                                    <p class="text-muted">Đã có tài khoản? <a href="login" class="link-text">Đăng nhập ngay</a></p>
                                    <hr class="my-4" style="background-color: #ffeef2;">
                                    <a href="home" class="btn btn-outline-secondary btn-sm rounded-pill px-3">
                                        <i class="fas fa-arrow-left me-1"></i> Quay về trang chủ
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-lg-7 p-0 d-none d-lg-block">
                    <div class="bg-image">
                        <div class="bg-overlay">
                            <div class="quote-text">
                                <h2 class="fw-bold">"Tình yêu là phương thuốc<br>làm tươi mới cuộc sống."</h2>
                                <p class="lead mt-3">- Pablo Picasso</p>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>