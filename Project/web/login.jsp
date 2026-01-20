<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng Nhập | Sweet Love</title>
        
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
            
            .login-container {
                height: 100vh;
            }
            
            /* Cột hình ảnh bên trái */
            .bg-image {
                /* Ảnh nền lãng mạn */
                background: url('https://images.unsplash.com/photo-1518199266791-5375a83190b7?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80') no-repeat center center;
                background-size: cover;
                position: relative;
                height: 100%;
            }
            
            .bg-overlay {
                position: absolute;
                top: 0; left: 0; right: 0; bottom: 0;
                /* Gradient hồng tím mờ */
                background: linear-gradient(to bottom, rgba(46, 26, 33, 0.2), rgba(232, 67, 147, 0.7));
                display: flex;
                align-items: flex-end;
                padding: 60px;
            }
            
            .quote-text {
                color: white;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            }

            .quote-text h2 {
                font-family: 'Dancing Script', cursive;
                font-size: 2.5rem;
            }
            
            /* Cột Form bên phải */
            .login-section {
                display: flex;
                flex-direction: column;
                justify-content: center;
                padding: 0 60px;
                height: 100%;
                background-color: white;
                position: relative;
            }
            
            /* Trang trí nền tim mờ */
            .login-section::before {
                content: '\f004'; 
                font-family: "Font Awesome 5 Free";
                font-weight: 900;
                position: absolute;
                top: -50px;
                right: -50px;
                font-size: 20rem;
                color: rgba(255, 238, 242, 0.5);
                z-index: 0;
                transform: rotate(20deg);
            }

            .form-content {
                position: relative;
                z-index: 1;
            }
            
            .brand-logo {
                font-family: 'Pacifico', cursive;
                background: linear-gradient(to right, var(--primary-pink), var(--romantic-red));
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                font-size: 2.5rem;
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
            
            .btn-login {
                background: linear-gradient(to right, var(--primary-pink), var(--deep-pink));
                color: white;
                border: none;
                padding: 12px;
                font-weight: 600;
                border-radius: 50px;
                transition: all 0.3s;
                font-size: 1.1rem;
                box-shadow: 0 4px 15px rgba(232, 67, 147, 0.3);
            }
            
            .btn-login:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(232, 67, 147, 0.4);
                background: linear-gradient(to right, var(--deep-pink), var(--romantic-red));
                color: white;
            }
            
            .link-text {
                color: #636e72;
                text-decoration: none;
                font-weight: 500;
                transition: color 0.3s;
            }
            
            .link-text:hover {
                color: var(--romantic-red);
            }

            /* Responsive */
            @media (max-width: 991.98px) {
                body { overflow: auto; }
                .bg-image { display: none; }
                .login-section { padding: 40px 20px; height: auto; min-height: 100vh; }
                .login-section::before { display: none; }
            }
        </style>
    </head>
    <body>
        
        <div class="container-fluid login-container">
            <div class="row h-100">
                
                <div class="col-lg-7 p-0 d-none d-lg-block">
                    <div class="bg-image">
                        <div class="bg-overlay">
                            <div class="quote-text">
                                <h2 class="fw-bold">"Yêu không chỉ là một danh từ<br>nó là một động từ."</h2>
                                <p class="lead mt-3">- L'amour Store</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-5 p-0">
                    <div class="login-section">
                        <div class="form-content">
                            <div class="text-center text-lg-start">
                                <a href="home" class="brand-logo">
                                    <i class="fas fa-heart me-2" style="font-size: 2rem; -webkit-text-fill-color: #ff4757;"></i>L'amour
                                </a>
                                <h3 class="fw-bold mb-1" style="color: #444;">Xin chào! 👋</h3>
                                <p class="text-muted mb-4">Đăng nhập để gửi trọn yêu thương.</p>
                            </div>
                            
                            <c:if test="${mess != null}">
                                <div class="alert alert-danger d-flex align-items-center mb-4 shadow-sm" style="border-radius: 15px; border-left: 5px solid #ff4757;" role="alert">
                                    <i class="fas fa-heart-broken me-2"></i>
                                    <div>${mess}</div>
                                </div>
                            </c:if>

                            <form action="login" method="post">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Tên người dùng" 
                                           name="Username" value="${username}" required autofocus>
                                    <label for="floatingInput">Tên người dùng</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input type="password" class="form-control" id="floatingPassword" placeholder="Mật khẩu" 
                                           name="Password" value="${password}" required>
                                    <label for="floatingPassword">Mật khẩu</label>
                                </div>
                                
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="1" id="rememberMe" name="r" checked style="accent-color: #e84393;">
                                        <label class="form-check-label text-muted" for="rememberMe">
                                            Nhớ mật khẩu
                                        </label>
                                    </div>
                                    <a href="change-newpassword.jsp" class="link-text small">Quên mật khẩu?</a>
                                </div>
                                
                                <div class="d-grid gap-2 mb-4">
                                    <button class="btn btn-login" type="submit">
                                        Đăng Nhập <i class="fas fa-arrow-right ms-2"></i>
                                    </button>
                                </div>
                                
                                <div class="text-center">
                                    <p class="text-muted">Chưa có tài khoản? <a href="signup.jsp" class="link-text fw-bold text-danger">Đăng ký ngay</a></p>
                                    <hr class="my-4" style="background-color: #ffeef2;">
                                    <a href="home" class="btn btn-outline-secondary btn-sm rounded-pill px-3">
                                        <i class="fas fa-home me-1"></i> Trang chủ
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>