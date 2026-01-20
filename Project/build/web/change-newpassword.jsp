<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Đặt Lại Mật Khẩu | Sweet Love</title>
        
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
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0;
            }
            
            .card-auth {
                border: none;
                border-radius: 30px;
                box-shadow: 0 15px 45px rgba(232, 67, 147, 0.15);
                overflow: hidden;
                width: 100%;
                max-width: 900px;
                background-color: white;
            }
            
            .auth-image {
                /* Hình ảnh lãng mạn nhẹ nhàng */
                background: url('https://images.unsplash.com/photo-1516589174184-c685266e430c?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80') no-repeat center center;
                background-size: cover;
                position: relative;
                min-height: 450px;
            }
            
            .auth-overlay {
                position: absolute;
                top: 0; left: 0; right: 0; bottom: 0;
                background: linear-gradient(to bottom, rgba(232, 67, 147, 0.2), rgba(46, 26, 33, 0.7));
                display: flex;
                flex-direction: column;
                justify-content: flex-end;
                padding: 50px;
                color: white;
            }

            .auth-overlay h3 {
                font-family: 'Dancing Script', cursive;
                font-size: 2.5rem;
                margin-bottom: 10px;
            }
            
            .form-section {
                padding: 60px;
                background-color: white;
            }
            
            .brand-logo {
                font-family: 'Dancing Script', cursive;
                color: var(--romantic-red);
                font-size: 2.2rem;
                font-weight: 700;
                text-decoration: none;
                display: inline-block;
                margin-bottom: 15px;
            }
            
            .form-control {
                padding: 12px 20px;
                border-radius: 15px;
                background-color: #fffbfc;
                border: 1px solid #ffeef2;
                padding-left: 45px;
                transition: all 0.3s;
            }
            
            .form-control:focus {
                background-color: white;
                border-color: var(--primary-pink);
                box-shadow: 0 0 0 0.2rem rgba(255, 126, 179, 0.2);
            }
            
            .input-icon {
                position: absolute;
                left: 18px;
                top: 50%;
                transform: translateY(-50%);
                color: var(--primary-pink);
                font-size: 1rem;
                z-index: 10;
            }
            
            .input-group-custom {
                position: relative;
                margin-bottom: 20px;
            }
            
            .btn-reset {
                background: linear-gradient(to right, var(--primary-pink), var(--deep-pink));
                color: white;
                border: none;
                border-radius: 50px;
                padding: 14px;
                font-weight: 600;
                width: 100%;
                text-transform: uppercase;
                letter-spacing: 1px;
                transition: all 0.3s;
                box-shadow: 0 4px 15px rgba(232, 67, 147, 0.3);
            }
            
            .btn-reset:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 20px rgba(232, 67, 147, 0.4);
                background: linear-gradient(to right, var(--deep-pink), var(--romantic-red));
                color: white;
            }
            
            .link-login {
                color: var(--text-color);
                text-decoration: none;
                font-weight: 600;
                transition: color 0.3s;
                font-size: 0.9rem;
            }
            
            .link-login:hover {
                color: var(--romantic-red);
            }

            .alert-custom {
                border-radius: 15px;
                border: none;
                background-color: #fff5f5;
                color: var(--romantic-red);
                font-size: 0.9rem;
                border-left: 4px solid var(--romantic-red);
            }
        </style>
    </head>
    <body>
        
        <div class="container d-flex justify-content-center">
            <div class="card card-auth shadow-lg">
                <div class="row g-0">
                    <div class="col-lg-6 d-none d-lg-block">
                        <div class="auth-image">
                            <div class="auth-overlay">
                                <h3>Đừng lo lắng...</h3>
                                <p>Một chút sơ ý không làm mất đi những kỉ niệm. Hãy để chúng tôi giúp bạn kết nối lại nhé!</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-6">
                        <div class="form-section h-100 d-flex flex-column justify-content-center">
                            <div class="text-center mb-4">
                                <a href="home" class="brand-logo">
                                    <i class="fas fa-heart me-2"></i>Sweet Love
                                </a>
                                <h4 class="fw-bold text-dark mt-2">Lấy Lại Mật Khẩu</h4>
                                <p class="text-muted small">An toàn và bảo mật là ưu tiên hàng đầu</p>
                            </div>
                            
                            <c:if test="${mess != null}">
                                <div class="alert alert-custom text-center shadow-sm mb-4" role="alert">
                                    <i class="fas fa-heart-broken me-2"></i> ${mess}
                                </div>
                            </c:if>

                            <form action="forgetPassword" method="post">
                                
                                <div class="input-group-custom">
                                    <i class="fas fa-user input-icon"></i>
                                    <input type="text" class="form-control" name="user" placeholder="Tên đăng nhập của bạn" required />
                                </div>

                                <div class="input-group-custom">
                                    <i class="fas fa-key input-icon"></i>
                                    <input type="password" class="form-control" name="newPassword" placeholder="Mật khẩu mới ngọt ngào" required />
                                </div>

                                <div class="input-group-custom">
                                    <i class="fas fa-check-double input-icon"></i>
                                    <input type="password" class="form-control" name="confirmPassword" placeholder="Xác nhận lại mật khẩu" required />
                                </div>

                                <div class="mt-4">
                                    <button class="btn btn-reset shadow" type="submit">
                                        <i class="fas fa-magic me-2"></i> Cập Nhật Mật Khẩu
                                    </button>
                                </div>

                                <div class="text-center mt-5">
                                    <p class="small text-muted mb-1">Bạn đã nhớ ra mật khẩu?</p>
                                    <a href="login" class="link-login">
                                        <i class="fas fa-reply me-1"></i> Quay lại Đăng Nhập
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